concrete PhyloEng of Phylo = open Prelude, SyntaxEng, ParadigmsEng in {
  
  lincat
    Message = Cl ;
    DSMessage = S;
    OutputObj = NP ; 
    InputObj = NP ;
    Service = NP ;
    Portal = NP ;
    
  lin
    Extract o i s = mkCl o (passiveVP extract_V2 s);
    Resolve o s = mkCl o (passiveVP resolve_V2 s);
    Submit s o se = mkCl s (submit_V3) o se;
    TheyResolve s = mkCl they_NP (passiveVP resolve_V2 s);
    AndConj s1 s2 = mkS and_Conj (mkS s1) (mkS s2);
    Tree = mkNP the_Det tree_CN ;
    ListO = mkNP the_Det list_CN ;
    SNamesO = mkNP aPl_Det species_names_CN;
    TheseSNamesO = mkNP these_Det species_names_CN;
    ListI = mkNP the_Det list_CN ;
    TextI = mkNP text_CN ;
    SNamesI = mkNP aPl_Det species_names_CN;
    ScientificNamesO = mkNP aPl_Det scientific_names_CN;
    ThePortal = mkNP (mkCN portal_N);
    OpenTree = mkNP (mkCN open_tree_N) ;
    GNRD = mkNP (mkCN GNRD_N);
    OT_TNRS = mkNP (mkCN OT_TNRS_N);
  oper
    extract_V2 = variants {mkV2 "extract"; mkV2 "take"; mkV2 "collect"};
    resolve_V2 = variants {mkV2 "resolve"};
    submit_V3 = variants {mkV3 "send"};
    list_CN = mkCN (mkN "list");
    tree_CN = mkCN (mkN "tree");
    species_names_CN = mkCN (mkN "species name");
    scientific_names_CN = mkCN (mkN "scientific name");
    text_CN = mkCN (mkN "text") ;
    portal_N = mkN "the portal";
    open_tree_N = mkN "OpenTree";
    GNRD_N = mkN "GNRD";
    OT_TNRS_N = mkN "OpenTree Name Resolution Service";
}  
