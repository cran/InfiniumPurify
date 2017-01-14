\name{InfiniumDMC}
\alias{InfiniumDMC}
\title{
Differentially Methylation Calling accounting for tumor purity
}
\description{
Infer differentially methylated CpG sites with the consideration of tumor purities.
}
\usage{
InfiniumDMC(tumor.data,normal.data,purity,threshold)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{tumor.data}{numeric matrix of beta values for tumor samlpes. The rownames of tumor.data
  should be probe names of Infinium 450k array, and colnames should be names of tumor samples.}
  \item{normal.data}{numeric matrix of beta values for normal samlpes. The rownames of normal.data
  should be probe names of Infinium 450k array, and colnames should be names of normal samples.}
  \item{purity}{purities for tumor samples. Could be estimated by \link{getPurity}, or user specified 
  purities from other tools.}
  \item{threshold}{probability threshold in control-free DM calling. Default is 0.1.}
}
\details{
If normal.data is provided, the function tests each CpG site for differential methylation between tumor and normal samples with the consideration of tumor purities by a generalized linear regression. If normal.data is not provided, the function computes posterior probability to rank CpG sites. 
}
\value{
A data frame of statistics, p-values and q-values for all CpG sites.
}
\references{
X. Zheng, N. Zhang, H.J. Wu and H. Wu, Estimating and accounting for tumor purity in the analysis of DNA methylation data from cancer studies. \emph{Genome biology}, in revision. 
}
\author{
Xiaoqi Zheng \email{xqzheng@shnu.edu.cn}.
}

\seealso{
\code{\link[minfi]{dmpFinder}} in the \pkg{minfi} package. 
}
\examples{

## load example data
data(beta.emp)

normal.data <- beta.emp[,1:21]
tumor.data <- beta.emp[,22:61]

## estimate tumor purity
purity <- getPurity(tumor.data = tumor.data,normal.data = normal.data)

## DM calling with normal controls
DMC = InfiniumDMC(tumor.data = tumor.data,normal.data = normal.data,purity = purity)

## DM calling without normal control
DMC_ctlFree = InfiniumDMC(tumor.data = tumor.data,purity = purity)

}