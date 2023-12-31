#SVR

#importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]

#Fitting SVR model
#install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
                data = dataset,
                type = 'eps-regression')


#Predicting the salary value with SVR model
y_pred = predict(regressor, data.frame(Level = 6.5))

#visualizing SVR model
library(ggplot2)
ggplot() + 
  geom_point(aes(x = dataset$Level , y= dataset$Salary),
             color = "red") +
  geom_line(aes(x = dataset$Level , y= predict(regressor, newdata = dataset)),
            color = "blue")+
  ggtitle("Truth or Bluff [SVR Model]")+
  xlab("Level")+
  ylab("Salary")
