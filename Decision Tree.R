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
train <- cardio_data[pd==1,]
validate <- cardio_data[pd==2,]
dim(train)
dim(cardio_data)
dim(validate)
#installing party package for classifying our data based on our prediction and class variables
install.packages("party")
#loading the package whenever you want to use it
library(party)
#creating tree based on BPM APC FMPS UCPS for simplicity classified in NSPF, also result in best attribute selection
cardio_tree <- ctree(NSPF~BPM+APC+FMPS+UCPS,train)
print(cardio_tree)
#drawing the plot 
plot(cardio_tree)
#drawing different types of plot
plot(cardio_tree, type="simple")
#making table for determining accuracy
tab <- table(predict(cardio_tree), train$NSPF)
print(tab)
#only diagonal values are correct prediction, the following line calcualte accuracy for training set 
sum(diag(tab)) /sum(tab)
#error 
1-sum(diag(tab)) /sum(tab)
#checking accuracy for validating set
test_predict <- table(predict(cardio_tree, newdata= validate),validate$NSPF)
print(test_predict)
#accuracy for validating set
sum(diag(test_predict))/sum(test_predict)
#error for validating set
1-sum(diag(test_predict))/sum(test_predict)
