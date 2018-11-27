x1 = read.csv("TrainAndTest.csv",sep = ",")

x = seq(0, 2.267, 0.0166)*2000/2.267
length(x)
x
testdata = read.csv("aizhenjiang_g10.trc", sep = "\t", header = FALSE)
testdata[1:137,"V129"] = x
testdata[,"V130"] = x

testdata = read.csv("STD.csv")
testdata[,c("V1","V2")] = ReplacedData[,c("V1","V2")]