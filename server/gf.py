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

gr = pgf.readPGF("../grammar_generator/Phylo.pgf")
eng = gr.languages["PhyloEng"]

grammar = onto_adapter.read_file("../grammar_generator/Phylo.gf")
in_out_file = "../grammar_generator/in_out.txt"

app = Flask(__name__)

@app.route('/')
def upload_file():
    return render_template('upload.html')
	
@app.route('/uploader', methods = ['POST'])
def process_file():
    if request.method == 'POST':
        f = request.files['file']
        # f.save(secure_filename(f.filename))
        content = f.read()
        j = json.loads( content )
        paragraph = []
        linearized_paragraph = ""
        
        with open( in_out_file ) as lfile:    
            in_out = json.load( lfile )
        
        for service in j["workflow_plan"][0]["plan"]:
            message = {}
            message["abstract_tree"] = {}
            
            # query input, output of service
            ser_in_out = in_out[ service["operation_name"] ]
            
            message["abstract_tree"] = abtree_construction( service["operation_name"], ser_in_out )
                        
            paragraph.append(message)
        
        for m in paragraph:
            lm = pgf.readExpr( m["abstract_tree"] )
            linearized_paragraph += eng.linearize(lm).capitalize()
            linearized_paragraph += ". "
        
        paragraph.append( linearized_paragraph )

    return json.dumps(paragraph)

def abtree_construction(func, in_out):
    abtree = func + " "
    for i in in_out["input"]:
        abtree = abtree + "p_" + i + " "
    for o in in_out["output"]:
        abtree = abtree + "p_" + o + " "
    return abtree
    
if __name__ == '__main__':
   app.run(debug = True)