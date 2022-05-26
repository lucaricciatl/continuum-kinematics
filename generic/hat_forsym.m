function tw_hat = hat_forsym(tw)
        ux = tw(1) ;
        uy = tw(2) ;
        uz = tw(3) ;

        tw_hat = [ 0 , -uz , uy ;
                   uz , 0 , -ux ;
                   -uy , ux , 0 ] ; 
end

