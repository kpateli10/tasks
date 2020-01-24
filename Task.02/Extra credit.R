Naps <- which(Data$event == "nap")
berenNaps <- Data[Naps,]
head(berenNaps)
dim(berenNaps)
tail(berenNaps)
berenNaps$event
beren4 <- beren3[Naps,]
head(beren4) 
beren4$start_minute <- beren4$start_minute / 60
beren4$end_minute <- beren4$end_minute / 60 
beren4$startnap <- beren4$start_hour + beren4$start_minute
beren4$endnap <- beren4$end_hour + beren4$end_minute
beren4$naplength <- beren4$endnap - beren4$startnap
totalNaptime<- tapply(beren4$day[Naps], beren4$age[Naps], sum)

par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck= -0.01)
plot(as.numeric(names(totalNaptime)), totalNaptime, type="b", pch=16, xlab="day", ylab="total nap time")
cor.test(beren4$age, beren4$naplength)

# the value of the corrolation coeficient is small (0.039) which means that essentially there is no corrolation.