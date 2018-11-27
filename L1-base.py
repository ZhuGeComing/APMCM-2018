from sklearn.svm import LinearSVC
import pandas as pd

y = pd.read_csv("Target.csv")
x = pd.read_csv("XsAll.csv")
names=x.columns



lsc=LinearSVC(C=0.01,penalty="l1",dual=False)
lsc.fit_transform(x,y)
print (sorted(zip(map(lambda x:round(x,4), lsc.ranking_),names)))

# result:
# 不可行