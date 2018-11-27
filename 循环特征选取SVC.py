import pandas as pd
from sklearn.feature_selection import RFE
from sklearn.svm import SVC

y = pd.read_csv("Target.csv")
x = pd.read_csv("XsAll.csv")
names=x.columns

svc=SVC(kernel="linear",C=1)
rfe=RFE(svc,n_features_to_select=100)

rfe.fit_transform(x,y)
print ("features sorted by their rank:" )
print (sorted(zip(map(lambda x:round(x,4), rfe.ranking_),names)))

# result:
# 未出结果