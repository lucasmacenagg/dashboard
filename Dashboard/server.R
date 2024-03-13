library(shiny)
library(shinydashboard)
source("Data.R")

server <- function(input, output) {
  output$piechartPlot <- renderPlot({
    if (is.null(input$x_slider3)) {
      dados_ano <- data.frame(ano = 2005, genero = genero)
    }
    else{
    dados_ano <- data.frame(ano = ano, genero = genero) %>%
      filter(ano == c(input$x_slider3))
    genero_count <- count(dados_ano, genero)
    ggplot(genero_count, aes(x = "", y = n, fill = genero)) +
      geom_bar(stat = "identity", width = 1) +
      coord_polar("y") +
      theme_void() +
      labs(title = paste("Distribuição dos Gêneros das Obras Lançadas em", c(input$x_slider3)))
  }})
  
  output$linechartPlot <- renderPlot({
    ggplot(data_limpo, aes(x=ano, y=ranking)) + 
      geom_line(linetype="dashed") + coord_cartesian(xlim = c(input$x_slider2, max(ano))) + 
      ggtitle("Gráfico de Linha") + xlab("Ano") + ylab("Nota") 
  })
  
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
  
  output$x_slider <- renderUI({
    sliderInput(
      "x_slider", 
      "Valor de x:",
      min = min(ano),
      max = max(ano),
      value = mean(ano),
      step = 1
    )
  })
  output$x_slider <- renderUI({
    sliderInput(
      "x_slider2", 
      "Valor de x:",
      min = min(ano),
      max = max(ano),
      value = mean(ano),
      step = 1
    )
  })
}
