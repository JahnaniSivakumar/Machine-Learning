#Polynomial Regression

#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting Linear Regression model
lin_reg = lm(formula = dataset$Salary ~., data = dataset)

#Fitting Polynomial Regression model
dataset$Level2 = dataset$Level^2
dataset$Level3 = dataset$Level^3
dataset$Level4 = dataset$Level^4
poly_reg = lm(formula = dataset$Salary ~., data = dataset)

#visualizing Linear regression
# install.packages('ggplot2')
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y= dataset$Salary),
                      color = "red") +
  geom_line(aes(x = dataset$Level , y= predict(lin_reg, newdata = dataset)),
            color = "blue")+
  ggtitle("Truth or Bluff [Linear Regression]")+
  xlab("Level")+
  ylab("Salary")

#visualizing Polynimial regression
ggplot() + 
  geom_point(aes(x = dataset$Level , y= dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level , y= predict(poly_reg, newdata = dataset)),
            color = "blue")+
  ggtitle("Truth or Bluff [Polynomial Regression]")+
  xlab("Level")+
  ylab("Salary")

#Predicting the salary value with linear regression
y_pred = predict(lin_reg, data.frame(Level = 6.5))

#Predicting the salary value with polynomial regression
y_pred = predict(poly_reg, data.frame(Level = 6.5, 
                                      Level2 = 6.5^2,
                                      Level3 = 6.5^3,
                                      Level4 = 6.5^4))
