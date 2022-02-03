function [f] = rotz(x)

rotz_mat = [cosd(x),-sind(x),0,0;sind(x),cosd(x),0,0;0,0,1,0;0,0,0,1]

f = rotz_mat;

