#Multiple linear Regression

#Importing the dataset
dataset = read.csv("50_Startups.csv")

#Encoding categorical data
dataset$State = factor(dataset$State,
                         levels = c('New York','California','Florida'),
                         labels = c(1,2,3))

#Splitting the dataset
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Multiple Linear Regression model to training set
regressor = lm(formula = Profit ~ . , data = training_set)

#Predict test set results
y_pred = predict(regressor, newdata = test_set)

#Building the optimal model using Backward Elimination
#Considering the whole dataset

regressor = lm (formula = Profit ~ R.D.Spend + Administration + Marketing.Spend + State,
                data = dataset)
summary(regressor)

#Removing the State variable
regressor = lm (formula = Profit ~ R.D.Spend + Administration + Marketing.Spend,
                data = dataset)
summary(regressor)

#Removing the Administration variable
regressor = lm (formula = Profit ~ R.D.Spend + Marketing.Spend,
                data = dataset)
summary(regressor)

#Removing the Marketing Spend variable
regressor = lm (formula = Profit ~ R.D.Spend,
                data = dataset)
summary(regressor)