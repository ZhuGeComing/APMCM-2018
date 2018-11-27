library(readr)
data = read_csv("Annex 1 Basic Data of Elderly People.csv" )
data = read.csv("Annex 1 Basic Data of Elderly People.csv" )
colnames(data)[11] = "Hurted"
data$Hurted = factor(data$Hurted)
colnames(data)
str(data)
library(ggplot2)
ggplot(data, aes(x=as.numeric(Hurted)-1, fill=Sex)) +geom_histogram(binwidth = 0.5) + 
  geom_histogram(position = "stack") + labs(x = "EasilyHurt", y = "Person")


ggplot(data, aes(x=Age, fill=Hurted))  + 
  geom_histogram(position = "stack") + labs(x = "Age", y = "Person", caption = "Hurted")

str(data)

ggplot(data, aes(x=Height, fill=Hurted))  + 
  geom_histogram(position = "stack") + labs(x = "Height", y = "Person")

ggplot(data, aes(x=Weight, fill=Hurted))  + 
  geom_histogram(position = "stack") + labs(x = "Weight", y = "Person")

ggplot(data, aes(x=BMI, fill=Hurted))  + 
  geom_histogram(position = "stack") + labs(x = "BMI", y = "Person")

install.packages("corrplot")
library(corrplot)
data$Hurted = as.numeric(data$Hurted)
cordata = cor(data[,c("Hurted","Height","Weight","BMI")])
corrplot(cordata,method ="color")


result = read.csv("RESULT.csv")
result
library(caret)
result$Hurt = as.factor(result$Hurt)
result$Predict = as.factor(result$Predict)
confusionMatrix(result[,c("Hurt", "Predict")])
str(result)

resultsummary = table(result[,c("Hurt", "Predict")])
plot(resultsummary, type = "n", col = c(197,55), lwd = 10, main = "RESULT")
