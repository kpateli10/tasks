#2a
setwd("~/Desktop/Evolution/Programming/Tasks/Task.02")
Data <- read.csv("http://jonsmitchell.com/data/beren.csv" , stringsAsFactors=F)
length(Data)
nrow(Data)
ncol(Data)
colnames(Data)
head(Data)
Data[1,]
Data[2,]
Data[1:3,]
Data[1:5, 1:3]
Feeds <- which(Data[,9] == "bottle")
berenMilk <- Data[Feeds,]
head(berenMilk)
Feeds <- which(Data[, "event"] == "bottle")
Feeds <- which(Data$event == "bottle")
dayID <- apply(Data, 1, function(x)paste(x[1:3], collapse="-"))
dateID <- sapply(dayID, as.Date, format = "%Y-%m-%d", origin = "2019-04-18")
Data$age <- dateID - dateID[which(Data$event =="birth")]
head(Data)
beren2 <- Data
beren3 <- beren2[order(beren2$age),]

#Hypothesis
KCHcaregiver <- which(Data$caregiver == "kch")
Rainbowcare <- which(Data$caregiver == "rainbow")
JRcare <- which(Data$caregiver == "jr")
Vonacare <- which(Data$caregiver == "vona")
Jsmkchcare <- which(Data$caregiver == "jsmkch")
Apcare <- which(Data$caregiver == "ap")
Ijcare <- which(Data$caregiver == "ij")
Kccare <- which(Data$caregiver == "kc")
Jdcare <- which(Data$caregiver == "jd")
Melodycare <- which(Data$caregiver == "melody")

Naps <- which(beren3$event == "nap")
beren5 <- beren3[Naps,]
beren5$start_minute <- beren5$start_minute / 60
beren5$end_minute <- beren5$end_minute / 60 
beren5$startnap <- beren5$start_hour + beren5$start_minute
beren5$endnap <- beren5$end_hour + beren5$end_minute
beren5$naplength <- beren5$endnap - beren5$startnap
totalNaptime<- tapply(beren5$naplength, beren5$caregiver, mean, na.rm=T)
totalNaptime

boxplot( beren5$naplength ~ beren5$caregiver, xlab= "caregiver", ylab= "average time napped")
pdf("r02c-averagenapbycaregiver", height = 4, width = 4)
par(las=1, mar=c(5,5,1,1), mgp=c(2, 0.5, 0), tck=-0.01)
boxplot( beren5$naplength ~ beren5$caregiver, xlab= "caregiver", ylab= "average time napped")
dev.off()



