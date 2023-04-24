

# **Life Expectancy Prediction Project**

This project involves analyzing data related to life expectancy and health factors for 193 countries. The dataset used in this project contains 1613 observations with 22 columns and was collected from the World Health Organization (WHO) data repository website, along with economic data from the United Nations website.

The goal of this project is to perform regression analysis to identify the main factors among the selected variables that impact life expectancy. The R programming language was used for data analysis, visualization, and model building.

## **Project Overview**
The project consists of the following steps:

**Data Exploration**: The imported dataset was explored by checking the structure, dimensions, and types of variables. Missing values were also checked for in the dataset.

**Data Visualization**: Data visualization techniques were used to gain insights from the data. Histograms were created to visualize the distribution of the dependent variable (life expectancy), and density plots were used to visualize the distribution of the independent variables. Scatter plots were also created to understand the relationship between each independent variable and life expectancy.

**Model Building**: Multiple linear regression was used to build the predictive model. Initially, a model was created using all the variables in the dataset, except for the "country", "year", and "status" variables. The summary of the model was analyzed to understand the statistical significance of each variable.

**Model Evaluation**: Diagnostic plots, such as the actual vs. fitted values plot, residuals plot, and equality of variances plot, were created to evaluate the model's performance. Multicollinearity was also checked using the variance inflation factor (VIF).

**Model Improvement**: Based on the VIF values, variables with high multicollinearity were identified and removed from the model to improve its accuracy. Stepwise regression method was used to further refine the model.

## **File Descriptions**
Life Expectancy Data.csv: The original dataset used in the project.
Life_Expectancy_Prediction.R: The R code file containing the code for data analysis, visualization, and model building.
README.md: The current file providing an overview of the project and instructions for its usage.

## **Usage**
To run the R code in this project, you will need to have R and the following packages installed: rio, car, and corrplot. You can install these packages using the following commands in R:


1. ***install.packages("rio")***
2. ***install.packages("car")***
3. ***install.packages("corrplot")***

After installing the required packages, you can simply run the code in the Life_Expectancy_Prediction.R file to perform the data analysis, visualization, and model building steps.

## **Conclusion**
This project provides an example of how to analyze and predict life expectancy using R programming. It demonstrates various data analysis techniques, including data exploration, visualization, and model building, and provides insights into the factors that impact life expectancy. The project also showcases how to evaluate and improve the accuracy of the predictive model.
