abstract Phylo = {
    flags startcat = DMessage;
    flags startcat = Message;
    cat
        Message;
        Input;
        Output;
    fun
        -- names_extraction_web: resource_WebURL -> resource_SetOfSciName
        f_names_extraction_web: Input -> Output -> Message;
        -- tree_retrieval_operation: 
        f_tree_retrieval_operation: Output -> Message;
        -- names_extraction_document: resource_Document -> resource_SetOfSciName
        f_names_extraction_document: Input -> Output -> Message;
        -- names_extraction_text: resource_FreeText -> resource_SetOfSciName
        f_names_extraction_text: Input -> Output -> Message;
        -- taxon_to_species_by_genome: resource_taxon -> resource_taxon -> resource_SetOfSciName
        f_taxon_to_species_by_genome: Input -> Output -> Output -> Message;
        -- gene_based_extraction: resource_SetOfGeneStrings -> resource_geneTree -> resource_geneTree
        f_gene_based_extraction: Input -> Output -> Output -> Message;
        -- phylotastic_ResolvedScientificNames_GNR_TNRS_POST: resource_SetOfSciName -> resource_SetOfNames -> resource_SetOfResolvedName -> resource_SetOfTaxon
        f_phylotastic_ResolvedScientificNames_GNR_TNRS_POST: Input -> Output -> Output -> Output -> Message;
        -- taxon_to_species_by_country: resource_taxon -> resource_CountryName -> resource_taxon -> resource_SetOfSciName
        f_taxon_to_species_by_country: Input -> Input -> Output -> Output -> Message;
        -- phylotastic_ResolvedScientificNames_OT_TNRS_POST: resource_SetOfSciName -> resource_SetOfNames -> resource_SetOfTaxon -> resource_SetOfResolvedName
        f_phylotastic_ResolvedScientificNames_OT_TNRS_POST: Input -> Output -> Output -> Output -> Message;
        -- phylotastic_ResolvedScientificNames_OT_TNRS_GET: resource_SetOfSciName -> resource_SetOfNames -> resource_SetOfTaxon -> resource_SetOfResolvedName
        f_phylotastic_ResolvedScientificNames_OT_TNRS_GET: Input -> Output -> Output -> Output -> Message;
        -- phylotastic_GetPhylogeneticTree_OT_GET: resource_SetOfTaxon -> resource_speciesTree -> resource_Tree
        f_phylotastic_GetPhylogeneticTree_OT_GET: Input -> Output -> Output -> Message;
        -- phylotastic_GetAllSpeciesFromTaxon_OT_GET: resource_taxon -> resource_taxon -> resource_SetOfSciName
        f_phylotastic_GetAllSpeciesFromTaxon_OT_GET: Input -> Output -> Output -> Message;
        -- branch_length_comparison_operation: resource_SetOfPhylogenyTrees
        f_branch_length_comparison_operation: Input -> Message;
        -- phylotastic_GetPhylogeneticTree_OT_POST: resource_SetOfTaxon -> resource_Tree -> resource_speciesTree
        f_phylotastic_GetPhylogeneticTree_OT_POST: Input -> Output -> Output -> Message;
        -- tree_scaling_operation: resource_Tree -> resource_Tree
        f_tree_scaling_operation: Input -> Output -> Message;
        -- symmetric_comparison_operation: resource_SetOfPhylogenyTrees
        f_symmetric_comparison_operation: Input -> Message;
        -- phylotastic_FindScientificNamesFromWeb_GNRD_GET: resource_WebURL -> resource_SetOfSciName -> resource_SetOfNames
        f_phylotastic_FindScientificNamesFromWeb_GNRD_GET: Input -> Output -> Output -> Message;
        -- gene_tree_scaling: resource_geneTree -> resource_geneTree
        f_gene_tree_scaling: Input -> Output -> Message;
        -- phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET: resource_taxon -> resource_taxon -> resource_SetOfSciName
        f_phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET: Input -> Output -> Output -> Message;
        -- phylotastic_FindScientificNamesFromFreeText_GNRD_GET: resource_FreeText -> resource_SetOfSciName -> resource_SetOfNames
        f_phylotastic_FindScientificNamesFromFreeText_GNRD_GET: Input -> Output -> Output -> Message;
        -- google_ConvertCountryCodeToName_GET: resource_CountryCode -> resource_CountryName
        f_google_ConvertCountryCodeToName_GET: Input -> Output -> Message;
        -- taxonomy_based_extraction: resource_SetOfTaxon -> resource_speciesTree
        f_taxonomy_based_extraction: Input -> Output -> Message;
        -- openTree_GetScientificNameFromAName_GET: resource_Name -> resource_ScientificName
        f_openTree_GetScientificNameFromAName_GET: Input -> Output -> Message;
        -- openTree_GetTaxonomyNameFromSciName_GET: resource_ScientificName -> resource_taxon
        f_openTree_GetTaxonomyNameFromSciName_GET: Input -> Output -> Message;
        -- common_name_to_scientific_name: resource_Name -> resource_ScientificName
        f_common_name_to_scientific_name: Input -> Output -> Message;
        -- phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET: resource_WebURL -> resource_SetOfNames -> resource_SetOfSciName
        f_phylotastic_FindScientificNamesFromWeb_CS_NMSU_GET: Input -> Output -> Output -> Message;
        -- phylotastic_GenerateGeneTree_From_Genes: resource_SetOfGeneStrings -> resource_geneTree
        f_phylotastic_GenerateGeneTree_From_Genes: Input -> Output -> Message;
        -- phylotastic_GetReconciliationTree_GET: resource_speciesTree -> resource_geneTree -> resource_reconcileTree
        f_phylotastic_GetReconciliationTree_GET: Input -> Input -> Output -> Message;
        -- phylotastic_GeneTree_Scaling: resource_geneTree -> resource_geneTree
        f_phylotastic_GeneTree_Scaling: Input -> Output -> Message;
        -- phylogeny_based_extraction: resource_SetOfResolvedName -> resource_speciesTree
        f_phylogeny_based_extraction: Input -> Output -> Message;
        -- scientific_name_to_taxonomy: resource_ScientificName -> resource_taxon
        f_scientific_name_to_taxonomy: Input -> Output -> Message;
        -- tree_extraction_operation: 
        f_tree_extraction_operation: Output -> Message;
        -- names_operation: 
        f_names_operation: Output -> Message;
        -- names_extraction_tree: resource_geneTree -> resource_SetOfSciName
        f_names_extraction_tree: Input -> Output -> Message;
        -- phylotastic_ExtractSpeicesName_From_Gene_Tree_GET: resource_geneTree -> resource_SetOfSciName -> resource_SetOfNames
        f_phylotastic_ExtractSpeicesName_From_Gene_Tree_GET: Input -> Output -> Output -> Message;
        -- taxon_to_species_operation: resource_taxon -> resource_SetOfSciName -> resource_taxon
        f_taxon_to_species_operation: Input -> Output -> Output -> Message;
        -- names_resolution_operation: resource_SetOfSciName -> resource_SetOfTaxon
        f_names_resolution_operation: Input -> Output -> Message;
        -- phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET: resource_CountryName -> resource_taxon -> resource_taxon -> resource_SetOfSciName
        f_phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET: Input -> Input -> Output -> Output -> Message;
        -- names_extraction_operation: 
        f_names_extraction_operation: Output -> Message;
        -- tree_generation: 
        f_tree_generation: Output -> Message;
        -- country_code_to_name: resource_CountryCode -> resource_CountryName
        f_country_code_to_name: Input -> Output -> Message;
        -- tree_comparison: resource_SetOfPhylogenyTrees
        f_tree_comparison: Input -> Message;
        -- phylotastic_ResolvedScientificNames_GNR_TNRS_GET: resource_SetOfSciName -> resource_SetOfNames -> resource_SetOfResolvedName -> resource_SetOfTaxon
        f_phylotastic_ResolvedScientificNames_GNR_TNRS_GET: Input -> Output -> Output -> Output -> Message;
        -- tree_transformation: resource_Tree -> resource_Tree
        f_tree_transformation: Input -> Output -> Message;
        -- tree_visualization: resource_Tree -> resource_Image
        f_tree_visualization: Input -> Output -> Message;
        -- tree_reconciliation: resource_geneTree -> resource_speciesTree -> resource_reconcileTree
        f_tree_reconciliation: Input -> Input -> Output -> Message;
        -- look_up_scientific_name: 
        f_look_up_scientific_name: Output -> Message;
        -- look_up_taxonomy: 
        f_look_up_taxonomy: Output -> Message;
        i_resource_SetOfTaxon: Input;
        i_resource_CountryName: Input;
        i_resource_Name: Input;
        i_resource_geneTree: Input;
        i_resource_SetOfPhylogenyTrees: Input;
        i_resource_SetOfGeneStrings: Input;
        i_resource_FreeText: Input;
        i_resource_taxon: Input;
        i_resource_ScientificName: Input;
        i_resource_SetOfResolvedName: Input;
        i_resource_speciesTree: Input;
        i_resource_WebURL: Input;
        i_resource_CountryCode: Input;
        i_resource_Document: Input;
        i_resource_SetOfSciName: Input;
        i_resource_Tree: Input;
        i_phylotastic_resources: Input;
        i_resource_speciesTree: Input;
        i_resource_geneTree: Input;
        i_resource_CountryName: Input;
        i_resource_SetOfGeneStrings: Input;
        i_resource_String: Input;
        i_phylotastic_concept: Input;
        i_resource_Tree: Input;
        i_resource_URI: Input;
        i_resource_SetOfTaxon: Input;
        i_resource_Name: Input;
        i_network: Input;
        i_resource_SetOfNames: Input;
        i_resource_FreeText: Input;
        i_resource_Text: Input;
        i_resource_SetOfScientificNames: Input;
        i_resource_WebURL: Input;
        i_resource_SetOfThings: Input;
        i_resource_ScientificName: Input;
        i_resource_Number: Input;
        i_resource_SetOfObjects: Input;
        i_resource_CountryCode: Input;
        i_resource_Document: Input;
        i_speciesTree: Input;
        i_resource_Object: Input;
        i_resource_SetOfStrings: Input;
        i_resource_taxon: Input;
        i_tree: Input;
        i_resource_SetOfSciName: Input;
        i_resource_SetOfResolvedName: Input;
        o_resource_SetOfTaxon: Output;
        o_resource_ScientificName: Output;
        o_resource_speciesTree: Output;
        o_resource_geneTree: Output;
        o_resource_CountryName: Output;
        o_resource_SetOfResolvedName: Output;
        o_resource_taxon: Output;
        o_resource_Image: Output;
        o_resource_SetOfNames: Output;
        o_resource_reconcileTree: Output;
        o_resource_SetOfSciName: Output;
        o_resource_Tree: Output;
        o_phylotastic_resources: Output;
        o_resource_speciesTree: Output;
        o_resource_geneTree: Output;
        o_resource_CountryName: Output;
        o_resource_String: Output;
        o_resource_reconcileTree: Output;
        o_phylotastic_concept: Output;
        o_resource_Tree: Output;
        o_resource_SetOfTaxon: Output;
        o_resource_Name: Output;
        o_network: Output;
        o_resource_SetOfResolvedName: Output;
        o_resource_Text: Output;
        o_resource_SetOfScientificNames: Output;
        o_resource_SetOfThings: Output;
        o_resource_ScientificName: Output;
        o_reconcileTree: Output;
        o_resource_Image: Output;
        o_speciesTree: Output;
        o_resource_Object: Output;
        o_resource_SetOfStrings: Output;
        o_resource_taxon: Output;
        o_tree: Output;
        o_resource_SetOfSciName: Output;
        o_resource_SetOfNames: Output;
}