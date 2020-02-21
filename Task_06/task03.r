#Q1 Each simulation started with with 3, 15 and 30 alleles. you can change the number by changing the n in the coalescent plot 

#Q2 The population the longer it takes for it to go into fixations. So it has a coreelation to the population size. The bigger the population is some go into fixation before 20.

#Q3 one offspring per individual

#Q4 it has no role at all

#Q5 They are not most of the time.

#Q2 I think it would be the 4Ne that we talked about in class so 4*(the effective population size) but in the lower two is was around 20 generations and in the larger one it was much bigger, as one would expect as Ne is increasing.

 


setwd('~/Desktop/Evolution/Programming/Tasks/Task_06')
library("learnPopGen")
install.packages("coala")
install.packages("phytools")
library("coala")
install.packages("ape")
install.packages("maps")
library("phytools")

coalescent.plot()
coalescent.plot(n=40, ngen=50, colors=NULL)


model<- coal_model(sample_size=5, loci_number=10, loci_length=500, ploidy=2)+
feat_mutation(10)+
feat_recombination(10)+
sumstat_trees()+
sumstat_nucleotide_div()

stats <- simulate(model, nsim=1)

Diversity<- stats$pi

Nloci <- length(stats$trees)

t1<- read.tree(text=stats$trees[[1]][1])
plot(t1)
axisPhylo()

#Q6 is because it is a phylogeny (sort of) of the realtive frequency and some fall in the same tip

Angel<- max(nodeHeights(t1))

t2<- read.tree(text=stats$trees[[2]][1])

plot(t2)
axisPhylo()

#Q7 they do not match
par(mfrow=c(1,2))
plot(t1)
axisPhylo()
plot(t2)
axisPhylo()

compare.chronograms(t1,t2)

t1_1<- read.tree(text=stats$trees[[1]][1])
t1_2<- read.tree(text=stats$trees[[1]][2])
compare.chronograms(t1_1, t1_2)

for(locus in 1:Nloci) {
	ntrees <- length(stats$trees[[locus]])
	for(n in 1:ntrees) { 
		if(locus==1&& n==1) {
			outPhy <- read.tree(text=stats$trees[[locus]][n])
			}
			else {
			outPhy <- ape:::c.phylo( outPhy, read.tree(text=stats$trees[[locus]][n]))
			}
			}
			}

	

par(mfrow=c(1,1))
densityTree(outPhy)


model3 <-coal_model(10, 50)+
	feat_mutation(par_prior("theta", sample.int(100, 1)))+
	sumstat_nucleotide_div()
stats <- simulate(model3, nsim=40)	

mean_pi<- sapply(stats, function(x) mean(x$pi))
theta <- sapply(stats, function(x) x$pars[["theta"]])
plot(mean_pi)
plot(theta)
plot(mean_pi,theta)
abline(lm(mean_pi ~ theta))
