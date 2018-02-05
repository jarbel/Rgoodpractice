##' Multiple plot function
##'
##' Display function to combine several ggplot objects into a single page.
##' The code comes from 'Cookbook for R' by Winston Chang
##' http://www.cookbook-r.com/Graphs/Multiple_graphs_on_one_page_(ggplot2)/
##' I changed the coding style (Alexis ARNAUD).
##'
##' @param ... ggplot objects can be passed here or to 'plotlist'
##' @param plotlist list of ggplot objects
##' @param cols number of columns in layout
##' @param layout a matrix specifying the layout. If present, 'cols' is ignored.
##' If the layout is something like matrix(c(1,2,3,3), nrow=2, byrow=TRUE),
##' then plot 1 will go in the upper left, 2 will go in the upper right, and
##' 3 will go all the way across the bottom.
##' 
##' @return NULL
##' 
##' @author Winston Chang
##' 
##' @importFrom grid grid.newpage grid.layout pushViewport viewport
##' 
##' @export
##' 
multiplot <- function(
                      ...
                    , plotlist = NULL
                    , cols = 1
                    , layout = NULL
                      ) {
    ## Make a list from the ... arguments and plotlist
    plots <- c(
        list(...)
      , plotlist
    )

    numPlots <- length(x = plots)

    ## If layout is NULL, then use 'cols' to determine layout
    if ( is.null(x = layout) ) {
        ## Make the panel
        ## ncol: Number of columns of plots
        ## nrow: Number of rows needed, calculated from ## of cols
        layout <- matrix(
            data = seq(
                from = 1
              , to = cols * ceiling(x = numPlots/cols)
            )
          , ncol = cols
          , nrow = ceiling(x = numPlots/cols)
        )
    }

    if ( numPlots == 1 ) {
        print(x = plots[[1]] )
    } else {
        ## Set up the page
        grid.newpage(recording = TRUE)
        pushViewport(
            viewport(
                layout = grid.layout(
                    nrow = nrow(layout)
                  , ncol = ncol(layout)
                )
            )
        )

        ## Make each plot, in the correct location
        for ( i in seq_len(length.out = numPlots) ) {
            ## Get the i,j matrix positions of the regions that contain this subplot
            matchidx <- as.data.frame(
                x = which(
                    x = layout == i
                  , arr.ind = TRUE
                )
            )

            print(
                x = plots[[ i ]]
              , vp = viewport(
                    layout.pos.row = matchidx$row
                  , layout.pos.col = matchidx$col
                )
            )
        }
    }
}
