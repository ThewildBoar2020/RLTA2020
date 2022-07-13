
% Main CBBA bundle building/updating (runs on each individual agent)
%---------------------------------------------------------------------%

function [DTA_Data newBid] = DTA_Bundle(DTA_Params, DTA_Data, agent, tasks)

% Update bundles after messaging to drop tasks that are outbid
DTA_Data = DTA_BundleRemove(DTA_Params, DTA_Data);

% Bid on new tasks and add them to the bundle
[DTA_Data, newBid] = DTA_BundleAdd(DTA_Params, DTA_Data, agent, tasks);

return
