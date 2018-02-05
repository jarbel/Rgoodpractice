##' .. content for \description{} (no empty lines) ..
##' Toy function to simply display the 2D plot and the associated boxplot of matrix.
##' .. content for \details{} ..
##' @title plot_boxplot
##' @param m a matrix with variables of interest on column
##' @return a boxplot object for the matrix 'm' (see graphics::boxplot for more informations)
##' @seealso [boxplot()] 
##' @author Alexis
plot_boxplot <- function(m) {
    if ( is.matrix(x = m) ) {
        m_names <- names(x = dimnames(x = m) )
        par(
            mfrow = c(2, 1)
        )
        plot(
            x = m[ , 1 ]
          , y = m[ , 2 ]
          , xlab = m_names[ 1 ]
          , ylab = m_names[ 2 ]
          , main = "2D plot"
        )
        boxplot(
            x = m
          , names = m_names
          , main = "associated boxplot"
        )
    } else {
        print(
            x = "The argument 'm' is not a matrix ! Nothing to do, sorry."
        )
    }
}

m_test <- t(
    x = matrix(
        data = rnorm(
            n = 1e3
          , mean = 0
          , sd = 1
        )
      , nrow = 2
      , ncol = 5e2
      , dimnames = list(
            "B" = NULL
          , "A" = NULL
        )
    ) * c(1, 3) + c(-1, 2)
)


plot_boxplot(m = m_test)
