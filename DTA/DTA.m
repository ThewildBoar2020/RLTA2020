function []=DTA(XMIN,XMAX,YMIN,YMAX,ZMIN,ZMAX,aircraft,task,depth);
% Main test file.  Initializes problem and calls CBBA.
%---------------------------------------------------------------------%
tic;
if isempty(aircraft)
    aircraft = 5;
end
if isempty(task)
    task = 5;
end
if isempty(XMIN)
    XMIN = -30;
end
if isempty(XMAX)
    XMAX = 30;
end
if isempty(YMIN)
    YMIN = -30;
end
if isempty(YMAX)
    YMAX = 30;
end
if isempty(ZMIN)
    ZMIN = -2;
end
if isempty(ZMAX)
    ZMAX = -12;
end
if isempty(depth)
    depth = 3;
end
    
% Clear environment
%close all; clear all;
addpath(genpath(cd));
% profile on
%%
%%
% 
SEED = 1;
rand('seed', SEED);

%---------------------------------------------------------------------%
% Initialize global variables
%---------------------------------------------------------------------%

WORLD.CLR  = rand(100,3);

WORLD.XMIN = XMIN;
WORLD.XMAX = XMAX;
WORLD.YMIN = YMIN;
WORLD.YMAX = YMAX;
WORLD.ZMIN = ZMIN;
WORLD.ZMAX = ZMAX;
WORLD.MAX_DISTANCE = sqrt((WORLD.XMAX - WORLD.XMIN)^2 + ...
                          (WORLD.YMAX - WORLD.YMIN)^2 + ...
                          (WORLD.ZMAX - WORLD.ZMIN)^2);
 
%---------------------------------------------------------------------%
% Define agents and tasks
%---------------------------------------------------------------------%
% Grab agent and task types from CBBA Parameter definitions
DTA_Params = DTA_Init(0,0,depth);

% Initialize possible agent fields
agent_default.id    = 0;            % agent id
agent_default.type  = 0;            % agent type
agent_default.avail = 0;            % agent availability (expected time in sec)
agent_default.clr = [];             % for plotting

agent_default.x       = 0;          % agent position (meters)
agent_default.y       = 0;          % agent position (meters)
agent_default.z       = 0;          % agent position (meters)
agent_default.nom_vel = 0;          % agent cruise velocity (m/s)
agent_default.fuel    = 0;          % agent fuel penalty (per meter)

% FOR USER TO DO:  Set agent fields for specialized agents, for example:
% agent_default.util = 0;

% Initialize possible task fields
task_default.id       = 0;          % task id
task_default.type     = 0;          % task type
task_default.value    = 0;          % task reward
task_default.start    = 0;          % task start time (sec)
task_default.end      = 0;          % task expiry time (sec)
task_default.duration = 0;          % task default duration (sec)
task_default.lambda   = 0.3;        % task exponential discount

task_default.x        = 0;          % task position (meters)
task_default.y        = 0;          % task position (meters)
task_default.z        = 0;          % task position (meters)

% FOR USER TO DO:  Set task fields for specialized tasks

%---------------------------%

% Create some default agents

% QUAD
agent_quad          = agent_default;
agent_quad.type     = DTA_Params.AGENT_TYPES.QUAD; % agent type
agent_quad.nom_vel  = 5;         % agent cruise velocity (m/s)
agent_quad.fuel     = 1;         % agent fuel penalty (per meter)

% CAR
agent_car           = agent_default;
agent_car.type      = DTA_Params.AGENT_TYPES.CAR;  % agent type
agent_car.nom_vel   = 8;         % agent cruise velocity (m/s)
agent_car.fuel      = 1;         % agent fuel penalty (per meter)

% DD
agent_dd          = agent_default;
agent_dd.type     = DTA_Params.AGENT_TYPES.DD; % agent type
agent_dd.nom_vel  = 4;         % agent cruise velocity (m/s)
agent_dd.fuel     = 1;         % agent fuel penalty (per meter)

% BB
agent_bb          = agent_default;
agent_bb.type     = DTA_Params.AGENT_TYPES.BB; % agent type
agent_bb.nom_vel  = 8;         % agent cruise velocity (m/s)
agent_bb.fuel     = 1;         % agent fuel penalty (per meter)

% CC
agent_cc         = agent_default;
agent_cc.type     = DTA_Params.AGENT_TYPES.CC; % agent type
agent_cc.nom_vel  = 7;         % agent cruise velocity (m/s)
agent_cc.fuel     = 1;         % agent fuel penalty (per meter)

% Create some default tasks

% Track
task_track          = task_default;
task_track.type     = DTA_Params.TASK_TYPES.TRACK;      % task type
task_track.value    = 500;    % task reward
task_track.start    = 0;      % task start time (sec)
task_track.end      = 100;    % task expiry time (sec)
task_track.duration = 600;      % task default duration (sec)

% Rescue
task_rescue          = task_default;
task_rescue.type     = DTA_Params.TASK_TYPES.RESCUE;      % task type
task_rescue.value    = 500;    % task reward
task_rescue.start    = 0;      % task start time (sec)
task_rescue.end      = 300;    % task expiry time (sec)
task_rescue.duration = 600;     % task default duration (sec)

% Track
task_zz          = task_default;
task_zz.type     = DTA_Params.TASK_TYPES.ZZ;      % task type
task_zz.value    = 500;    % task reward
task_zz.start    = 0;      % task start time (sec)
task_zz.end      = 100;    % task expiry time (sec)
task_zz.duration = 600;      % task default duration (sec)

% XX
task_xx          = task_default;
task_xx.type     = DTA_Params.TASK_TYPES.XX;      % task type
task_xx.value    = 500;    % task reward
task_xx.start    = 0;      % task start time (sec)
task_xx.end      = 300;    % task expiry time (sec)
task_xx.duration = 600;      % task default duration (sec)

% YY
task_yy          = task_default;
task_yy.type     = DTA_Params.TASK_TYPES.ZZ;      % task type
task_yy.value    = 500;    % task reward
task_yy.start    = 0;      % task start time (sec)
task_yy.end      = 200;    % task expiry time (sec)
task_yy.duration = 300;      % task default duration (sec)


%---------------------------------------------------------------------%
% Define sample scenario
%---------------------------------------------------------------------%

N = aircraft;      % # of agents
M = task;     % # of tasks

% Create random agents
for n=1:N,
    if(n/N <= 0.2),agents(n) = agent_quad;
    elseif(0.2<n/N <= 0.4),agents(n) = agent_car;
    elseif(0.4<n/N <= 0.6),agents(n) = agent_bb;
    elseif(0.6<n/N <= 0.8),agents(n) = agent_cc;
    else agents(n) = agent_dd;
    end

    % Init remaining agent params
    agents(n).id   = n;
    agents(n).x    = rand(1)*(WORLD.XMAX - WORLD.XMIN) + WORLD.XMIN+2;%Vidima tak: Generate values from the uniform distribution on the interval [a, b]: r = a + (b-a).*rand(100,1);
    agents(n).y    = rand(1)*(WORLD.YMAX - WORLD.YMIN) + WORLD.YMIN;
    agents(n).z    = -10;
    agents(n).clr  = WORLD.CLR(n,:);
end
 
% Create random tasks
for m=1:M,
    if(m/M <= 0.1),tasks(m) = task_track;
    elseif(0.1<m/M <= 0.2),tasks(m) = task_rescue;
    elseif(0.2<m/M <= 0.6),tasks(m) = task_xx;
    elseif(0.6<m/M <= 0.8),tasks(m) = task_yy;
    else tasks(m) = task_zz;
    end
    tasks(m).id       = m;
    tasks(m).start    = rand(1)*1009;
    tasks(m).end      = tasks(m).start + 1*tasks(m).duration;
    tasks(m).x        = rand(1)*(WORLD.XMAX - WORLD.XMIN) + WORLD.XMIN;
    tasks(m).y        = rand(1)*(WORLD.YMAX - WORLD.YMIN) + WORLD.YMIN;
    tasks(m).z        = rand(1)*(WORLD.ZMAX - WORLD.ZMIN) + WORLD.ZMIN;
end
 %---------------------------------------------------------------------%
% Initialize communication graph and diameter
%----------------------------------------------------------------------%

% Fully connected graph
Graph = ~eye(N);

%---------------------------------------------------------------------%
% Run CBBA
%---------------------------------------------------------------------%
tic
[DTA_Assignments Total_Score] =DTA_Main(agents, tasks, Graph, depth)
toc
PlotAssignments(WORLD, DTA_Assignments, agents, tasks, 1);
figure(1),title(sprintf('TotalScore: %1.3f' ,Total_Score))


% profile off
% profile report
t = toc;
fprintf('任务分配结果时间：%f秒\n',t);
end