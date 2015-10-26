QPX_check <- function(origin, destination, date, oneway) {
    # Check that origin and destinations are strings
    invisible(sapply(c("origin", "destination"), function(i) {
        if (length(get(i)) != 1) stop(paste("The argument", i, "can not be a vector"), call. = FALSE)
        if (class(get(i)) != "character") stop(paste("The argument", i, "should be a character"), call. = FALSE)
    }))
    
    # Check that date is in a valid format
    date <- try(as.Date(date), silent = TRUE)
    if ("try-error" %in% class(date)) 
        stop("The argument date is not in a valid format, please pass it in the format YYYY-MM-DD", call. = FALSE)
    
    # Check that there is only one date if oneway true or two otherwise
    if (!oneway & length(date) != 2) 
        stop("When the oneway parameter is set to FALSE date must be a vector of length 2", call. = FALSE)
    if (oneway & length(date) != 1) 
        stop("When the oneway parameter is set to TRUE date must be an unique value", call. = FALSE)
} 
