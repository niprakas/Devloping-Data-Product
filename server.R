#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to calculate calorie for daily intake
shinyServer(function(input, output) {
  
  values <- reactiveValues()
  
  observe({
    input$CalCalories
    values$malebmr <- isolate({
      66.4730 + (13.7516 * input$weight) + (5.0033 * input$height) - (6.7550 * input$age)
    })
    values$femalebmr <- isolate({
      655.0955 + (9.5634 * input$weight) + (1.8496 * input$height) - (4.6756 * input$age)
    })
  })
  
  observe({
    input$CalBMR
    values$mbmr <- isolate({
      66.4730 + (13.7516 * input$weight) + (5.0033 * input$height) - (6.7550 * input$age)
    })
    values$fbmr <- isolate({
      655.0955 + (9.5634 * input$weight) + (1.8496 * input$height) - (4.6756 * input$age)
    })
    
  observe({
      input$calBMI
      values$bmi <- isolate({
        input$weight / (input$height/100 * input$height/100)
      })
    })
    
  })

  #*********************************************************
  # Calculate Calorie
  #********************************************************
  # Display your calorie classification
  
  output$calorie_result <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste("Daily kilocalories needed is", values$malebmr * 1.2)
        }
        else if(input$activity == "2") {
          paste("Daily kilocalories needed is", values$malebmr * 1.375)
        }
        else if(input$activity == "3") {
          paste("Daily kilocalories needed is", values$malebmr * 1.55)
        }
        else if(input$activity == "4") {
          paste("Daily kilocalories needed is", values$malebmr * 1.725)
        }
        else if(input$activity == "5") {
          paste("Daily kilocalories needed is", values$malebmr * 1.9)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste("Daily kilocalories needed is", values$femalebmr * 1.2)
      }
      else if(input$activity == "2") {
        paste("Daily kilocalories needed is", values$femalebmr * 1.375)
      }
      else if(input$activity == "3") {
        paste("Daily kilocalories needed is", values$femalebmr * 1.55)
      }
      else if(input$activity == "4") {
        paste("Daily kilocalories needed is", values$femalebmr * 1.725)
      }
      else if(input$activity == "5") {
        paste("Daily kilocalories needed is", values$femalebmr * 1.9)
      } 
    }
  })
  output$maintain_weight <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste(" * To maintain the current weight total calorie intake should be: ", values$malebmr * 1.2)
        }
        else if(input$activity == "2") {
          paste(" * To maintain the current weight total calorie intake should be: ", values$malebmr * 1.375)
        }
        else if(input$activity == "3") {
          paste(" * To maintain the current weight total calorie intake should be: ", values$malebmr * 1.55)
        }
        else if(input$activity == "4") {
          paste(" * To maintain the current weight total calorie intake should be: ", values$malebmr * 1.725)
        }
        else if(input$activity == "5") {
          paste(" * To maintain the current weight total calorie intake should be: ", values$malebmr * 1.9)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste(" * To maintain the current weight total calorie intake should be: ", values$femalebmr * 1.2)
      }
      else if(input$activity == "2") {
        paste(" * To maintain the current weight total calorie intake should be: ", values$femalebmr * 1.375)
      }
      else if(input$activity == "3") {
        paste(" * To maintain the current weight total calorie intake should be: ", values$femalebmr * 1.55)
      }
      else if(input$activity == "4") {
        paste(" * To maintain the current weight total calorie intake should be: ", values$femalebmr * 1.725)
      }
      else if(input$activity == "5") {
        paste(" * To maintain the current weight total calorie intake should be: ", values$femalebmr * 1.9)
      } 
    }
  })

  output$lose_0.5_weight <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 8.4) - 3850) / 7)
        }
        else if(input$activity == "2") {
          paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 9.625) - 3850) / 7)
        }
        else if(input$activity == "3") {
          paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 10.85) - 3850) / 7)
        }
        else if(input$activity == "4") {
          paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 12.075) - 3850) / 7)
        }
        else if(input$activity == "5") {
          paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 13.3) - 3850) / 7)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 8.4) - 3850) / 7)
      }
      else if(input$activity == "2") {
        paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 9.625) - 3850) / 7)
      }
      else if(input$activity == "3") {
        paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 10.85) - 3850) / 7)
      }
      else if(input$activity == "4") {
        paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 12.075) - 3850) / 7)
      }
      else if(input$activity == "5") {
        paste(" * To reduce upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 13.3) - 3850) / 7)
      }
    }
  })
  
  output$lose_1.0_weight <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 8.4) - 7700) / 7)
        }
        else if(input$activity == "2") {
          paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 9.625) - 7700) / 7)
        }
        else if(input$activity == "3") {
          paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 10.85) - 7700) / 7)
        }
        else if(input$activity == "4") {
          paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 12.075) - 7700) / 7)
        }
        else if(input$activity == "5") {
          paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 13.3) - 7700) / 7)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 8.4) - 7700) / 7)
      }
      else if(input$activity == "2") {
        paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 9.625) - 7700) / 7)
      }
      else if(input$activity == "3") {
        paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 10.85) - 7700) / 7)
      }
      else if(input$activity == "4") {
        paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 12.075) - 7700) / 7)
      }
      else if(input$activity == "5") {
        paste(" * To reduce upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 13.3) - 7700) / 7)
      }
    }
  })  
  
  output$gain_0.5_weight <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 8.4) + 3850) / 7)
        }
        else if(input$activity == "2") {
          paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 9.625) + 3850) / 7)
        }
        else if(input$activity == "3") {
          paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 10.85) + 3850) / 7)
        }
        else if(input$activity == "4") {
          paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 12.075) + 3850) / 7)
        }
        else if(input$activity == "5") {
          paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$malebmr * 13.3) + 3850) / 7)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 8.4) + 3850) / 7)
      }
      else if(input$activity == "2") {
        paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 9.625) + 3850) / 7)
      }
      else if(input$activity == "3") {
        paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 10.85) + 3850) / 7)
      }
      else if(input$activity == "4") {
        paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 12.075) + 3850) / 7)
      }
      else if(input$activity == "5") {
        paste(" * To gain upto 0.5 kg weight total calorie intake should be: ", ((values$femalebmr * 13.3) + 3850) / 7)
      }
    }
  })  
  
  output$gain_1.0_weight <- renderText({
    if(input$CalCalories == 0) ""
    else
      if(input$sex == "1") {
        if(input$activity == "1") {
          paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 8.4) + 7700) / 7)
        }
        else if(input$activity == "2") {
          paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 9.625) + 7700) / 7)
        }
        else if(input$activity == "3") {
          paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 10.85) + 7700) / 7)
        }
        else if(input$activity == "4") {
          paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 12.075) + 7700) / 7)
        }
        else if(input$activity == "5") {
          paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$malebmr * 13.3) + 7700) / 7)
        }
      }
    else if(input$sex == "2") {
      if(input$activity == "1") {
        paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 8.4) + 7700) / 7)
      }
      else if(input$activity == "2") {
        paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 9.625) + 7700) / 7)
      }
      else if(input$activity == "3") {
        paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 10.85) + 7700) / 7)
      }
      else if(input$activity == "4") {
        paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 12.075) + 7700) / 7)
      }
      else if(input$activity == "5") {
        paste(" * To gain upto 1 kg weight total calorie intake should be: ", ((values$femalebmr * 13.3) + 7700) / 7)
      }
    }
  })   
  
  #*********************************************************
  # Calculate BMR
  #********************************************************

  # Display your BMR Results
  output$BMR_result <- renderText({
    if(input$CalBMR == 0) ""
    else
      if(input$sex == "1") {
        paste("Total BMR calculated for male is :", values$mbmr)
      }
    else if(input$sex == "2") {
      paste("Total BMR calculated for female is :", values$fbmr)
    }
  })
  
  #*********************************************************
  # Calculate BMI
  #*********************************************************
  # Display your current values for BMI calculation
  output$curr_age <- renderText({
    input$calBMI
    paste("Current age :", isolate(input$age))
  })
  
  output$curr_height <- renderText({
    input$calBMI
    paste("Current Height in CM :", isolate(input$height))
  })
  
  output$curr_weight <- renderText({
    input$calBMI
    paste("Current Weight in KG : ", isolate(input$weight))
  })
  
  output$BMI_result <- renderText({
    if(input$calBMI == 0) ""
    else
      paste("Total BMR calculated is :", values$bmi)
  })
  
  output$Status_IND <- renderText({
    
    if(input$calBMI == 0) ""
    else {
      if (values$bmi < 18.5)
      {
        values$Status_IND = "Underweight"
      }
      else if (values$bmi < 24.9)
      {
        values$Status_IND="Normal weight"
      }
      else if (values$bmi < 29.9)
      {
        values$Status_IND="Overweight"
      }
      else
      {
        values$Status_IND="Obesity"
      }
      paste("Classification based on your calculated BMI: ", values$Status_IND)
    }
  })
})

