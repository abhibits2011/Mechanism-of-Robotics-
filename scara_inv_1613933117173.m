origin = [0,0,0,1]'

P = [650,250,200]
% Variables
%theta1 = 46.6
%theta2 = -59.4
%d3 = 150
%theta4 = 0

% Constants
L1 = 500
L2 = 450
L3 = 350
L23 = 50
L4 = 200

%P = transz(L1)*rotz(theta1)*transx(L2)*transz(L23)*rotz(theta2)*transx(L3)*rotx(180)*transz(d3)*rotz(theta4)*transz(L4)*origin

Px = P(1);
Py = P(2);
Pz = P(3);

d3 = L1+L23-L4-Pz

 C = sqrt(Px*Px + Py*Py)

 alpha = atand(Py/Px)
 
 theta2 = acosd((C*C - L2*L2 - L3*L3)/(2*L2*L3));
 c = 180 - theta2
 
 b = asind(L3*sind(c)/C)
 
 theta1 = alpha + b
 
 theta2 = -acosd((C*C - L2*L2 - L3*L3)/(2*L2*L3))
 