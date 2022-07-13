function  [Th_x, Th_y, Th_z]= TSA_double_thrust(t, Thmag0, theta, phi, Tburn, u, v, w)
F = 500000;
if t == 0
    Th_x = Thmag0*cosd(theta)*sind(phi);
    Th_y = Thmag0*sind(theta)*sind(phi);
    Th_z = Thmag0*cosd(phi);
elseif t > 10.165 && t<= 10.265
    Th_x = -F*w/sqrt(u^2+v^2+w^2);
    Th_y = 0;
    Th_z = F*u/sqrt(u^2+v^2+w^2);
elseif t > 0 && t <= Tburn
    Th_x = Thmag0*u/sqrt(u^2+v^2+w^2);
    Th_y = Thmag0*v/sqrt(u^2+v^2+w^2);
    Th_z = Thmag0*w/sqrt(u^2+v^2+w^2);
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
end

