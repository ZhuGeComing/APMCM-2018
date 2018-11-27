micepath <- "D:/FOLDER/×ÀÃæ/2018 APMCM Problems/R³ÌÐò/Annex 2 raw data"
micefiles <- list.files(micepath, pattern = "*.trc$", full.names = FALSE)
data1 = read.csv("./Annex 2 raw data/aizhenjiang_g10.trc", sep = "\t", header = FALSE)
data1$V129 = 1
print(micefiles[1])
i = 1
while (i<77) {
  data2 = read.csv(paste("./Annex 2 raw data/",micefiles[i],sep = ""), sep = "\t", header = FALSE)
  data2$V129 = i
  data1 = rbind(data1, data2) 
  i = i + 1
}
write.csv(data1,"TotalData.csv", row.names = FALSE)

temp = read.csv("TotalData.csv")


xp = a[,seq(3,126,3)]
library(dplyr)
i = 1
times = sample(76)
while (i<77) {
  temp = which(data1[,129] == i)
  cutdata = data1[temp,]
  if (i == 1) {
    finaldata = cutdata[1:137,]
  }
  else{
    finaldata = rbind(finaldata, cutdata[1:137,]) 
  }

  times[i] = data1[temp[length(temp)],2]
  i = i + 1
}
row.names(finaldata) = 1:10412
write.csv(finaldata,"FinalTotalData.csv", row.names = FALSE)

library(magrittr)

xp = finaldata[,seq(3,126,3)]

speed = data.frame()
j = 1
while (j<77) {
  cuttemp = finaldata[(j*137-136):(j*137),]
  xp = cuttemp[,seq(3,126,3)]
  i = 1
  while (i<137) {
    speed = rbind(speed,(xp[i+1,]-xp[i,])/0.017)
    i = i + 1
  }
  speed = rbind(speed, speed[nrow(speed),])
  j = j +1
}
row.names(speed) = 1:10412
write.csv(speed,"Speed.csv", row.names = FALSE)

ReplacedData = finaldata
i = 1
while (i<43) {
  ReplacedData[,(3*i)] = speed[,i]
  i = i+1
}
write.csv(ReplacedData,"ReplacedData.csv", row.names = FALSE)

install.packages("caret")
library(caret)

hurt = read.csv("hurt.csv",header = FALSE)


y = matrix()
j = 1
while (j<77) {
  y[(j*137-136):(j*137)] = hurt[j,1]
  j = j +1
}
write.csv(y,"Target.csv", row.names = FALSE)


x = ReplacedData[,c(-1,-2,-129)]
y
write.csv(x,"XsAll.csv", row.names = FALSE)

ReplacedData = read.csv("ReplacedData.csv")
ReplacedData = ReplacedData[,c(-129)]
j = 1
while (j<77) {
  ReplacedData[(j*137-136):(j*137),1] = x
  j = j +1
}
write.csv(ReplacedData,"XDistance.csv", row.names = FALSE)
write.csv(testdata,"XDistanceSTD.csv", row.names = FALSE)
