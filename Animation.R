install.packages("rgl")
library(rgl)
micepath <- "D:/FOLDER/×ÀÃæ/2018 APMCM Problems/R³ÌÐò/Annex 2 raw data"
micefiles <- list.files(micepath, pattern = "*.trc$", full.names = FALSE)
micefiles[1]
a = read.csv(paste("./Annex 2 raw data/",micefiles[1],sep = ""), sep = "\t", header = FALSE)
j = 30
print(micefiles[j])
while (j<77) {
  a = read.csv(paste("./Annex 2 raw data/",micefiles[1],sep = ""), sep = "\t", header = FALSE)
  i = 1
  b = as.data.frame(matrix(a[1,c(-129,-1,-2)], ncol = 3, byrow = TRUE))
  attach(b)
  plot3d(V1, V2, V3,add = FALSE)
  detach(b)
  while (i<182) {
    b = as.data.frame(matrix(a[i,c(-129,-1,-2)], ncol = 3, byrow = TRUE))
    b[,4] = i 
    attach(b)
    plot3d(V1, V2, V3,add = TRUE)
    xlim = 3500
    ylim = 1500
    zlim = 2000
    decorate3d(xlim, ylim, zlim, 
               xlab = "x", ylab = "y", zlab = "z", 
               box = TRUE, axes = TRUE, main = NULL, sub = NULL,
               top = FALSE, aspect = FALSE, expand = 1.03)
    detach(b)
    i = i+1
  }
  j = j + 1
  Sys.sleep(3)
}


i = 1
while (i<182) {
  b = as.data.frame(matrix(a[i,c(-129,-1,-2)], ncol = 3))
  b[,4] = i 
  attach(b)
  xlim = 3000
  ylim = 3000
  zlim = 3000
  plot3d(V1, V2, V3,add = TRUE)
  decorate3d(xlim, ylim, zlim, 
             xlab = "x", ylab = "y", zlab = "z", 
             box = TRUE, axes = TRUE, main = NULL, sub = NULL,
             top = TRUE, aspect = FALSE, expand = 1.03)
  detach(b)
  i = i+1
}



i <- 1
sum_100 <- 0
repeat{sum_100 = sum_100 + i
i=i+1
if(i>100){
  print(sum_100)
  break
}
}


b = as.data.frame(matrix(a[2,c(-129,-1,-2)], ncol = 3))
b[,4] = 2 
attach(b)
plot3d(V1, V2, V3)
detach(b)

attach(a)
plot3d(V3, V4, V5)
detach(a)


micepath <- "D:/OneDrive/OneDrive - business-cn/ÎÄµµ/2018 APMCM Problems/2018 APMCM Problem A/Annex 2 raw data"
micefiles <- list.files(micepath, pattern = "*.trc$", full.names = FALSE)
micefiles[1]


i = 1
b = as.data.frame(matrix(a[i,c(-129,-1,-2)], ncol = 3,byrow = TRUE))
b[,4] = i 
attach(b)
xlim = 3000
ylim = 3000
zlim = 3000
plot3d(V1, V2, V3)
decorate3d(xlim, ylim, zlim, 
           xlab = "x", ylab = "y", zlab = "z", 
           box = TRUE, axes = TRUE, main = NULL, sub = NULL,
           top = TRUE, aspect = FALSE, expand = 1.03)
detach(b)


xlim = 3000
ylim = 3000
zlim = 3000
decorate3d(xlim, ylim, zlim, 
           xlab = "x", ylab = "y", zlab = "z", 
           box = TRUE, axes = TRUE, main = NULL, sub = NULL,
           top = TRUE, aspect = FALSE, expand = 1.03)