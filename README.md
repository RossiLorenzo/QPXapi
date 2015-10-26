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
this call will return the flights from Pisa to London for tomorrow

## API key
In order to use this package you need to obtain an API key. You can find a comprhensive guide on how to do this [HERE](https://developers.google.com/qpx-express/v1/prereqs).
The main steps are:

1. If you don't have one, get a Google account
2. Go to the [Google Developers Console](https://console.developers.google.com/project)
3. Create a New Project and give it the name you liek the most
4. On the sidebar menu click on APIs & Auth -> APIs
5. In the search box digit QPX and the click on the resulting line (QPX Express Airfare API)
6. Click on the blue button Enable API
7. In the sidebar menu select Credentials
8. Click on Add credentials and then choose API key -> server key
9. Create the key
10. You should now have you personal API key. Do not share it with anyone.
