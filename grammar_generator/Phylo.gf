abstract Phylo = {
    flags startcat = DMessage;
    flags startcat = Message;
    cat
        Message;
        bio_taxon;
        phylotastic_scientific_names;
        bio_taxa;
        phylotastic_TNRS_resolved_names;
        free_text;
        http_URL;
        a_country_in_the_world;
        eol_species_information_urls;
        http_status_code_int;
        cdao_species_tree;
        http_response_time;
    fun
        phylotastic_GetSpeciesOfTaxon_Genome_NCBI_GET: bio_taxon -> http_status_code_int -> phylotastic_scientific_names -> bio_taxon -> Message;
        phylotastic_FindScientificNamesFromFreeText_GNRD_GET: free_text -> http_response_time -> http_status_code_int -> phylotastic_scientific_names -> Message;
        phylotastic_GetAllSpeciesFromTaxon_Country_OT_GET: bio_taxon -> a_country_in_the_world -> http_status_code_int -> phylotastic_scientific_names -> bio_taxon -> Message;
        phylotastic_ResolvedScientificNames_GNR_TNRS_POST: phylotastic_scientific_names -> bio_taxa -> phylotastic_TNRS_resolved_names -> http_status_code_int -> Message;
        phylotastic_ResolvedScientificNames_GNR_TNRS_GET: phylotastic_scientific_names -> http_status_code_int -> bio_taxa -> phylotastic_TNRS_resolved_names -> Message;
        phylotastic_ResolvedScientificNames_OT_TNRS_POST: phylotastic_scientific_names -> http_status_code_int -> bio_taxa -> phylotastic_TNRS_resolved_names -> Message;
        phylotastic_ResolvedScientificNames_OT_TNRS_GET: phylotastic_scientific_names -> http_status_code_int -> phylotastic_TNRS_resolved_names -> bio_taxa -> Message;
        phylotastic_GetPhylogeneticTree_OT_GET: bio_taxa -> http_status_code_int -> cdao_species_tree -> Message;
        phylotastic_GetAllSpeciesFromTaxon_OT_GET: bio_taxon -> bio_taxon -> http_status_code_int -> phylotastic_scientific_names -> Message;
        phylotastic_GetInformationURLsOfSpecies_EOL_POST: phylotastic_scientific_names -> http_status_code_int -> eol_species_information_urls -> Message;
        phylotastic_GetPhylogeneticTree_OT_POST: phylotastic_TNRS_resolved_names -> bio_taxa -> http_status_code_int -> cdao_species_tree -> Message;
        phylotastic_FindScientificNamesFromWeb_GNRD_GET: http_URL -> http_response_time -> http_status_code_int -> phylotastic_scientific_names -> Message;
        phylotastic_GetInformationURLsOfSpecies_EOL_GET: phylotastic_scientific_names -> eol_species_information_urls -> http_status_code_int -> Message;
        p_bio_taxon: bio_taxon;
        p_phylotastic_scientific_names: phylotastic_scientific_names;
        p_bio_taxa: bio_taxa;
        p_phylotastic_TNRS_resolved_names: phylotastic_TNRS_resolved_names;
        p_free_text: free_text;
        p_http_URL: http_URL;
        p_a_country_in_the_world: a_country_in_the_world;
        p_eol_species_information_urls: eol_species_information_urls;
        p_http_status_code_int: http_status_code_int;
        p_cdao_species_tree: cdao_species_tree;
        p_http_response_time: http_response_time;
}