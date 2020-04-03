setwd('~/Desktop/Evolution/Programming/Tasks/Task_09/Project')

catData <- read.csv(file= 'Hypothesis.Data.Final.csv', header = TRUE, sep=",")
catData
head(catData)
dim(catData)

length(catData)
nrow(catData)
ncol(catData)
colnames(catData)

library(lattice)

cat_table <- read.table(text = "catData", header= TRUE, sep= ",")
cat_table

#plot the number in y axis
#by the body part
#grouped by species

colors= c("deeppink1", "darkturquoise")

barchart(
	data = catData,
	
	Coefficient.of.variation ~ Body.Part,
	
	groups = Cat.species,
)

barchart(
	data = catData,
	
	Coefficient.of.variation ~ Body.Part, 
	
	
	groups = Cat.species,
	
	main = list(
	label = "Comparisson of Cat species Characteristics",
	cex=1.5
),
	
	xlab = list(
	label = "Body part",
	cex= 1.0
	
),	
	
	scales = list(
	x=list(
	cex=0.5,
	rot=45
	)
),	
		
	auto.key = list(
	space = list (space = "top"),
	columns = 2
),
	
	
	par.settings = list(superpose.polygon = list(col = colors))

)

colors= c("deeppink1", "darkturquoise")

#ANALYSES LIST

#Graph of characteristics due today
#Make another graph of data gathered from another paper mainly anatomical data 
#Make a barchart on craniological differentiation between wildcats around the world and compare it with craniological data of domestic cats 
#include tables of data that cannot be graphed

#From the papers that I have found I haven't really seen data that I will be able to use to crate barcharts like the one today. I am basically trying through my graphs to make a comparison of the wild cat anatomical characteristics with the Domestic cat anatomcal characteristics. In my papers I will mostly include inforation about their environments and show how steadily the wildcat evolved to become the domestic cat. I will mention mostly the African and the European wildcat compared to the Domestic cat.