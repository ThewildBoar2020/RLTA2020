function [Th_x, Th_y, Th_z] = TSA_thrust(t, Thmag0, theta, phi, Tburn, u, v, w)
% THRUST returns the time-dependent thrust needed to propel the missile.
% At initial time, the thrust points in the launch direction.
% During flight, the thrust diretion is tangential to the missile
% trajectory.
% Inputs (all scalars) are time, initial thrust magnitude, theta, phi, 
%   burn time and velocity components.
% Outputs (all scalars) are three components of the thrust.
% Call format: 
%   [Th_x, Th_y, Th_z] = thrust(t, Thmag0, theta, phi, Tburn, u, v, w)

if t == 0
    Th_x = Thmag0*cosd(theta)*sind(phi);
    Th_y = Thmag0*sind(theta)*sind(phi);
    Th_z = Thmag0*cosd(phi);
elseif t > 0 && t <= Tburn
    Th_x = Thmag0*u/sqrt(u^2+v^2+w^2);
    Th_y = Thmag0*v/sqrt(u^2+v^2+w^2);
    Th_z = Thmag0*w/sqrt(u^2+v^2+w^2);
% elseif t > 11.11 && t<= 13
%     Th_x = -Thmag0*u/sqrt(u^2+v^2+w^2);
%     Th_y = -Thmag0*v/sqrt(u^2+v^2+w^2);
%     Th_z = -Thmag0*w/sqrt(u^2+v^2+w^2);
elseif t > Tburn
    Th_x = 0;
    Th_y = 0;
    Th_z = 0;
else
    disp('Error in computing thrust components in thrust');
    Th_x = NaN;
    Th_y = NaN;
    Th_z = NaN;
end
    end % function thrust