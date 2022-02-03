
% Inverse Kinematics of a Planar Arm using matrix inverse
origin = [0,0,0,1]'
L1 = 450
L2 = 500

P = [650,250,0]
Px = P(1);
Py = P(2);
Pz = P(3);

alpha = atand(Py/Px)

R = sqrt(Px*Px + Py*Py)

theta1 = acosd((Px*Px + Py*Py + L1*L1 - L2*L2)/(2*L1*R))+ alpha
theta2 = acosd((Px*Px + Py*Py - L1*L1 - L2*L2)/(2*L1*L2))

P = rotz(theta1)*transx(L1)*rotz(theta2)*transx(L2)*rotz(90)*rotx(90)*origin

x1 = origin
x2 = rotz(theta1)*transx(L1)*origin
x3 = rotz(theta1)*transx(L1)*rotz(theta2)*transx(L2)*rotz(90)*rotx(90)*origin

X = [x1(1),x2(1),x3(1)]
Y = [x1(2),x2(2),x3(2)]
Z = [x1(3),x2(3),x3(3)]
plot(X,Y,'-rs','LineWidth',8,...
                       'MarkerEdgeColor','k',...
                       'MarkerFaceColor','g',...
                       'MarkerSize',15)
    
                   hold on