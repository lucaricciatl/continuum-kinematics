function T = T_dh(x)
%T_DH Summary of this function goes here
%   Detailed explanation goes here
    d= x(1) ;
    theta = x(2) ;
    r = x(3) ;
    alpha = x(4) ;
    st = sin(theta) ;
    ct = cos(theta);
    sa = sin(alpha);
    ca = cos(alpha) ;
    T = [ct ,-st*ca, st*sa ,r*ct;
        st ,ct*ca ,-ct*sa ,r*st;
        0 ,sa ,ca   ,d;
        0 0 0 1];

end

