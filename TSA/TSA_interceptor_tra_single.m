function [T_inter,  X_inter, Y_inter, Z_inter, U_inter, V_inter, W_inter] = TSA_interceptor_tra_single(interceptor)
% »æÖÆÀ¹½ØÆ÷·ÉÐÐ¹ì¼£
tic;
if interceptor == 0
    interceptor = 'TSA_Interceptor_data.txt';
else if isempty(interceptor)
    interceptor = 'TSA_Interceptor_data.txt';
    end
end

internum = 1;
for i = 1:internum
    [ X0_inter, Y0_inter, Z0_inter, m0_inter, mf_inter, Thmag0_inter, theta_inter, phi_inter, Tburn_inter ] = read_input( interceptor, i );
    [ T_inter{i}, X_inter{i}, Y_inter{i}, Z_inter{i}, U_inter{i}, V_inter{i}, W_inter{i} ] = TSA_interceptor( X0_inter, Y0_inter, Z0_inter, m0_inter, mf_inter, Thmag0_inter, theta_inter, phi_inter, Tburn_inter ); 
end
figure(4); 
hold on;
load('TSA_terrain.mat');
surf(x_terrain/1000, y_terrain/1000, h_terrain/1000); 
shading interp; 

flag = 1;     %flag = 1,ÎªÓÐÀ¹½ØÆ÷¡£flag = 0 ÎÞÀ¹½ØÆ÷
if flag == 1
    for i = 1:internum
        x_targetI = X_inter{i}(end); 
        y_targetI = Y_inter{i}(end);
        h_targetI = interp2(x_terrain, y_terrain, h_terrain, x_targetI, y_targetI);
        plot3(x_targetI/1000, y_targetI/1000, h_targetI/1000,'ro','MarkerSize', 10, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'y');
        MI1 = plot3(X_inter{i}/1000,Y_inter{i}/1000,Z_inter{i}/1000,'LineWidth',2,'color','b');
    end
end
view(3);       grid on; 
xlabel('x'); ylabel('y'); zlabel('z');
title('À¶·½·ÉÐÐÆ÷·ÉÐÐ¹ì¼£');
set(gca,'FontName','Microsoft YaHei');
% hold off;
t = toc;
fprintf('»æÖÆÀ¶·½À¹½ØÆ÷·ÉÐÐ¹ì¼£Ê±¼ä£º%fÃë\n',t);
end

