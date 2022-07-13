function [ T, X, Y, Z, U, V, W ] = TSA_missile_tra(missile)
% 绘制DD飞行轨迹
ddnum = 1;
for i = 1:ddnum
    [ X0, Y0, Z0, m0, mf, Thmag0, theta, phi, Tburn ] = read_input( missile, i );
    [ T{i}, X{i}, Y{i}, Z{i}, U{i}, V{i}, W{i} ] = TSA_missile( X0, Y0, Z0, m0, mf, Thmag0, theta, phi, Tburn );        
end


%figure(1); 
hold on;
load('TSA_terrain.mat');
surf(x_terrain/1000, y_terrain/1000, h_terrain/1000); 
shading interp; 

for i = 1:ddnum
    x_target = X{i}(end); 
    y_target = Y{i}(end);
    h_target = interp2(x_terrain, y_terrain, h_terrain, x_target, y_target);
    plot3(x_target/1000, y_target/1000, h_target/1000,'ro','MarkerSize', 10, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'c');
    M1 = plot3(X{i}/1000,Y{i}/1000,Z{i}/1000,'LineWidth',2,'color','r');
end
view(3);       grid on; 
xlabel('x (km)'); ylabel('y (km)'); zlabel('z (km)');
title('missile on the terrain');
% hold off;

%画出一部分轨迹
% maxz = max(Z{1});
% maxz_index = find(Z{1} == maxz);
% lenz = size(Z{1});
% for i = i:maxz_index
%    z_firsthalf(i) = Z{1}(i);
% end
% for i = maxz_index:lenz(2)
%     z_secondhalf(i) = Z{1}(i);
% end
% [~,index1] = min(abs(z_firsthalf-maxz/2));
% [~,index2] = min(abs(z_secondhalf-maxz/2));
% index = 1;
% for i = index1:index2
%    x0(index) = X{1}(i);
%    y0(index) = Y{1}(i);
%    z0(index) = Z{1}(i);
%    index = index + 1;
% end
% z1 = z0+150;
% z2 = z0-150;
% figure(2);hold on;
% plot3(x0/1000,y0/1000,z0/1000,'LineWidth',1,'color','c');
% plot3(x0/1000,y0/1000,z1/1000,'LineWidth',1,'color','k');
% plot3(x0/1000,y0/1000,z2/1000,'LineWidth',1,'color','k');
% grid on; 
% view(0,0); 
% hold off;
% 
% figure(3);hold on;
% fill([x0,fliplr(x0)],[z1,fliplr(z2)],'k')
% axis off
% saveas(gca,'old.jpg');
% a= imread('old.jpg');
% b= imresize(a,[600 800]);
% imwrite(b,'new.jpg');
% 
% hold off;
% 
% Ob=imread('new.jpg');Ob=Ob(:,:,1);
% %maxv,minv最大最小速度
% speed_index = 1;
% for i = index1:index2
%     speed(speed_index) = sqrt(U{1}(i)^2 + V{1}(i)^2 + W{1}(i)^2);
%     speed_index = speed_index + 1;
% end
% maxv = max(speed);
% minv = min(speed);
% %maxa,mina最大最小加速度
% acceleration =(diff(speed))/0.005;      %速度差/时间=加速度
% maxa = max(acceleration);
% mina = min(acceleration);
end
