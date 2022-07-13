
% Initialize CBBA Parameters
%---------------------------------------------------------------------%

function DTA_Params = DTA_Init(N,M,depth)

% Define CBBA Constants
DTA_Params.N            = N;        % number of agents
DTA_Params.M            = M;        % number of tasks
DTA_Params.MAX_DEPTH    = depth;        % maximum bundle depth (remember to set it for each scenario) (tipa skoka zadach moget vypolnit kagduiy UAV)

% FOR USER TO DO:  Add specialized agent types and task types

% List agent types 
DTA_Params.AGENT_TYPES.QUAD   = 1;
DTA_Params.AGENT_TYPES.CAR    = 2;
DTA_Params.AGENT_TYPES.BB   = 3;
DTA_Params.AGENT_TYPES.CC   =4;
DTA_Params.AGENT_TYPES.DD   = 5;


% List task types
DTA_Params.TASK_TYPES.TRACK   = 1;
DTA_Params.TASK_TYPES.RESCUE  = 2;
DTA_Params.TASK_TYPES.XX = 3;
DTA_Params.TASK_TYPES.YY = 4;
DTA_Params.TASK_TYPES.ZZ =5;

% Initialize Compatibility Matrix 
DTA_Params.CM = zeros(length(fieldnames(DTA_Params.AGENT_TYPES)), ...
                       length(fieldnames(DTA_Params.TASK_TYPES)));

% FOR USER TO DO: Set agent-task pairs (which types of agents can do which types of tasks)
DTA_Params.CM(DTA_Params.AGENT_TYPES.QUAD, DTA_Params.TASK_TYPES.TRACK)  = 1;
DTA_Params.CM(DTA_Params.AGENT_TYPES.CAR,  DTA_Params.TASK_TYPES.RESCUE) = 1;
DTA_Params.CM(DTA_Params.AGENT_TYPES.BB,  DTA_Params.TASK_TYPES.XX) = 1;
DTA_Params.CM(DTA_Params.AGENT_TYPES.CC,  DTA_Params.TASK_TYPES.YY) = 1;
DTA_Params.CM(DTA_Params.AGENT_TYPES.DD,  DTA_Params.TASK_TYPES.ZZ) = 1;

return