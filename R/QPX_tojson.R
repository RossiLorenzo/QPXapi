# Function that takes trip data and converts it into a valid json object
QPX_tojson <- function(origin, destination, date, oneway){
  # If is not one way create the new origin and destination 
  if(!oneway){
    old_origin <- origin
    origin <- c(origin, destination)
    destination <- c(destination, old_origin)
  }
  # Create json object
  jsonlite::toJSON(
    list(
      request = list(
        passengers = list(adultCount = 1),
        slice = dplyr::data_frame(origin = origin, destination = destination, date = date)
      )
    ), auto_unbox = TRUE)
}