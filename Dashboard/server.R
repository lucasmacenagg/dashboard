library(shiny)
library(shinydashboard)
source("data.R")  

server <- function(input, output) {
  output$histogramPlot <- renderPlot({
    hist(ano, main = "Histograma de Ano", xlab = "Ano",
         xlim = c(input$x_slider, max(ano)))
  })
  
  output$media_ano <- renderText({
    paste("Média do Ano:", round(media_ano, 2))
  })
  
  output$mediana_ano <- renderText({
    paste("Mediana do Ano:", mediana_ano)
  })
  
  output$desvio_ano <- renderText({
    paste("Desvio Padrão do Ano:", round(desvio_ano, 2))
  })
}

server
