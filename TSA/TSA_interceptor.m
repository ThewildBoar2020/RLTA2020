function [ T, X, Y, Z, U, V, W ] = TSA_interceptor( X0, Y0, Z0, m0, mf, Thmag0, theta, phi, Tburn )
%This function solves the equations 2 for the missile trajectory from a given set of initial conditions. 
%The input values are:
%     Xo = initial x position
%     Yo = initial y position
%     Zo = initial z position
%     mo = initial mass
%     mf = landing mass
%     Thmago = initial thrust magnitude
%     theta = launch angle 1
%     phi = launch angle 2
%     Tburn = burn time of missile
%     
%     All inputs must be scalars, the outputs are vectors. 
global g
load('TSA_terrain.mat')

%Constants
dt = .005;
ro = 1.2;
r = .2;
A = pi*r^2;
g = 9.81;

%Starting Values
T(1) = 0;
U(1) = 0;
V(1) = 0;
W(1) = 0;
X(1) = X0;
Y(1) = Y0;
Z(1) = Z0;
m(1) = m0;
n = 1;

%Equations
while (Z(n) >= (interp2(x_terrain,y_terrain,h_terrain,X(end),Y(end)))) || (n == 1)  
   Vmag = sqrt(U(n)^2 + V(n)^2 + W(n)^2);
   [Cd(n)] = TSA_drag_coeff(Vmag);
   [m(n)] = TSA_mass(T(n), m0, mf, Tburn);
   [Th_x(n), Th_y(n), Th_z(n)] = TSA_thrust(T(n), Thmag0, theta, phi, Tburn, U(n), V(n), W(n)); 

   U(n+1) = U(n) + ((Th_x(n)/m(n)) - Cd(n)*((ro*A)/(2*m(n)))*U(n)*Vmag)*dt;
   V(n+1) = V(n) + ((Th_y(n)/m(n)) - Cd(n)*((ro*A)/(2*m(n)))*V(n)*Vmag)*dt;
   W(n+1) = W(n) + ((Th_z(n)/m(n)) - Cd(n)*((ro*A)/(2*m(n)))*W(n)*Vmag - g)*dt;
   X(n+1) = X(n) + U(n+1)*dt;
   Y(n+1) = Y(n) + V(n+1)*dt;
   Z(n+1) = Z(n) + W(n+1)*dt;
   T(n+1) = T(n) + dt;
   n = n+1;
end
end

