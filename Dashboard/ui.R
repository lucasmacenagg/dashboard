library(shiny)
library(shinydashboard)
source("server.R")
source("data.R")

ui <- dashboardPage(
  skin = "black",
  dashboardHeader(title = "Dashboard de dorama "),
  dashboardSidebar(
    sidebarMenu(
      menuItem("Histogramas", tabName = "histogramas", icon = icon("chart-bar")),
      menuItem("Dispersão", tabName = "dispersao", icon = icon("chart-bar"))
    )
  ),
  dashboardBody(
    tags$style(".content-wrapper { overflow-x: hidden; }"),
    
    tabItems(
      tabItem(
        tabName = "histogramas",
        sidebarPanel(
          sliderInput(
            "x_slider", 
            "Valor de x:",
            min = min(histo$breaks),
            max = max(histo$breaks),
            value = mean(histo$breaks),
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
      tabItem(tabName = "dispersao", "Testando a aba Dispersão")
    )
  )
)

shinyApp(ui, server)
