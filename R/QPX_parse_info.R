# Parse the price info and get a temporary ID
QPX_parse_info <- function(l) {
    
    data.frame(id = l$id, option = 1:nrow(l), price = as.numeric(gsub("[A-Za-z]", "", l$saleTotal)), currency = gsub("[0-9\\.]", 
        "", l$saleTotal), stringsAsFactors = FALSE)
    
} 
