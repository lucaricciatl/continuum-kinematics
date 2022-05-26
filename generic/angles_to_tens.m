function tens = angles_to_tens(angles)
    theta = angles(1) ;
    phi = angles(2) ;
    psi = angles(3) ;
    

    k = theta * sin(phi) ;
    b = theta * cos(phi) ;
    t = psi ;
    
    tens = [k b t] ;
    
end

