#Simple Linear Regression

#Importing the dataset
dataset = read.csv("Salary_Data.csv")


#Splitting the dataset
#install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Salary, SplitRatio = 2/3)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting Simple Linear Regression to training set
regressor = lm (formula = Salary ~ YearsExperience, data = training_set)

#Predicitng the test result
y_pred = predict(regressor, newdata = test_set)

#Visualizing Training set
library(ggplot2)
ggplot() +
  geom_point(aes(x = training_set$YearsExperience, y = training_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
                color = 'blue') +
  ggtitle("Salary Vs Years of Experience (Training Set)") +
  xlab("Years of Experience") +
  ylab("Salary")

#Visualizing Test set
library(ggplot2)
ggplot() +
  geom_point(aes(x = test_set$YearsExperience, y = test_set$Salary),
             color = 'red') +
  geom_line(aes(x = training_set$YearsExperience, y = predict(regressor, newdata = training_set)),
            color = 'blue') +
  ggtitle("Salary Vs Years of Experience (Test Set)") +
  xlab("Years of Experience") +
  ylab("Salary")
