function []=PDQN_171_180LJW()%GUO
   % clear all;clc;
addpath(genpath('Environment'));
addpath(genpath('Agent'));

%load('Model/model_1220_0353.mat') %model_1220_1244
%load('Model_160/model_1220_1835.mat') %model_1220_1244
load('Model_160/model_1221_1842.mat') %model_1220_1244
seed = 0;
rand('state', seed);
    % ���ػ�����Ϣ������255��ʾ�ϰ������
    Ob=imread('51.jpg');Ob=Ob(:,:,1);Ob=im2bw(Ob,maps,0.4);
  % ���˻��˶�ѧģ��:����ٶ�[pixel/s],�����ת�ٶ�[rad/s],���ٶ�[pixel/ss],
    % ��ת���ٶ�[rad/ss],�ٶȷֱ���[pixel/s],ת�ٷֱ���[rad/s]]
     % Kinematic=[200,1.2,80,0.6,3,0.08];
    Kinematic=[200,0.8,80,1.6,3,0.08];
 % x=[163 364 0 0 0];
  %  goal=[702 342];
   global x0;x0=[190 435];global xT;xT=[689 315];
    x=[x0 0 0 0];
    goal=xT;
    State.x=x;State.goal=goal;
   % eps-greedy
    Const.eps=0.5;
    % �˻�ϵ��
    Const.anneal=0.95;
    % ��������С��batch��С
    Const.BufferSize=50;    Const.BatchSize=10;
    net.opts.batchsize=Const.BatchSize;
    % DQN�е�ѧϰ�ʺ��ۿ���
    Const.alpha=0.8;    Const.gamma=0.95;
    Const.ratio=10000;
 E=180;M=1;

    global dt;dt=0.2;
    %{ 
   
    % ���ػ�����Ϣ������255��ʾ�ϰ������
    Ob=imread('5.jpg');Ob=Ob(:,:,1);
    % ���˻��˶�ѧģ��:����ٶ�[pixel/s],�����ת�ٶ�[rad/s],���ٶ�[pixel/ss],
    % ��ת���ٶ�[rad/ss],�ٶȷֱ���[pixel/s],ת�ٷֱ���[rad/s]]
    Kinematic=[200,1.2,80,0.6,3,0.08];
    % ���ۺ������� [heading,dist,velocity,predictDT]
    evalParam=[ones(1,3),0.5];
    % ��������ֵ
    stochRmax=10;
    % ʱ����
    global dt;dt=0.2;
    % ѵ������/ÿ�ֵ�������
    E=300;M=1;
    % ��ʼ����ǰ״̬����ʼ��Ŀ���
    % �����˵ĳ���״̬[x(m),y(m),yaw(Rad),v(m/s),w(rad/s)]
    % ��ʼ��ѵ������
    %path='Model/model_0923_1139.mat';
    path='Model/';
    %load('Model/model_0923_1139.mat')
    %{
    x=InitialState(Ob);
    goal=GoalRandGen(x(1:2),Ob);
    %} 
    x=[163 364 0 0 0];
    goal=[702 342];
    [SurOb,~]=PDQN_GetCurSurOb(x,goal,Ob);
    net=CreateNeuralNetneural(1,path,SurOb,zeros(36,1));

    % ״̬����洢
    StochQmean=zeros(E,1);TrainRmean=zeros(E,M+1);
    StochCount=zeros(E,1);TrainCount=zeros(E,M+1);
    StochFail=zeros(E,1);TrainFail=zeros(E,M+1);
    State.x=zeros(M,5);State.goal=zeros(M,2);
    
   % eps-greedy
    Const.eps=0.5;
    % �˻�ϵ��
    Const.anneal=0.95;
    % ��������С��batch��С
    Const.BufferSize=50;    Const.BatchSize=10;
    net.opts.batchsize=Const.BatchSize;
    % DQN�е�ѧϰ�ʺ��ۿ���
    Const.alpha=0.8;    Const.gamma=0.95;
    Const.ratio=10000;

    % ��ʼ��������ÿһ�ֵ���ʼ��/Ŀ�����Ϣ
    for m=1:M
        %x=InitialState(Ob);
       % x=[163 364 0 0 0];
       % goal=GoalRandGen(x(1:2),Ob);
       %goal=[662 191];
      % goal=[660 364];
        State.x(m,:)=x;
        State.goal(m,:)=goal;
    end
%}
    % ��ѵ������
   for e=171:E
   % for e=109:E
        tic
        % �˻�
        Const.eps=Const.eps*Const.anneal;
        % ������ʼ��/Ŀ����˳��
        rank=randperm(M);
        % �������������ǰ��һ��
        [StochQmean(e),StochCount(e),StochFail(e),x_traj1{e}]=StochParamGetQmeanGUO(State,Kinematic,rank,Ob,net,Const);
        % ��ʼѧϰ
        [TrainRmean(e,:),TrainCount(e,:),TrainFail(e,:),net]=Train(State,Kinematic,rank,Ob,net,Const);
        % ��ӡ���洢����ѵ�����
        DisplayAndStore(net,StochQmean,StochCount,StochFail,TrainRmean,TrainCount,TrainFail,e,E,rank(1));
        toc
    end
    time=clock();timestr=cell(5);
    for j=2:5
       timestr{j}=['0',num2str(time(j))]; 
       timestr{j}=timestr{j}(end-1:end);
    end
    str=['Data_',timestr{2},timestr{3},'_',timestr{4},timestr{5}];
    save([str,'.mat']);
    figure(6)
    imshow('51.jpg');
    hold on;
    xx=x_traj1{e};
    plot(xx(2,:),xx(1,:),'r','LineWidth',4);legend('��ɫ���������');
    plot(190,435,'c*','markersize',8);text(190,435+20,'�жγ�ʼ��','FontSize',14,'color','r','FontName','Microsoft YaHei');
    plot(689,315,'c*','markersize',8);text(689,315+20,'�����','FontSize',14,'color','r','FontName','Microsoft YaHei');
    text(327,317,'(����������)','FontSize',14,'color','r','FontName','Microsoft YaHei');
    title('�췽�������Ĺ켣');
    set(gca,'FontName','Microsoft YaHei');
    
    hold off;
    
end

function [Qmean,CurCount,FailCount,x_traj]=StochParamGetQmeanGUO(State,Kinematic,rank,Ob,net,Const) %GUO
    x=State.x(rank(1),:);
    goal=State.goal(rank(1),:);
    evalParam=[ones(1,3),1.5];
    evalParam(1:3)=[0.5,rand(),rand()]+0.5;
    [SurOb,~]=PDQN_GetCurSurOb(x,goal,Ob);
    CurCount=0;FailCount=0;Q=0;
     x_traj=[];
     while (1)
         CurCount=CurCount+1;
         % �õ�Agent��ǰ�����
         [~,net,~]=PDQN_AgentOutput(SurOb,net,0);
         Q=Q+1000*max(net.o);
         % ʹ�õ�ǰ�Ĳ������õ���һ��״̬
         [SurOb,~,x,goal,state]=PDQN_Environment(evalParam,Kinematic,x,goal,Ob,Const); 
        % [SurOb,Reward6,x,~,state]=Environment(evalParam,Kinematic,x,goal,Ob,Const); 
        
        xx=[x(2);x(1)];
        x_traj=[x_traj xx];
         if(state==1)
             break;
         end
         if(state==-1)
             FailCount=FailCount+1;
         end
     end
     Qmean=Q/CurCount;
end

function [TrainRmean,TrainCount,TrainFail,net]=Train(State,Kinematic,rank,Ob,net,Const)
    M=length(rank);
    SumCount=0;
    evalParam=[ones(1,3),1.5];
    TrainRmean=zeros(1,M+1);
    TrainCount=zeros(1,M+1);
    TrainFail=zeros(1,M+1);        
    Buffer=cell(1,Const.BufferSize);
    for m=1:M
        % ��ջ�����
        i=0;R=0;
        x=State.x(rank(m),:);
        goal=State.goal(rank(m),:);
        [SurOb,~]=PDQN_GetCurSurOb(x,goal,Ob);
        while(1)
            i=i+1;
            SumCount=SumCount+1;
            % �õ�Agent��ǰ�����
            [evalParam(1:3),net,num]=PDQN_AgentOutput(SurOb,net,Const.eps);
            % ʹ�õ�ǰ�Ĳ������õ���һ��״̬
            [SurObnext,Reward,x,goal,state]=PDQN_Environment(evalParam,Kinematic,x,goal,Ob,Const);
            R=R+Const.ratio*Reward;            
            % ����һ�β����Ĺ��̴��뻺����
            D.s=SurOb;D.a=num;D.r=Reward;D.snext=SurObnext;D.flag=state;
            Buffer{Const.BufferSize-mod(SumCount,Const.BufferSize)}=D;            
            % �ӻ�����ѡ��״̬����������ѧϰ����
            if (SumCount>Const.BufferSize && mod(i,5)==0)
                net=PDQN_AgentLearn(Buffer,net,net.opts,Const);
            end
            SurOb=SurObnext;
            if(state==1)
                break;
            end
            if(state==-1)
                TrainFail(rank(m))=TrainFail(rank(m))+1;
            end                            
        end
        TrainRmean(rank(m))=R;
        TrainCount(rank(m))=i;        
    end
    TrainRmean(end)=mean(TrainRmean(1:end-1));
    TrainCount(end)=sum(TrainCount(1:end-1));
    TrainFail(end)=sum(TrainFail(1:end-1));
end

function []=DisplayAndStore(net,StochQmean,StochCount,StochFail,TrainRmean,TrainCount,TrainFail,e,E,num)
%     �洢��ǰģ��
    time=clock();
    timestr=cell(5);
    for j=2:5
       timestr{j}=['0',num2str(time(j))]; 
       timestr{j}=timestr{j}(end-1:end);
    end
    str=['model_',timestr{2},timestr{3},'_',timestr{4},timestr{5}];
    save(['PDQN_161/Model_160/',str,'.mat'],'net');
    % ��ӡ��ǰ���
    disp([num2str(e),'/',num2str(E),':   ']);
    disp(['StochCount/TrainCount:   ',num2str(StochCount(e)),'/',num2str(TrainCount(e,num))]);
    disp(['StochFail/TrainFail:   ',num2str(StochFail(e)),'/',num2str(TrainFail(e,num))]);
    disp(['StochQmean:',num2str(StochQmean(e)),'   ,','TrainRmean:',num2str(TrainRmean(e,end))]);
    % ��ͼ
    figure(1);clf;
    xl=(1:e);
    subplot(2,1,1);
    plot(xl,StochQmean(1:e),'r'); legend('Average of Qmax');
    axis([171 185 0 20])
    subplot(2,1,2);
    plot(xl,TrainRmean(1:e,end),'r'); legend('Average of R');
     axis([171 185 0 3000])
    drawnow;
    % ��ͼ
    figure(2);clf;
    subplot(2,1,1);
    plot(xl,TrainCount(1:e,end),'r'); legend('Sum of TrainCount');
      axis([171 185 0 200])
    subplot(2,1,2);
    plot(xl,TrainFail(1:e,end),'r'); legend('Sum of TrainFail');
      axis([171 185 0 5])
    drawnow;
end