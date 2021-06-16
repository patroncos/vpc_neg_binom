library(shiny)

ui <- fluidPage(headerPanel("VPC for a 2-level empty NB2 model", windowTitle = "vpc_nb2_app"),
                tags$h4("Author: Patricio Troncoso, Heriot-Watt University"),
                wellPanel(tags$p("This calculator provides the Variance Partioning Coefficient (VPC), according to the formulae described in Leckie et al. (2020), available ",
                                 tags$a(href="https://doi.org/10.1037/met0000265", "here.")),
                          tags$p("This is meant to be used with the results of an unconditional (empty) 2-level negative binomial model."),
                          tags$p("A 2-level negative binomial arises when the outcome of interest is a count variable with overdispersion and observations are nested in hierarchical units."), 
                          tags$p("A typical example of such a setting would be the number of days in which pupils are absent from school.
                          Overdispersion refers to the situation when the variance of a count variable is larger than its mean, so it does not 
                          conform to the underlying assumption of a Poisson distribution. Underdispersion is also possible, but overdispersion is far more common."),
                          tags$p("If you have any comments or suggestions, please contact me via",
                                 a(href="mailto:p.troncoso@hw.ac.uk", "this email")),
                          tags$p("The Github repository for this app is", a(href="https://github.com/patroncos/vpc_neg_binom", "here")),
                          tags$p("Latest update: 15/06/2021")),
                fluidRow(column(12, wellPanel(strong("Instructions: "), "Below are the main parameters 
                                              to calculate the VPC. Default values
                                              are completely arbitrary. Modify the values and then click on the 
                                              Calculate button. The default VPC is for level 2, to obtain
                                              the level-1 VPC, check the box."), offset= 0.5)),
                fluidRow(column(10, numericInput(inputId = "beta", 
                                                 label = "Intercept",
                                                 value = 0.5,
                                                 min = 0,
                                                 max = 1,
                                                 step = 0.001)), offset = 0.5),
                fluidRow(column(10, numericInput(inputId = "alpha", 
                                                 label = "Overdispersion parameter",
                                                 value = 2,
                                                 min = 0,
                                                 max = 1,
                                                 step = 0.001)), offset = 0.5),
                fluidRow(column(10, numericInput(inputId = "u", 
                                                 label = "Level-2 variance",
                                                 value = 2,
                                                 step = 1, 
                                                 min = 0)), offset = 0.5),
                fluidRow(column(8, checkboxInput(inputId = "level1", 
                                                 "Level-1 VPC"), offset = 0.5)),
                fluidRow(column(8, actionButton(inputId = "calculate", label = "Calculate")),
                         offset = 0.5),
                fluidRow(column(12, h3(" ")), offset = 0),
                fluidRow(column(12, wellPanel(h3(strong(textOutput("VPC")))), offset = 0.5)),
                fluidRow(column(10, p(em(strong("Note: "), "The overdispersion parameter can be expressed as alpha or theta, 
                                         depending on the software package used. It can also be in the log-scale; if so, it needs to be exponentiated first.
                                         theta is the reciprocal of alpha, i.e.
                                         alpha = 1/theta")), 
                                offset = 0.5)), 
                fluidRow(column(10, helpText(strong("Disclaimer: "), "This online tool comes with no warranty.
                                             Results should be used at the user's discretion."), 
                                offset = 0.5))
)

server <- function(input, output) {
    data <- eventReactive(input$calculate, {if (input$level1==TRUE) {
        lev2var <- (exp(input$beta +(input$u/2)))^2*(exp(input$u)-1)
        lev1var <- exp(input$beta + input$u/2)+((exp(input$beta + input$u/2))^2*exp(input$u)*input$alpha)
        VPC <- lev1var/(lev2var+lev1var)
        print((paste("Level-1 VPC", " = ", round(VPC, digits=3))))
    }
        else {
            lev2var <- (exp(input$beta +(input$u/2)))^2*(exp(input$u)-1)
            lev1var <- exp(input$beta + input$u/2)+((exp(input$beta + input$u/2))^2*exp(input$u)*input$alpha)
            VPC <- lev2var/(lev2var+lev1var)
            print(paste("Level-2 VPC", " = ", round(VPC, digits=3)))
        }
    })
    output$VPC <- renderText({
        data()
    })
}

shinyApp(ui=ui, server=server)