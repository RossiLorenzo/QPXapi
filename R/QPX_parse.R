QPX_parse <- function(res) {
    
    # Get the carrier info
    carrier <- res$trips$data$carrier[, 2:3]
    names(carrier) <- c("carrier_code", "carrier_name")
    
    # Get the price info
    df <- QPX_parse_info(res$trips$tripOption)
    
    # Get the slices
    slices <- QPX_parse_slice(res$trips$tripOption$slice, carrier)
    
    # Join
    df <- dplyr::left_join(df, slices, by = c("option"))
    
    # Return
    return(df)
    
} 
