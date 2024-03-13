library(shiny)
library(shinydashboard)
library(ggplot2)
library(dplyr)
source("server.R")

ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "Dashboard TV Coreana"),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Programas por ano", tabName = "histograma", icon = icon("chart-bar")),
      menuItem("Notas por ano", tabName = "linha", icon = icon("chart-bar")),
      menuItem("Gêneros por ano", tabName = "pizza", icon = icon("chart-bar"))
    )
  ),
  dashboardBody(
    tags$style(".content-wrapper { overflow-x: hidden; }"),
    
    tabItems(
      tabItem(
        tabName = "histograma",
        sidebarPanel(
          sliderInput(
            "x_slider", 
            "Valor de x:",
            min = min(ano),
            max = max(ano),
            value = mean(ano),
            step = 1
          ),
          h3("Estatísticas do Ano"),
          textOutput("media_ano"),
          textOutput("mediana_ano"),
          textOutput("desvio_ano")
        ),
        mainPanel(
          plotOutput("histogramPlot", height = 300)
        )
      ),
      tabItem(
        tabName = "linha",
        mainPanel(
          plotOutput("linechartPlot", height = 300),
          sliderInput("x_slider2", "Valor de x:",
                      min = min(ano),
                      max = max(ano),
                      value = mean(ano),
                      step = 1)
        )
      ),
      tabItem(
        tabName = "pizza",
        sidebarPanel(
          sliderInput(
            "x_slider3", 
            "Valor de x:",
            min = 2000,
            max = 2018,
            value = 2005,
            step = 1
          ),
        ),
        mainPanel(
          plotOutput("piechartPlot", height = 300)
        )
      )
    )
  )
)

ui
