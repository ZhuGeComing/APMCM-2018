install.packages("e1071")
install.packages("klaR")
library(C50)
library(e1071)
library(klaR)
library(caret)
data(churn)

#构建sbf函数的控制参数(使用朴素贝叶斯函数和BootStrap抽样方法)

sbfControls_nb <- sbfControl(
  
  functions = nbSBF,
  
  method = 'boot')

#使用sbf函数进行特征选择

fs_nb <- sbf(x = x,
             
             y = factor(y$x),
             
             sbfControl = sbfControls_nb)

fs_nb
fs_nb$optVariables

rfeControl(functions = NULL,
           
           rerank = FALSE,
           
           method = "boot",
           
           saveDetails = FALSE,
           
           number = ifelse(method %in% c("cv", "repeatedcv"), 10, 25),
           
           repeats = ifelse(method %in% c("cv", "repeatedcv"), 1, number),
           
           verbose = FALSE,
           
           returnResamp = "final",
           
           p = .75,
           
           index = NULL,
           
           indexOut = NULL,
           
           timingSamps = 0,
           
           seeds = NA,
           
           allowParallel = TRUE)


sbfControls_rf <- sbfControl(
  
  functions = rfSBF,
  
  method = 'cv',
  
  repeats = 5)

#使用sbf函数进行特征选择

fs_rf <- sbf(x = churnTrain[,-20],
             
             y = churnTrain[,20],
             
             sbfControl = sbfControls_rf)

# 归一化处理后数据
# Selection By Filter
# 
# Outer resampling method: Bootstrapped (25 reps) 
# 
# Resampling performance:
#   
#   Accuracy  Kappa AccuracySD KappaSD
# 0.748 0.4764   0.007125 0.01471
# 
# Using the training set, 94 variables were selected:
#   V4, V5, V7, V8, V10...
# 
# During resampling, the top 5 selected variables (out of a possible 122):
#   V10 (100%), V100 (100%), V101 (100%), V103 (100%), V106 (100%)
# 
# On average, 97.2 variables were selected (min = 89, max = 104)
# > fs_nb$optVariables
# [1] "V4"   "V5"   "V7"   "V8"   "V10"  "V13"  "V16"  "V17"  "V19"  "V21"  "V22" 
# [12] "V23"  "V25"  "V26"  "V27"  "V28"  "V29"  "V31"  "V32"  "V33"  "V34"  "V36" 
# [23] "V37"  "V38"  "V39"  "V40"  "V41"  "V42"  "V43"  "V44"  "V45"  "V46"  "V47" 
# [34] "V48"  "V49"  "V50"  "V51"  "V52"  "V54"  "V55"  "V56"  "V57"  "V58"  "V61" 
# [45] "V62"  "V63"  "V64"  "V66"  "V67"  "V68"  "V69"  "V70"  "V71"  "V72"  "V73" 
# [56] "V74"  "V76"  "V77"  "V79"  "V81"  "V82"  "V83"  "V85"  "V87"  "V88"  "V89" 
# [67] "V90"  "V91"  "V93"  "V94"  "V96"  "V97"  "V99"  "V100" "V101" "V103" "V104"
# [78] "V106" "V107" "V109" "V112" "V115" "V117" "V118" "V119" "V120" "V121" "V122"
# [89] "V123" "V124" "V125" "V126" "V127" "V128"