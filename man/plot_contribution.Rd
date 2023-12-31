% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_contribution.R
\name{plot_contribution}
\alias{plot_contribution}
\title{SHAP value based Break-Down plot}
\usage{
plot_contribution(
  treeshap,
  obs = 1,
  max_vars = 5,
  min_max = NA,
  digits = 3,
  explain_deviation = FALSE,
  title = "SHAP Break-Down",
  subtitle = ""
)
}
\arguments{
\item{treeshap}{A treeshap object produced with the \code{\link{treeshap}} function. \code{\link{treeshap.object}}.}

\item{obs}{A numeric indicating which observation should be plotted. Be default it's first observation.}

\item{max_vars}{maximum number of variables that shall be presented. Variables with the highest importance will be presented.
Remaining variables will be summed into one additional contribution. By default \code{5}.}

\item{min_max}{a range of OX axis. By default \code{NA}, therefore it will be extracted from the contributions of \code{x}.
But it can be set to some constants, useful if these plots are to be used for comparisons.}

\item{digits}{number of decimal places (\code{\link{round}}) to be used.}

\item{explain_deviation}{if \code{TRUE} then instead of explaining prediction and plotting intercept bar, only deviation from mean prediction of the reference dataset will be explained. By default \code{FALSE}.}

\item{title}{the plot's title, by default \code{'SHAP Break-Down'}.}

\item{subtitle}{the plot's subtitle. By default no subtitle.}
}
\value{
a \code{ggplot2} object
}
\description{
This function plots contributions of features into the prediction for a single observation.
}
\examples{
\donttest{
library(xgboost)
data <- fifa20$data[colnames(fifa20$data) != 'work_rate']
target <- fifa20$target
param <- list(objective = "reg:squarederror", max_depth = 3)
xgb_model <- xgboost::xgboost(as.matrix(data), params = param, label = target,
                              nrounds = 20, verbose = FALSE)
unified_model <- xgboost.unify(xgb_model, as.matrix(data))
x <- head(data, 1)
shap <- treeshap(unified_model, x)
plot_contribution(shap, 1,  min_max = c(0, 120000000))
}
}
\seealso{
\code{\link{treeshap}} for calculation of SHAP values

\code{\link{plot_feature_importance}}, \code{\link{plot_feature_dependence}}, \code{\link{plot_interaction}}
}
