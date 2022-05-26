function [phi , theta ,psi] = euler_angles(T)
%EULER_ANGLES Summary of this function goes here
%   Detailed explanation goes here
    R =T(1:3,1:3) ;
    phi = atan2(R(2,3),R(1,3)) ;
    theta = atan2( sqrt(R(1,3)^2+R(1,2)^2),R(3,3)) ;
    psi = atan2(R(3,2),-R(3,3)) ;
end

