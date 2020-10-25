#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

shinyUI(fluidPage(

    # Application title
    titlePanel("Calculate Your Body Mass Index"),

    # Sidebar with a slider input
    sidebarLayout(
        sidebarPanel(
            h3("Set your weight and height"),
            sliderInput("weight",
                        "Your weight (kg):",
                        min = 40,
                        max = 250,
                        value = 70),
            sliderInput("height",
                        "Your height (cm):",
                        min = 100,
                        max = 250,
                        value = 170),
            actionButton("Calculate", label = "Calculate BMI")
        ),

        
        mainPanel(
            tabsetPanel(type = "tabs",
                        tabPanel("BMI caculation",
                                 h3("Classical Body Mass Index"),
                                 textOutput("BMI"),
                                 textOutput("classificationBMI"),
                                 br(),
                                 h3("New Body Mass Index"),
                                 textOutput("BMInew"),
                                 textOutput("classificationBMInew"),
                                 br(),
                                 h3("Body Mass Index Prime"),
                                 textOutput("BMIprime")
                                 ),
                        
                        tabPanel("Documentation",
                                 p(h3("Body Mass Index Calculator")),
                                 helpText("This Shiny application is a project of Coursera's Developing Data Products"),
                                 p(h3("Help information")),
                                 helpText("Set your weight (kg) and height (cm) using the slide bars. Click 'Calculate'. On the main panel, you can see the results of calculating two BMIs."),
                                 p(h3("Short information about Body Mass Index")),
                                 helpText("Body mass index (BMI) is a value derived from the mass (weight) and height of a person."),
                                 helpText("The BMI is a convenient rule of thumb used to broadly categorize a person as underweight, normal weight, overweight, or obese based on tissue mass (muscle, fat, and bone) and height."),
                                 helpText("BMIs under 20 and over 25 have been associated with higher all-causes mortality, with the risk increasing with distance from the 20-25 range."),
                                 p(h3("New BMI")),
                                 helpText("A new formula for computing Body Mass Index that accounts for the distortions of the traditional BMI formula for shorter and taller individuals has been proposed by Nick Trefethen, Professor of numerical analysis at the University of Oxford."),
                                 p(h3("BMI prime")),
                                 helpText("BMI prime, a modification of the BMI system, is the ratio of actual BMI to upper limit optimal BMI (currently defined at 25), i.e., the actual BMI expressed as a proportion of upper limit optimal."),
                                 em("Information taken from Wikipedia")
                        )
        )
    )
    )
))
