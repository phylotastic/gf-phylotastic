# last_index in workflow composition
# categorize services for each step in ontology?

from flask import Flask, render_template, request
from werkzeug import secure_filename
from IPython import embed
import json
import pgf
import random
import urllib2

gr = pgf.readPGF("Phylo.pgf")
eng = gr.languages["PhyloEng"]

app = Flask(__name__)

QUERY_ONT = "http://phylo.cs.nmsu.edu:5000/q?"
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
            # "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
            # "PREFIX cdao: <http://www.cs.nmsu.edu/~epontell/CDAO/cdao.owl#>"
            # "PREFIX method: <http://www.cs.nmsu.edu/~epontell/Ontologies/phylogenetic_methods.owl#>"
            # "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
            if step["operation_name"] == "phylotastic_FindScientificNamesFromFreeText_GNRD_GET":
                # in ontology: FindScientificNamesFromText. Ontology -> ASP -> "findScientificNamesFromText_GNRD_GET".
                # How to know the predicate is "containComponents". Inference???? Agree on a convention? But convention in this case can not apply on other cases, other ontologies
                message["func"] = "ExtractNames"

                triple = q(["cdao:" + step["operation_name"], "method:has_input", None])
                input = select_o(triple)
                embed()
                triple = q([input, "has_Component", None])
                message["inp"] = select_o(triple)
                
                triple = q([step["operation_name"], "has_output", None])
                output = select_o(triple)
                triple = q([output, "has_Component", None])
                message["out"] = select_o(triple)

                # dont know
                message["ser"] = step["operation_name"]
                
                message["abstract_tree"] = " ".join([message["func"], message["out"][0], message["inp"][0], message["ser"]])
            elif step["operation_name"] == "resolvedScientificNames_OT_TNRS_GET":
                # in ontology: ResolveScientificNamesWithOpenTreeTNRS_GET
                message["func"] = "ResolveNames"
                
                triple = q(["ResolveScientificNamesWithOpenTreeTNRS_GET_Output", "containComponents", None])
                message["out"] = select_o(triple)

                triple = q(["ResolveScientificNamesWithOpenTreeTNRS_GET_Input", "containComponents", None])
                message["inp"] = select_o(triple)
                
                message["ser"] = "OT_TNRS"
                
                message["abstract_tree"] = " ".join([message["func"], message["out"][1], message["inp"][0], message["ser"]])
                            
            elif step["operation_name"] == "getPhylogeneticTree_OT_GET":
                # in ontology: GetPhylogeneticTreesFromOpenTree_GET
                message["func"] = "ExtractTree"
                
                triple = q(["GetPhylogeneticTreesFromOpenTree_GET_Output", "containComponents", None])
                message["tree_format"] = select_o(triple)
                
                triple = q(["GetPhylogeneticTreesFromOpenTree_GET_Input", "containComponents", None])
                message["inp"] = select_o(triple)
                
                message["ser"] = "OpenTree"
                message["abstract_tree"] = " ".join([message["func"], message["inp"][0], message["tree_format"][0], message["ser"]])
                
            paragraph.append(message)
                    
        for m in paragraph:
            lm = pgf.readExpr(m["abstract_tree"])
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
    
def q(arr):
    query = QUERY_ONT
    for idx, val in enumerate(arr):
        if val is not None:
            if idx == 0:
                query = query + "s=" + val + "&"
            elif idx == 1:
                query = query + "p=" + val + "&"
            elif idx == 2:
                query = query + "o=" + val + "&"
            
    return json.loads(urllib2.urlopen(query).read())

def select_o(triple):
    return list(map(lambda x: rm_pre(x["o"]["value"]), triple["results"]["bindings"]))

def rm_pre(s):
    return s.replace(PREFIX_METHOD, "").replace(PREFIX_CDAO, "")
            
if __name__ == '__main__':
   app.run(debug = True)