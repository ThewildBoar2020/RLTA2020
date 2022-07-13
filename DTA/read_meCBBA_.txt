(一)：各个函数的功能：
CBBA_Main.m:给出agents、tasks和graph，得到CBBA_Data和Total_Score；
CBBA_Communicate.m：CBBA_params,CBBA_Data,Graph,old_t，T,得到CBBA_Data，和t（为每个任务实施表格）
CBBA_Init.m：初始化CBBA参数
CBBA_Bundle.m在每个任务上运行，得到新的CBBA_Data和Bid
CBBA_BundleRemove:删除不满足条件的任务
CBBA_BundleAdd：将新任务运行运行，得到新的CBBA_Data和Bid
CBBA_ComputeBids：计算Bids
(二)：运行主函数MainTest5to5.m，得到如图一和图二所示的任务分配结果。图一为5个Agents执行5个Tasks的最终结果；图二各个任务的时间窗口
(三)
___________________________________
选定Agents
for n=1:N,
    if(n/N <= 0.5),
        agents(n) = agent_quad;
    else,
        agents(n) = agent_car;
    end
—————————————————— 
选定tasks
for m=1:M,
    if(m/M <= 0.5),
        tasks(m) = task_track;
    else,
        tasks(m) = task_rescue;
    end
(四)任务分配：如图3所示。
1）初始化各个变量和参数，
2）确定Agents和tasks的个数与类型
3）计算每个Agent和每个Task的任务分配情况，得到任务实施表格
4）计算每一组的任务的bid
5)判断该组任务是否满足任务需求（条件，约束等等）
6）如果任务满足条件输出（保留），如果不满足，删除这一组任务，并添加新的一轮任务分配
7）输出满足条件所有的任务分配，并得到CBBA_Data
++++++++++++
agentID
agentIndex
bundle
path
times
scores
bids
winners
winnerBids
++++++++++
