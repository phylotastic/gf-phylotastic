concrete PhyloEng of Phylo = open SyntaxEng, ParadigmsEng, ConstructorsEng in {
    lincat
        Message = S;
        Input = NP;
        Output = NP;
        Format = NP;
    lin
        f_names_extraction_web i_resource_WebURL o_resource_SetOfSciName = mkS and_Conj (mkS (mkCl names_extraction_web_in (mkV2 "require") i_resource_WebURL)) (mkS (mkCl names_extraction_web_out (mkV2 "return") o_resource_SetOfSciName ));
        f_tree_retrieval_operation o_resource_Tree = mkS (mkCl tree_retrieval_operation_out o_resource_Tree);
        f_names_extraction_document i_resource_Document o_resource_SetOfSciName = mkS (mkCl names_extraction_document_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_Document (mkVP (mkV2 "extract") o_resource_SetOfSciName ));
        f_names_extraction_text i_resource_FreeText o_resource_SetOfSciName = mkS (mkCl names_extraction_text_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_FreeText (mkVP (mkV2 "extract") o_resource_SetOfSciName ));
        f_taxon_to_species_by_genome i_resource_taxon o_resource_taxon o_resource_SetOfSciName = mkS and_Conj (mkS (mkCl taxon_to_species_by_genome_in i_resource_taxon)) (mkS (mkCl taxon_to_species_by_genome_out (mkNP both7and_DConj o_resource_taxon o_resource_SetOfSciName)));
        f_gene_based_extraction i_resource_SetOfGeneStrings o_resource_geneTree o_resource_geneTree = mkS and_Conj (mkS (mkCl gene_based_extraction_in (mkV2 "require") i_resource_SetOfGeneStrings)) (mkS (mkCl gene_based_extraction_out (mkV2 "return") (mkNP and_Conj o_resource_geneTree o_resource_geneTree)));
        f_phylotastic_ResolvedScientificNames_GNR_TNRS_POST i_resource_SetOfSciName o_resource_SetOfNames o_resource_SetOfResolvedName o_resource_SetOfTaxon = mkS (mkCl phylotastic_ResolvedScientificNames_GNR_TNRS_POST_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_SetOfSciName (mkVP (mkV2 "extract") (mkNP and_Conj (mkListNP o_resource_SetOfNames (mkListNP o_resource_SetOfResolvedName o_resource_SetOfTaxon))) ));
        f_phylotastic_ResolvedScientificNames_OT_TNRS_POST i_resource_SetOfSciName o_resource_SetOfNames o_resource_SetOfTaxon o_resource_SetOfResolvedName = mkS and_Conj (mkS (mkCl phylotastic_ResolvedScientificNames_OT_TNRS_POST_in (mkV2 "require") i_resource_SetOfSciName)) (mkS (mkCl phylotastic_ResolvedScientificNames_OT_TNRS_POST_out (mkV2 "return") (mkNP and_Conj (mkListNP o_resource_SetOfNames (mkListNP o_resource_SetOfTaxon o_resource_SetOfResolvedName)))));
        f_phylotastic_ResolvedScientificNames_OT_TNRS_GET i_resource_SetOfSciName o_resource_SetOfNames o_resource_SetOfTaxon o_resource_SetOfResolvedName = mkS and_Conj (mkS (mkCl i_resource_SetOfSciName phylotastic_ResolvedScientificNames_OT_TNRS_GET_in)) (mkS (mkCl (mkNP and_Conj (mkListNP o_resource_SetOfNames (mkListNP o_resource_SetOfTaxon o_resource_SetOfResolvedName))) phylotastic_ResolvedScientificNames_OT_TNRS_GET_out));
        f_phylotastic_GetPhylogeneticTree_OT_GET i_resource_SetOfTaxon o_resource_speciesTree o_resource_Tree = mkS and_Conj (mkS (mkCl phylotastic_GetPhylogeneticTree_OT_GET_in (mkV2 "require") i_resource_SetOfTaxon)) (mkS (mkCl phylotastic_GetPhylogeneticTree_OT_GET_out (mkV2 "return") (mkNP and_Conj o_resource_speciesTree o_resource_Tree)));
        f_phylotastic_GetAllSpeciesFromTaxon_OT_GET i_resource_taxon o_resource_taxon o_resource_SetOfSciName = mkS and_Conj (mkS (mkCl phylotastic_GetAllSpeciesFromTaxon_OT_GET_in i_resource_taxon)) (mkS (mkCl phylotastic_GetAllSpeciesFromTaxon_OT_GET_out (mkNP both7and_DConj o_resource_taxon o_resource_SetOfSciName)));
        f_branch_length_comparison_operation i_resource_SetOfPhylogenyTrees = mkS (mkCl branch_length_comparison_operation_in i_resource_SetOfPhylogenyTrees);
        f_phylotastic_GetPhylogeneticTree_OT_POST i_resource_SetOfTaxon o_resource_Tree o_resource_speciesTree = mkS and_Conj (mkS (mkCl phylotastic_GetPhylogeneticTree_OT_POST_in i_resource_SetOfTaxon)) (mkS (mkCl phylotastic_GetPhylogeneticTree_OT_POST_out (mkNP both7and_DConj o_resource_Tree o_resource_speciesTree)));
        f_tree_scaling_operation i_resource_Tree o_resource_Tree = mkS (mkCl tree_scaling_operation_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_Tree (mkVP (mkV2 "extract") o_resource_Tree ));
        f_symmetric_comparison_operation i_resource_SetOfPhylogenyTrees = mkS (mkCl symmetric_comparison_operation_in i_resource_SetOfPhylogenyTrees);
        f_phylotastic_FindScientificNamesFromWeb_GNRD_GET i_resource_WebURL o_resource_SetOfSciName o_resource_SetOfNames = mkS (mkCl phylotastic_FindScientificNamesFromWeb_GNRD_GET_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_WebURL (mkVP (mkV2 "extract") (mkNP and_Conj o_resource_SetOfSciName o_resource_SetOfNames) ));
        f_gene_tree_scaling i_resource_geneTree o_resource_geneTree = mkS and_Conj (mkS (mkCl gene_tree_scaling_in (mkV2 "require") i_resource_geneTree)) (mkS (mkCl gene_tree_scaling_out (mkV2 "return") o_resource_geneTree ));
        f_phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET i_resource_taxon o_resource_taxon o_resource_SetOfSciName = mkS and_Conj (mkS (mkCl phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_in (mkV2 "require") i_resource_taxon)) (mkS (mkCl phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_out (mkV2 "return") (mkNP and_Conj o_resource_taxon o_resource_SetOfSciName)));
        f_phylotastic_FindScientificNamesFromFreeText_GNRD_GET i_resource_FreeText o_resource_SetOfSciName o_resource_SetOfNames = mkS and_Conj (mkS (mkCl phylotastic_FindScientificNamesFromFreeText_GNRD_GET_in (mkV2 "require") i_resource_FreeText)) (mkS (mkCl phylotastic_FindScientificNamesFromFreeText_GNRD_GET_out (mkV2 "return") (mkNP and_Conj o_resource_SetOfSciName o_resource_SetOfNames)));
        f_google_ConvertCountryCodeToName_GET i_resource_CountryCode o_resource_CountryName = mkS and_Conj (mkS (mkCl google_ConvertCountryCodeToName_GET_in i_resource_CountryCode)) (mkS (mkCl google_ConvertCountryCodeToName_GET_out o_resource_CountryName ));
        f_taxonomy_based_extraction i_resource_SetOfTaxon o_resource_speciesTree = mkS (mkCl taxonomy_based_extraction_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_SetOfTaxon (mkVP (mkV2 "extract") o_resource_speciesTree ));
        f_openTree_GetScientificNameFromAName_GET i_resource_Name o_resource_ScientificName = mkS and_Conj (mkS (mkCl openTree_GetScientificNameFromAName_GET_in i_resource_Name)) (mkS (mkCl openTree_GetScientificNameFromAName_GET_out o_resource_ScientificName ));
        f_openTree_GetTaxonomyNameFromSciName_GET i_resource_ScientificName o_resource_taxon = mkS (mkCl openTree_GetTaxonomyNameFromSciName_GET_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_ScientificName (mkVP (mkV2 "extract") o_resource_taxon ));
        f_common_name_to_scientific_name i_resource_Name o_resource_ScientificName = mkS (mkCl common_name_to_scientific_name_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_Name (mkVP (mkV2 "extract") o_resource_ScientificName ));
        f_phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET i_resource_WebURL o_resource_SetOfNames o_resource_SetOfSciName = mkS and_Conj (mkS (mkCl i_resource_WebURL phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET_in)) (mkS (mkCl (mkNP both7and_DConj o_resource_SetOfNames o_resource_SetOfSciName) phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET_out));
        f_phylotastic_GenerateGeneTree_From_Genes i_resource_SetOfGeneStrings o_resource_geneTree = mkS (mkCl phylotastic_GenerateGeneTree_From_Genes_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_SetOfGeneStrings (mkVP (mkV2 "extract") o_resource_geneTree ));
        f_phylotastic_GetReconciliationTree_GET i_resource_speciesTree i_resource_geneTree o_resource_reconcileTree = mkS and_Conj (mkS (mkCl phylotastic_GetReconciliationTree_GET_in (mkV2 "require") (mkNP and_Conj i_resource_speciesTree i_resource_geneTree))) (mkS (mkCl phylotastic_GetReconciliationTree_GET_out (mkV2 "return") o_resource_reconcileTree));
        f_phylotastic_GeneTree_Scaling i_resource_geneTree o_resource_geneTree = mkS and_Conj (mkS (mkCl phylotastic_GeneTree_Scaling_in i_resource_geneTree)) (mkS (mkCl phylotastic_GeneTree_Scaling_out o_resource_geneTree ));
        f_phylogeny_based_extraction i_resource_SetOfResolvedName o_resource_speciesTree = mkS (mkCl phylogeny_based_extraction_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_SetOfResolvedName (mkVP (mkV2 "extract") o_resource_speciesTree ));
        f_scientific_name_to_taxonomy i_resource_ScientificName o_resource_taxon = mkS and_Conj (mkS (mkCl scientific_name_to_taxonomy_in i_resource_ScientificName)) (mkS (mkCl scientific_name_to_taxonomy_out o_resource_taxon ));
        f_tree_extraction_operation o_resource_Tree = mkS (mkCl tree_extraction_operation_out o_resource_Tree);
        f_names_operation o_resource_SetOfNames = mkS (mkCl names_operation_out o_resource_SetOfNames);
        f_names_extraction_tree i_resource_geneTree o_resource_SetOfSciName = mkS (mkCl names_extraction_tree_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_geneTree (mkVP (mkV2 "extract") o_resource_SetOfSciName ));
        f_phylotastic_ExtractSpeicesName_From_Gene_Tree_GET i_resource_geneTree o_resource_SetOfSciName o_resource_SetOfNames = mkS and_Conj (mkS (mkCl phylotastic_ExtractSpeicesName_From_Gene_Tree_GET_in (mkV2 "require") i_resource_geneTree)) (mkS (mkCl phylotastic_ExtractSpeicesName_From_Gene_Tree_GET_out (mkV2 "return") (mkNP and_Conj o_resource_SetOfSciName o_resource_SetOfNames)));
        f_taxon_to_species_operation i_resource_taxon o_resource_SetOfSciName o_resource_taxon = mkS and_Conj (mkS (mkCl i_resource_taxon taxon_to_species_operation_in)) (mkS (mkCl (mkNP both7and_DConj o_resource_SetOfSciName o_resource_taxon) taxon_to_species_operation_out));
        f_names_resolution_operation i_resource_SetOfSciName o_resource_SetOfTaxon = mkS (mkCl names_resolution_operation_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_SetOfSciName (mkVP (mkV2 "extract") o_resource_SetOfTaxon ));
        f_names_extraction_operation o_resource_SetOfSciName = mkS (mkCl names_extraction_operation_out o_resource_SetOfSciName);
        f_tree_generation o_resource_Tree = mkS (mkCl tree_generation_out o_resource_Tree);
        f_country_code_to_name i_resource_CountryCode o_resource_CountryName = mkS (mkCl country_code_to_name_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_CountryCode (mkVP (mkV2 "extract") o_resource_CountryName ));
        f_tree_comparison i_resource_SetOfPhylogenyTrees = mkS (mkCl tree_comparison_in i_resource_SetOfPhylogenyTrees);
        f_phylotastic_ResolvedScientificNames_GNR_TNRS_GET i_resource_SetOfSciName o_resource_SetOfNames o_resource_SetOfResolvedName o_resource_SetOfTaxon = mkS and_Conj (mkS (mkCl i_resource_SetOfSciName phylotastic_ResolvedScientificNames_GNR_TNRS_GET_in)) (mkS (mkCl (mkNP and_Conj (mkListNP o_resource_SetOfNames (mkListNP o_resource_SetOfResolvedName o_resource_SetOfTaxon))) phylotastic_ResolvedScientificNames_GNR_TNRS_GET_out));
        f_tree_transformation i_resource_Tree o_resource_Tree = mkS (mkCl tree_transformation_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_Tree (mkVP (mkV2 "extract") o_resource_Tree ));
        f_tree_visualization i_resource_Tree o_resource_Image = mkS (mkCl tree_visualization_in (mkV2V (mkV "use") noPrep to_Prep) i_resource_Tree (mkVP (mkV2 "extract") o_resource_Image ));
        f_tree_reconciliation i_resource_geneTree i_resource_speciesTree o_resource_reconcileTree = mkS and_Conj (mkS (mkCl tree_reconciliation_in (mkV2 "require") (mkNP and_Conj i_resource_geneTree i_resource_speciesTree))) (mkS (mkCl tree_reconciliation_out (mkV2 "return") o_resource_reconcileTree));
        f_look_up_scientific_name o_resource_ScientificName = mkS (mkCl look_up_scientific_name_out o_resource_ScientificName);
        f_look_up_taxonomy o_resource_taxon = mkS (mkCl look_up_taxonomy_out o_resource_taxon);
        d_i_phylotastic_GeneTree_Scaling i_resource_geneTree d_newickTree = mkS (mkCl i_resource_geneTree (mkV2 "use") d_newickTree);
        d_i_phylotastic_GetReconciliationTree_GET i_resource_speciesTree d_newickTree = mkS (mkCl i_resource_speciesTree (mkV2 "use") d_newickTree);
        d_i_phylotastic_GenerateGeneTree_From_Genes i_resource_SetOfGeneStrings d_list_of_strings = mkS (mkCl i_resource_SetOfGeneStrings (mkV2 "use") d_list_of_strings);
        d_i_phylotastic_ExtractSpeicesName_From_Gene_Tree_GET i_resource_geneTree d_newickTree = mkS (mkCl i_resource_geneTree (mkV2 "use") d_newickTree);
        d_i_google_ConvertCountryCodeToName_GET i_resource_CountryCode d_integer = mkS (mkCl i_resource_CountryCode (mkV2 "use") d_integer);
        d_i_phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET i_resource_taxon d_string = mkS (mkCl i_resource_taxon (mkV2 "use") d_string);
        d_i_phylotastic_ResolvedScientificNames_OT_TNRS_GET i_resource_SetOfSciName d_names_format_resolved_OT = mkS (mkCl i_resource_SetOfSciName (mkV2 "use") d_names_format_resolved_OT);
        d_i_phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET i_resource_CountryName d_string = mkS (mkCl i_resource_CountryName (mkV2 "use") d_string);
        d_i_openTree_GetScientificNameFromAName_GET i_resource_Name d_string = mkS (mkCl i_resource_Name (mkV2 "use") d_string);
        d_i_phylotastic_GetAllSpeciesFromTaxon_OT_GET i_resource_taxon d_string = mkS (mkCl i_resource_taxon (mkV2 "use") d_string);
        d_i_phylotastic_GetPhylogeneticTree_OT_GET i_resource_SetOfTaxon d_list_of_strings = mkS (mkCl i_resource_SetOfTaxon (mkV2 "use") d_list_of_strings);
        d_i_phylotastic_GetPhylogeneticTree_OT_POST i_resource_SetOfTaxon d_list_of_strings = mkS (mkCl i_resource_SetOfTaxon (mkV2 "use") d_list_of_strings);
        d_i_phylotastic_FindScientificNamesFromWeb_GNRD_GET i_resource_WebURL d_data_format_D = mkS (mkCl i_resource_WebURL (mkV2 "use") d_data_format_D);
        d_i_phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET i_resource_WebURL d_data_format_E = mkS (mkCl i_resource_WebURL (mkV2 "use") d_data_format_E);
        d_i_phylotastic_ResolvedScientificNames_GNR_TNRS_GET i_resource_SetOfSciName d_names_format_resolved_GNR = mkS (mkCl i_resource_SetOfSciName (mkV2 "use") d_names_format_resolved_GNR);
        d_i_phylotastic_ResolvedScientificNames_GNR_TNRS_POST i_resource_SetOfSciName d_names_format_resolved_GNR = mkS (mkCl i_resource_SetOfSciName (mkV2 "use") d_names_format_resolved_GNR);
        d_i_openTree_GetTaxonomyNameFromSciName_GET i_resource_ScientificName d_string = mkS (mkCl i_resource_ScientificName (mkV2 "use") d_string);
        d_i_phylotastic_ResolvedScientificNames_OT_TNRS_POST i_resource_SetOfSciName d_names_format_resolved_OT = mkS (mkCl i_resource_SetOfSciName (mkV2 "use") d_names_format_resolved_OT);
        d_i_phylotastic_FindScientificNamesFromFreeText_GNRD_GET i_resource_FreeText d_plain_text = mkS (mkCl i_resource_FreeText (mkV2 "use") d_plain_text);
        d_o_phylotastic_GenerateGeneTree_From_Genes o_resource_geneTree d_newickTree = mkS (mkCl o_resource_geneTree (mkV2 "use") d_newickTree);
        d_o_phylotastic_ExtractSpeicesName_From_Gene_Tree_GET o_resource_SetOfNames d_list_of_strings = mkS (mkCl o_resource_SetOfNames (mkV2 "use") d_list_of_strings);
        d_o_phylotastic_GetPhylogeneticTree_OT_POST o_resource_speciesTree d_nmsu_tree_format = mkS (mkCl o_resource_speciesTree (mkV2 "use") d_nmsu_tree_format);
        d_o_phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET o_resource_SetOfNames d_list_of_strings = mkS (mkCl o_resource_SetOfNames (mkV2 "use") d_list_of_strings);
        d_o_openTree_GetScientificNameFromAName_GET o_resource_ScientificName d_string = mkS (mkCl o_resource_ScientificName (mkV2 "use") d_string);
        d_o_openTree_GetTaxonomyNameFromSciName_GET o_resource_taxon d_string = mkS (mkCl o_resource_taxon (mkV2 "use") d_string);
        d_o_phylotastic_FindScientificNamesFromWeb_GNRD_GET o_resource_ConnectionTime d_integer = mkS (mkCl o_resource_ConnectionTime (mkV2 "use") d_integer);
        d_o_google_ConvertCountryCodeToName_GET o_resource_CountryName d_string = mkS (mkCl o_resource_CountryName (mkV2 "use") d_string);
        d_o_phylotastic_GeneTree_Scaling o_resource_geneTree d_newickTree = mkS (mkCl o_resource_geneTree (mkV2 "use") d_newickTree);
        d_o_phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET o_resource_HTTPCode d_integer = mkS (mkCl o_resource_HTTPCode (mkV2 "use") d_integer);
        d_o_phylotastic_GetReconciliationTree_GET o_resource_reconcileTree d_newickTree = mkS (mkCl o_resource_reconcileTree (mkV2 "use") d_newickTree);
        d_o_phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET o_resource_HTTPCode d_integer = mkS (mkCl o_resource_HTTPCode (mkV2 "use") d_integer);
        d_o_phylotastic_GetPhylogeneticTree_OT_GET o_resource_Tree d_nmsu_tree_format = mkS (mkCl o_resource_Tree (mkV2 "use") d_nmsu_tree_format);
        d_o_phylotastic_GetAllSpeciesFromTaxon_OT_GET o_resource_HTTPCode d_integer = mkS (mkCl o_resource_HTTPCode (mkV2 "use") d_integer);
        d_o_phylotastic_ResolvedScientificNames_OT_TNRS_POST o_resource_SetOfNames d_list_of_strings = mkS (mkCl o_resource_SetOfNames (mkV2 "use") d_list_of_strings);
        d_o_phylotastic_ResolvedScientificNames_OT_TNRS_GET o_resource_HTTPCode d_integer = mkS (mkCl o_resource_HTTPCode (mkV2 "use") d_integer);
        d_o_phylotastic_ResolvedScientificNames_GNR_TNRS_POST o_resource_SetOfResolvedName d_list_of_strings = mkS (mkCl o_resource_SetOfResolvedName (mkV2 "use") d_list_of_strings);
        d_o_phylotastic_ResolvedScientificNames_GNR_TNRS_GET o_resource_SetOfNames d_list_of_strings = mkS (mkCl o_resource_SetOfNames (mkV2 "use") d_list_of_strings);
        d_o_phylotastic_FindScientificNamesFromFreeText_GNRD_GET o_resource_SetOfNames d_list_of_strings = mkS (mkCl o_resource_SetOfNames (mkV2 "use") d_list_of_strings);
        tree_figure d_figure d_tree = mkS (mkCl d_figure (mkV2 "illustrate") d_tree);
        i_phylotastic_resources = mkNP( mkCN (mkN "phylotastic resources"));
        i_resource_speciesTree = mkNP( mkCN (mkN "species tree"));
        i_resource_geneTree = mkNP( mkCN (mkN "geneTree"));
        i_resource_CountryName = mkNP( mkCN (mkN "name of country"));
        i_resource_SetOfGeneStrings = mkNP( mkCN (mkN "set of gene strings"));
        i_resource_String = mkNP( mkCN (mkN "a string"));
        i_phylotastic_concept = mkNP( mkCN (mkN "phylotastic concept"));
        i_resource_Tree = mkNP( mkCN (mkN "tree"));
        i_resource_URI = mkNP( mkCN (mkN "a URI"));
        i_resource_SetOfTaxon = mkNP( mkCN (mkN "a set of taxon"));
        i_resource_Name = mkNP( mkCN (mkN "a name"));
        i_network = mkNP( mkCN (mkN "network"));
        i_resource_SetOfNames = mkNP( mkCN (mkN "a set of names"));
        i_resource_FreeText = mkNP( mkCN (mkN "text"));
        i_resource_Text = mkNP( mkCN (mkN "text"));
        i_resource_SetOfScientificNames = mkNP( mkCN (mkN "a set of scientific names"));
        i_resource_WebURL = mkNP( mkCN (mkN "web URL"));
        i_resource_SetOfThings = mkNP( mkCN (mkN "set of things"));
        i_resource_ScientificName = mkNP( mkCN (mkN "scientific name"));
        i_resource_Number = mkNP( mkCN (mkN "a number"));
        i_resource_SetOfObjects = mkNP( mkCN (mkN "set of objects"));
        i_resource_CountryCode = mkNP( mkCN (mkN "resource country code"));
        i_resource_Document = mkNP( mkCN (mkN "recource document"));
        i_speciesTree = mkNP( mkCN (mkN "species tree"));
        i_resource_Object = mkNP( mkCN (mkN "object"));
        i_resource_SetOfStrings = mkNP( mkCN (mkN "set of strings"));
        i_resource_taxon = mkNP( mkCN (mkN "taxon"));
        i_tree = mkNP( mkCN (mkN "tree"));
        i_resource_SetOfSciName = mkNP( mkCN (mkN "a set of scientific names"));
        i_resource_SetOfResolvedName = mkNP( mkCN (mkN "a set of resolved names"));
        o_phylotastic_resources = mkNP( mkCN (mkN "phylotastic resources"));
        o_resource_speciesTree = mkNP( mkCN (mkN "species tree"));
        o_resource_geneTree = mkNP( mkCN (mkN "geneTree"));
        o_resource_CountryName = mkNP( mkCN (mkN "name of country"));
        o_resource_String = mkNP( mkCN (mkN "a string"));
        o_resource_reconcileTree = mkNP( mkCN (mkN "resource reconcile tree"));
        o_phylotastic_concept = mkNP( mkCN (mkN "phylotastic concept"));
        o_resource_Tree = mkNP( mkCN (mkN "tree"));
        o_resource_SetOfTaxon = mkNP( mkCN (mkN "a set of taxon"));
        o_resource_Name = mkNP( mkCN (mkN "a name"));
        o_network = mkNP( mkCN (mkN "network"));
        o_resource_SetOfResolvedName = mkNP( mkCN (mkN "a set of resolved names"));
        o_resource_Text = mkNP( mkCN (mkN "text"));
        o_resource_SetOfScientificNames = mkNP( mkCN (mkN "a set of scientific names"));
        o_resource_SetOfThings = mkNP( mkCN (mkN "set of things"));
        o_resource_ScientificName = mkNP( mkCN (mkN "scientific name"));
        o_reconcileTree = mkNP( mkCN (mkN "reconcile tree"));
        o_resource_Image = mkNP( mkCN (mkN "image"));
        o_speciesTree = mkNP( mkCN (mkN "species tree"));
        o_resource_Object = mkNP( mkCN (mkN "object"));
        o_resource_SetOfStrings = mkNP( mkCN (mkN "set of strings"));
        o_resource_taxon = mkNP( mkCN (mkN "taxon"));
        o_tree = mkNP( mkCN (mkN "tree"));
        o_resource_SetOfSciName = mkNP( mkCN (mkN "a set of scientific names"));
        o_resource_SetOfNames = mkNP( mkCN (mkN "a set of names"));
        d_newickTree = mkNP( mkCN (mkN "newick tree format"));
        d_list_of_strings = mkNP( mkCN (mkN "list of strings format"));
        d_integer = mkNP( mkCN (mkN "integer format"));
        d_string = mkNP( mkCN (mkN "string format"));
        d_names_format_resolved_OT = mkNP( mkCN (mkN "names_format_resolved_OT format"));
        d_data_format_D = mkNP( mkCN (mkN "data format D format"));
        d_data_format_E = mkNP( mkCN (mkN "data_format_E format"));
        d_names_format_resolved_GNR = mkNP( mkCN (mkN "names_format_resolved_GNR format"));
        d_plain_text = mkNP( mkCN (mkN "plain text format"));
        d_nmsu_tree_format = mkNP( mkCN (mkN "nmsu_tree_format format"));
        d_names_format_2 = mkNP( mkCN (mkN "names_format_2 format"));
        d_names_format_1 = mkNP( mkCN (mkN "names_format_1 format"));
        d_figure = mkNP (mkCN (mkN "Figure 1"));
        d_tree = mkNP (mkCN (mkN "the extracted tree"));
    oper
        names_extraction_web_in = mkNP (mkCN (mkN "names_extraction_web"));
        names_extraction_web_out = mkNP (mkCN (mkN "it"));
        tree_retrieval_operation_out = mkNP (mkCN (mkN "tree_retrieval_operation's output"));
        names_extraction_document_in = mkNP (mkCN (mkN "names_extraction_document"));
        names_extraction_document_out = mkNP (mkCN (mkN "it"));
        names_extraction_text_in = mkNP (mkCN (mkN "names_extraction_text"));
        names_extraction_text_out = mkNP (mkCN (mkN "it"));
        taxon_to_species_by_genome_in = mkNP (mkCN (mkN "taxon_to_species_by_genome's input"));
        taxon_to_species_by_genome_out = mkNP (mkCN (mkN "output of taxon_to_species_by_genome"));
        gene_based_extraction_in = mkNP (mkCN (mkN "gene_based_extraction"));
        gene_based_extraction_out = mkNP (mkCN (mkN "it"));
        phylotastic_ResolvedScientificNames_GNR_TNRS_POST_in = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_GNR_TNRS_POST"));
        phylotastic_ResolvedScientificNames_GNR_TNRS_POST_out = mkNP (mkCN (mkN "it"));
        phylotastic_ResolvedScientificNames_OT_TNRS_POST_in = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_POST"));
        phylotastic_ResolvedScientificNames_OT_TNRS_POST_out = mkNP (mkCN (mkN "it"));
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_in = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET's input"));
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_out = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_OT_TNRS_GET's output"));
        phylotastic_GetPhylogeneticTree_OT_GET_in = mkNP (mkCN (mkN "phylotastic_GetPhylogeneticTree_OT_GET"));
        phylotastic_GetPhylogeneticTree_OT_GET_out = mkNP (mkCN (mkN "it"));
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_in = mkNP (mkCN (mkN "input of phylotastic_GetAllSpeciesFromTaxon_OT_GET"));
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_out = mkNP (mkCN (mkN "phylotastic_GetAllSpeciesFromTaxon_OT_GET's output"));
        branch_length_comparison_operation_in = mkNP (mkCN (mkN "input of branch_length_comparison_operation"));
        phylotastic_GetPhylogeneticTree_OT_POST_in = mkNP (mkCN (mkN "input of phylotastic_GetPhylogeneticTree_OT_POST"));
        phylotastic_GetPhylogeneticTree_OT_POST_out = mkNP (mkCN (mkN "output of phylotastic_GetPhylogeneticTree_OT_POST"));
        tree_scaling_operation_in = mkNP (mkCN (mkN "tree_scaling_operation"));
        tree_scaling_operation_out = mkNP (mkCN (mkN "it"));
        symmetric_comparison_operation_in = mkNP (mkCN (mkN "input of symmetric_comparison_operation"));
        phylotastic_FindScientificNamesFromWeb_GNRD_GET_in = mkNP (mkCN (mkN "phylotastic_FindScientificNamesFromWeb_GNRD_GET"));
        phylotastic_FindScientificNamesFromWeb_GNRD_GET_out = mkNP (mkCN (mkN "it"));
        gene_tree_scaling_in = mkNP (mkCN (mkN "gene_tree_scaling"));
        gene_tree_scaling_out = mkNP (mkCN (mkN "it"));
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_in = mkNP (mkCN (mkN "phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET"));
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_out = mkNP (mkCN (mkN "it"));
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET_in = mkNP (mkCN (mkN "phylotastic_FindScientificNamesFromFreeText_GNRD_GET"));
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET_out = mkNP (mkCN (mkN "it"));
        google_ConvertCountryCodeToName_GET_in = mkNP (mkCN (mkN "input of google_ConvertCountryCodeToName_GET"));
        google_ConvertCountryCodeToName_GET_out = mkNP (mkCN (mkN "google_ConvertCountryCodeToName_GET's output"));
        taxonomy_based_extraction_in = mkNP (mkCN (mkN "taxonomy_based_extraction"));
        taxonomy_based_extraction_out = mkNP (mkCN (mkN "it"));
        openTree_GetScientificNameFromAName_GET_in = mkNP (mkCN (mkN "input of openTree_GetScientificNameFromAName_GET"));
        openTree_GetScientificNameFromAName_GET_out = mkNP (mkCN (mkN "output of openTree_GetScientificNameFromAName_GET"));
        openTree_GetTaxonomyNameFromSciName_GET_in = mkNP (mkCN (mkN "openTree_GetTaxonomyNameFromSciName_GET"));
        openTree_GetTaxonomyNameFromSciName_GET_out = mkNP (mkCN (mkN "it"));
        common_name_to_scientific_name_in = mkNP (mkCN (mkN "common_name_to_scientific_name"));
        common_name_to_scientific_name_out = mkNP (mkCN (mkN "it"));
        phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET_in = mkNP (mkCN (mkN "phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET's input"));
        phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET_out = mkNP (mkCN (mkN "output of phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET"));
        phylotastic_GenerateGeneTree_From_Genes_in = mkNP (mkCN (mkN "phylotastic_GenerateGeneTree_From_Genes"));
        phylotastic_GenerateGeneTree_From_Genes_out = mkNP (mkCN (mkN "it"));
        phylotastic_GetReconciliationTree_GET_in = mkNP (mkCN (mkN "phylotastic_GetReconciliationTree_GET"));
        phylotastic_GetReconciliationTree_GET_out = mkNP (mkCN (mkN "it"));
        phylotastic_GeneTree_Scaling_in = mkNP (mkCN (mkN "input of phylotastic_GeneTree_Scaling"));
        phylotastic_GeneTree_Scaling_out = mkNP (mkCN (mkN "output of phylotastic_GeneTree_Scaling"));
        phylogeny_based_extraction_in = mkNP (mkCN (mkN "phylogeny_based_extraction"));
        phylogeny_based_extraction_out = mkNP (mkCN (mkN "it"));
        scientific_name_to_taxonomy_in = mkNP (mkCN (mkN "input of scientific_name_to_taxonomy"));
        scientific_name_to_taxonomy_out = mkNP (mkCN (mkN "scientific_name_to_taxonomy's output"));
        tree_extraction_operation_out = mkNP (mkCN (mkN "tree_extraction_operation's output"));
        names_operation_out = mkNP (mkCN (mkN "output of names_operation"));
        names_extraction_tree_in = mkNP (mkCN (mkN "names_extraction_tree"));
        names_extraction_tree_out = mkNP (mkCN (mkN "it"));
        phylotastic_ExtractSpeicesName_From_Gene_Tree_GET_in = mkNP (mkCN (mkN "phylotastic_ExtractSpeicesName_From_Gene_Tree_GET"));
        phylotastic_ExtractSpeicesName_From_Gene_Tree_GET_out = mkNP (mkCN (mkN "it"));
        taxon_to_species_operation_in = mkNP (mkCN (mkN "input of taxon_to_species_operation"));
        taxon_to_species_operation_out = mkNP (mkCN (mkN "taxon_to_species_operation's output"));
        names_resolution_operation_in = mkNP (mkCN (mkN "names_resolution_operation"));
        names_resolution_operation_out = mkNP (mkCN (mkN "it"));
        names_extraction_operation_out = mkNP (mkCN (mkN "names_extraction_operation's output"));
        tree_generation_out = mkNP (mkCN (mkN "tree_generation's output"));
        country_code_to_name_in = mkNP (mkCN (mkN "country_code_to_name"));
        country_code_to_name_out = mkNP (mkCN (mkN "it"));
        tree_comparison_in = mkNP (mkCN (mkN "tree_comparison's input"));
        phylotastic_ResolvedScientificNames_GNR_TNRS_GET_in = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_GNR_TNRS_GET's input"));
        phylotastic_ResolvedScientificNames_GNR_TNRS_GET_out = mkNP (mkCN (mkN "phylotastic_ResolvedScientificNames_GNR_TNRS_GET's output"));
        tree_transformation_in = mkNP (mkCN (mkN "tree_transformation"));
        tree_transformation_out = mkNP (mkCN (mkN "it"));
        tree_visualization_in = mkNP (mkCN (mkN "tree_visualization"));
        tree_visualization_out = mkNP (mkCN (mkN "it"));
        tree_reconciliation_in = mkNP (mkCN (mkN "tree_reconciliation"));
        tree_reconciliation_out = mkNP (mkCN (mkN "it"));
        look_up_scientific_name_out = mkNP (mkCN (mkN "output of look_up_scientific_name"));
        look_up_taxonomy_out = mkNP (mkCN (mkN "look_up_taxonomy's output"));
}