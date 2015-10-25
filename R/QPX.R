##############################################################
#' Call QPX API
#'
#' Function that calls the QPX API and returns the resulting flights reshaped in a R dataframe
#'
#' @param apikey The authentication key. See https://developers.google.com/qpx-express/v1/prereqs for details on how to obtain your API key.
#'
#' @param origin Airport or city IATA designator of the origin.
#' 
#' @param destination Airport or city IATA designator of the destination.
#' 
#' @param date Departure date in YYYY-MM-DD format. If oneway is set to FALSE, the date argument must be a vector of length 2 with depart and return date.
#' 
#' @param oneway Boolean identifying if one way or return flight is requested.
#'
#' @examples
#' resp <- QPX(apikey = "yourapikey", origin = "PSA", destination = "LON", date = Sys.Date() + 1)
#' resp <- QPX(apikey = "yourapikey", origin = "PSA", destination = "LON", date = c(Sys.Date() + 1, Sys.Date() + 7), oneway = FALSE)
#' 
#' @export

QPX <- function(apikey, origin, destination, date, oneway = TRUE){
  
  # Check that parameters are correct
  invisible(QPX_check(origin, destination, date, oneway))
  
  # Create json body data
  body <- QPX_tojson(origin, destination, date, oneway)
  
  # Send request
  res <- QPX_POST(body, apikey)
  
}