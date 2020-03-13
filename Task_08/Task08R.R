setwd('~/Desktop/Evolution/Programming/Tasks/Task_08')

library(maps)
library(ape)
library(phytools)

text.string <- "(((((((cow, pig), whale),(bat,(lemur, human))),(robin, iguana)), coelacanth), (gold_fish, trout)),shark);"
vert.tree <- read.tree(text=text.string)
plot(vert.tree, edge.width=2)

nodelabels(frame="circle", bg='white', cex=1)

#Q1 goldfish is more closely related probably because it connects to 13 in less nodes than humans do

vert.tree

#Q2 There are no branch lengths in this tree

str(vert.tree)

tree <- read.tree(text="(((A,B),(C,D)),E);")
plotTree(tree, offset=1)
tiplabels(frame="circle", bg='lightblue',cex=1)
nodelabels(frame="circle",bg='white', cex=1)

tree$tip.label

tree$edge

AnolisTree <- force.ultrametric(read.tree("https://jonsmitchell.com/data/anolis.tre"))

par(las=1)
hist(AnolisTree$edge.length, col='black', border='white', main="", xlab="edge lengths for the Anolis tree", ylim=c(0,50),xlim=c(0,6))

tipEdges <- which(AnolisTree$edge[,2]<=Ntip(AnolisTree))
Lengths <- AnolisTree$edge.length
names(Lengths)<- AnolisTree$tip.label
names(Lengths)[which(Lengths == min(Lengths))]


plot(AnolisTree, cex=0.25)
Labs <-sapply(AnolisTree$edge.length, round, digits=2)
edgelabels(text=Labs, cex=0.25)

#Question 3
plotTree(AnolisTree, offset=1)
edgelabels(text=NULL, cex=0.25)

#Question 4
plot(AnolisTree, type="fan")

#Question 5
plot(AnolisTree,cex=0.25,tip.color='red')

#Question 6 

?which()
which$



ltt(AnolisTree)
abline(0,1,lwd=2,col='red',lty=2)

#Question 9
#The line just keeps going up and seems to jump up in smaller incrememnts, it never goes down. Because that is how geneological systems work, they are all derived from the one most closely behind it. The slope seems to be decreasing due to thesmaller incremmental jumps. It tells us that things are more closely related towards the end due the decreasing increments of differences between species.


#Question 10
fit.bd(AnolisTree, rho=0.2)