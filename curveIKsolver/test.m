clc
clear 

hold on
N1 = 10
N2 = 10
N = [N1,N2]'
q = [0.7,-0.1,-3,0,0.3,0.04]'
l = ones(N1+N2,1) * 1
IKs = curveIKsolver(N,l,q)
IKs.compute_T();
IKs.compute_J();
 IKs.plotkin()


goal = [1,0.5,0.5,0,0,0]';
plot3(goal(1),goal(2),goal(3),'o','Markersize',20,'Color','g','MarkerfaceColor','g')
weights = [1,1,1,0,0,0];
IKs.IK_solve(goal,weights);
T = IKs.T

p = zeros(3,sum(N)*5);
for i = 1 : sum(N)*5
    xi = ni(T(:,:,i));
    p(:,i) = xi(1:3);
end
IKs.plotkin()


p2 =plot3(p(1,:),p(2,:),p(3,:))
p2.LineWidth  = 5;
grid on

xlabel('X') 
ylabel('Y') 
zlabel('Z') 
set(gca,'DataAspectRatio',[1 1 1])


q = IKs.q

