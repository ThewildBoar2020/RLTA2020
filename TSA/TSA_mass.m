function [m] = TSA_mass(t, m0, mf, Tburn)
% MASS conputes the mass of the missile as a function of time
% Initial mass is m0; after burn time Tburn, the missile has mass mf.
% Call format: [m] = mass(t, m0, mf, Tburn)

if t >= 0 && t <= Tburn 
    m = m0 - ((m0-mf)/Tburn)*t;
elseif t > Tburn
    m = mf;
else
    disp('Error in computing m in mass');
    m = NaN;
end
end % function mass