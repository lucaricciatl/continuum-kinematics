function T = T_curve_angles_forsym_pw(x)
    %   l -> ascissa [l]
    %   k -> parametro curvatura su xz [rad/l]
    %   b -> parametro curvatura su yz [rad/l]
    %   t -> parametro torsione assiale z [rad/l]

    %   theta -> angolo di curvatura [rad]
    %   phi -> angolo di bending [rad]
    %   psi -> angolo torsione assiale z [rad]

    
    l = x(1) ;
    theta = x(2) ;
    phi = x(3) ;
    psi = x(4) ;
    
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

    T14_std= l / theta * cp * ( ct - 1 ) ;
    T24_std= l / theta * sp * ( ct - 1 ) ;
    T34_std= l / theta * st ;
    
    T14_sing =  - ( l * theta * cp) / 2  ;
    T24_sing =  (l * theta * sp) / 2 ;
    T34_sing = l - (l * theta^2) / 6  ;
    
    T14 = piecewise(abs(theta) >  10^-2 , T14_std , ...
                    abs(theta) <= 10^-2 , T14_sing ) ;
    T24 = piecewise(abs(theta) >  10^-2 , T24_std , ...
                    abs(theta) <= 10^-2 ,  T24_sing ) ;
    T34 = piecewise(abs(theta) > 10^-2  , T34_std , ...
                    abs(theta) <= 10^-2 , T34_sing ) ;

    T = [ T11 , T12 , T13 , T14 ;
          T21 , T22 , T23 , T24 ;
          T31 , T32, T33  , T34 ;
          0 , 0 , 0 , 1 ];
    
    T =  T * Tz(psi) ; 
end

