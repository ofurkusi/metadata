\name{metadata-package}
\alias{metadata-package}
\alias{metadata}
\docType{package}
\title{
Add metadata to datasets
}
\description{
This package allow you to store metadata as attributes for data frames.
}
\details{
\tabular{ll}{
Package: \tab metadata\cr
Type: \tab Package\cr
Version: \tab 0.1\cr
Date: \tab 2016-02-17\cr
License: \tab GPL-3\cr
}
%~~ An overview of how to use the package, including the most important functions ~~
}
\author{
Author and maintainer: Palmar Thorsteinsson <palmar.thorsteinsson@gmail.com>
}
%\references{
%~~ Literature or other references for background information ~~
%}
%~~ Optionally other standard keywords, one per line, from file KEYWORDS in the R documentation directory ~~
\keyword{datasets, package}
\seealso{
%~~ Optional links to other man pages, e.g. ~~
\code{\link{Hmisc}}, \code{\link{dspl-r}}, also the built in function \code{comment}
}
\examples{

df <- data.frame(l = c(1, 2, 3), r = c(4, 5, 6))
metadata(df) <- list(Title = "My numbers",
                       Source = "Input by hand")
metadata(df)


%~~ simple examples of the most important functions ~~
}
