#script (python)

import clingo
import datetime
import re 
from IPython import embed
import random
import json
from pprint import pprint

filter_out_params = ["http_response_time", "http_status_code_int", 
                     "resource_HTTPCode", "resource_ConnectionTime"]

sentence_models_file = "../grammar_generator/sentence_models.json"

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
    class_asp  = []
    instance_of_asp = []
    direct_asp = []
    subclass   = []
    klass      = {}
    direct_inheritance = {}
    data_format_input = []
    data_format_output = []
    
    def on_model(model):
        for a in model.symbols("atoms"):
            if a.name == "has_input":
                input_asp.append(a)
            elif a.name == "has_output":
                output_asp.append(a)
            elif a.name == "direct_instance":
                instance_of_asp.append(a)
            elif a.name == "subClass":
                subclass.append(a)
            elif a.name == "class":
                class_asp.append(a)
            elif a.name == "direct_child":
                direct_asp.append(a)
            elif a.name == "instance_operation_has_input_has_data_format":
                data_format_input.append(a)
            elif a.name == "instance_operation_has_output_has_data_format":
                data_format_output.append(a)
                
    # prg.load("ontology_base_modified.lp")
    prg.load("ontology_TESTING_Working.lp")
    prg.add("base", [], "has_input(S, F, I) :- instance_operation_has_input_has_data_format(S, I, F).")
    prg.add("base", [], "has_output(S, F, O) :- instance_operation_has_output_has_data_format(S, O, F).")
    prg.add("base", [], "not_direct_child(A, B) :- subClass(A, B), subClass(A, C), subClass(C, B), A != C, B != C, A != B.")
    prg.add("base", [], "direct_child(A, B) :- not not_direct_child(A, B), subClass(A, B), A != B.")
    prg.add("base", [], "not_direct_instance(A, B) :- isInstanceOf(A, C), subClass(C, B), isInstanceOf(A, B), B != C.")
    prg.add("base", [], "direct_instance(A, B) :- not not_direct_instance(A, B), isInstanceOf(A, B).")
    prg.ground([("base", [])])
    prg.solve(on_model = on_model)
    
    with open('linearization.json') as lfile:    
        param_linearization = json.load(lfile)
    
    in_out = {}
    
    input_classes = {}
    for i in input_asp:
        a = i.arguments
        input_classes[str(a[2])] = []
        if a[0] in in_out.keys():
            in_out[a[0]]["input"].append(a[2])
        else:
            in_out[a[0]] = {}
            in_out[a[0]]["input"] = [a[2]]
    
    # filter out http_response_time http_status_code_int 
    output_classes = {}
    for o in output_asp:
        a = o.arguments
        if str(a[2]) in filter_out_params:
            continue
        output_classes[str(a[2])] = []
        if a[0] in in_out.keys():
            if "output" in in_out[a[0]].keys():
                in_out[a[0]]["output"].append(a[2])
            else:
                in_out[a[0]]["output"] = [a[2]]
        else:
            in_out[a[0]] = {}
            in_out[a[0]]["input"] = []
            in_out[a[0]]["output"] = [a[2]]
            
            
    for key, value in in_out.items():
        if "output" not in value.keys():
            value["output"] = []
    
    instances = {}
    for instance in instance_of_asp:
        if instance.arguments[0] in in_out.keys():
            instances[ str(instance.arguments[0]) ] = str(instance.arguments[1])
    
    for s in subclass:
        if str(s.arguments[0]) in input_classes.keys():
            input_classes[ str(s.arguments[0]) ].append( str(s.arguments[1]) )
            
        if str(s.arguments[0]) in output_classes.keys():
            output_classes[ str(s.arguments[0]) ].append( str(s.arguments[1]) )
        
    # print "Instances"
    # print instances
    
    print input_classes
    print output_classes

    with open('ser_instances.json', 'w') as outfile:
        json.dump(instances, outfile)
    
    with open('input_classes.json', 'w') as outfile:
        json.dump(input_classes, outfile)
    
    with open('output_classes.json', 'w') as outfile:
        json.dump(output_classes, outfile)

    for d in direct_asp:
        if str(d.arguments[0]) not in direct_inheritance.keys():
            direct_inheritance[ str(d.arguments[0]) ] = []
        direct_inheritance[ str(d.arguments[0]) ].append( str(d.arguments[1]) )
        
    with open('direct_inheritance.json', 'w') as outfile:
        json.dump(direct_inheritance, outfile)
        
    instr_out = {}
    for key, value in in_out.items():
        instr_out[str(key)] = {}
        instr_out[str(key)]["input"] = []
        instr_out[str(key)]["output"] = []
        for v in value["input"]:
            instr_out[str(key)]["input"].append(str(v))
        for v in value["output"]:
            instr_out[str(key)]["output"].append(str(v))
            
    with open('in_out.json', 'w') as answer:
        answer.write(json.dumps(instr_out))
        
    print "\nGenerating Phylo\n"
    
    f = open('Phylo.gf', 'w')
    f.write('abstract Phylo = {\n')
    f.write('    flags startcat = DMessage;\n')
    f.write('    flags startcat = Message;\n')
    f.write('    cat\n')
    f.write('        Message;\n')

    f.write("        Input;\n")
    f.write("        Output;\n")
    f.write("        Format;\n")
    
    # for i in input_classes:
        # f.write('        ' + i + ";\n")
    
    # for o in output_classes:
    #     if o not in input_classes:
    #         f.write('        ' + o + ";\n")
        
    f.write('    fun\n')
    
    for instance, io in in_out.items():
        func_comment = "-- " + str(instance) + ": " 
        func = "f_" + str(instance) + ": " 
        
        for idx, val in enumerate(io['input']):
            if idx == 0:
                func_comment = func_comment + str(val)
                func = func + "Input"
            else:
                func_comment = func_comment + " -> " + str(val)
                func = func + " -> Input"
                                
        for idx, val in enumerate(io['output']):
            if idx == 0 and len(io['input']) == 0:
                func = func + "Output" 
            else:
                func_comment = func_comment + " -> " + str(val)
                func = func + " -> Output" 

        func = func + " -> Message;"
        # f.write('        ' + func_comment + "\n")
        f.write('        ' + func + "\n")
    
    f.write("        tree_figure: Format -> Format -> Message;\n")
    
    data_format = []
    data_format_func = []
    data_format_json = {}
    for a in data_format_input:
        if str(a.arguments[0]) not in data_format_func:
            format_input_func = "d_i_" + str(a.arguments[0]) + ": Input -> Format -> Message;"
            f.write('        ' + format_input_func + "\n")

        if str(a.arguments[0]) not in data_format_json:
            data_format_func.append( str(a.arguments[0]) )
            data_format_json[ str(a.arguments[0]) ] = []
            
        data_format_json[ str(a.arguments[0]) ].append({ "input": str(a.arguments[1]), "data": str(a.arguments[2]) })
        
        if str(a.arguments[2]) not in data_format:
            data_format.append( str(a.arguments[2]) )
    
    data_format_func = []
    for a in data_format_output:
        if str(a.arguments[0]) not in data_format_func:
            format_output_func = "d_o_" + str(a.arguments[0]) +  ": Output -> Format -> Message;"
            f.write('        ' + format_output_func + "\n")


        if str(a.arguments[0]) not in data_format_json:
            data_format_func.append( str(a.arguments[0]) )
            data_format_json[ str(a.arguments[0]) ] = []
        
        data_format_json[ str(a.arguments[0]) ].append({ "output": str(a.arguments[1]), "data": str(a.arguments[2]) })
            
        if str(a.arguments[2]) not in data_format:
            data_format.append( str(a.arguments[2]) )
    
    with open('data_format.json', 'w') as outfile:
        json.dump( data_format_json, outfile)
            
    for k in input_classes:
        f.write('        ' + "i_" + k + ": Input;\n")
    # print input_classes
    input_classes = set( val for dic in input_classes.values() for val in dic)
    # print input_classes
    for upper_classes in input_classes:
        f.write('        ' + "i_" + str(upper_classes) + ": Input;\n")
            
    for k in output_classes:
        f.write('        ' + "o_" + k + ": Output;\n")
    output_classes = set( val for dic in output_classes.values() for val in dic)
    for upper_classes in output_classes:
        f.write('        ' + "o_" + str(upper_classes) + ": Output;\n")
    
    for a in data_format:
        f.write('        ' + "d_" + a + ": Format;\n")
    
    f.write("        d_figure: Format;\n")
    f.write("        d_tree: Format;\n")
    
    f.write('}')
    f.close()
    
    with open( sentence_models_file ) as s:    
        sentence_models = json.load( s )
        
    print "\nGenerating PhyloEng\n"
    
    f = open('PhyloEng.gf', 'w')
    f.write('concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {\n')
    f.write('    lincat\n')
    f.write('        Message = S;\n')
    f.write("        Input = NP;\n")
    f.write("        Output = NP;\n")
    f.write("        Format = NP;\n")
    f.write('    lin\n')
    
    operation = []
    conjunctive = {}
    
    failed_generation = 0
    
    for instance, io in in_out.items():
        conjunctive[ str(instance) ] = {}
        model_cat = str( len(io['input']) ) + str( len(io['output']) )
        if model_cat in sentence_models.keys():
            sm = random.choice( sentence_models[model_cat] )
            tree = sm["s"]
            
            conjunctive[ str(instance) ]["accept_conjunctive"] = sm["accept_conjunctive"]
                
            func = "f_" + str(instance)
            for idx, val in enumerate( io['input'] ):
                gf_param = "i_" + str(val)
                func = func + " " + gf_param
                tree = tree.replace("p_in_" + str(idx + 1), gf_param)
                
            for idx, val in enumerate( io['output'] ):
                gf_param = "o_" + str(val)
                func = func + " " + gf_param
                tree = tree.replace("p_out_" + str(idx + 1), gf_param)
                
            for k in sm["operation"].keys():
                operation_linearization = random.choice( sm["operation"][k] )
                operation_linearization = operation_linearization.replace("subject", str(instance))
                operation_name = k.replace("subject", str(instance))
                tree = tree.replace(k, operation_name)
                operation.append({ operation_name: operation_linearization })
                
            func = func + " = " + tree 
            f.write('        ' + func + "\n")
        else:
            # when you can not find any model satisfing in_out conditions
            print((bcolors.FAIL + "\nWarning: Can not find suitable sentence models for {} which has {} input and {} output\n" + bcolors.ENDC).format(instance, len(io['input']), len(io['output']) ))
            failed_generation += 1
    
    data_format_func = []
    for a in data_format_input:
        if str(a.arguments[0]) not in data_format_func:
            fname = "d_i_" + str(a.arguments[0])
            i = " i_" + str(a.arguments[1])
            d = " d_" + str(a.arguments[2])
            format_input_func = fname + i + d + " = mkS (mkCl" + i + " (mkV2 \"use\")" + d + ");"
            f.write('        ' + format_input_func + "\n")
            data_format_func.append( str(a.arguments[0]) )

    data_format_func = []
    for a in data_format_output:
        if str(a.arguments[0]) not in data_format_func:
            fname = "d_o_" + str(a.arguments[0])
            o = " o_" + str(a.arguments[1])
            d = " d_" + str(a.arguments[2])
            format_output_func = fname + o + d + " = mkS (mkCl" + o + " (mkV2 \"use\")" + d + ");"
            f.write('        ' + format_output_func + "\n")
            data_format_func.append( str(a.arguments[0]) )
    
    f.write("        tree_figure d_figure d_tree = mkS (mkCl d_figure (mkV2 \"illustrate\") d_tree);\n")
            
    for k in input_classes:
        if k in param_linearization:
            f.write("        i_" + k + " = mkNP( mkCN (mkN \"" + param_linearization[k] + "\"));\n")
        else:
            li = raw_input('Enter linearization for \'' + k + '\': ')
            param_linearization[k] = li
            f.write("        i_" + k + " = mkNP( mkCN (mkN \"" + li + "\"));\n")
    
    for k in output_classes:
        if k in param_linearization:
            f.write("        o_" + k + " = mkNP( mkCN (mkN \"" + param_linearization[k] + "\"));\n")
        else:
            li = raw_input('Enter linearization for \'' + k + '\': ')
            param_linearization[k] = li
            f.write("        o_" + k + " = mkNP( mkCN (mkN \"" + li + "\"));\n")
    
    for k in data_format:
        if k in param_linearization:
            f.write("        d_" + k + " = mkNP( mkCN (mkN \"" + param_linearization[k] + " format\"));\n")
        else:
            f.write("        d_" + k + " = mkNP( mkCN (mkN \"" + str(k) + " format\"));\n")
    
    f.write("        d_figure = mkNP (mkCN (mkN \"Figure 1\"));\n")
    f.write("        d_tree = mkNP (mkCN (mkN \"the extracted tree\"));\n")
        
    print operation
    # TODO: combine linearization and learning from web service description
    f.write('    oper\n')
    for o in operation:
        f.write('        ' + o.keys()[0] + ' = mkNP (mkCN (mkN \"' + o[o.keys()[0]] + '\"));\n')
    
    f.write('}')
    f.close()
        
    print( (bcolors.FAIL + "\nFailed to generate {} out of {} GF functions\n" + bcolors.ENDC).format(failed_generation, len(in_out)) )
    
    # write to file json what we learnt.
    with open('linearization.json', 'w') as outfile:
        json.dump(param_linearization, outfile)
    
    with open('conjunctive.json', 'w') as outfile:
        json.dump(conjunctive, outfile)
    # TODO: class level
#end.
