function angles = tens_to_angles(tens)

    k = tens(1) ;
    b = tens(2) ;
    t = tens(3) ;

    theta = sqrt( k^2 + b^2 ) ;
    phi = atan2(   k , b    ) ;
    psi = t  ;

    angles = [theta phi psi] ;
end 

