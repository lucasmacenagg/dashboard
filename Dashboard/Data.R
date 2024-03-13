data <- read.csv('koreanTV.csv')
data_limpo <- subset(data, !grepl("-", Rating) & !grepl("-", Year) & !grepl("-", Genre) & !grepl("-", Time) & !grepl("-", Votes.) & !grepl("-", Stars))
titulo <- data_limpo$Title
genero <- data_limpo$Genre
ano <- as.numeric(substr(data_limpo$Year, start = 2, stop = 5))
ranking <- as.numeric(data_limpo$Rating)

media_ano = mean(ano)
mediana_ano = median(ano)
desvio_ano = sd(ano)

media_classificação = mean(ranking)
mediana_classificação = median(ranking)
desvio_classificação = sd(ranking)

selecionar_primeiro_genero <- function(generos) {
  generos <- strsplit(generos, ", ")[[1]]
  primeiro_genero <- generos[1]
  print(primeiro_genero)
  return(primeiro_genero)
}

genero <- sapply(genero, selecionar_primeiro_genero)
