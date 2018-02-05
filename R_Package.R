## Personnal library path :
## .libPaths(new = "~/R_libs")

## Generation of the documentation with roxygen2 :
library(package = "roxygen2")

roxygenize(
    package.dir = "MyPackage"
  , clean = TRUE
)

## Building of the package with the 'tools' package :
library(package = "tools")

Rcmd(args = "build MyPackage")
## or with a shell : R CMD build MyPackage

## Installation and loading of the package :
install.packages(pkgs = "MyPackage_0.1.tar.gz")
library(package = "MyPackage")

## Test :
n_col <- 3
n_row <- 1e3

m_test <- t(
    x = matrix(
        data = rnorm(
            n = n_col * n_row
          , mean = 0
          , sd = 1
        )
      , nrow = n_col
      , ncol = n_row
      , dimnames = list(
            "Variables" = paste("V ", seq_len(length.out = n_col), sep = "")
          , "Observations" = NULL
        )
    ) * c(0.1, 1, 3) + c(-1, 1, 0)
)

plot_boxplot(data = m_test)
