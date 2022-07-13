
% Create bundles for each agent
%---------------------------------------------------------------------%

function [DTA_Data, newBid] = DTA_BundleAdd(DTA_Params, DTA_Data, agent, tasks)

epsilon = 10e-6;
newBid  = 0;

% Check if bundle is full
bundleFull = isempty(find(DTA_Data.bundle == -1));

% Initialize feasibility matrix (to keep track of which j locations can be pruned)
feasibility = ones(DTA_Params.M, DTA_Params.MAX_DEPTH+1); 

while(bundleFull == 0)

    % Update task values based on current assignment
    [DTA_Data bestIdxs taskTimes feasibility] = DTA_ComputeBids(DTA_Params, DTA_Data, agent, tasks, feasibility);

    % Determine which assignments are available
      
    D1 = (DTA_Data.bids - DTA_Data.winnerBids > epsilon);
    D2 = (abs(DTA_Data.bids - DTA_Data.winnerBids) <= epsilon);
    D3 = (DTA_Data.agentIndex < DTA_Data.winners);       % Tie-break based on agent index

    D = D1 | (D2 & D3);

    % Select the assignment that will improve the score the most and
    % place bid
    [value bestTask] = max(D.*DTA_Data.bids);

    if( value > 0 )

        % Set new bid flag
        newBid = 1;
        
        % Check for tie
        allvalues = find(D.*DTA_Data.bids == value);
        if(length(allvalues) == 1),
            bestTask = allvalues;
        else
            % Tie-break by which task starts first
            earliest = realmax;
            for i=1:length(allvalues),
                if ( tasks(allvalues(i)).start < earliest),
                    earliest = tasks(allvalues(i)).start;
                    bestTask = allvalues(i);
                end
            end
        end

        DTA_Data.winners(bestTask)    = DTA_Data.agentIndex;
        DTA_Data.winnerBids(bestTask) = DTA_Data.bids(bestTask);

        DTA_Data.path          = DTA_InsertInList(DTA_Data.path, bestTask, bestIdxs(1,bestTask));
        DTA_Data.times         = DTA_InsertInList(DTA_Data.times, taskTimes(1,bestTask), bestIdxs(1,bestTask));
        DTA_Data.scores        = DTA_InsertInList(DTA_Data.scores, DTA_Data.bids(bestTask), bestIdxs(1,bestTask));
        len                     = length(find(DTA_Data.bundle > -1));
        DTA_Data.bundle(len+1) = bestTask;
        
        
        % Update feasibility

        for i = 1:DTA_Params.M
            feasibility(i,:) = DTA_InsertInList(feasibility(i,:), feasibility(i,bestIdxs(1,bestTask)), bestIdxs(1,bestTask));
        end

    else
        % disp('Value is zero, breaking');
        break;
    end

    % Check if bundle is full
    bundleFull = isempty(find(DTA_Data.bundle == -1));
end


return