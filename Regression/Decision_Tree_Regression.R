#Decision Tree Regression

#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting Regression model
# install.packages('rpart')
library(rpart)
regressor = rpart(formula = Salary ~ .,
                  data = dataset,
                  control = rpart.control(minsplit = 1))

#Predicting the salary value with polynomial regression
y_pred = predict(regressor, data.frame(Level = 6.5))

#Visualizing Decision Tree
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y= dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level , y= predict(regressor, newdata = dataset)),
            color = "blue")+
  ggtitle("Truth or Bluff [Decision Tree]")+
  xlab("Level")+
  ylab("Salary")


#visualizing Decision tree (for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() +
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line(aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
            colour = 'blue') +
  ggtitle('Truth or Bluff (Decision Tree Regression)') +
  xlab('Level') +
  ylab('Salary')
