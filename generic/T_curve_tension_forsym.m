function T =  T_curve_tension_forsym(x)
    %   l -> ascissa [l]
    %   k -> parametro curvatura su yz [rad/l]
    %   b -> parametro curvatura su xz [rad/l]
    %   t -> parametro torsione assiale z [rad/l]

    %   theta -> angolo di curvatura [rad]
    %   phi -> angolo di bending [rad]
    %   psi -> angolo torsione assiale z [rad]
    l = x(1) ;
    k = x(2) ;
    b = x(3) ;
    t = x(4) ;
    
    theta = l * sqrt( k^2 + b^2 ) ;
    phi = atan2(   b,k    ) ;
    psi = l * t  ;

    ct = cos(theta);
    st = sin(theta);
    cp = cos(phi);
    sp = sin(phi);

    
    T11 = cp^2 * ( ct - 1 ) + 1 ;
    T12 = sp * cp * ( ct - 1 ) ;
    T13 = - cp * st ;
        
    T21 = sp * cp * ( ct - 1 ) ;
    T22 = cp^2 * ( 1 - ct ) + ct ;
    T23 = - sp * st ;
    
    T31 = cp * st ;
    T32 = sp * st ;
    T33 = ct ;
        
    T14 = l / theta * cp * (ct - 1 ) ;
    T24 = l / theta * sp * ( ct - 1 ) ;
    T34 = l / theta * st ;
    
    T = [ T11 , T12 , T13 , T14 ;
          T21 , T22 , T23 , T24 ;
          T31 , T32, T33 , T34 ;
          0 , 0 , 0 , 1 ];
    
    T =  T * Tz(psi) ; 
    
end

