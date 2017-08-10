concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {
  
    lincat
        Message = Cl ;
    
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET     = NP;
        phylotastic_FindScientificNames_FromText_GNRD_GET_In     = NP;
        phylotastic_FindScientificNames_FromText_GNRD_GET_Out    = NP;
        phylotastic_FindScientificNamesFromWeb_GNRD_GET          = NP;
        phylotastic_FindScientificNames_Web_GNRD_GET_IN          = NP;
        phylotastic_FindScientificNames_Web_GNRD_GET_Out         = NP;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET        = NP;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In     = NP;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out    = NP;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET                = NP;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_In             = NP;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out            = NP;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET            = NP;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In         = NP;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out        = NP;
        phylotastic_GetPhylogeneticTree_OT_GET                   = NP;
        phylotastic_GetPhylogeneticTree_OT_GET_In                = NP;
        phylotastic_GetPhylogeneticTree_OT_GET_Out               = NP;
        phylotastic_GetPhylogeneticTree_OT_POST                  = NP;
        phylotastic_GetPhylogeneticTree_OT_POST_In               = NP;
        phylotastic_GetPhylogeneticTree_OT_POST_Out              = NP;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET          = NP;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_In       = NP;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out      = NP;
        
        -- Class level
        DMessage = S;
        resource_SetOfSciName = CN;
        resource_WebURL       = CN;
        resource_Document     = CN;
        resource_FreeText     = CN;
        resource_SetOfTaxon   = CN;
        resource_CountryName  = NP;
        resource_taxon        = NP;
        resource_speciesTree  = CN;
        resource_SetOfResolvedName = CN;
        resource_Tree         = CN;
        resource_Image        = CN;
        
    lin
        -- Class level
        NamesExtractionWeb presource_SetOfSciName presource_WebURL = mkS and_Conj (mkS (mkCl name_extraction_web_in presource_WebURL)) (mkS (mkCl name_extraction_web_out presource_SetOfSciName));
        NamesExtractionDocument presource_SetOfSciName presource_Document = mkS and_Conj (mkS (mkCl name_extraction_document_in presource_Document)) (mkS (mkCl name_extraction_document_out presource_SetOfSciName));
        NamesExtractionText presource_SetOfSciName presource_FreeText = mkS and_Conj (mkS (mkCl name_extraction_text_in presource_FreeText)) (mkS (mkCl name_extraction_text_out presource_SetOfSciName));
        NamesExtraction presource_SetOfSciName = mkCl name_extraction_out presource_SetOfSciName;
        NamesOperation = mkCl name_operation (mkVP (mkVP operate_V) (ConstructorsEng.mkAdv on_Prep (mkNP (mkCN (mkN "species names")))));
        NamesResolutions presource_SetOfTaxon presource_SetOfSciName = mkS and_Conj (mkS (mkCl name_resolution_in presource_SetOfSciName)) (mkS (mkCl name_resolution_out presource_SetOfTaxon));
        
        TaxonToSpeciesByCountry presource_SetOfSciName presource_CountryName presource_taxon = mkS and_Conj (mkS (mkCl taxon_to_species_by_country_in (mkNP both7and_DConj presource_taxon presource_CountryName))) (mkS (mkCl taxon_to_species_by_country_out presource_SetOfSciName));
        -- TODO TaxonToSpeciesByGenome: 
        TaxonToSpeciesOperation presource_SetOfSciName presource_taxon = mkS and_Conj (mkS (mkCl taxon_to_species_operation_in (mkNP both7and_DConj presource_taxon addtional_info))) (mkS (mkCl taxon_to_species_by_country_out presource_SetOfSciName));
        TaxonOperation = mkCl taxon_operation (mkVP (mkVP operate_V) (ConstructorsEng.mkAdv on_Prep (mkNP (mkCN (mkN "taxonomies")))));
        
        TaxonomyBasedExtraction presource_speciesTree presource_SetOfTaxon = mkS and_Conj (mkS (mkCl taxonomy_based_extraction_in presource_SetOfTaxon)) (mkS (mkCl taxonomy_based_extraction_out presource_speciesTree));
        PhylogenyBasedExtraction presource_speciesTree presource_SetOfResolvedName = mkS and_Conj (mkS (mkCl phylogeny_based_extraction_in presource_SetOfResolvedName)) (mkS (mkCl phylogeny_based_extraction_out presource_speciesTree));
        TreeExtractionOperation presource_Tree = mkCl tree_extraction_operation (mkVP (mkVP operate_V) (ConstructorsEng.mkAdv on_Prep (mkNP (mkCN (mkN "tree extraction API")))));
        
        TreeTransformation presource_Tree = mkS and_Conj (mkS (mkCl tree_transformation_in presource_Tree)) (mkS (mkCl tree_transformation_out presource_Tree));
        TreeScalingOperation presource_Tree = mkS and_Conj (mkS (mkCl tree_scaling_operation_in presource_Tree)) (mkS (mkCl tree_scaling_operation_out presource_Tree));
        
        TreeVisualizationOperation presource_Image presource_Tree = mkS and_Conj (mkS (mkCl tree_visualization_operation_in presource_Tree)) (mkS (mkCl tree_visualization_operation_out presource_Image));
        
        TreeOperation = mkCl tree_operation (mkVP (mkVP operate_V) (ConstructorsEng.mkAdv on_Prep (mkNP (mkCN (mkN "tree")))));
        
        presource_SetOfSciName = mkCN (mkN "set of scientific names");
        presource_WebURL       = mkCN (mkN "a web URL");
        presource_Document     = mkCN (mkN "a document");
        presource_FreeText     = mkCN (mkN "a piece of text");
        presource_SetOfTaxon   = mkCN (mkN "set of taxonomies");
        
        presource_taxon        = mkNP (mkCN (mkN "a taxonomy"));
        presource_CountryName  = mkNP (mkCN (mkN "a country name"));
        
        presource_speciesTree  = mkCN (mkN "species tree");
        presource_SetOfResolvedName = mkCN (mkN "set of resolved names");
        presource_Tree         = mkCN (mkN "tree");
        
        presource_Image        = mkCN (mkN "image of tree");
        
        -- Instance level
        ExtractNamesFromText pphylotastic_FindScientificNames_FromText_GNRD_GET_Out pphylotastic_FindScientificNames_FromText_GNRD_GET_In pphylotastic_FindScientificNamesFromFreeText_GNRD_GET = mkCl pphylotastic_FindScientificNames_FromText_GNRD_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_FindScientificNamesFromFreeText_GNRD_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_FindScientificNames_FromText_GNRD_GET_In)));
        ExtractNamesFromWeb pphylotastic_FindScientificNames_Web_GNRD_GET_Out pphylotastic_FindScientificNames_Web_GNRD_GET_IN pphylotastic_FindScientificNamesFromWeb_GNRD_GET = mkCl pphylotastic_FindScientificNames_Web_GNRD_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_FindScientificNamesFromWeb_GNRD_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_FindScientificNames_Web_GNRD_GET_IN)));
        ExtractNamesFromTaxonAndCountry pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET = mkCl pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In)));
        -- ExtractNamesFromTaxonAndCountry pparam_taxon pparam_species pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In pparam_country pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET = mkCl (mkNP and_Conj pparam_species pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In) (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET (ConstructorsEng.mkAdv from_Prep (mkNP and_Conj pparam_country pparam_taxon))));
        ExtractNamesFromTaxon pphylotastic_GetAllSpeciesFromTaxon_OT_GET_Out pphylotastic_GetAllSpeciesFromTaxon_OT_GET_In pphylotastic_GetAllSpeciesFromTaxon_OT_GET = mkCl pphylotastic_GetAllSpeciesFromTaxon_OT_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_OT_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_GetAllSpeciesFromTaxon_OT_GET_In)));
        -- ExtractNamesFromTaxon pparam_taxon pparam_species pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In pphylotastic_GetAllSpeciesFromTaxon_OT_GET =  mkCl (mkNP and_Conj pparam_species pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In) (passiveVP extract_V2 (mkNP pphylotastic_GetAllSpeciesFromTaxon_OT_GET (ConstructorsEng.mkAdv from_Prep pparam_taxon)));
        ExtractNamesFromTaxonAndGenome pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET = mkCl pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In)));
        ExtractTreeGet pphylotastic_GetPhylogeneticTree_OT_GET_Out pphylotastic_GetPhylogeneticTree_OT_GET_In pphylotastic_GetPhylogeneticTree_OT_GET = mkCl pphylotastic_GetPhylogeneticTree_OT_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_GetPhylogeneticTree_OT_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_GetPhylogeneticTree_OT_GET_In)));
        ExtractTreePost pphylotastic_GetPhylogeneticTree_OT_POST_Out pphylotastic_GetPhylogeneticTree_OT_POST_In pphylotastic_GetPhylogeneticTree_OT_POST = mkCl pphylotastic_GetPhylogeneticTree_OT_POST_Out (passiveVP extract_V2 (mkNP pphylotastic_GetPhylogeneticTree_OT_POST (ConstructorsEng.mkAdv from_Prep pphylotastic_GetPhylogeneticTree_OT_POST_In)));
        ResolveNames pphylotastic_ResolvedScientificNames_OT_TNRS_GET_Out pphylotastic_ResolvedScientificNames_OT_TNRS_GET_In pphylotastic_ResolvedScientificNames_OT_TNRS_GET = mkCl pphylotastic_ResolvedScientificNames_OT_TNRS_GET_Out (passiveVP extract_V2 (mkNP pphylotastic_ResolvedScientificNames_OT_TNRS_GET (ConstructorsEng.mkAdv from_Prep pphylotastic_ResolvedScientificNames_OT_TNRS_GET_In)));
        
        pphylotastic_FindScientificNamesFromFreeText_GNRD_GET     = mkNP phylotastic_FindScientificNamesFromFreeText_GNRD_GET_CN;
        pphylotastic_FindScientificNames_FromText_GNRD_GET_In     = mkNP phylotastic_FindScientificNames_FromText_GNRD_GET_In_CN;
        pphylotastic_FindScientificNames_FromText_GNRD_GET_Out    = mkNP phylotastic_FindScientificNames_FromText_GNRD_GET_Out_CN;
        pphylotastic_FindScientificNamesFromWeb_GNRD_GET          = mkNP phylotastic_FindScientificNamesFromWeb_GNRD_GET_CN;
        pphylotastic_FindScientificNames_Web_GNRD_GET_IN          = mkNP phylotastic_FindScientificNames_Web_GNRD_GET_IN_CN;
        pphylotastic_FindScientificNames_Web_GNRD_GET_Out         = mkNP phylotastic_FindScientificNames_Web_GNRD_GET_Out_CN;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET        = mkNP phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_CN;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In     = mkNP phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In_CN;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out    = mkNP phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out_CN;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET                = mkNP phylotastic_GetAllSpeciesFromTaxon_OT_GET_CN;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET_In             = mkNP phylotastic_GetAllSpeciesFromTaxon_OT_GET_In_CN;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET_Out            = mkNP phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out_CN;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET            = mkNP phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_CN;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In         = mkNP phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In_CN;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out        = mkNP phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out_CN;
        pphylotastic_GetPhylogeneticTree_OT_GET                   = mkNP phylotastic_GetPhylogeneticTree_OT_GET_CN;
        pphylotastic_GetPhylogeneticTree_OT_GET_In                = mkNP phylotastic_GetPhylogeneticTree_OT_GET_In_CN;
        pphylotastic_GetPhylogeneticTree_OT_GET_Out               = mkNP phylotastic_GetPhylogeneticTree_OT_GET_Out_CN;
        pphylotastic_GetPhylogeneticTree_OT_POST                  = mkNP phylotastic_GetPhylogeneticTree_OT_POST_CN;
        pphylotastic_GetPhylogeneticTree_OT_POST_In               = mkNP phylotastic_GetPhylogeneticTree_OT_POST_In_CN;
        pphylotastic_GetPhylogeneticTree_OT_POST_Out              = mkNP phylotastic_GetPhylogeneticTree_OT_POST_Out_CN;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET          = mkNP phylotastic_ResolvedScientificNames_OT_TNRS_GET_CN;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET_In       = mkNP phylotastic_ResolvedScientificNames_OT_TNRS_GET_In_CN;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET_Out      = mkNP phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out_CN;
        
    oper
        extract_V2 = variants {mkV2 "extract"; mkV2 "take"; mkV2 "collect"};
        return_V2 = mkV2 "return";
        operate_V = mkV "operate";
        
        -- Class level
        name_extraction_web_in       = mkNP (mkCN (mkN "input of NameExtractionWeb class"));
        name_extraction_web_out      = mkNP (mkCN (mkN "output"));
        name_extraction_document_in  = mkNP (mkCN (mkN "input of NameExtractionDocument class"));
        name_extraction_document_out = mkNP (mkCN (mkN "output"));
        name_extraction_text_in      = mkNP (mkCN (mkN "input of NameExtractionText class"));
        name_extraction_text_out     = mkNP (mkCN (mkN "output"));
        name_extraction_out          = mkNP (mkCN (mkN "output of NameExtraction class"));
        name_operation               = mkNP (mkCN (mkN "set of web services"));
        name_resolution_in           = mkNP (mkCN (mkN "input of NameResolution class"));
        name_resolution_out          = mkNP (mkCN (mkN "output"));
        taxon_to_species_by_country_in  = mkNP (mkCN (mkN "input of TaxonToSpeciesByCountry class"));
        taxon_to_species_by_country_out = mkNP (mkCN (mkN "output"));
        taxon_to_species_operation_in  = mkNP (mkCN (mkN "input of TaxonToSpeciesOperation class"));
        taxon_to_species_operation_out = mkNP (mkCN (mkN "output"));
        taxon_operation              = mkNP (mkCN (mkN "set of web services"));
        addtional_info               = mkNP (mkCN (mkN "an additional information"));
        taxonomy_based_extraction_in = mkNP (mkCN (mkN "input of TaxonomyBasedExtraction class"));
        taxonomy_based_extraction_out = mkNP (mkCN (mkN "output"));
        phylogeny_based_extraction_in = mkNP (mkCN (mkN "input of PhylogenyBasedExtraction class"));
        phylogeny_based_extraction_out = mkNP (mkCN (mkN "output"));
        tree_extraction_operation    = mkNP (mkCN (mkN "set of web services"));
        tree_transformation_in       = mkNP (mkCN (mkN "input of TreeTransformation class"));
        tree_transformation_out      = mkNP (mkCN (mkN "output"));
        tree_scaling_operation_in    = mkNP (mkCN (mkN "input of TreeScalingOperation class"));
        tree_scaling_operation_out   = mkNP (mkCN (mkN "output"));
        tree_visualization_operation_in = mkNP (mkCN (mkN "input of TreeVisualizationOperation class"));
        tree_visualization_operation_out = mkNP (mkCN (mkN "output"));
        tree_operation               = mkNP (mkCN (mkN "set of web services"));
        
        -- Instance level
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET_CN     = mkCN (mkN "phylotastic_FindScientificNamesFromFreeText_GNRD_GET");
        phylotastic_FindScientificNames_FromText_GNRD_GET_In_CN     = mkCN (mkN "phylotastic_FindScientificNamesFromFreeText_GNRD_GET_In");
        phylotastic_FindScientificNames_FromText_GNRD_GET_Out_CN    = mkCN (mkN "phylotastic_FindScientificNamesFromFreeText_GNRD_GET_Out");
        phylotastic_FindScientificNamesFromWeb_GNRD_GET_CN          = mkCN (mkN "phylotastic_FindScientificNamesFromWeb_GNRD_GET");
        phylotastic_FindScientificNames_Web_GNRD_GET_IN_CN          = mkCN (mkN "phylotastic_FindScientificNames_Web_GNRD_GET_IN");
        phylotastic_FindScientificNames_Web_GNRD_GET_Out_CN         = mkCN (mkN "phylotastic_FindScientificNames_Web_GNRD_GET_Out");
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_CN        = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET");
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In_CN     = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In");
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out_CN    = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out");
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_CN                = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_OT_GET");
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_In_CN             = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_OT_GET_In");
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out_CN            = mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out");
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_CN            = mkCN (mkN "phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET");
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In_CN         = mkCN (mkN "phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In");
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out_CN        = mkCN (mkN "phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out");
        phylotastic_GetPhylogeneticTree_OT_GET_CN                   = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_GET");
        phylotastic_GetPhylogeneticTree_OT_GET_In_CN                = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_GET_In");
        phylotastic_GetPhylogeneticTree_OT_GET_Out_CN               = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_GET_Out");
        phylotastic_GetPhylogeneticTree_OT_POST_CN                  = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_POST");
        phylotastic_GetPhylogeneticTree_OT_POST_In_CN               = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_POST_In");
        phylotastic_GetPhylogeneticTree_OT_POST_Out_CN              = mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_POST_Out");
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_CN          = mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET");
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_In_CN       = mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET_In");
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out_CN      = mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out");
        
}  
