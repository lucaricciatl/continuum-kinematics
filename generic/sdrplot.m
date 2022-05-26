function sdrplot(T)
%SDRPLOT Summary of this function goes here
%   Detailed explanation goes here
hold on

px = T(1,4) ;
py = T(2,4) ;
pz = T(3,4) ;
ax = T(1:3,1) ;
ay = T(1:3,2) ;
az = T(1:3,3) ;
        
    
quiver3(px, py, pz, ax(1) ,ax(2) ,ax(3) , 'Color' , 'red' ) ;
quiver3(px, py, pz, ay(1) ,ay(2) ,ay(3) , 'Color' , 'green' ) ;
quiver3(px, py, pz, az(1) ,az(2) ,az(3) , 'Color' , 'blue' ) ;

scatter3(px,py,pz, 'MarkerEdgeColor','k', 'MarkerFaceColor',[0 0 0])      
end

