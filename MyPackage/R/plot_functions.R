##' Plot function for matrices
##'
##' @description Toy function to simply display the scatter plot and the associated boxplot of a matrix or a data frame on the same page by using ggplot2.
##' 
##' @param data a matrix or data frame with variables of interest on column. If 'data' is not a data frame, there is a conversion to data frame.
##' 
##' @return NULL
##' 
##' @author Alexis ARNAUD
##' @seealso \code{ \link[GGally]{ggpairs} } \code{ \link[ggplot2]{geom_boxplot} }
##' @keywords plot ggplot2
##' 
##' @examples
##' n_col <- 3
##' n_row <- 1e3
##' 
##' m_test <- t(
##'     x = matrix(
##'         data = rnorm(
##'             n = n_col * n_row
##'           , mean = 0
##'           , sd = 1
##'         )
##'       , nrow = n_col
##'       , ncol = n_row
##'       , dimnames = list(
##'             "Variables" = paste("V ", seq_len(length.out = n_col), sep = "")
##'           , "Observations" = NULL
##'         )
##'     ) * c(0.1, 1, 3) + c(-1, 1, 0)
##' )
##' 
##' plot_boxplot(data = m_test)
##'
##' @importFrom reshape melt
##' @importFrom GGally ggpairs 
##' @importFrom ggplot2 ggplot aes geom_boxplot
##' 
##' @export
##' 
plot_boxplot <- function(data) {
    if ( !is.data.frame(x = data) ) {
        data <- as.data.frame(x = data)
    }

    data_melt <- melt(data = data)

    plot_pairs <- ggpairs(data = data)
    plot_boxplot <- ggplot(
        data = data_melt
      , aes(
            x = variable
          , y = value
          , fill = variable
        )
    ) + geom_boxplot( )

    multiplot(
        plot_pairs
      , plot_boxplot
      , cols = 2
    )
}
