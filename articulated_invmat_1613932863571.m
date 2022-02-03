
% Inverse Kinematics of a Planar Arm using matrix inverse
origin = [0,0,0,1]'
L1 = 150
L2 = 400
L3 = 300


P = [650,200,250,1]'
Px = P(1);
Py = P(2);
Pz = P(3);

theta1 = atand(Py/Px)

T01 = [cosd(theta1),0,sind(theta1),0;sind(theta1),0,-cosd(theta1),0;0,1,0,L1;0,0,0,1]

T01_inv = inv(T01)

P1 = T01_inv*P

P1x = P1(1)
P1y = P1(2)

alpha = atand(P1y/P1x)
R = sqrt(P1x*P1x + P1y*P1y)

theta2 = acosd((P1x*P1x + P1y*P1y + L2*L2 - L3*L3)/(2*L2*R))+ alpha

theta3 = -acosd((P1x*P1x + P1y*P1y - L2*L2 - L3*L3)/(2*L2*L3))

P = [rotz(theta1)*transz(L1)*rotx(90)]*[rotz(theta2)*transx(L2)]*[rotz(theta3)*transx(L3)*rotz(90)*rotx(90)]*origin

x1 = origin
x2 = rotz(theta1)*transz(L1)*rotx(90)*origin
x3 = [rotz(theta1)*transz(L1)*rotx(90)]*[rotz(theta2)*transx(L2)]*origin
x4 = [rotz(theta1)*transz(L1)*rotx(90)]*[rotz(theta2)*transx(L2)]*[rotz(theta3)*transx(L3)*rotz(90)*rotx(90)]*origin
X = [x1(1),x2(1),x3(1),x4(1)]
Y = [x1(2),x2(2),x3(2),x4(2)]
Z = [x1(3),x2(3),x3(3),x4(3)]
plot3(X,Y,Z,'-rs','LineWidth',8,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',15)
    
                   hold on