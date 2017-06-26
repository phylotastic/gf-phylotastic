abstract Phylo = {

    flags startcat = Message ;

    cat
        Message;
        
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET;
        phylotastic_FindScientificNames_FromText_GNRD_GET_In;
        phylotastic_FindScientificNames_FromText_GNRD_GET_Out;
       
        phylotastic_FindScientificNamesFromWeb_GNRD_GET;
        phylotastic_FindScientificNames_Web_GNRD_GET_IN;
        phylotastic_FindScientificNames_Web_GNRD_GET_Out;
        
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out;
        
        phylotastic_GetAllSpeciesFromTaxon_OT_GET;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_In;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out;
        
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In;
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out;
        
        phylotastic_GetPhylogeneticTree_OT_GET;
        phylotastic_GetPhylogeneticTree_OT_GET_In;
        phylotastic_GetPhylogeneticTree_OT_GET_Out;
        
        phylotastic_GetPhylogeneticTree_OT_POST;
        phylotastic_GetPhylogeneticTree_OT_POST_In;
        phylotastic_GetPhylogeneticTree_OT_POST_Out;
        
        phylotastic_ResolvedScientificNames_OT_TNRS_GET;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_In;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out;
        
    fun
        ExtractNamesFromText: phylotastic_FindScientificNames_FromText_GNRD_GET_Out -> phylotastic_FindScientificNames_FromText_GNRD_GET_In -> phylotastic_FindScientificNamesFromFreeText_GNRD_GET -> Message;
        ExtractNamesFromWeb: phylotastic_FindScientificNames_Web_GNRD_GET_Out -> phylotastic_FindScientificNames_Web_GNRD_GET_IN -> phylotastic_FindScientificNamesFromWeb_GNRD_GET -> Message;
        ExtractNamesFromTaxonAndCountry: phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out -> phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In -> phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET -> Message;
        ExtractNamesFromTaxon: phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out -> phylotastic_GetAllSpeciesFromTaxon_OT_GET_In -> phylotastic_GetAllSpeciesFromTaxon_OT_GET -> Message;
        ExtractNamesFromTaxonAndGenome: phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out -> phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In -> phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET -> Message;
        ExtractTreeGet: phylotastic_GetPhylogeneticTree_OT_GET_Out -> phylotastic_GetPhylogeneticTree_OT_GET_In -> phylotastic_GetPhylogeneticTree_OT_GET -> Message;
        ExtractTreePost: phylotastic_GetPhylogeneticTree_OT_POST_Out -> phylotastic_GetPhylogeneticTree_OT_POST_In -> phylotastic_GetPhylogeneticTree_OT_POST -> Message;        
        ResolveNames: phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out -> phylotastic_ResolvedScientificNames_OT_TNRS_GET_In -> phylotastic_ResolvedScientificNames_OT_TNRS_GET -> Message;
                
             
        pphylotastic_FindScientificNamesFromFreeText_GNRD_GET     : phylotastic_FindScientificNamesFromFreeText_GNRD_GET;
        pphylotastic_FindScientificNames_FromText_GNRD_GET_In     : phylotastic_FindScientificNames_FromText_GNRD_GET_In;
        pphylotastic_FindScientificNames_FromText_GNRD_GET_Out    : phylotastic_FindScientificNames_FromText_GNRD_GET_Out;
        pphylotastic_FindScientificNamesFromWeb_GNRD_GET          : phylotastic_FindScientificNamesFromWeb_GNRD_GET;
        pphylotastic_FindScientificNames_Web_GNRD_GET_IN          : phylotastic_FindScientificNames_Web_GNRD_GET_IN;
        pphylotastic_FindScientificNames_Web_GNRD_GET_Out         : phylotastic_FindScientificNames_Web_GNRD_GET_Out;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET        : phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In     : phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_In;
        pphylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out    : phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET_Out;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET                : phylotastic_GetAllSpeciesFromTaxon_OT_GET;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET_In             : phylotastic_GetAllSpeciesFromTaxon_OT_GET_In;
        pphylotastic_GetAllSpeciesFromTaxon_OT_GET_Out            : phylotastic_GetAllSpeciesFromTaxon_OT_GET_Out;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET            : phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In         : phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_In;
        pphylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out        : phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET_Out;
        pphylotastic_GetPhylogeneticTree_OT_GET                   : phylotastic_GetPhylogeneticTree_OT_GET;
        pphylotastic_GetPhylogeneticTree_OT_GET_In                : phylotastic_GetPhylogeneticTree_OT_GET_In;
        pphylotastic_GetPhylogeneticTree_OT_GET_Out               : phylotastic_GetPhylogeneticTree_OT_GET_Out;
        pphylotastic_GetPhylogeneticTree_OT_POST                  : phylotastic_GetPhylogeneticTree_OT_POST;
        pphylotastic_GetPhylogeneticTree_OT_POST_In               : phylotastic_GetPhylogeneticTree_OT_POST_In;
        pphylotastic_GetPhylogeneticTree_OT_POST_Out              : phylotastic_GetPhylogeneticTree_OT_POST_Out;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET          : phylotastic_ResolvedScientificNames_OT_TNRS_GET;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET_In       : phylotastic_ResolvedScientificNames_OT_TNRS_GET_In;
        pphylotastic_ResolvedScientificNames_OT_TNRS_GET_Out      : phylotastic_ResolvedScientificNames_OT_TNRS_GET_Out;
                                                       
}
