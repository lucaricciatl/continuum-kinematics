function tw = ni(tw)
%NI compute ni form of a matrix
%   if tw is 3x3 result is a vector 1x3 composed by angular velocity 
%   IF TW IS 4X4 result is a vector 1x6 composed by velocity and angular
%   velocity

    S = size(tw) ;
    S1 = S(1) ;
    S2 = S(2) ;
    
    if S1 == 4 && S2 ==4
    
        vx = tw(1,4) ;
        vy = tw(2,4) ;
        vz = tw(3,4) ;
        ux = tw(3,2) ;
        uy = tw(1,3) ;
        uz = tw(2,1) ;

        tw = [vx ; vy ; vz ; ux ; uy ; uz ] ;
    
    elseif S1 == 3 && S2 == 3
        ux = tw(3,2) ;
        uy = tw(1,3) ;
        uz = tw(2,1) ;    
        
        tw = [ux ; uy ; uz ]    ;
    
    else
        error("dimensions must be consistent") ;
    end
    
end

