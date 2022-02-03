
% Location of the origin
origin = [0,0,0,1]'

% Angle of rotation of the first joint
theta1= 60
% Link lengths
L1 = 700
L2 = 600
% Extension distances
d2 = 250
d3 = 400

rotz(theta1)*transz(L1)*transz(d2)*rotx(-90)*transz(L2)*transz(d3)*origin
x1 = origin
x11 = rotz(theta1)*transz(L1)*origin
x2 = rotz(theta1)*transz(L1)*transz(d2)*origin
x3 = rotz(theta1)*transz(L1)*transz(d2)*rotx(-90)*transz(L2)*origin
x4 = rotz(theta1)*transz(L1)*transz(d2)*rotx(-90)*transz(L2)*transz(d3)*origin
X = [x1(1),x11(1),x2(1),x3(1),x4(1)]
Y = [x1(2),x11(2),x2(2),x3(2),x4(2)]
Z = [x1(3),x11(3),x2(3),x3(3),x4(3)]

plot3(X,Y,Z,'-rs','LineWidth',8,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',15)
    
                   hold on
                   