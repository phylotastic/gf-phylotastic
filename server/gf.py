# last_index in workflow composition
# categorize services for each step in ontology?

from flask import Flask, render_template, request
from werkzeug import secure_filename
from IPython import embed
import json
import pgf
import random
import urllib2
import urllib
import onto_adapter

gr = pgf.readPGF("Phylo.pgf")
eng = gr.languages["PhyloEng"]

grammar = onto_adapter.read_file("../Phylo.gf")

app = Flask(__name__)

# basic query
BQUERY_ONT = "http://phylo.cs.nmsu.edu:5000/bq?"
# restriction query
RQUERY_ONT = "http://phylo.cs.nmsu.edu:5000/rq?"
PREFIX_METHOD = "http://www.cs.nmsu.edu/~epontell/Ontologies/phylogenetic_methods.owl#"
PREFIX_CDAO = "http://www.cs.nmsu.edu/~epontell/CDAO/cdao.owl#"

@app.route('/')
def upload_file():
    return render_template('upload.html')
	
@app.route('/uploader', methods = ['POST'])
def process_file():
    if request.method == 'POST':
        f = request.files['file']
        # f.save(secure_filename(f.filename))
        content = f.read()
        j = json.loads(content)
        paragraph = []
        linearized_paragraph = ""
        
        # document planning
        for step in j["workflow_plan"][0]["plan"]:
            message = {}
            message["abstract_tree"] = {}
            # "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
            # "PREFIX cdao: <http://www.cs.nmsu.edu/~epontell/CDAO/cdao.owl#>"
            # "PREFIX method: <http://www.cs.nmsu.edu/~epontell/Ontologies/phylogenetic_methods.owl#>"
            # "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
                
            # There's no "validate" method because almost anything is a valid URL. http://stackoverflow.com/questions/827557/how-do-you-validate-a-url-TNth-a-regular-expression-in-python
            
            # extract GF function names from rdfs:comment of the node, then get the parameters list of the function.
            queried_funcs = bq(["<" + step["operation_ontology_uri"] + ">", "rdfs:comment", None])
            func_names = select_obj(queried_funcs)
            for name in func_names:
                prototype = onto_adapter.get_function(grammar, rm_nlg_pre(rm_pre(name)))
                params = prototype.split(" ")
                mapping = {}
                for p in params:
                    if p != rm_nlg_pre(rm_pre(name)):
                        # explore function: get more detail of a parameter. It will enable some changes in sentence like:
                        # 1. ServiceX has input A, output B
                        # 2. ServiceX has input subclass_of_A, output subclass_of_B
                        mapping[p] = explore(PREFIX_CDAO + p, 0)
                message["abstract_tree"][name] = abtree_construction( params, mapping )
                        
                paragraph.append(message)
        
        for m in paragraph:
            for onto_uri, tree in m["abstract_tree"].iteritems():
                lm = pgf.readExpr(tree)
                linearized_paragraph += eng.linearize(lm).capitalize()
                linearized_paragraph += ". "
        
        paragraph.append(linearized_paragraph)
                
        # micro planning
        # if message_1["out"] == message_2["out"]:
#             # AndConj (Extract ScientificNamesO TextI GNRD) (TheyResolve OT_TNRS)
#             # AndConj function accepts 2 parameters:
#             #   - Extract function accepts 3 parameters which are:
#             #       +
#             #       +
#             #       +
#             #   - TheyResolve function accepts 1 parameter which is:
#             #       +
#
#             e = pgf.readExpr("AndConj (" + message_1["func"] + " " + message_1["out"] +
#                             " " + message_1["inp"] + " " + message_1["ser"] + ") (They" +
#                             message_2["func"] + " " + message_2["ser"] + ")")
#             paragraph += eng.linearize(e)
#         else:
#             e1 = pgf.readExpr(message_1["func"] + " " + message_1["out"] +
#                                 " " + message_1["inp"] + " " + message_1["ser"])
#             paragraph += eng.linearize(e1)
#             paragraph += ". "
#             e2 = pgf.readExpr(message_2["func"] + " These" + message_2["out"] + " " + message_2["ser"])
#             paragraph += eng.linearize(e2)

    return json.dumps(paragraph)

# text generation for generalizing a class
# klass is class
# rank is how generalized you want. The bigger the more generalized.
@app.route('/generalize')
def generalize():
    klass = request.args.get('class')
    rank = request.args.get('rank')
    
    triple = bq(["<" + PREFIX_CDAO + klass + ">", None, None])
    embed()
    return render_template('upload.html')
    
    
# specify how deep you want to go down from a node. If you want to go way too deep than actual reachable path, return when you reach the deepest node.
def explore(node, level, visited=None):
    bucket = []
    
    if visited is None:
        visited = []
    
    if node in visited:
        return []

    if level == 0:
        return [node]
    
    # nlg_stop annotates the deepest node you can reach.
    cm_in_node = bq(["<" + node + ">", "rdfs:comment", None])
    if cm_in_node["results"]["bindings"] != [] and "nlg_stop" in cm_in_node["results"]["bindings"][0]["o"]["value"]:
        return [node]
        
    if level > 0:
        # go down
        triple = bq(["<" + node + ">", None, None])
        for t in triple["results"]["bindings"]:
            # check if this property (edge) should be followed by seeing that "rdfs:comment" is denoted by "nlg_follow"
            comment_in_property = bq(["<" + t["p"]['value'] + ">", "rdfs:comment", None])
            if comment_in_property["results"]["bindings"] != [] and "nlg_follow" in comment_in_property["results"]["bindings"][0]["o"]["value"]:
                bucket.extend( explore(t["o"]['value'], level - 1, visited.append(node)) )
    # else:
        # TODO: go up
        
    return bucket

def abtree_construction(params, mapping):
    replacement = list()
    for idx, p in enumerate(params):
        if idx == 0:
            replacement.append( p )
        else:
            # for now, just select random because most of cases, there will 
            # be only one nlg_stop node so it is one-to-one mapping. 
            # TODO: selection on purpose or select all
            replacement.append( "p" + rm_pre(random.choice(mapping[p])) )
    return " ".join(replacement)
    
def rq(klass):
    query = RQUERY_ONT + "klass=" + klass
    return json.loads(urllib2.urlopen(query).read())
    
def bq(arr):
    params = {}
    for idx, val in enumerate(arr):
        if val is not None:
            if idx == 0:
                params["s"] = val
            elif idx == 1:
                params["p"] = val
            elif idx == 2:
                params["o"] = val
    query = BQUERY_ONT + urllib.urlencode(params)
    return json.loads(urllib2.urlopen(query).read())

def select_obj(triple):
    return list(map(lambda x: x["o"]["value"], triple["results"]["bindings"]))

def rm_pre(s):
    return s.replace(PREFIX_METHOD, "").replace(PREFIX_CDAO, "")

def rm_nlg_pre(s):
    return s.replace("nlg_", "")
    
if __name__ == '__main__':
   app.run(debug = True)