
rm(list = ls())
library(rio)
library(car)
library(corrplot)

Data = import("Life Expectancy Data.csv")
colnames(Data) = tolower(make.names(colnames(Data)))
attach(Data)



#Explore data

#display first 6 rows
head(Data)
#check structure of data
str(Data)
dim(Data)



#keeping original data safe
data1=Data





#check for any missing value column wise
colSums(is.na(data1))

#Analyze data

#display dimensions of data
dim(data1)
#list type of each variable
sapply(data1,class)



#check correlation between different variables
cor(data1[,4:22])
library(corrplot)
corrplot(cor(data1[,4:22]))



#Visualize data

#check distribution of dependent variable i.e. Life.expectancy-histogram
hist(data1[,4], main="Histogram of Life expectancy")

#check distribution of independent variables-density plot
par(mfrow=c(3,6))
for(i in 5:22){
  hist(data1[,i],main=names(data1)[i],ylab = "Frequency",
       xlab=paste("",names(data1)[i]))
}

#Scatterplot of independent vriables against Life expectancy
par(mfrow=c(3,6))
for(i in 5:22){
  plot(data1[,i],data1$Life.expectancy,xlab=paste("",names(data1)[i]),
       ylab="Life expectancy")
}

################################################################


#################################################################################################
names(data1)
#Fit multiple linear regression model, excluding Country variable
model1<-lm(life.expectancy~.-country-year-status,data=data1)


#check summary of model
summary(model1)


###################################################################################################
Line
####################################################################33

#L

plot(data1$life.expectancy,model1$fitted.values,pch=19,main="Actuals v. Fitted")
abline(0,1,col="red",lwd=3)

#N

hist(model1$residuals,col="red",main="Residuals, Prices",probability=TRUE)
curve(dnorm(x,mean(model1$residuals), sd(model1$residuals)),from=min(model1$residuals),to=max(model1$residuals),lwd=3,col="blue",add=TRUE)

#E

plot(model1$fitted.values,rstandard(model1), pch=19,main="Equality of Variances, Prices")
abline(0,0,lwd=3,col="red")

##################################################
#Multicollinearity

vif(model1)

sqrt(vif(model1))>3

#Multicollinearity can be detected using a statistic called the variance inflation factor (VIF). For any
#predictor variable, the square root of the VIF indicates the degree to which the confidence interval for 
#that variable's regression parameter is expanded relative to a model with uncorrelated predictors.
# sq. root vif >2 indicates a multicollinearity problem.

# We see that multicollinearity is there in our data.
#Infant deaths, under 5 deaths, polio, thinness 1 to 19 yrs and thinness 5 to 9 yrs are highly correlated. 
#########################################################################

#Improving model accuracy

#by taking into account, multicollinearity and variable section method-stepwise regression, we are deleting
#few variabes such as: Infant deaths, under 5 deaths,polio, thinness_1to19_yrs and thinness_5_to9_yrs

model2<-lm(life.expectancy~.-infant.deaths-under.five.deaths-polio-thinness..1.19.years-thinness.5.9.years,data=data1)
summary(model2)



