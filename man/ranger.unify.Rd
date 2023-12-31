% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/unify_ranger.R
\name{ranger.unify}
\alias{ranger.unify}
\title{Unify ranger model}
\usage{
ranger.unify(rf_model, data)
}
\arguments{
\item{rf_model}{An object of \code{ranger} class. At the moment, models built on data with categorical features
are not supported - please encode them before training.}

\item{data}{Reference dataset. A \code{data.frame} or \code{matrix} with the same columns as in the training set of the model. Usually dataset used to train model.}
}
\value{
a unified model representation - a \code{\link{model_unified.object}} object
}
\description{
Convert your ranger model into a standardized representation.
The returned representation is easy to be interpreted by the user and ready to be used as an argument in \code{treeshap()} function.
}
\examples{

 library(ranger)
 data_fifa <- fifa20$data[!colnames(fifa20$data) \%in\%
                            c('work_rate', 'value_eur', 'gk_diving', 'gk_handling',
                             'gk_kicking', 'gk_reflexes', 'gk_speed', 'gk_positioning')]
 data <- na.omit(cbind(data_fifa, target = fifa20$target))

 rf <- ranger::ranger(target~., data = data, max.depth = 10, num.trees = 10)
 unified_model <- ranger.unify(rf, data)
 shaps <- treeshap(unified_model, data[1:2,])
 plot_contribution(shaps, obs = 1)
}
\seealso{
\code{\link{lightgbm.unify}} for \code{\link[lightgbm:lightgbm]{LightGBM models}}

\code{\link{gbm.unify}} for \code{\link[gbm:gbm]{GBM models}}

\code{\link{xgboost.unify}} for \code{\link[xgboost:xgboost]{XGBoost models}}

\code{\link{randomForest.unify}} for \code{\link[randomForest:randomForest]{randomForest models}}
}
