library(plotly)
library(ggplot2)
library(shiny)
## 2018-09
eight_sep=read.csv("/Users/admin/Desktop/744/project/listings18-91.csv")
avgprc1809=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1809[(i-1)*3+k]=mean(eight_sep$price[eight_sep$neighbourhood_group_cleansed==levels(eight_sep$neighbourhood_group_cleansed)[i]&eight_sep$room_type==levels(eight_sep$room_type)[k]])
  }
}
neigh1809=c()
for (i in 1:16){
  for (k in 1:3){
    neigh1809[(i-1)*3+k]=levels(eight_sep$neighbourhood_group_cleansed)[i]
  }
}
roomtype1809=c()
for (i in 1:16){
  for (k in 1:3){
    roomtype1809[(i-1)*3+k]=levels(eight_sep$room_type)[k]
  }
}


## 2018-10
eight_oct=read.csv("/Users/admin/Desktop/744/project/listings18-101.csv")
avgprc1810=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1810[(i-1)*3+k]=mean(eight_oct$price[eight_oct$neighbourhood_group_cleansed==levels(eight_oct$neighbourhood_group_cleansed)[i]&eight_oct$room_type==levels(eight_oct$room_type)[k]])
  }
}

## 2018-11
eight_nov=read.csv("/Users/admin/Desktop/744/project/listings18-111.csv")
avgprc1811=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1811[(i-1)*3+k]=mean(eight_nov$price[eight_nov$neighbourhood_group_cleansed==levels(eight_nov$neighbourhood_group_cleansed)[i]&eight_nov$room_type==levels(eight_nov$room_type)[k]])
  }
}

## 2018-12
eight_dec=read.csv("/Users/admin/Desktop/744/project/listings18-121.csv")
avgprc1812=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1812[(i-1)*3+k]=mean(eight_dec$price[eight_dec$neighbourhood_group_cleansed==levels(eight_dec$neighbourhood_group_cleansed)[i]&eight_dec$room_type==levels(eight_dec$room_type)[k]])
  }
}

## 2019-01
nine_jan=read.csv("/Users/admin/Desktop/744/project/listings19-011.csv")
avgprc1901=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1901[(i-1)*3+k]=mean(nine_jan$price[nine_jan$neighbourhood_group_cleansed==levels(nine_jan$neighbourhood_group_cleansed)[i]&nine_jan$room_type==levels(nine_jan$room_type)[k]])
  }
}

## 2019-02
nine_feb=read.csv("/Users/admin/Desktop/744/project/listings19-021.csv")
avgprc1902=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1902[(i-1)*3+k]=mean(nine_feb$price[nine_feb$neighbourhood_group_cleansed==levels(nine_feb$neighbourhood_group_cleansed)[i]&nine_feb$room_type==levels(nine_feb$room_type)[k]])
  }
}

## 2019-03
nine_mar=read.csv("/Users/admin/Desktop/744/project/listings19-031.csv")
avgprc1903=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1903[(i-1)*3+k]=mean(nine_mar$price[nine_mar$neighbourhood_group_cleansed==levels(nine_mar$neighbourhood_group_cleansed)[i]&nine_mar$room_type==levels(nine_mar$room_type)[k]])
  }
}

## 2019-04
nine_apr=read.csv("/Users/admin/Desktop/744/project/listings19-041.csv")
avgprc1904=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1904[(i-1)*3+k]=mean(nine_apr$price[nine_apr$neighbourhood_group_cleansed==levels(nine_apr$neighbourhood_group_cleansed)[i]&nine_apr$room_type==levels(nine_apr$room_type)[k]])
  }
}

## 2019-05
nine_may=read.csv("/Users/admin/Desktop/744/project/listings19-051.csv")
avgprc1905=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1905[(i-1)*3+k]=mean(nine_may$price[nine_may$neighbourhood_group_cleansed==levels(nine_may$neighbourhood_group_cleansed)[i]&nine_may$room_type==levels(nine_may$room_type)[k]])
  }
}

## 2019-06
nine_june=read.csv("/Users/admin/Desktop/744/project/listings19-061.csv")
avgprc1906=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1906[(i-1)*3+k]=mean(nine_june$price[nine_june$neighbourhood_group_cleansed==levels(nine_june$neighbourhood_group_cleansed)[i]&nine_june$room_type==levels(nine_june$room_type)[k]])
  }
}

## 2019-07
nine_jul=read.csv("/Users/admin/Desktop/744/project/listings19-071.csv")
avgprc1907=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1907[(i-1)*3+k]=mean(nine_jul$price[nine_jul$neighbourhood_group_cleansed==levels(nine_jul$neighbourhood_group_cleansed)[i]&nine_jul$room_type==levels(nine_jul$room_type)[k]])
  }
}

## 2019-08
nine_aug=read.csv("/Users/admin/Desktop/744/project/listings19-081.csv")
avgprc1908=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1908[(i-1)*3+k]=mean(nine_aug$price[nine_aug$neighbourhood_group_cleansed==levels(nine_aug$neighbourhood_group_cleansed)[i]&nine_aug$room_type==levels(nine_aug$room_type)[k]])
  }
}


## 2019-09
nine_sep=read.csv("/Users/admin/Desktop/744/project/listings19-091.csv")
avgprc1909=c()
for (i in 1:16){
  for (k in 1:3){
    avgprc1909[(i-1)*3+k]=mean(nine_sep$price[nine_sep$neighbourhood_group_cleansed==levels(nine_sep$neighbourhood_group_cleansed)[i]&nine_sep$room_type==levels(nine_sep$room_type)[k]])
  }
}

time=c(format(as.Date(eight_sep$last_scraped),"%Y-%m")[1:48],format(as.Date(eight_oct$last_scraped),"%Y-%m")[1:48],format(as.Date(eight_nov$last_scraped),"%Y-%m")[1:48],
       format(as.Date(eight_dec$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_jan$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_feb$last_scraped),"%Y-%m")[1:48],
       format(as.Date(nine_mar$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_apr$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_may$last_scraped),"%Y-%m")[1:48],
       format(as.Date(nine_june$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_jul$last_scraped),"%Y-%m")[1:48],format(as.Date(nine_aug$last_scraped),"%Y-%m")[1:48],
       format(as.Date(nine_sep$last_scraped),"%Y-%m")[1:48])
neigh=c(neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809,neigh1809)
roomtype=c(roomtype1809,roomtype1809,roomtype1809,roomtype1809,roomtype1809,roomtype1809,roomtype1809,roomtype1809,roomtype1809,
           roomtype1809,roomtype1809,roomtype1809,roomtype1809)
avgprc=c(avgprc1809,avgprc1810,avgprc1811,avgprc1812,avgprc1901,avgprc1902,avgprc1903,avgprc1904,avgprc1905,avgprc1906,avgprc1907,avgprc1908,avgprc1909)
new=data.frame(time,neigh,roomtype,avgprc)

logprc=c()
for (i in 1:16){
  for (k in 1:3){
    logprc[(i-1)*3+k]=log(new$avgprc[new$neigh==levels(new$neigh)[i]&new$roomtype==levels(new$roomtype)[k]&new$time=="2019-09"])-
      log(new$avgprc[new$neigh==levels(new$neigh)[i]&new$roomtype==levels(new$roomtype)[k]&new$time=="2018-09"])
  }
}
logprc100=100*logprc
new2=data.frame(neigh1809,roomtype1809,logprc100)


ui<-fluidPage(
  sidebarPanel(
    h3("Please select a neighbourhood and a roomtype"),
    selectizeInput(
      inputId = "neighbour",
      label=NULL,
      choices=unique(new$neigh),
      multiple=TRUE,
      options=list(maxItems=16,placeholder='Select a neighbourhood')),
    selectizeInput(
      inputId = "type",
      label=NULL,
      choices = unique(new$roomtype),
      multiple = TRUE,
      options=list(maxItems=3,placeholder='select a roomtype')),
    plotlyOutput("termplot",height="600px")
#    verbatimTextOutput("termplot")
  ),
  mainPanel(
    plotlyOutput("p",height="800px")
  )
)
server<-function(input,output){
  output$p<-renderPlotly({
    nms=filter(new,neigh%in%input$neighbour,roomtype%in%input$type)
    if (nrow(nms)==0) return(NULL)
    finalplot<-ggplot(nms,aes(x=time,y=avgprc,color=neigh,linetype=roomtype,group=interaction(neigh,roomtype),
                              text=paste('Time:',time,
                                         '<br>Average price:',avgprc,
                                         '<br>Neighbourhood group:',neigh,
                                         '<br>Room type:',roomtype)))+
      geom_line()+
      geom_point()+
      labs(x="Time",y="Average price")+
      ggtitle("Trend of Monthly Average Price")+
      theme(plot.title = element_text(face="bold",hjust=0.5),legend.title = element_blank(),
            axis.text.x = element_text(angle=30,hjust=1))
    finalplotly<-ggplotly(finalplot,tooltip=c('text'))
#    layout(finalplotly,hovermode = 'x')
  })
  output$termplot<-renderPlotly({
    nms2=filter(new2,neigh1809%in%input$neighbour,roomtype1809%in%input$type)
    if (nrow(nms2)==0) return(NULL)
    g2<-ggplot(nms2,aes(x=neigh1809,y=logprc100,fill=roomtype1809,
                    text=paste('Neighbourhood group:',neigh1809,
                               '<br>Room Type:',roomtype1809,
                               '<br>Price Fluctuation(%):',logprc100)))+
      geom_bar(stat="identity",position = "dodge")+
      labs(x="Neighbourhood Group",y="Log-price difference(%)")+
      ggtitle("Price Fluctuation")+
      theme(plot.title=element_text(face="bold",hjust=0.5),legend.title = element_blank(),
            axis.text.x = element_text(angle=30,hjust=1))
    ggplotly(g2,tooltip=c('text'))
#    d<-event_data("plotly_hover")
#    if (is.null(d)) return("hover a point") else return (d)
#    nms=filter(new,neigh%in%input$neighbour,roomtype%in%input$type)
#    if (nrow(nms)==0) return(NULL)
#    cat(input$neighbour,"\n",input$type,"\n")
#    cat(log(subset(new,roomtype%in%input$type&neigh%in%input$neighbour&time=="2019-09",select=avgprc)$avgprc)-log(subset(new,roomtype%in%input$type&neigh%in%input$neighbour&time=="2018-09",select=avgprc)$avgprc),"\n")
#    cat(log(nms$avgprc[nms$roomtype%in%input$type&nms$neigh%in%input$neighbour&nms$time=="2019-09"])-log(nms$avgprc[nms$roomtype%in%input$type&nms$neigh%in%input$neighbour&nms$time=="2018-09"]))
  })
}
shinyApp(ui,server)


