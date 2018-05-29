# last_index in workflow composition
# categorize services for each step in ontology?

from flask import Flask, render_template, request, jsonify
from flask_cors import CORS, cross_origin
from werkzeug import secure_filename
from IPython import embed
import json
import pgf
import random
import urllib2
import urllib
import onto_adapter
from operator import itemgetter

gr = pgf.readPGF("../grammar_generator/Phylo.pgf")
eng = gr.languages["PhyloEng"]

grammar = onto_adapter.read_file("../grammar_generator/Phylo.gf")
in_out_file = "../grammar_generator/in_out.json"
conjunctive_file = "../grammar_generator/conjunctive.json"
ser_instances_file = "../grammar_generator/ser_instances.json"
direct_inheritance_file = "../grammar_generator/direct_inheritance.json"
data_format_file = "../grammar_generator/data_format.json"

app = Flask(__name__)
CORS(app)

app.config.from_pyfile('../config.cfg')

@app.route('/')
def upload_file():
    return render_template('upload.html')
	
@app.route('/generate', methods = ['POST'])
def generate():
    print(request.get_json())
    
    result = {}
    ab_trees = []
    linearized_sentences = []
    paragraph = ""
    steps = []
    
    with open( in_out_file ) as iofile:
        in_out = json.load( iofile )

    with open( conjunctive_file ) as cfile:
        conjunctive = json.load( cfile )

    
    
    p = request.get_json()["workflow_plan"][0]["full_plan"]
    short_p = list(map(lambda x: {"index": x["service_index"], "name": x["service_name"]},p))
    sorted_p = sorted(short_p, key=itemgetter('index'))
    only_services = list(map(lambda x: x["name"], sorted_p))
    
    for service in only_services:
        m = {}
        m["abstract_tree"] = {}

        # query input, output of service
        ser_in_out = in_out[ service ]

        steps.append( {service: ser_in_out} )

        m["abstract_tree"] = abtree_construction( service, ser_in_out )

        ab_trees.append(m)

    for m in ab_trees:
        lm = pgf.readExpr( m["abstract_tree"] )
        linearized_sentences.append( eng.linearize(lm).capitalize() )

    for ind, s in enumerate(linearized_sentences):
        # if (ind < len(linearized_sentences) - 1 and
#             conjunctive[ j["workflow_plan"][0]["plan"][ind]["operation_name"] ]["accept_conjunctive"] and
#             ind > 0):
#             paragraph += "Then, "
        paragraph += s + ". "

    result["blob"] = paragraph
    result["steps"] = steps
    
    return jsonify(result)
    
@app.route('/traversing_ontology_generate', methods = ['POST'])
def traversing_ontology_generate():
    print request.form
    if request.method == 'POST':
        f = request.files['file']
        # f.save(secure_filename(f.filename))
        content = f.read()
        j = json.loads( content )
        generalization = []
        messages = {}
        ab_trees = []
        linearized_sentences = []
        paragraph = ""
        steps = []
        
        with open( in_out_file ) as iofile:    
            in_out = json.load( iofile )
        
        with open( conjunctive_file ) as cfile:    
            conjunctive = json.load( cfile )

        with open( ser_instances_file ) as ifile:
            ser_instances = json.load( ifile )
        
        with open( direct_inheritance_file ) as dfile:
            direct_inheritance = json.load( dfile )
        
        with open( data_format_file ) as dfile:
            data_format = json.load( dfile )
        
        for counter in range( 0, len(j["workflow_plan"][0]["plan"]) ):
            service = j["workflow_plan"][0]["plan"][counter]
            m = {}
            m["abstract_tree"] = ""
            
            step_name = request.form.get('step[' + str(counter) + '][name]')
            step_direction = request.form.get('step[' + str(counter) + '][direction]')

            if step_direction == None:
                target = step_name
                steps.append({ target: {} })  
                ser_in_out = in_out[ target ]
                for _idx, inp in enumerate( ser_in_out["input"] ):
                    if "input" not in steps[ len(steps) - 1 ][target].keys():
                        steps[ len(steps) - 1 ][target]["input"] = []
                    inp_name = request.form.get('input[' + str(counter) + '][' + str(_idx) + '][name]')
                    inp_direction = request.form.get('input[' + str(counter) + '][' + str(_idx) + '][direction]')
                    if inp_direction != None:
                        leaf = ser_in_out["input"][_idx]
                        gen_inp = target_finder( direct_inheritance, None, inp_name, leaf, inp_direction )
                        steps[ len(steps) - 1 ][target]["input"].append( gen_inp )
                        if counter > 0:
                            previous_step_outputs = steps[ len(steps) - 2 ][ steps[ len(steps) - 2 ].keys()[0] ]["output"]
                            for idx, p in enumerate(previous_step_outputs):
                                if p == inp_name:
                                    steps[ len(steps) - 2 ][ steps[ len(steps) - 2 ].keys()[0] ]["output"][idx] = gen_inp
                    else:
                        steps[ len(steps) - 1 ][target]["input"].append( inp_name )
                for _idx, out in enumerate( ser_in_out["output"] ):  
                    if "output" not in steps[ len(steps) - 1 ][target].keys():
                        steps[ len(steps) - 1 ][target]["output"] = []
                    outp_name = request.form.get('output[' + str(counter) + '][' + str(_idx) + '][name]')
                    outp_direction = request.form.get('output[' + str(counter) + '][' + str(_idx) + '][direction]')
                    if outp_direction != None:
                        leaf = ser_in_out["output"][_idx]
                        gen_out = target_finder( direct_inheritance, None, outp_name, leaf, outp_direction )
                        steps[ len(steps) - 1 ][target]["output"].append( gen_out )
                    else:
                        steps[ len(steps) - 1 ][target]["output"].append( outp_name )       
                if len( steps[ len(steps) - 1 ][target]["input"] ) == 0:
                    steps[ len(steps) - 1 ][target]["input"] = ['x']
                if len( steps[ len(steps) - 1 ][target]["output"] ) == 0:
                    steps[ len(steps) - 1 ][target]["output"] = ['x']
                    
            else:
                leaf = j["workflow_plan"][0]["plan"][counter]["operation_name"]
                target = target_finder( direct_inheritance, ser_instances, step_name, leaf, step_direction )
                steps.append({ target: {} })  
                if target in in_out:
                    ser_in_out = in_out[ target ]
                else:
                    ser_in_out = {"input": ['x'], "output": ['x']}
                if len(ser_in_out["input"]) == 0:
                    ser_in_out["input"] = ['x']
                if len(ser_in_out["output"]) == 0:
                    ser_in_out["output"] = ['x']
                steps[ len(steps) - 1 ][target] = ser_in_out
            
            m["abstract_tree"] = abtree_construction( target, steps[ len(steps) - 1 ][target] )

            ab_trees.append(m)
            
            if step_direction == None:
                step_input_datatype  = request.form.get('step[' + str(counter) + '][input][datatype]')
                step_output_datatype = request.form.get('step[' + str(counter) + '][output][datatype]')
                if step_input_datatype == "add":
                    for i_o in data_format[target]:
                        print list(i_o.keys())
                        if "input" in i_o.keys():
                            m = {}
                            m["abstract_tree"] = "d_i_" + target + " i_" + i_o["input"] + " d_" + i_o["data"]
                            ab_trees.append(m)
                                
                    steps[len(steps)-1][target]["input_in_paragraph"] = 1
                
                if step_output_datatype == "add":
                    for i_o in data_format[target]:
                        if "output" in i_o.keys():
                            m = {}
                            m["abstract_tree"] = "d_o_" + target + " o_" + i_o["output"] + " d_" + i_o["data"]
                            ab_trees.append(m)
                            
                    steps[len(steps)-1][target]["output_in_paragraph"] = 1

        
        m = {}
        m["abstract_tree"] = "tree_figure d_figure d_tree"
        ab_trees.append(m)
        messages["figure"] = 1
        
        for m in ab_trees:
            lm = pgf.readExpr( m["abstract_tree"] )
            linearized_sentences.append( eng.linearize(lm).capitalize() )
        
        for ind, s in enumerate(linearized_sentences):
            # if (ind < len(linearized_sentences) - 1 and
#                 conjunctive[ j["workflow_plan"][0]["plan"][ind]["operation_name"] ]["accept_conjunctive"] and
#                 ind > 0):
#                 paragraph += "Then, "
            paragraph += s + ". "
        print steps
        messages["paragraph"] = paragraph
        messages["steps"] = steps

    return json.dumps(messages)

def abtree_construction(func, in_out):
    abtree = "f_" + func + " "
    for i in in_out["input"]:
        if i != 'x':
            abtree = abtree + "i_" + i + " "
    for o in in_out["output"]:
        abtree = abtree + "o_" + o + " "
    return abtree

def target_finder(direct_inheritance, ser_instance, step_name, leaf, step_direction):
    if ser_instance == None:
        if step_direction == "up":
            if step_name not in direct_inheritance:
                return step_name
            return direct_inheritance[step_name][0]
        else:
            upper_class = direct_inheritance[leaf][0]
            target = leaf
            while step_name != upper_class:
                if upper_class not in direct_inheritance:
                    return leaf
                target = upper_class
                upper_class = direct_inheritance[upper_class][0]
            return target
            
    if step_name in ser_instance:
        if step_direction == "up":
            return ser_instance[step_name]
        else:
            return step_name
    else:
        if step_direction == "up":
            if step_name not in direct_inheritance:
                return step_name
            return direct_inheritance[step_name][0]
        else:
            if leaf not in ser_instance:
                return leaf
            upper_class = ser_instance[leaf]
            if step_name == upper_class:
                return leaf
            else:
                while step_name != upper_class:
                    target = upper_class
                    upper_class = direct_inheritance[upper_class][0]
                return target
    
def traverse_up(hierarchy, node, up):
    if up == 0:
        return node
    if node not in hierarchy.keys():
        return node
    if len(hierarchy[node]) == 1:
        return traverse_up(hierarchy, hierarchy[node][0], up - 1)
    else:
        return traverse_up(hierarchy, hierarchy[node][0], up - 1)
        
if __name__ == '__main__':
    host = app.config['HOST']
    port = app.config['PORT']
    app.run(host = host, debug = True)