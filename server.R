#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyServer(function(input, output) {
    
    values <- reactiveValues()
    
    observe({
        input$Calculate
        values$BMI <- isolate({ round(input$weight / (input$height / 100) ^ 2, digits = 1) })
        values$BMInew <- isolate({ round(1.3 * input$weight / (input$height / 100) ^ 2.5, digits = 1) })
        values$BMIprime <- isolate({ round(values$BMI / 25, digits = 2) })
    })
    
    output$BMI1 <- renderText({BMI})
    
    output$classificationBMI <- renderText({
        
        if(input$Calculate == 0) " "
        
        else {
            if (values$BMI < 16)
            {
                values$classificationBMI <- "Severely underweight"
            }
            else if (values$BMI < 18.5)
            {
                values$classificationBMI <- "Underweight"
                
            }
            
            else if (values$BMI < 25)
            {
                values$classificationBMI <- "Normal (healthy weight)"
            }
            else if (values$BMI < 30)
            {
                values$classificationBMI <- "Overweight"
            }
            else if (values$BMI < 35)
            {
                values$classificationBMI <- "Obese Class I (Moderately obese)"
            }
            else if (values$BMI < 40)
            {
                values$classificationBMI <- "Obese Class II (Severely obese)"
            }
            else
            {
                values$classificationBMI <- "Obese Class III (Very severely obese)"
            }
            
            
            paste("Category: ", values$classificationBMI)
        }
    })
    
    output$classificationBMInew <- renderText({
        
        if(input$Calculate == 0) " "
        
        else {
            if (values$BMInew < 16)
            {
                values$classificationBMInew <- "Severely underweight"
            }
            else if (values$BMInew < 18.5)
            {
                values$classificationBMInew <- "Underweight"
                
            }
            
            else if (values$BMInew < 25)
            {
                values$classificationBMInew <- "Normal (healthy weight)"
            }
            else if (values$BMInew < 30)
            {
                values$classificationBMInew <- "Overweight"
            }
            else if (values$BMInew < 35)
            {
                values$classificationBMInew <- "Obese Class I (Moderately obese)"
            }
            else if (values$BMInew < 40)
            {
                values$classificationBMInew <- "Obese Class II (Severely obese)"
            }
            else
            {
                values$classificationBMInew <- "Obese Class III (Very severely obese)"
            }
            
            paste("Category: ", values$classificationBMInew)
        }
    })
    
    output$BMIprime <- renderText({
        
        if(input$Calculate == 0) " "
        
        else {
            if (values$BMIprime < 0.74)
            {
                values$classificationBMIprime <- "Underweight"
            }
            else if (values$BMIprime < 1)
            {
                values$classificationBMIprime <- "Normal (healthy weight)"
            }
            else
            {
                BMIprimeText = (values$BMIprime - 1) * 100
                values$classificationBMIprime <- 
                    paste("Your weight is  ", BMIprimeText, "% above from the maximum optimal BMI")
            }
            
            paste("BMI prime: ", values$classificationBMIprime)
        }
    })
    
    output$BMI <- renderText({
        if(input$Calculate == 0) " "
        else
            paste("Your current BMI is:", values$BMI)
    })
    
    output$BMInew <- renderText({
        if(input$Calculate == 0) " "
        else
            paste("Your current BMI (new) is:", values$BMInew)
    })

})
