#script (python)

import gringo
import datetime
import re 
from IPython import embed
import random
import json
from pprint import pprint

class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\033[93m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'
    
def main(prg):
    output_asp = []
    input_asp  = []
    def on_model(model):
        for a in model.atoms():
            if a.name() == "has_input":
                input_asp.append(a)
            elif a.name() == "has_output":
                output_asp.append(a)
        
    prg.load("ontology_base_modified.lp")
    prg.ground([("base", [])])
    prg.solve(on_model = on_model)
    
    with open('linearization.json') as lfile:    
        param_linearization = json.load(lfile)
    
    in_out = {}
    
    input_cat = {}
    for i in input_asp:
        a = i.args()
        input_cat[str(a[1])] = ''
        if a[0] in in_out.keys():
            in_out[a[0]]["input"].append(a[1])
        else:
            in_out[a[0]] = {}
            in_out[a[0]]["input"] = [a[1]]
        
    output_cat = {}
    for o in output_asp:
        a = o.args()
        output_cat[str(a[1])] = ''
        if "output" in in_out[a[0]].keys():
            in_out[a[0]]["output"].append(a[1])
        else:
            in_out[a[0]]["output"] = [a[1]]

    print input_cat
    print output_cat
    print in_out
    
    instr_out = {}
    for key, value in in_out.items():
        instr_out[str(key)] = {}
        instr_out[str(key)]["input"] = []
        instr_out[str(key)]["output"] = []
        for v in value["input"]:
            instr_out[str(key)]["input"].append(str(v))
        for v in value["output"]:
            instr_out[str(key)]["output"].append(str(v))
            
    with open('in_out.txt', 'w') as answer:
        answer.write(json.dumps(instr_out))
        
    print "\nGenerating Phylo\n"
    
    f = open('Phylo.gf', 'w')
    f.write('abstract Phylo = {\n')
    f.write('    flags startcat = DMessage;\n')
    f.write('    flags startcat = Message;\n')
    f.write('    cat\n')
    f.write('        Message;\n')

    for i in input_cat:
        f.write('        ' + i + ";\n")
    
    for o in output_cat:
        if o not in input_cat:
            f.write('        ' + o + ";\n")
        
    f.write('    fun\n')
    
    for klass, io in in_out.items():
        func = str(klass) + ": " 
        for idx, val in enumerate(io['input']):
            if idx == 0:
                func = func + str(val)
            else:
                func = func + " -> " + str(val)

        for val in io['output']:
            func = func + " -> " + str(val)

        func = func + " -> Message;"
        f.write('        ' + func + "\n")
    
    for i in input_cat:
        f.write('        ' + "p_" + i + ": " + i + ";\n")
    
    for o in output_cat:
        if o not in input_cat:
            f.write('        ' + "p_" + o + ": " + o + ";\n")

    f.write('}')
    f.close()
    
    sentence_models = {
        "12": [
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in p_in_1)) (mkS (mkCl subject_out (mkNP both7and_DConj p_out_1 p_out_2)));",
                "operation": {
                    "subject_in": ["input of subject", "subject\'s input"],
                    "subject_out": ["output of subject", "subject\'s output"]
                }
            },
            {
                "s": "mkS and_Conj (mkS (mkCl p_in_1 subject_in)) (mkS (mkCl (mkNP both7and_DConj p_out_1 p_out_2) subject_out));",
                "operation": {
                    "subject_in": ["input of subject", "subject\'s input"],
                    "subject_out": ["output of subject", "subject\'s output"]
                }
            },
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in (mkV2 \"require\") p_in_1)) (mkS (mkCl subject_out (mkV2 \"return\") (mkNP and_Conj p_out_1 p_out_2)));",
                "operation": {
                    "subject_in": ["subject"],
                    "subject_out": ["it"]
                }
            }
        ],
        "13": [
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in p_in_1)) (mkS (mkCl subject_out (mkNP and_Conj (mkListNP p_out_1 (mkListNP p_out_2 p_out_3)))));",
                "operation": {
                    "subject_in": ["input of subject", "subject\'s input"],
                    "subject_out": ["output of subject", "subject\'s output"]
                }
            },
            {
                "s": "mkS and_Conj (mkS (mkCl p_in_1 subject_in)) (mkS (mkCl (mkNP and_Conj (mkListNP p_out_1 (mkListNP p_out_2 p_out_3))) subject_out));",
                "operation": {
                    "subject_in": ["input of subject", "subject\'s input"],
                    "subject_out": ["output of subject", "subject\'s output"]
                }
            },
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in (mkV2 \"require\") p_in_1)) (mkS (mkCl subject_out (mkV2 \"return\") (mkNP and_Conj (mkListNP p_out_1 (mkListNP p_out_2 p_out_3)))));",
                "operation": {
                    "subject_in": ["subject"],
                    "subject_out": ["it"]
                }
            }
        ],
        "21": [
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in (mkNP both7and_DConj p_in_1 p_in_2))) (mkS (mkCl subject_out p_out_1));",
                "operation": {
                    "subject_in": ["input of subject", "subject\'s input"],
                    "subject_out": ["output of subject", "subject\'s output"]
                }
            },
            {
                "s": "mkS and_Conj (mkS (mkCl subject_in (mkV2 \"require\") (mkNP and_Conj p_in_1 p_in_2))) (mkS (mkCl subject_out (mkV2 \"return\") p_out_1));",
                "operation": {
                    "subject_in": ["subject"],
                    "subject_out": ["it"]
                }
            }
        ]
    }
    
    print "\nGenerating PhyloEng\n"
    
    f = open('PhyloEng.gf', 'w')
    f.write('concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {\n')
    f.write('    lincat\n')
    f.write('        Message = S;\n')
    
    for i in input_cat:
        f.write('        ' + i + "= NP;\n")
    
    for o in output_cat:
        if o not in input_cat:
            f.write('        ' + o + "= NP;\n")
    
    f.write('    lin\n')
    
    operation = []
    
    for klass, io in in_out.items():
        model_cat = str( len(io['input']) ) + str( len(io['output']) )
        if model_cat in sentence_models.keys():
            sm = random.choice( sentence_models[model_cat] )
            tree = sm["s"]
            
            func = str(klass)
            for idx, val in enumerate(io['input']):
                gf_param = "p_" + str(val)
                func = func + " " + gf_param
                tree = tree.replace("p_in_" + str(idx + 1), gf_param)
                if str(val) in param_linearization:
                    f.write("        " + gf_param + " = mkNP( mkCN (mkN \"" + param_linearization[str(val)] + "\"));\n")
                else:
                    li = raw_input('Enter linearization for \'' + str(val) + '\': ')
                    param_linearization[str(val)] = li
                    f.write("        " + gf_param + " = mkNP( mkCN (mkN \"" + li + "\"));\n")
            
            for idx, val in enumerate(io['output']):
                gf_param = "p_" + str(val)
                func = func + " " + gf_param
                tree = tree.replace("p_out_" + str(idx + 1), gf_param)
                if str(val) in param_linearization:
                    f.write("        " + gf_param + " = mkNP( mkCN (mkN \"" + param_linearization[str(val)] + "\"));\n")
                else:
                    li = raw_input('Enter linearization for \'' + str(val) + '\': ')
                    param_linearization[str(val)] = li
                    f.write("        " + gf_param + " = mkNP( mkCN (mkN \"" + li + "\"));\n")
             
            for k in sm["operation"].keys():
                operation_linearization = random.choice( sm["operation"][k] )
                operation_linearization = operation_linearization.replace("subject", str(klass))
                operation_name = k.replace("subject", str(klass))
                tree = tree.replace(k, operation_name)
                operation.append({ operation_name: operation_linearization })
                
            func = func + " = " + tree 
            f.write('        ' + func + "\n")
        else:
            # when you can not find any model satisfing in_out conditions
            print((bcolors.WARNING + "\nWarning: Can not find suitable sentence models for {} which has {} input and {} output\n" + bcolors.ENDC).format(klass, len(io['input']), len(io['output']) ))
    
    print operation
    # TODO: combine linearization and learning from web service description
    f.write('    oper\n')
    for o in operation:
        f.write('        ' + o.keys()[0] + ' = mkNP (mkCN (mkN \"' + o[o.keys()[0]] + '\"));\n')
    f.write('}')
    f.close()
    
    print("\nTotal generated GF functions is {}\n".format(len(in_out)))
    
    # write to file json what we learnt.
    with open('linearization.json', 'w') as outfile:
        json.dump(param_linearization, outfile)
        
    # TODO: class level
#end.
