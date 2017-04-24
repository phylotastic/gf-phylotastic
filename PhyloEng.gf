concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {
  
  lincat
    Message = Cl ;
    DSMessage = S;
    OutputObj = NP ; 
    InputObj = NP ;
    Service = NP ;
    TreeFormat = AP;
    
  lin
    ExtractNames o i s = mkCl o (passiveVP extract_V2 (mkNP s (ConstructorsEng.mkAdv from_Prep i)));
    ResolveNames o i s = mkCl o (passiveVP resolve_V2 (mkNP s (ConstructorsEng.mkAdv from_Prep i)));
    ExtractTree i tf s = mkCl (mkNP (mkNP tree_CN) (mkRS (mkRCl which_RP tf))) (passiveVP resolve_V2 (mkNP s (ConstructorsEng.mkAdv from_Prep i))) ;
    
    names = mkNP aPl_Det species_names_CN;
    text = mkNP text_CN ;
    taxa = mkNP taxa_CN ;
    
    scientificNames = mkNP aPl_Det scientific_names_CN;
    resolvedNames = mkNP aPl_Det resolved_names_CN;
    
    OpenTree = mkNP (mkCN open_tree_N) ;
    GNRD = mkNP (mkCN GNRD_N);
    OT_TNRS = mkNP (mkCN OT_TNRS_N);
    
    newick = mkAP newick_A;
    
  oper
    extract_V2 = variants {mkV2 "extract"; mkV2 "take"; mkV2 "collect"};
    resolve_V2 = variants {mkV2 "resolve"; mkV2 "correct"};
    be_V2 = mkV2 "to be";
    
    species_names_CN = mkCN (mkN "species name");
    text_CN = mkCN (mkN "text") ;
    taxa_CN = mkCN (mkN "these taxa") ;
    
    scientific_names_CN = mkCN (mkN "scientific name");
    resolved_names_CN = mkCN (mkN "resolved name");
    
    open_tree_N = mkN "OpenTree";
    GNRD_N = mkN "GNRD";
    OT_TNRS_N = mkN "OpenTree Name Resolution Service";
    
    tree_CN = mkCN (mkN "tree") ;
    newick_A = mkA "newick format" ;
    
}  
