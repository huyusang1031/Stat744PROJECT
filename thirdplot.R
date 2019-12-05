library(shiny)
library(htmltools)
library(leaflet)
library(leaflet.extras)
library(ggplot2)
library(dplyr)
library(RColorBrewer)

df <- read.csv("https://raw.githubusercontent.com/huyusang1031/Stat744PROJECT/master/plot3data/listing1909.csv")
#df <- select(df,neighbourhood_group_cleansed, latitude, longitude, room_type, bathrooms, bedrooms, price)
#is.na(df)
df$lat <- df$latitude
df$lon <- df$longitude
df$price <- as.numeric(df$price)
height <- max(df$latitude) - min(df$latitude)
width <- max(df$longitude) - min(df$longitude)
listings_borders <- c(bottom  = min(df$latitude)  - 0.02 * height, 
                      top     = max(df$latitude)  + 0.02 * height,
                      left    = min(df$longitude) - 0.02 * width,
                      right   = max(df$longitude) + 0.02 * width)

#map <- get_stamenmap(listings_borders, zoom = 10, maptype = "toner-lite")
#ggmap(map)

shinyApp(
  ui <-  fluidPage(
    headerPanel("Airbnb Victoria"),
    sidebarPanel(
      selectizeInput(inputId =  "Neighbourhood_group:",
                     label="Neighbourhood",
                     choices=  c("Langford"="Langford",
                                 "Central Saanich" = "Central Saanich",
                                 "Colwood" = "Colwood",
                                 "Esquimalt"="Esquimalt",
                                 "Highlands"="",
                                 "Juan de Fuca"="Juan de Fuca",
                                 "Metchosin"="Metchosin",
                                 "North Saanich"="North Saanich",
                                 "Oak Bay"="Oak Bay",
                                 "Saanich"="Saanich",
                                 "Salt Spring Island"="Salt Spring Island",
                                 "Sidney" = "Sidney",
                                 "Sooke"="Sooke",
                                 "Southern Gulf Islands"="Southern Gulf Islands",
                                 "Victoria" = "Victoria",
                                 "View Royal"="View Royal"),
                     multiple=TRUE,
                     options=list(maxItems=16, placeholder='Select a neighbourhood')
      ),
      selectInput(inputId =  "yearmonth:",
                  label="Year-Month",
                  choices=  c("201909" = "1909",
                              "201908" = "1908",
                              "201907" = "1907",
                              "201906" = "1906",
                              "201905" = "1905",
                              "201904" = "1904",
                              "201903" = "1903",
                              "201902" = "1902",
                              "201901" = "1901",
                              "201809" = "1809",
                              "201810" = "1810",
                              "201811" = "1811",
                              "201812" = "1812"
                  )
      ),
      br(),
      verbatimTextOutput("summary1"),
      br(),
      #      verbatimTextOutput("summary2"),
      br(),
      plotOutput("listplot1")
    ),
    mainPanel(leafletOutput("map"),
              br(),
              br(),
              plotOutput("priceplot1")
    )
  ),
  
  server <-  function(input, output) {
    # return the requested dataset
    dat <- reactive({
      #test <- subset(df, neighbourhood_group_cleansed==input$Neighbourhood_group)
      #print(test)
      df <- read.csv(paste0("https://raw.githubusercontent.com/huyusang1031/Stat744PROJECT/master/plot3data/listing",input$yearmonth,".csv"))
      df$price <- as.numeric(df$price)
      test <- filter(df, neighbourhood_group_cleansed %in% input$Neighbourhood_group)
    })
    #output$plot <- renderPlotly({
    # ggplotly(ggplot(dat(),aes(x=longitude, y=latitude, 
    #                           text=paste("reviews: ",number_of_reviews, 
    #                                                      "<br>price: ",price))) + geom_point(),
    #          tooltip="text")
    #})
    output$map <- renderLeaflet({
      cen_lat <- (max(dat()$latitude) + min(dat()$latitude))/2
      cen_lon <- (max(dat()$longitude) + min(dat()$longitude))/2
      pal=colorNumeric("OrRd", domain=dat()$price)
      # XT <- cbind(dat()$longitude, dat()$latitude)
      # kde2d <- bkde2D(XT, bandwidth = c(bw.ucv(XT[,1]),bw.ucv(XT[,2])))
      # x=kde2d$x1
      # y=kde2d$x2
      # z=kde2d$fhat
      # CL=contourLines(x,y,z)
      map1=leaflet(dat()) %>%
        setView(lng=cen_lon, lat=cen_lat, zoom=14) %>%
        addTiles() %>%
        addMarkers(~longitude, ~latitude,
                   #labelOptions = labelOptions(noHide = F),
                   clusterOptions = markerClusterOptions(),
                   popup = ~paste("room type:", room_type,"<br>",
                                  "price:", price,"<br>",
                                  "number of bedrooms:", bedrooms, "<br>",
                                  "number of bathrooms:", bathrooms)
        ) %>%
        addProviderTiles(providers$Stamen.TonerLines, options=providerTileOptions(opacity = 0.2)) %>%
        addProviderTiles("CartoDB.Positron.Position") 
      map1 %>% addHeatmap(lng=~longitude, lat=~latitude, intensity=~price, gradient = 
                            #                            heat.colors(20), 
                            "OrRd",
                          blur=20, max=100, radius=8) %>%
        addLegend(pal=pal, values=~price, position="bottomright")
      
    })
    output$summary1 <- renderPrint({
      dataset <- dat()
      cat("Total listings:\n", nrow(dataset))
    })
    output$summary3 <- renderPrint({
      dataset <- dat()
      cat("Listings by room type:\n")
      summary(dataset$room_type)
    })
    output$listplot1 <- renderPlot({
      dataset <- dat()
      ggplot(dataset,aes(x=room_type))+geom_bar() + 
        xlab("room type") + 
        ylab("number of listing")+theme_bw()
    })
    # output$priceplot1 <- renderPlot({
    #   dataset <- dat() %>%
    #     group_by(room_type) %>%
    #     summarise(avg_price=mean(price))
    #   ggplot(dataset,aes(x=room_type, y=avg_price))+geom_point() + xlab("room type") + 
    #     ylab("average price")+theme_bw()
    # })
    output$priceplot1 <- renderPlot({
      ggplot(dat(),aes(x=price)) +
        geom_histogram(binwidth = 10,colour="black",fill="white")+ xlab("Price") +
        scale_x_continuous(breaks=seq(0,300,20))+
        ylab("Number")+theme_bw()+ggtitle("The distribution of price")+
        geom_vline(aes(xintercept=mean(price,na.rm=T)), color="red", linetype="dashed",
                   size=1)
    })
  }
)
# Run the application 
shinyApp(ui = ui, server = server)
