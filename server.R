#library(shiny)
predictingRandomValue <- function(n,mu,var){
        # generate illustrate data set
        x <- runif(n)
        y <- 5 + 2.7 * x + rnorm(n, mean=mu, sd=sqrt(var))

        # fit the model and store the coefficients
        regLin <- lm(y~x)
        coef <- coef(regLin)

        #use the predict() function
        y_star2 <- predict(regLin)

        #formulate the equation
        y_star1 <- coef[1] + coef[2] * x
        #d <- paste("y","=",coef[1],"+",coef[2],"*","x", sep=" ")
        p <- sprintf("%s %s %s %s %s %s %s", "y","=",coef[1],"+",coef[2],"*","x")

        # comparison table
        z <- cbind(x, y, y_star1, y_star2)
        colnames(z) <- c("x", "y","Regressed y","Predict y")

        list(z,p)
}

shinyServer(
        
        function(input, output) {
                output$tablePred  <- renderPrint({predictingRandomValue(input$n,input$mu,input$sd)}[[1]])
                output$tablePred1  <- renderPrint(cat({predictingRandomValue(input$n,input$mu,input$sd)}[[2]]))
        }
)