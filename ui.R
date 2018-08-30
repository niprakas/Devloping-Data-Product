#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  tags$head(
    tags$style(HTML("
      @import url('//fonts.googleapis.com/css?family=Lobster|Cabin:400,700');
      h1 {
        font-family: 'Lobster', cursive;
        font-weight: 500;
        line-height: 1.1;
        color: #48ca3b;
      }
    "))
  ),
  headerPanel(
    list(tags$head(tags$style("body {background-color: #FBFDE8;}")))),
    titlePanel(h1("Calories/BMR/BMI Calculator", windowTitle ="Calories/BMR/BMI")),
    sidebarLayout(
    sidebarPanel(
      
      helpText("The daily calorie intake calculator estimates your daily calories requirements in order to maintain, lose or gain weigh based on your BMR (weight, height, age and gender) and physical exercise level."),            
      selectInput("sex", label = h5("Select your gender"), choices = list("Male" = 1, "Female" = 2), 
                  selected = 1),
      br(),
      numericInput("weight",label = h5("Enter your weight (KG)"),min = 10, max = 300,0), 
      br(),
      numericInput("height",label = h5("Enter your height (CM)"),min = 10, max = 250,0), 
      br(),
      numericInput("age", label = h5("Enter your age"),min = 4, max = 100,0),
      br(),
      selectInput("activity", label = h5("Exercise level"), 
                  choices = list("little or No exercise" = 1, "Light exercise (1-3 days per week)" =  2, "Moderate exercise (3-5 days per week)" = 3, "Heavy exercise (6-7 days per week)" = 4, "Very heavy exercise (twice per day)" = 5), 
                  selected = 1),
      br(),   
      actionButton("CalCalories", label = "Calculate Calories"), actionButton("CalBMR", label = "Calculate BMR"), actionButton("calBMI", label = "Calculate BMI")    
      
    ),
    mainPanel
    (
      tabsetPanel
      (
        tabPanel(tags$h3("Results"),

                 p(tags$h4("Calorie calculation Results: ")),
                 hr(),
                 helpText(tags$h4(" 1. Calorie Intake requirements is :")),
                 textOutput("calorie_result"),
                 
                 helpText(tags$h4("2. Additional information will be displayed here once you calculate your Calorie Intake requirements.")),
                 textOutput("maintain_weight"),
                 textOutput("lose_0.5_weight"),
                 textOutput("lose_1.0_weight"),
                 textOutput("gain_0.5_weight"),
                 textOutput("gain_1.0_weight"),
                 br(),
                 p(tags$h4("BMR calculation Results: ")),
                 hr(),
                 helpText("To calculate BMR(Basal Metabolic Rate), Please select gender & input your weight and height only."),
                 helpText(tags$h4(" 1. Total BMR(Basal Metabolic Rate) is :")),
                 textOutput("BMR_result"),
                 br(),
                 p(tags$h4("BMI calculation Results: ")),
                 hr(),
                 helpText("To calculate body mass index (BMI), Please input your weight and height only."),
                 helpText(tags$h4(" 1. Current BMI(Body Mass Index) is :")),
                 textOutput("BMI_result"),
                 textOutput("Status_IND")
        ),
        tabPanel(tags$h3("Documentation"),
          p(tags$h3("Calorie Intake Calculator")),
          helpText(tags$h4("The calorie calculator estimates your daily calories requirements in order to maintain, lose or gain weigh based on your BMR (weight, height, age and gender) and physical exercise level.")),
          helpText(tags$h4("This Calorie Calculator is based on the Mifflin-St Jeor Equation which calculates basal metabolic rate (BMR), and its results are based on an estimated average. The basal metabolic rate is the amount of energy expended per day at rest. There exist other equations including the Harris-Benedict Equation")),
          helpText(tags$h4("BMR (Basal Metabolic Rate) represents an estimate of calories burned while resting and it is measured in kilo joules per hour per kilogram of body mass.")),
          helpText(tags$h4("A restful state refers to the energy sufficient only for the functioning of the vital organs: the heart, lungs, nervous system, kidneys, liver, intestine, sex organs, muscles, brain and skin.")), 
          br(),
          hr(),
          p(tags$h3("Basal Metabolic Rate Formulas")),
          helpText(tags$h4("The Original Harris-Benedict Equation")),
          helpText(tags$h4("1. Men	BMR = 66.4730 + (13.7516 x weight in kg) + (5.0033 x height in cm) - (6.7550 x age in years)")),
          helpText(tags$h4("2. Women BMR = 655.0955 + (9.5634 x weight in kg) + (1.8496 x height in cm) - (4.6756 x age in years)")),
          hr(),
          p(tags$h3("Body Mass Index")),
          helpText(tags$h4("The BMI is an attempt to quantify the amount of tissue mass (muscle, fat, and bone) in an individual, and then categorize that person as underweight, normal weight, overweight, or obese based on that value."))
          
        )
      )
    )
  )
)
)