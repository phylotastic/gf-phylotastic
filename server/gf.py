from flask import Flask, render_template, request
from werkzeug import secure_filename
from IPython import embed
import json
import pgf
import random

gr = pgf.readPGF("Phylo.pgf")
eng = gr.languages["PhyloEng"]

app = Flask(__name__)

@app.route('/upload')
def upload_file():
    return render_template('upload.html')
	
@app.route('/uploader', methods = ['POST'])
def process_file():
    if request.method == 'POST':
        f = request.files['file']
        # f.save(secure_filename(f.filename))
        content = f.read()
        j = json.loads(content)
        message_1 = {}
        message_2 = {}
        paragraph = ""
        
        # document planning
        # generalize: has ontology, ask question to ontology, figure out answer, 
        # autogenerate this part
        for step in j["workflow_plan"][0]["plan"]:
            if step["operation_name"] == "findScientificNamesFromText_GNRD_GET":
                message_1["func"] = "Extract"
                message_1["out"] = random.choice(["ScientificNamesO"])
                message_1["inp"] = "Text"
                message_1["ser"] = "GNRD"
            elif step["operation_name"] == "resolvedScientificNames_OT_TNRS_GET":
                message_2["func"] = "Resolve"
                message_2["out"] = random.choice(["ScientificNamesO", "SNamesO"])
                message_2["ser"] = "OT_TNRS"
    
        # micro planning
        if message_1["out"] == message_2["out"]:
            # AndConj (Extract ScientificNamesO TextI GNRD) (TheyResolve OT_TNRS)
            # AndConj function accepts 2 parameters:
            #   - Extract function accepts 3 parameters which are:
            #       + 
            #       + 
            #       + 
            #   - TheyResolve function accepts 1 parameter which is:
            #       + 
            
            e = pgf.readExpr("AndConj (" + message_1["func"] + " " + message_1["out"] + 
                            " " + message_1["inp"] + " " + message_1["ser"] + ") (They" + 
                            message_2["func"] + " " + message_2["ser"] + ")")
            paragraph += eng.linearize(e)
        else:
            e1 = pgf.readExpr(message_1["func"] + " " + message_1["out"] + 
                                " " + message_1["inp"] + " " + message_1["ser"])
            paragraph += eng.linearize(e1)
            paragraph += ". "
            e2 = pgf.readExpr(message_2["func"] + " These" + message_2["out"] + " " + message_2["ser"])
            paragraph += eng.linearize(e2)
    # embed()
    
    return paragraph
		
if __name__ == '__main__':
   app.run(debug = True)