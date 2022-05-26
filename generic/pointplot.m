function pointplot(T)
%SDRPLOT Summary of this function goes here
%   Detailed explanation goes here
hold on

px = T(1,4) ;
py = T(2,4) ;
pz = T(3,4) ;
ax = T(1:3,1) ;
ay = T(1:3,2) ;
az = T(1:3,3) ;


scatter3(px,py,pz, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0 0 0])      
end
