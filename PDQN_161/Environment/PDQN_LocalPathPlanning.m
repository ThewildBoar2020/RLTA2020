function [x,traj]=PDQN_LocalPathPlanning(Ob,goal,x,Kinematic,evalParam,Rmax)
    % DWA��������,[u(vt,ot),traj(�켣)]
    [u,traj]=DynamicWindowApproach(x,Kinematic,goal,evalParam,Ob,Rmax);
    % �������ƶ�����һ��ʱ��
    x=f(x,u);
end

function [u,trajDB]=DynamicWindowApproach(x,model,goal,evalParam,ob,R) %  model =Kinematic
    % Dynamic Window [vmin,vmax,wmin,wmax]
    Vr=CalcDynamicWindow(x,model);
    % ���ۺ����ļ���
    [evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam);
    if isempty(evalDB)
        disp('no path to goal!!');
        u=[0;0];return;
    end
    % �����ۺ�������
    evalDB=NormalizeEval(evalDB,R,model(1));
    % �������ۺ����ļ���
    % feval=[];
    feval=zeros(1,length(evalDB(:,1)));
    for id=1:length(evalDB(:,1))
    %     feval=[feval;evalParam(1:3)*evalDB(id,3:5)'];
        feval(id)=evalParam(1:3)*evalDB(id,3:5)';
    end
    % evalDB=[evalDB feval];
    [~,ind]=max(feval);% �������ۺ���
%     trajBest=trajDB(ind,:);
    u=evalDB(ind,1:2)';%
end

function [evalDB,trajDB]=Evaluation(x,Vr,goal,ob,R,model,evalParam)
    evalDB=[];  trajDB=[];
    for vt=Vr(1):model(5):Vr(2)
        for ot=Vr(3):model(6):Vr(4)
            % �켣�Ʋ�; �õ� xt: ��������ǰ�˶����Ԥ��λ��; traj: ��ǰʱ�� �� Ԥ��ʱ��֮��Ĺ켣
            [xt,traj]=GenerateTrajectory(x,vt,ot,evalParam(4),model);  %evalParam(4),ǰ��ģ��ʱ��;
            if ~isempty(traj)
                % �����ۺ����ļ���
                heading=CalcHeadingEval(xt,goal);
                dist=CalcDistEval(xt,ob,R);
                vel=abs(vt);
                % �ƶ�����ļ���
                stopDist=CalcBreakingDist(vel,model);
                if dist>stopDist  %
                    evalDB=[evalDB;[vt ot heading dist vel]];
                    trajDB=[trajDB;traj]; % traj = [x,y,yaw,u,w]'
                end
            end
        end
    end
end

function EvalDB=NormalizeEval(EvalDB,Rmax,velmax)
    % ���ۺ�������
    if sum(EvalDB(:,3))~=0
        EvalDB(:,3)=EvalDB(:,3)/sum(EvalDB(:,3));
    end
    if sum(EvalDB(:,4))~=0
        EvalDB(:,4)=EvalDB(:,4)/sum(EvalDB(:,4));
    end
    if sum(EvalDB(:,5))~=0
        EvalDB(:,5)=EvalDB(:,5)/sum(EvalDB(:,5));
    end
%     EvalDB(:,3)=EvalDB(:,3)./180;
%     EvalDB(:,4)=(EvalDB(:,4)-1)./(Rmax-1);
%     EvalDB(:,5)=EvalDB(:,5)./velmax;
end

function [x,traj]=GenerateTrajectory(x,vt,ot,evaldt,model)
    % �켣���ɺ���
    % evaldt��ǰ��ģ��ʱ��; vt��ot��ǰ�ٶȺͽ��ٶ�;
    global dt;
    time=0;
    u=[vt;ot];% ����ֵ
    traj=x';% �����˹켣
    while time<=evaldt
        time=time+dt;% ʱ�����
        x=f(x,u);% �˶�����
        if(x(1)>800||x(1)<0||x(2)>600||x(2)<0)
            traj=[];
            break;
        end
        traj=[traj x'];
    end
end

function stopDist=CalcBreakingDist(vel,model)
    % �����˶�ѧģ�ͼ����ƶ�����,����ƶ����벢û�п�����ת�ٶȣ�����ȷ�ɣ�����
    global dt;
    stopDist=0;
    while vel>0
        stopDist=stopDist+vel*dt;% �ƶ�����ļ���
        vel=vel-model(3)*dt;%
    end
end

function dist=CalcDistEval(state,Ob,R)
    % �ϰ���������ۺ���
    x=state(2);    y=state(1);
    dist=R;    dlimit=R;
    xmin=max(1,round(x-dlimit));
    xmax=min(600,round(x+dlimit));
    ymin=max(1,round(y-dlimit));
    ymax=min(800,round(y+dlimit));
    for i=xmin:1:xmax
        for j=ymin:1:ymax
            if (Ob(i,j))
                dist=min(dist,sqrt((x-i)^2+(y-j)^2));
            end
        end
    end
%     AroundOb=Ob(xmin:xmax,ymin:ymax);
%     for dist=1:1:R
%         xmin=max(1,round(x-dist));
%         xmax=min(800,round(x+dist));
%         ymin=max(1,round(y-dist));
%         ymax=max(600,round(y+dist));
%         AroundOb=Ob(xmin:xmax,ymin:ymax);
%         if(sum(sum(AroundOb)))
%             break;
%         end
%     end
end

function heading=CalcHeadingEval(x,goal)
% heading�����ۺ�������
    theta=mod(toDegree(x(3)),270);% �����˳���
    goalTheta=mod(toDegree(atan2(goal(2)-x(2),goal(1)-x(1))),270);% Ŀ���ķ�λ
    mint=min(theta,goalTheta);
    maxt=max(theta,goalTheta);
    targetTheta=min(maxt-mint,mint+270-maxt);
%     if goalTheta>theta
%         targetTheta=goalTheta-theta;% [deg]
%     else
%         targetTheta=theta-goalTheta;% [deg]
%     end
    heading=180-targetTheta;
end

function Vr=CalcDynamicWindow(x,model)
    %
    global dt;
    % �����ٶȵ������С��Χ
    Vs=[0 model(1) -model(2) model(2)];
    % ���ݵ�ǰ�ٶ��Լ����ٶ����Ƽ���Ķ�̬����
    Vd=[x(4)-model(3)*dt x(4)+model(3)*dt x(5)-model(4)*dt x(5)+model(4)*dt];
    % ���յ�Dynamic Window
    Vtmp=[Vs;Vd];
    Vr=[max(Vtmp(:,1)) min(Vtmp(:,2)) max(Vtmp(:,3)) min(Vtmp(:,4))];
end

function x = f(x, u)
    % Motion Model
    % u = [vt; wt];��ǰʱ�̵��ٶȡ����ٶ�
    global dt;
    F = [1 0 0 0 0;0 1 0 0 0;0 0 1 0 0;0 0 0 0 0;0 0 0 0 0];
    B = [dt*cos(x(3)),0;dt*sin(x(3)),0;0,dt;1,0;0,1];
    x= F*x'+B*u;
    x=x';
end

function radian = toRadian(degree)
    % degree to radian
    radian = degree/180*pi;
end

function degree = toDegree(radian)
    % radian to degree
    degree = radian/pi*180;
end