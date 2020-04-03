setwd('~/Desktop/Evolution/Programming/Tasks/Task_09')
library(ape)
library(maps)
library(phytools)
#Phylogeny in R 
tree <- force.ultrametric(read.tree("http://jonsmitchell.com/data/anolis.tre"))
plot(tree, type="fan")

#Q1 There are 82 tips in the tree and the branch lengths are present and there are 162 branch lengths.


tiplabels(frame="circle", bg='lightblue', cex=1)
tree$tip.label
edgelabels(tree$edge.length, bg="black", col="white", font=2)

data <- read.csv("https://jonsmitchell.com/data/svl.csv", stringsAsFactors=F, row.names=1)

#Q2. Data is an "object" which includes species with their snout-vent length. The dimesnions are one column and 100 rows.
head(data)
dim(data)


svl<- setNames(data$svl , rownames(data)) 

Ancestors<- fastAnc (tree , svl[tree$tip.label] , vars=TRUE, CI=TRUE) 
#Q3

#Q4


par(mar=c(0.1 ,0.1 ,0.1 ,0.1) )
 plot(tree, type="fan",lwd=2, show.tip.label=F) 

tiplabels (pch=21, cex=0.25 * svl [tree$tip.label])
nodelabels(pch=21, cex=0.25 * Ancestors$ace) 












