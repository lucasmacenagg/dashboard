data <- read.csv('koreanTV.csv')
titulo <- data$Title
genero <- data$Genre
ano <- as.numeric(substr(data$Year, start= 2,stop= 5))
ranking <- data$Rating
