origin = [0,0,0,1]'
theta1 = 180
theta2 = 90
theta3 = 90
L1 = 100
L2 = 300
L3 = 300
%T01 = rotz(theta1)*transz(L1)*rotx(90)
%T12 = rotz(theta2)*transx(L2)
%T23 = rotz(theta3)*transx(L3)*rotz(90)*rotx(90)
%P = T01*T12*T23*origin
P = rotz(theta1)*transz(L1)*rotx(90)*rotz(theta2)*transx(L2)*rotz(theta3)*transx(L3)*rotz(90)*rotx(90)*origin

x1 = origin
x2 = rotz(theta1)*transz(L1)*rotx(90)*origin
x3 = rotz(theta1)*transz(L1)*rotx(90)*rotz(theta2)*transx(L2)*origin
x4 = rotz(theta1)*transz(L1)*rotx(90)*rotz(theta2)*transx(L2)*rotz(theta3)*transx(L3)*rotz(90)*rotx(90)*origin
X = [x1(1),x2(1),x3(1),x4(1)]
Y = [x1(2),x2(2),x3(2),x4(2)]
Z = [x1(3),x2(3),x3(3),x4(3)]
plot3(X,Y,Z,'-rs','LineWidth',8,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',15)
    
                   hold on
                   