import pandas as pd
from sklearn.datasets import load_iris
from sklearn.feature_selection import SelectKBest
from sklearn.feature_selection import chi2,f_classif
from sklearn.feature_selection import RFE
from sklearn.svm import SVC
from sklearn.linear_model import LinearRegression

y = pd.read_csv("Target.csv")
x = pd.read_csv("XsAll.csv")
names=x.columns

X_new=SelectKBest(f_classif,k=2).fit_transform(x,y)
print (X_new.shape)
print (X_new)


# result:
# (10412, 2)
# [[348.85229 409.56592]
#  [350.21814 410.30865]
#  [351.52579 411.19391]
#  ...
#  [378.23907 427.17404]
#  [378.2074  427.04272]
#  [377.6799  426.62845]]

