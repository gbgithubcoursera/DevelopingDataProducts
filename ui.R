#library(shiny)
shinyUI(
    fluidPage(
            
        # Application title
        titlePanel("Linear Regression Prediction"),
        
        sidebarLayout(
                sidebarPanel(
                        helpText("Compares the prediction results given by the linear model against the 
                                 results given by the predict function in R."),
                        helpText("Creates the dependent variable y and the independent variable x as per our input values 
                                 according to the following formulas:"),
                        helpText("x <- runif(n)"),
                        helpText("y <- 5 + 2.7 * x + rnorm(n, mean=mu, sd=sqrt(var))"),
                        numericInput('n', 'Random Uniform Size (n)', 10, min = 50, max = 200, step = 5),
                        numericInput('mu', 'Sample Meam (mu)', 0, min =0 , max = , step = ),
                        numericInput('sd', 'Sample Variance(var)', 1, min = 0, max = , step = 0.1),
                        submitButton('Submit')
                ),
                mainPanel(
                        h4("Corresponding Linear Regression Model Equation"),
                        verbatimTextOutput("tablePred1"),
                        h4('Table Shows the Actual initial dependent variable y and independent variable as 
                           as sampled by our formula, the predicted y using a built linear regression model , and 
                           then finally the predicted y as given by the predict function found in R'),
                        
                        verbatimTextOutput("tablePred")
                )
        )
        # end of siderbar layout
    )
    # end of fluid page
)