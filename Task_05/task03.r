setwd('~/Desktop/Evolution/Programming/Tasks/Task_05')
source("http://jonsmitchell.com/code/fxn05.R")
Pop1 <- simPop(Popsize = 50, nGenerations = 100, initial_p = 0.5, h=1, s=0)
plot(1:nrow(Pop1), Pop1[,1], ylim=c(0,1), type="l",xlab="generation", ylab= "allele freq.", lwd=2)
lines(1:nrow(Pop1), Pop1[,1], lwd=2, col='red' )
legend("topleft", legend=c ("a", "b"), col=c("black", "red"), lwd=2, bty="n")

# change lots of numbers here to study
plotFit(nruns=50, n=150, ngens=100, init_p=0.5, h=1, s=0.1)


Expectation <- c(10, 10, 10, 10)
Observed <- c(0, 0, 0, 40)
Chisq <- sum(((Expectation - Observed)^2)/2)
barplot(rbind(Expectation, Observed), beside=T, main=bquote(chi^2~"="~.(Chisq)), legend.text=c("expected", "observed"))

results<- read.csv("http://jonsmitchell.com/data/biol112labresults.csv", stringsAsFactors=F)
counts<- results[,c("yellow", "red", "green", "blue", "black", "tan")]
backgrounds <- c("White", "Red", "Yellow", "Green", "Blue", "Black")
backgroundCol <- c("white", "#d53e4f", "#fee08b", "#abdda4", "#3288bd","black")
calcChi(counts[1,])
Chisqs <- apply(counts, 1, calcChi)
plotChis(counts)
#
#the average Chi squared is 60.99081

Avg <- mean(Chisqs)
#
#Yes the chi-squared differs by background
backgroundAvgs <- tapply(Chisqs, results[,3], mean)
propSig <- length( which( Chisqs > 11.70) ) / length(Chisqs)
percSig <- round(100*propSig)
#the percent of trials was 92% so no it doesn't surprise me. Natural selection could be the thing driving the high number

par(las=1, mar=c(4, 4, 1, 1), mgp= c(2, 0.5, 0), tck = -0.01, cex.axis=1)
hist(Chisqs, main="", xlab="chi-squared values", ylab="frequency")
par(las= 1, mar=c(4, 4, 1, 1), mgp = c(2, 0.5, 0), tck = -0.01, cex.axis=1)
plot(1, 1, xlim=c(0, 400), ylim=c(1, 8.5), xlab="", ylab="", type="n", yaxt="n")
axis(2, at = 1:length(backgrounds), labels = backgrounds)
mtext(side=1, expression(chi^2), cex=1.75, line=2.5)
counter <- 1
for (i in backgrounds)  {
	Data <- Chisqs[which(results[,3] == i)]
	addHist(Y=counter, Dat=Data, Color=backgroundCol[counter])
	counter <- counter + 1
}
abline( v = 11.70, lty=2, lwd = 2, col='black')


Simulation <- simDraws(10000)
addHist(Y=7, Dat=Simulation, Color="lightgray")
mtext(side=2, at=7, line=0, "simulated")
abline(v = 11.70, lty=2, lwd=2)

Fit <- c(1, 1, 1, 1, 1, 1)
names(Fit) <- 1:6
Simulation2 <- simDraws(1e4, w= Fit)
addHist(Y=8, Dat=Simulation2, Color=rgb(0,0,0,0.25))

Fit <- c(0.1, 1, 1, 1, 1, 1)
names(Fit) <- 1:6
Simulation3 <- simDraws(1e4, w= Fit)
addHist(Y=8, Dat=Simulation3, Color=rgb(0,0,1,0.25))

Fit <- c(0.5, 0.6, 0.7, 1, 1, 1)
names(Fit) <- 1:6
Simulation4 <- simDraws(1e4, w= Fit)
addHist(Y=8, Dat=Simulation4, Color=rgb(0,0,0,0.25))

Fit <- c(0.1, 0.2, 0.3, 0.4, 0.5, 1)
names(Fit) <- 1:6
Simulation5 <- simDraws(1e4, w= Fit)
addHist(Y=8, Dat=Simulation5, Color=rgb(0,0,0,0.25))

Fit <- c(0.1, 0.1, 0.1, 0.1, 0.1, 1)
names(Fit) <- 1:6
Simulation6 <- simDraws(1e4, w= Fit)
addHist(Y=8, Dat=Simulation6, Color=rgb(1,0,0,0.25))
mtext(side=2, at=8, line=0, "sel.sim.")

Simulation7 <- c(Simulation2, Simulation3, Simulation5, Simulation5, Simulation4, Simulation5, Simulation6)
addHist(Y=8, Dat= Simulation7, Color=rgb(1,0,0,1))
