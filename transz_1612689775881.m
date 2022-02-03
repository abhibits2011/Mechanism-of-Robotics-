function [f] = transz(x)


trans_mat = [1,0,0,0;0,1,0,0;0,0,1,x;0,0,0,1]


f = trans_mat

