#Adding dataset
cardio_data <-read.csv("Cardiotocographic.csv", header= TRUE)
#checking the data
names(cardio_data)
head(cardio_data)
tail(cardio_data)
summary(cardio_data)
str(cardio_data)
nrow(cardio_data)
ncol(cardio_data)
dim(cardio_data)
#changing the variable to Factor or Categorical variable to be used in prediction
cardio_data$NSPF <- as.factor(cardio_data$NSP)
str(cardio_data)
# specifying the training and validation data
# I will use training data for operation
# I will use my validation data to test the accuracy of my data
#set.seed produce the same random number everytime
set.seed(1234)
#sample will select randomly and here it replace 80% of the data (training) with 1 and 20% data with 2 (validate)
pd <- sample(2,nrow(cardio_data),replace = TRUE, prob=c(0.8,0.2))
