% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/importData.R
\name{importData}
\alias{importData}
\title{Import a data-frame or matrix, and associated metadata, to a \code{SingleCellExperiment} object.}
\usage{
importData(
  mat,
  assayname,
  metadata = NULL,
  downsampleVar = NULL,
  verbose = TRUE
)
}
\arguments{
\item{mat}{A data-frame or matrix of expression values. Data-frames will be
coerced to matrices.}

\item{assayname}{Name of the \code{SingleCellExperiment} assay slot in which
data will be stored.}

\item{metadata}{Metadata associated with the data contained in 'mat'. A
strict rule is enforced requiring that \code{rownames(metadata) ==
rownames(mat)}.}

\item{downsampleVar}{Downsample based on variance. Removes this proportion of
variables (rows) based on lesser variance. This is applied on a per sample
basis. If user wishes to apply this globally on the final merged dataset,
then set this to 0 and remove based on variance manually after object
creation.}

\item{verbose}{Boolean (TRUE / FALSE) to print messages to console or not.}
}
\value{
A \code{SingleCellExperiment} object.
}
\description{
Import a data-frame or matrix, and associated metadata, to a \code{SingleCellExperiment} object.
}
\details{
Import a data-frame or matrix, and associated metadata, to a \code{SingleCellExperiment} object.
}
\examples{
# create random data that follows a negative binomial
mat <- jitter(matrix(
  MASS::rnegbin(rexp(50000, rate=.1), theta = 4.5),
  ncol = 20))
colnames(mat) <- paste0('CD', 1:ncol(mat))
rownames(mat) <- paste0('cell', 1:nrow(mat))

metadata <- data.frame(
  group = rep('A', nrow(mat)),
  row.names = rownames(mat),
  stringsAsFactors = FALSE)

sce <- importData(mat,
  assayname = 'normcounts',
  metadata = metadata)

}
\author{
Kevin Blighe <kevin@clinicalbioinformatics.co.uk>
}
