function J = joint_jacobian(type,T,Tn)
%PRISMATIC_JACOBIAN Summary of this function goes here
%   Detailed explanation goes here
    k = T(1:3,3) ;
    Pn = Tn(1:3,4) ;
    P = T(1:3,4) ;

    if type == 'r'
        Jp = cross(k , Pn-P);
        Jo = k ;
    elseif type == 'p' 
        Jp = k ;
        Jo = zeros(3,1) ;
    end
    [phi,theta,psi] = euler_angles(T);
    T_an = Tz(phi)*Ty(theta)*Tx(psi);
    J = [ Jp ; pinv(T_an(1:3,1:3) ) * Jo  ] ;
end

