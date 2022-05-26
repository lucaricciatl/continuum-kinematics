function tw = ni_forsym(tw)
        
        vx = tw(1,4) ;
        vy = tw(2,4) ;
        vz = tw(3,4) ;
        ux = tw(3,2) ;
        uy = tw(1,3) ;
        uz = tw(2,1) ;

        tw = [vx ; vy ; vz ; ux ; uy ; uz ] ;
end

