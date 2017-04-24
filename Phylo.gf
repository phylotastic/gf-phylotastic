abstract Phylo = {
  
  flags startcat = Message ;

  cat
    Message ; InputObj ; OutputObj ; Service ; DSMessage ; TreeFormat ;

  fun
    ExtractNames : OutputObj -> InputObj -> Service -> Message ;
    ResolveNames : OutputObj -> InputObj -> Service -> Message ;
    ExtractTree: InputObj -> TreeFormat -> Service -> Message;
    
    names, text, taxa : InputObj ;
    scientificNames, resolvedNames : OutputObj ;
    newick : TreeFormat;
    
    OpenTree, GNRD, OT_TNRS : Service ;
}