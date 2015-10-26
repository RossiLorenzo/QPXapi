# Function to send the
QPX_POST <- function(body, apikey, ...) {
    # Send request
    req <- httr::POST("https://www.googleapis.com/qpxExpress/v1/trips/search", query = list(key = apikey), encode = "json", 
        httr::content_type_json(), body = body, ...)
    res <- jsonlite::fromJSON(httr::content(req, as = "text"))
    
    # Check that response is valid
    if (req$status_code != 200) 
        stop(paste0("Call failed with error ", req$status_code, " and message:\n", res$error$message), call. = FALSE)
    
    # Check that response is not empty
    if (is.null(res$trips$tripOption)) 
        stop("No results found", call. = FALSE)
    
    # If everything is OK return the parsed result
    return(res)
} 
