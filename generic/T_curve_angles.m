function T =  T_curve_angles(x)
    %   l -> ascissa [l]
    %   k -> parametro curvatura su xz [rad/l]
    %   b -> parametro curvatura su yz [rad/l]
    %   t -> parametro torsione assiale z [rad/l]

    %   theta -> angolo di curvatura [rad]
    %   phi -> angolo di bending [rad]
    %   psi -> angolo torsione assiale z [rad]
    l = x(1) ;
    theta = l * x(2)  ;
    phi = x(3) ;
    psi = l * x(4) ;

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
    
    if theta > 10^-6
        
        T14 = l / theta * cp * (ct - 1 ) ;
        T24 = l / theta * sp * ( ct - 1 ) ;
        T34 = l / theta * st ;
 
    elseif theta <= 10^-6
    
        T14 = 0 ;
        T24 = 0 ;
        T34 = l  ;

    end
    
    T = [ T11 , T12 , T13 , T14 ;
          T21 , T22 , T23 , T24 ;
          T31 , T32, T33 , T34 ;
          0 , 0 , 0 , 1 ];
    
    T =  T * Tz(psi) ; 
    
end

