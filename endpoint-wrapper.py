from flask import Flask, render_template, request, jsonify
from werkzeug import secure_filename
from IPython import embed
import json
import random
from SPARQLWrapper import SPARQLWrapper, JSON

sparql = SPARQLWrapper("http://phylo.cs.nmsu.edu:3030/ds/query")

app = Flask(__name__)

# parameters submitted in the URL (?s=value&p=value&o=value)
# s: subject
# p: predicate
# o: object
# if you want to query s=ClassX for example, then the where part of your query will look like "where my:ClassX". my is prefix.
@app.route('/q', methods=['GET'])
def search():
    s = request.args.get('s')
    p = request.args.get('p')
    o = request.args.get('o')
    return jsonify(query(s, p, o))

def query(s, p, o):
    select = " SELECT "
    where = " "
    if s is None:
        select = select + "?s "
        where = where + "?s "
    else:
        where = where + s
        
    if p is None:
        select = select + "?p "
        where = where + " ?p "
    else:
        where = where + p
          
    if o is None:
        select = select + "?o "
        where = where + " ?o "
    else:
        where = where + o
    
    query =("PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>"
            "PREFIX cdao: <http://www.cs.nmsu.edu/~epontell/CDAO/cdao.owl#>"
            "PREFIX method: <http://www.cs.nmsu.edu/~epontell/Ontologies/phylogenetic_methods.owl#>"
            "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
            + select +
            "WHERE {"
                + where +
            "}")
    return call(query)
    
def call(q):
    sparql.setQuery(q)
    sparql.setReturnFormat(JSON)
    return sparql.query().convert()
    
        
if __name__ == '__main__':
   app.run(debug = True)