concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {
  
    lincat
        Message = Cl ;
    
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET = NP;
        param_text = NP;
        param_scientific_names_json = NP;
        
        phylotastic_FindScientificNamesFromWeb_GNRD_GET = NP;
        param_url = NP;

        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET = NP;
        param_taxon = NP;
        param_country = NP;
        param_species = NP;
        
        phylotastic_GetAllSpeciesFromTaxon_OT_GET = NP;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET = NP;

        phylotastic_GetPhylogeneticTree_OT_GET = NP;
        param_taxa = NP;
        param_species_tree = NP;

        phylotastic_GetPhylogeneticTree_OT_POST = NP;
        param_resolved_names = NP;

        phylotastic_ResolvedScientificNames_OT_TNRS_GET = NP;
        param_resolved_names = NP;
        param_names = NP;
        
    lin
        ExtractNamesFromText pparam_scientific_names_json pparam_text pphylotastic_FindScientificNamesFromFreeText_GNRD_GET = mkCl pparam_scientific_names_json (passiveVP extract_V2 (mkNP pphylotastic_FindScientificNamesFromFreeText_GNRD_GET (ConstructorsEng.mkAdv from_Prep pparam_text)));
        ExtractNamesFromWeb pparam_scientific_names_json pparam_url pphylotastic_FindScientificNamesFromWeb_GNRD_GET = mkCl pparam_scientific_names_json (passiveVP extract_V2 (mkNP pphylotastic_FindScientificNamesFromWeb_GNRD_GET (ConstructorsEng.mkAdv from_Prep pparam_url)));
        ExtractNamesFromTaxonAndCountry pparam_taxon pparam_species pparam_taxon pparam_country pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET = mkCl (mkNP and_Conj pparam_species pparam_taxon) (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET (ConstructorsEng.mkAdv from_Prep (mkNP and_Conj pparam_country pparam_taxon))));
        ExtractNamesFromTaxon pparam_taxon pparam_species pparam_taxon pphylotastic_GetAllSpeciesFromTaxon_OT_GET =  mkCl (mkNP and_Conj pparam_species pparam_taxon) (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_OT_GET (ConstructorsEng.mkAdv from_Prep pparam_taxon)));
        ExtractNamesFromTaxonAndGenome pparam_taxon pparam_species pparam_taxon pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET = mkCl pparam_taxon (passiveVP extract_V2 (mkNP pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET (ConstructorsEng.mkAdv from_Prep (mkNP and_Conj pparam_species pparam_taxon))));
        ExtractTreeGet pparam_species_tree pparam_taxa pphylotastic_GetPhylogeneticTree_OT_GET = mkCl pparam_species_tree (passiveVP extract_V2 (mkNP pphylotastic_GetPhylogeneticTree_OT_GET (ConstructorsEng.mkAdv from_Prep pparam_taxa)));
        ExtractTreePost pparam_species_tree pparam_resolved_names pphylotastic_GetPhylogeneticTree_OT_POST = mkCl pparam_species_tree (passiveVP extract_V2 (mkNP pphylotastic_GetPhylogeneticTree_OT_POST (ConstructorsEng.mkAdv from_Prep pparam_resolved_names)));
        ResolveNames pparam_resolved_names pparam_names pphylotastic_ResolvedScientificNames_OT_TNRS_GET = mkCl pparam_resolved_names (passiveVP extract_V2 (mkNP pphylotastic_ResolvedScientificNames_OT_TNRS_GET (ConstructorsEng.mkAdv from_Prep pparam_names)));
        
        
        Extract pparam_scientific_names_json pparam_text pphylotastic_FindScientificNamesFromFreeText_GNRD_GET = mkCl pphylotastic_FindScientificNamesFromFreeText_GNRD_GET extract_V2 (mkNP pparam_scientific_names_json (ConstructorsEng.mkAdv from_Prep pparam_text));
        Return pparam_scientific_names_json pparam_text pphylotastic_FindScientificNamesFromFreeText_GNRD_GET = mkCl pphylotastic_FindScientificNamesFromFreeText_GNRD_GET return_V2 (mkNP pparam_scientific_names_json (ConstructorsEng.mkAdv from_Prep pparam_text));
        
        pparam_text = mkNP text_CN ;
        pparam_scientific_names_json = mkNP aPl_Det scientific_names_CN;
        pphylotastic_FindScientificNamesFromFreeText_GNRD_GET = mkNP (mkCN (mkN "phylotastic_FindScientificNamesFromFreeText_GNRD_GET_ser"));

        pparam_url = mkNP url_CN ;
        pphylotastic_FindScientificNamesFromWeb_GNRD_GET = mkNP (mkCN (mkN "phylotastic_FindScientificNamesFromWeb_GNRD_GET"));
        
        pparam_species = mkNP species_CN ;
        pparam_taxon = mkNP taxon_CN ;
        pparam_country= mkNP country_CN ;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET = mkNP (mkCN (mkN "pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET"));
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET = mkNP (mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_OT_GET"));
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET = mkNP (mkCN (mkN "phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET"));
        
        pparam_species_tree = mkNP species_tree_CN;
        pparam_taxa = mkNP taxa_CN;
        pparam_resolved_names = mkNP resolved_names_CN;
        
        pphylotastic_GetPhylogeneticTree_OT_GET = mkNP (mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_GET"));
        pphylotastic_GetPhylogeneticTree_OT_POST = mkNP (mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_POST"));
        pparam_names = mkNP names_CN;
        
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET"));
        
    oper
        extract_V2 = variants {mkV2 "extract"; mkV2 "take"; mkV2 "collect"};
        return_V2 = mkV2 "return";
        
        text_CN = mkCN (mkN "provided text") ;        
        scientific_names_CN = mkCN (mkN "scientific name");
        url_CN = mkCN (mkN "provided web link") ;
        
        species_CN = mkCN (mkN "species names");
        taxon_CN = mkCN (mkN "taxon");
        country_CN = mkCN (mkN "country");
        
        species_tree_CN = mkCN (mkN "tree");
        taxa_CN = mkCN (mkN "taxa");
        resolved_names_CN = mkCN (mkN "resolved names");
        names_CN = mkCN (mkN "names");
}  
