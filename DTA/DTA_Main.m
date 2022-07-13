
% Main CBBA Function
%---------------------------------------------------------------------%

function [DTA_Data Total_Score] = DTA_Main(agents, tasks, Graph, depth)

% Initialize CBBA parameters
DTA_Params = DTA_Init(length(agents),length(tasks), depth);

for n=1:DTA_Params.N,
    DTA_Data(n).agentID          = agents(n).id;
    DTA_Data(n).agentIndex       = n;
    DTA_Data(n).bundle           = -ones(1, DTA_Params.MAX_DEPTH);
    DTA_Data(n).path             = -ones(1, DTA_Params.MAX_DEPTH);
    DTA_Data(n).times            = -ones(1, DTA_Params.MAX_DEPTH);
    DTA_Data(n).scores           = -ones(1, DTA_Params.MAX_DEPTH);
    DTA_Data(n).bids             = zeros(1, DTA_Params.M);
    DTA_Data(n).winners          = zeros(1, DTA_Params.M);
    DTA_Data(n).winnerBids       = zeros(1, DTA_Params.M);
end

% Initialize working variables
T         = 10;                                      % Current iteration
t         = zeros(DTA_Params.N, DTA_Params.N);    % Matrix of time of updates from the current winners
lastTime  = T-1;
doneFlag  = 0;

% Main CBBA loop (runs until convergence)
while(doneFlag == 0)
    
    %---------------------------------------%
    % 1. Communicate
    %---------------------------------------%
    % Perform consensus on winning agents and bid values 
    [DTA_Data t] = DTA_Communicate(DTA_Params, DTA_Data, Graph, t, T);

    %---------------------------------------%
    % 2. Run CBBA bundle building/updating
    %---------------------------------------%
    % Run CBBA on each agent 
    for n=1:DTA_Params.N,

        [DTA_Data(n) newBid] = DTA_Bundle(DTA_Params, DTA_Data(n), agents(n), tasks);

        % Update last time things changed 
        if(newBid),
            lastTime = T;
        end
    end

    %---------------------------------------%
    % 3. Convergence Check
    %---------------------------------------%
    % Determine if the assignment is over (implemented for now, but later
    % this loop will just run forever)
    if(T-lastTime > DTA_Params.N)
        doneFlag   = 1;
    elseif(T-lastTime > 2*DTA_Params.N)
        disp('Algorithm did not converge due to communication trouble');
        doneFlag = 1;
    else
        % Maintain loop
        T = T + 1;
        display(T);
        display(agents(n).x)
    end
end


% Map path and bundle values to actual task indices
for n=1:DTA_Params.N,
    for m=1:DTA_Params.MAX_DEPTH,
        if(DTA_Data(n).bundle(m) == -1),
            break;
        else
            DTA_Data(n).bundle(m) = tasks(DTA_Data(n).bundle(m)).id;
        end
        
        if(DTA_Data(n).path(m) == -1),
            break;
        else
            DTA_Data(n).path(m) = tasks(DTA_Data(n).path(m)).id;
        end
    end
end

% Compute the total score of the CBBA assignment
Total_Score = 0;
 for n=1:DTA_Params.N,
     for m=1:DTA_Params.MAX_DEPTH,
         if DTA_Data(n).scores(m) > -1,
             Total_Score = Total_Score + DTA_Data(n).scores(m);
         else
             break;
         end
     end
 end
