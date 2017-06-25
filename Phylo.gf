abstract Phylo = {

    flags startcat = Message ;

    cat
        Message;
        
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET;
        param_text;
        param_scientific_names_json;
       
        phylotastic_FindScientificNamesFromWeb_GNRD_GET;
        param_url;
        
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET;
        param_taxon;
        param_country;
        param_species;
        
        phylotastic_GetAllSpeciesFromTaxon_OT_GET;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET;
        
        phylotastic_GetPhylogeneticTree_OT_GET;
        param_taxa;
        param_species_tree;
        
        phylotastic_GetPhylogeneticTree_OT_POST;
        param_resolved_names;
        
        
        phylotastic_ResolvedScientificNames_OT_TNRS_GET;
        param_resolved_names;
        param_names;
        
    fun
        ExtractNamesFromText: param_scientific_names_json -> param_text -> phylotastic_FindScientificNamesFromFreeText_GNRD_GET -> Message;
        ExtractNamesFromWeb: param_scientific_names_json -> param_url -> phylotastic_FindScientificNamesFromWeb_GNRD_GET -> Message;
        ExtractNamesFromTaxonAndCountry: param_taxon -> param_species -> param_taxon -> param_country -> phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET -> Message;
        ExtractNamesFromTaxon: param_taxon -> param_species -> param_taxon -> phylotastic_GetAllSpeciesFromTaxon_OT_GET -> Message;
        ExtractNamesFromTaxonAndGenome: param_taxon -> param_species -> param_taxon -> phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET -> Message;
        
        ExtractTreeGet: param_species_tree -> param_taxa -> phylotastic_GetPhylogeneticTree_OT_GET -> Message;
        ExtractTreePost: param_species_tree -> param_resolved_names -> phylotastic_GetPhylogeneticTree_OT_POST -> Message;        
        
        ResolveNames: param_resolved_names -> param_names -> phylotastic_ResolvedScientificNames_OT_TNRS_GET -> Message;
        
        pphylotastic_FindScientificNamesFromFreeText_GNRD_GET : phylotastic_FindScientificNamesFromFreeText_GNRD_GET;
        
        
        Extract: param_scientific_names_json -> param_text -> phylotastic_FindScientificNamesFromFreeText_GNRD_GET -> Message;
        Return: param_scientific_names_json -> param_text -> phylotastic_FindScientificNamesFromFreeText_GNRD_GET -> Message;
        
        
             
        pparam_text                                           : param_text;       
        pparam_scientific_names_json                          : param_scientific_names_json;       
        pphylotastic_FindScientificNamesFromWeb_GNRD_GET      : phylotastic_FindScientificNamesFromWeb_GNRD_GET;       
        pparam_url                                            : param_url;       
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET    : phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET;       
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET            : phylotastic_GetAllSpeciesFromTaxon_OT_GET;       
        pparam_taxon                                          : param_taxon;       
        pparam_country                                        : param_country;       
        pparam_species                                        : param_species;       
        pphylotastic_GetPhylogeneticTree_OT_GET               : phylotastic_GetPhylogeneticTree_OT_GET;       
        pparam_taxa                                           : param_taxa;       
        pparam_species_tree                                   : param_species_tree;       
        pphylotastic_GetPhylogeneticTree_OT_POST              : phylotastic_GetPhylogeneticTree_OT_POST;       
        pparam_resolved_names                                 : param_resolved_names;       
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET        : phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET;       
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET      : phylotastic_ResolvedScientificNames_OT_TNRS_GET;       
        pparam_resolved_names                                 : param_resolved_names;       
        pparam_names                                          : param_names;                                                 
}
