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
import re
import random

gr = pgf.readPGF("ACE-0_0_2.pgf")
eng = gr.languages["TestAttemptoAce"]

# gr = pgf.readPGF("Words300.pgf")
# eng = gr.languages["Words300Ace"]

mapping_file = "mapping.json"

app = Flask(__name__)

@app.route('/')
def upload_file():
    return render_template('home.html', paragraph=[], errors=[])
	
@app.route('/', methods = ['POST'])
def generate():
    atoms = request.form['atoms'].split()
    paragraph = []
    errors = []
    
    with open( mapping_file ) as f:
        mapping = json.load( f )
    
    for a in atoms:
        r = re.compile('\w+')
        match = r.findall(a)
        name = match.pop(0)
        args = list(match)
        
        try:
            model_list = list(filter(lambda x: re.findall('\w+', x)[0] == name, mapping["func"]))
            model = random.choice(model_list)
        except Exception:
            errors.append("There is no example sentence of atom \"" + name + "\" provided")
            continue
            
        parts = re.findall('\w+', model)
        model_name = parts.pop(0)
        model_args = list(parts)
        
        li = mapping["func"][model]
        
        try:
            u = "http://localhost:41296/ACE-0_0_2.pgf?command=parse&input=" + li.replace(" ", "+")
            res = urllib2.urlopen(u).read()
            respond = json.loads(res)
            syntax_tree = respond[0]["trees"][0]
        except Exception:
            print "Can not parse sentece \"" + li + "\"\n"
            break
        
        replaced = True
        for i, arg in enumerate(model_args):
            if not arg.isdigit():
                try:
                    param_model_li = mapping["params"][arg]
                except Exception: 
                    # errors.append("Mapping of \"" + arg + "\" not found")
                    param_model_li = ""
                    continue
                    
                try:
                    param_li       = mapping["params"][args[i]]
                except Exception: 
                    errors.append("Mapping of \"" + args[i] + "\" not found")
                    replaced = False
                    break
                    
                try:
                    syntax_tree = syntax_tree.replace(param_model_li, param_li)
                    print syntax_tree
                    print "\n"
                except Exception: 
                    errors.append("Can not replace param \"" + arg + "\" with \"" + args[i] + "\" in syntax tree of atom " + a + " \n")
                    replaced = False
                    break
        
        if replaced:
            e = pgf.readExpr(syntax_tree)
            paragraph.append( eng.linearize(e) )
        
    # if request.method == 'POST':
    #     f = request.files['file']
    #     # f.save(secure_filename(f.filename))
    #     content = f.read()
    #     j = json.loads( content )
    #     messages = {}
    #     ab_trees = []
    #     linearized_sentences = []
    #     paragraph = ""
    #     steps = []
    #
    #     with open( in_out_file ) as iofile:
    #         in_out = json.load( iofile )
    #
    #     with open( conjunctive_file ) as cfile:
    #         conjunctive = json.load( cfile )
    #
    #     for service in j["workflow_plan"][0]["plan"]:
    #         m = {}
    #         m["abstract_tree"] = {}
    #
    #         # query input, output of service
    #         ser_in_out = in_out[ service["operation_name"] ]
    #
    #         steps.append( {service["operation_name"]: ser_in_out} )
    #
    #         m["abstract_tree"] = abtree_construction( service["operation_name"], ser_in_out )
    #
    #         ab_trees.append(m)
    #
    #     for m in ab_trees:
    #         lm = pgf.readExpr( m["abstract_tree"] )
    #         linearized_sentences.append( eng.linearize(lm).capitalize() )
    #
    #     for ind, s in enumerate(linearized_sentences):
    #         if (ind < len(linearized_sentences) - 1 and
    #             conjunctive[ j["workflow_plan"][0]["plan"][ind]["operation_name"] ]["accept_conjunctive"] and
    #             ind > 0):
    #             paragraph += "Then, "
    #         paragraph += s + ". "
    #
    #     messages["paragraph"] = paragraph
    #     messages["steps"] = steps
    return render_template('home.html', paragraph=paragraph, errors=errors)

if __name__ == '__main__':
   app.run(debug = True)