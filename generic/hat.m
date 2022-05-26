function tw_hat = hat(tw)
%HAT compute hat form of a vector
%   if tw is 1x3 the result is a matrix 3x3 composed by angular velocity
%   matrix
%   if tw is a 1x6 the result is a matrix 4x4 composed in the 3x3 part of
%   angular velocity matrix and in the part 4x(1:3)by velocity

    L = length(tw) ;
    
    if L == 3 
    
        ux = tw(1) ;
        uy = tw(2) ;
        uz = tw(3) ;

        tw_hat = [ 0 , -uz , uy ;
                   uz , 0 , -ux ;
                   -uy , ux , 0 ] ; 
    elseif L == 6
        
        vx = tw(1) ;
        vy = tw(2) ;
        vz = tw(3) ;
        ux = tw(4) ;
        uy = tw(5) ;
        uz = tw(6) ;
        
        tw_hat = [ 0 , -uz , uy , vx ;
                   uz , 0 , -ux , vy ;
                   -uy , ux , 0 , vz ;
                   0 , 0 , 0 , 0] ;   
    else 
        error("dimensions must be consistent") ;
        
    end
end

