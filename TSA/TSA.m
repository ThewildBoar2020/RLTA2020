function []=TSA(FindTime, safevalue, missile, interceptor)
% clear all;
% close all;
% clc;
tic;
format long;
% name = 'Zachary Pyle';
% id = 'A12601746';
% hw_num = 'project';
% global g
if isempty(FindTime)
    FindTime = 0.05;
end
if isempty(safevalue)
    safevalue = 150;
end
if missile == 0
    missile = 'TSA_missile_data.txt';
else if isempty(missile)
    missile = 'TSA_missile_data.txt';
    end
end

if interceptor == 0
    interceptor = 'TSA_Interceptor_data.txt';
else if isempty(interceptor)
    interceptor = 'TSA_Interceptor_data.txt';
    end
end

figure(5)

[ T, X, Y, Z, U, V, W ] = TSA_missile_tra(missile);          %绘制DD轨迹
[T_inter,  X_inter, Y_inter, Z_inter, U_inter, V_inter, W_inter] = TSA_interceptor_tra(interceptor);      %绘制拦截器轨迹

xlabel('x'); ylabel('y'); zlabel('z');
title('红蓝方交会模拟');
set(gca,'FontName','Microsoft YaHei');
TSA_collision(X,Y,Z,X_inter,Y_inter,Z_inter,T,FindTime,safevalue);

hold off;
%Legend and axis and stuff for figure 1
t = toc;
fprintf('红、蓝双方交会模拟时间：%f秒\n',t);
end


