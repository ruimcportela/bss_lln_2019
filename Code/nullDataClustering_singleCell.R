library(DESeq2)
library(Rtsne)
library(edgeR)

runEdgeR <- function(counts, design){
    d <- DGEList(counts)
    d <- calcNormFactors(d)
    d <- estimateDisp(d, design)
    fit <- glmFit(d, design)
    lrt <- glmLRT(fit, coef=2)
    return(lrt)
}

# simulate data according to a negative binomial distribution
set.seed(99)
n <- 1e4 #number of genes
m <- 100 #number of cells
fprCluster <- c()
fprMock <- c()
par(mfrow=c(1,3))
for(ii in 1:5){
  dss <- DESeq2::makeExampleDESeqDataSet(n=n, m=m)
  counts <- assays(dss)$counts

  # t-SNE on top PCs
  tsneDR <- Rtsne(log1p(t(counts)))

  # cluster in t-SNE space
  km <- kmeans(tsneDR$Y, centers=2)
  group <- as.factor(km$cluster)
  plot(tsneDR$Y, col=group, pch=16, cex=1/2, main="t-SNE on top PCs", xlab="t-SNE1", ylab="t-SNE2")

  # DE based on clustering
  design <- model.matrix(~group)
  lrt <- runEdgeR(counts, design)
  hist(lrt$table$PValue, main=paste("iteration",ii,"cluster comparison"), ylim=c(0,600), xlab="p-value")
  fprCluster[ii] <- sum(lrt$table$PValue <= 0.05)

  # mock DE
  mock <- as.factor(rep(1:2,each=m/2))
  designMock <- model.matrix(~mock)
  lrtMock <- runEdgeR(counts, designMock)
  hist(lrtMock$table$PValue, main=paste("iteration",ii,"mock comparison"), ylim=c(0,600), xlab="p-value")
  fprMock[ii] <- sum(lrtMock$table$PValue <= 0.05)
}

boxplot(cbind(fprCluster, fprMock)/n, names=c("cluster-based", "random"), ylab="False positive rate")
