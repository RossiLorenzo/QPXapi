# Parse the slice info
QPX_parse_slice <- function(l, carrier) {
    
    parsed <- do.call(rbind, lapply(1:length(l), function(i) {
        s <- l[[i]]$segment
        dplyr::rbind_all(lapply(s, function(slice) {
            legs <- dplyr::rbind_all(slice$leg)
            tmp <- data.frame(option = i, segmentid = paste0(legs$id, collapse = " - "), carrier_code = paste0(unique(slice$flight$carrier), 
                collapse = " - "), carrier_name = paste0(dplyr::left_join(data.frame(carrier_code = unique(slice$flight$carrier), 
                stringsAsFactors = FALSE), carrier, by = c("carrier_code"))$carrier_name, collapse = " - "), flightnumber = paste0(unique(slice$flight$number), 
                collapse = " - "), origin = legs$origin[1], destination = legs$destination[nrow(legs)], stops = nrow(legs) - 
                1, stop_airport = paste0(legs$destination[-nrow(legs)], collapse = " - "), departuredate = as.POSIXlt(gsub("\\:", 
                "", legs$departureTime[1]), format = "%FT%H%M%z"), arrivaldate = as.POSIXlt(gsub("\\:", "", legs$arrivalTime[2]), 
                format = "%FT%H%M%z"), mileage = sum(legs$mileage), flightduration = sum(legs$duration), stringsAsFactors = FALSE)
        }))
    }))
    
    # Return results
    return(parsed)
} 
