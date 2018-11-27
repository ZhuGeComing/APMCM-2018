import pandas as pd
from sklearn.preprocessing import MinMaxScaler

if __name__ == "__main__":
    # 读取葡萄酒数据集
    data = pd.read_csv("XsAll.csv")
    # 获取第二列Alcohol
    x = data
    # 获取数据的基本情况
    print(x.describe())
    minMax = MinMaxScaler()
    # 将数据进行归一化
    x_std = minMax.fit_transform(x)
    print(x_std)
    pd.DataFrame(x_std, columns=x.columns).to_csv("STD.csv",index=None)
