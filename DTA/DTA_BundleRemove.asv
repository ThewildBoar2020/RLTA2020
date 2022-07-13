
% Update bundles after communication
% For outbid agents, releases tasks from bundles
%---------------------------------------------------------------------%

function DTA_Data = DTA_BundleRemove(DTA_Params, DTA_Data)

outbidForTask = 0;

for j=1:DTA_Params.MAX_DEPTH
    % If bundle(j) < 0, it means that all tasks up to task j are
    % still valid and in paths, the rest (j to MAX_DEPTH) are
    % released
    if( DTA_Data.bundle(j) < 0 )
         disp('Order is negative, breaking');
        break;
    else
        % Test if agent has been outbid for a task.  If it has,
        % release it and all subsequent tasks in its path.
        if( DTA_Data.winners(DTA_Data.bundle(j)) ~= DTA_Data.agentIndex )
            outbidForTask = 1;
        end

        if( outbidForTask )
            % The agent has lost a previous task, release this one too
            if( DTA_Data.winners(DTA_Data.bundle(j)) == DTA_Data.agentIndex )
                % Remove from winner list if in there
                DTA_Data.winners(DTA_Data.bundle(j)) = 0;
                DTA_Data.winnerBids(DTA_Data.bundle(j)) = 0;
            end
            % Clear from path and times vectors and remove from bundle
            idx = find(DTA_Data.path == DTA_Data.bundle(j));
            
            DTA_Data.path   = DTA_RemoveFromList(DTA_Data.path,   idx);
            DTA_Data.times  = DTA_RemoveFromList(DTA_Data.times,  idx);
            DTA_Data.scores = DTA_RemoveFromList(DTA_Data.scores, idx);

            DTA_Data.bundle(j) = -1;
        end
    end
end

end
