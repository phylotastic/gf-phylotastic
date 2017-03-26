abstract Phylo = {
  
  flags startcat = Message ;

  cat
    Message ; InputObj ; OutputObj ; Service ; DSMessage ; Portal ;

  fun
    Extract : OutputObj -> InputObj-> Service -> Message ;
    Resolve : OutputObj -> Service -> Message ;
    Submit : Portal -> InputObj-> Service -> Message ;
    TheyResolve: Service -> Message ;
    AndConj : Message -> Message -> DSMessage ;
    ListO, Tree, SNamesO, TheseSNamesO, ScientificNamesO : OutputObj ;
    SNamesI, ListI, TextI : InputObj ;
    ThePortal : Portal ;
    OpenTree, GNRD, OT_TNRS : Service ;
}