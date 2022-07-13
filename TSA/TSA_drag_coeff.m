function [Cd] = TSA_drag_coeff(Vmag)
% DRAG_COEFF computes drag coeffcient from the velocity magnitude of the
% missile.
% Call format: [Cd] = drag_coeff(Vmag)

Ma = Vmag/340;

if Ma >= 0 && Ma < 0.9 
    Cd = 0.2;
elseif Ma < 1.1
    Cd = 0.2 + 0.075/0.2*(Ma-0.9);
elseif Ma < 3
    Cd = 0.275 - 0.075/1.9*(Ma-1.1);
elseif Ma > 3
    Cd = 0.2;
else
    disp('Error: Invalid Vmag to compute drag coefficient');
    Cd = NaN;
end 

end % function drag_coeff