# QPXapi
Easy access from R to the [QPX Express Airfare API](https://developers.google.com/qpx-express/)

## Installation
You can install the package using the **devtools** package as follows:
```S
devtools::install_github("RossiLorenzo/QPXapi")
```

## Usage
There is only one exported function in the package called `QPX`. Using this function you'll connect to the API and download the JSON data obtained. You can then choose to get the results as they are or reshaped in a R data.frame (only a subset of fields). For example:
```S
res <- QPX(apikey = "yourapikey", origin = "PSA", destination = "LON", date = Sys.Date() + 1)
```
this call will return the flights from Pisa to London fro tomorrow