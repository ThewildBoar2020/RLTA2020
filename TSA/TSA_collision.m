function [ ] = TSA_collision(X , Y , Z , X_inter , Y_inter , Z_inter , T, FindTime, safevalue)
%判断DD和拦截器是否交会，以及交会时的时刻距离
t = FindTime;
for i = 1:1
    tindex = t(i)/0.005;
    len1 = length(X{i});
    len2 = length(X_inter{i});
    len = min(len1,len2);
    num = 1;
    mindist = inf;
    for j = 1:len-tindex
        dist(j) = sqrt((X{i}(j+tindex)-X_inter{i}(j)).^2+(Y{i}(j+tindex)-Y_inter{i}(j)).^2+(Z{i}(j+tindex)-Z_inter{i}(j)).^2);
        if dist(j) < mindist
            mindist = dist(j);
        end
        if dist(j)<safevalue
            fprintf('\n拦截器% d:第% d次碰撞：碰撞时刻为:% f\n',i,num,T{i}(j+tindex));
            fprintf('距离为:% f\n',dist(j));
            num = num+1;
            plot3(X{i}(j+tindex)/1000,Y{i}(j+tindex)/1000 ,Z{i}(j+tindex)/1000 ,'ro','MarkerSize', 10, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
            plot3(X_inter{i}(j)/1000,Y_inter{i}(j)/1000 ,Z_inter{i}(j)/1000 ,'ro','MarkerSize', 10, 'MarkerFaceColor', 'r', 'MarkerEdgeColor', 'r');
            break;
        elseif j==len-tindex
            fprintf('\n无碰撞。最近距离为:% f\n',mindist);
        end
    end
end    
end