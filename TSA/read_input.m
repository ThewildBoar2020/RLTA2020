function [ X0, Y0, Z0, m0, mf, Thmag0, theta, phi, Tburn ] = read_input( input_filename, M_id )
%This function reads the parameters stored in the a text file
%call format: [ X0, Y0, Z0, m0, mf, Thmag0, theta, phi, Tburn ] = read_input( input_filename, M_id )
%
%the file name will be missile_data.txt
% This file will pull all the relevant information needed for the function
% missile.m to operate
%It will give a unique set of parameters for each missile ID

missilestuff = importdata(input_filename,'\t',7);
[r,c] = size([missilestuff.data]);

if (M_id <= 0) || (M_id > r)
    X0 = NaN;
    Y0 = NaN;
    Z0 = NaN;
    m0 = NaN;
    mf = NaN;
    Thmag0 = NaN;
    theta = NaN;
    phi = NaN;
    Tburn = NaN;
    disp('Error: invalid Missile ID')
else
    X0 = missilestuff.data(M_id,2);
    Y0 = missilestuff.data(M_id,3);
    Z0 = missilestuff.data(M_id,4);
    m0 = missilestuff.data(M_id,5);
    mf = missilestuff.data(M_id,6);
    Thmag0 = missilestuff.data(M_id,7);
    theta = missilestuff.data(M_id,8);
    phi = missilestuff.data(M_id,9);
    Tburn = missilestuff.data(M_id,10);
end


end
