import pandas as pd
import re
import matplotlib.pyplot as plt
from random import sample
import numpy as np


def jaccard(data=None):
    '''
    构建物品相似度矩阵(杰卡德相似系数)
    :param data: 用户物品矩阵,0-1矩阵;行为用户,列为物品
    :return: jaccard相似系数矩阵
    '''
    te = -(data-1)              # 将用户物品矩阵的值反转
    dot1 = np.dot(data.T, data)  # 任意两网址同时被浏览次数
    dot2 = np.dot(te.T, data)    # 任意两个网址中只有一个被浏览的次数（上三角表示前一个被浏览，下三角表示后一个被浏览）
    dot3 = dot2.T+dot2          # 任意两个网址中随意一个被浏览的次数
    cor = dot1/(dot1+dot3)      # 杰卡德相似系数公式
    for i in range(len(cor)):   # 将对角线值处理为零
        cor[i, i] = 0
    return cor


data = pd.read_csv('recomment_news.csv')
data['userid'] = data['userid'].astype(str)
data.shape
# (85561, 2)
# 一、数据清洗
'''
1、补齐网址
2、去除首页(包含index.html或index.jhtml,或者经过补齐后只有http://www.tipdm.org/)
3、去除网址中的"?"及其后面的内容
4、去重
'''
# 补齐网址
index = 'http://www.tipdm.org'
index_Incomplete = data['page_path'].str.contains('http://')
data['page_path'][~index_Incomplete] = data['page_path'][~index_Incomplete].apply(lambda x: index+x)

# 去除首页
index_html = data['page_path'].str.contains('index.html')
index_jhtml = data['page_path'].str.contains('index.jhtml')
index_equal = data['page_path'] == index+'/'
data_new = data.loc[~index_html & ~index_jhtml & ~index_equal]

# 去除网址中的"?"及后面的内容
data_new['page_path'] = data_new['page_path'].apply(lambda x: re.sub('\?.*', '', x))

# 去重
data_new.drop_duplicates(inplace=True)
data_new.shape
# (12189, 2)
# 保存数据
data_new.to_csv('data_new.csv', index=None)


# 二、数据拆分
'''
1、统计每个用户的网页浏览数
2、找出浏览网页数在3次以上的用户id
3、找出训练集用户
4、找出测试集用户
5、划分训练集数据
6、划分测试集数据
'''
id_counts = data_new['userid'].value_counts()   # 1、统计每个用户的网页浏览数

plt.plot(range(1000), id_counts.values[:1000])
plt.show()

id_index = id_counts[id_counts > 3].index       # 2、找出浏览网页数在3次以上的用户id
id_train = sample(id_index.tolist(), int(len(id_index)*0.8))    # 3、找出训练集用户
id_test = [i for i in id_index if i not in id_train]            # 4、找出测试集用户

index_train = data_new['userid'].apply(lambda x: x in id_train)  # 判定是否是训练集id
index_test = data_new['userid'].apply(lambda x: x in id_test)    # 判定是否是测试集id

data_train = data_new.loc[index_train, :]   # 5、划分训练集数据
data_test = data_new.loc[index_test, :]     # 6、划分测试集数据
# 三、构建模型
'''
1、用户物品矩阵构建
2、构建物品相似度矩阵
'''
te = pd.crosstab(index=data_train['userid'], columns=data_train['page_path'])
cor = jaccard(te)
cor = pd.DataFrame(cor, index=te.columns, columns=te.columns)
# 四、推荐与评估
'''
1、构建测试集用户网址浏览字典
2、开始推荐,rem第一列为测试集用户IP,第二列为已浏览过网址,第三列为相应推荐网址,第四列为推荐是否有效
3、推荐的网址
4、判定推荐是否准确
'''
test_dic = {i: data_test.loc[data_test['userid'] == i, 'page_path'].tolist() for i in id_test}
recommend = data_test.copy()
recommend['recommend'] = None
recommend['trueOrFalse'] = None
for i in recommend.index:
    if recommend.loc[i, 'page_path'] in cor.columns:
        recommend.loc[i, 'recommend'] = cor.loc[recommend.loc[i, 'page_path'], :].idxmax()
        recommend.loc[i, 'trueOrFalse'] = recommend.loc[i, 'recommend'] in test_dic[recommend.loc[i, 'userid']]
recommend['trueOrFalse'].mean()