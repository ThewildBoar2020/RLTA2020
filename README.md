# -
# 项目描述
本项目重点完成了合同网模型的改进，并将其应用于飞行器任务的实时分配。飞行器中段飞行时间长，弹道固定，容易成为防御系统拦截重点。利用深度强化学习算法结合动态窗口局部路径规划法完成深度强化学习模型设计、飞行器突防航迹推演等关键技术研究。主要技术：CNP、DQN。
## 1、环境依赖

MATLAB2016以上。

## 2、文件说明

一、"TSA"文件

采用改进合同网模型通过模拟市场机制中的“招标-投标-中标”模式，采用多种合同类型，通过多个个体之间的相互通信和协商，在个体追求最优的基础上，寻求全局最优和次优。用智能体来表示合同网模型中的个体，每隔智能体都是具有互相通信和一定的信息处理能力的个体。

二、“PDQN_161”文件

已训练好的深度强化模型。

## 3、运行步骤

运行文件夹PDQN_161中的PDQN160.m函数，但是需要修改报错路径和创建相应文件夹。
## 4、运行结果
![](https://s3.bmp.ovh/imgs/2022/08/09/0215bbd947a60de9.png)
![](https://s3.bmp.ovh/imgs/2022/08/09/fc9d0ef75d5e24e8.jpg)


