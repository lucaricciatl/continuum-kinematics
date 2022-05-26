function Ty = Ty(alpha)
%TX Summary of this function goes here
%   Detailed explanation goes here
    ca = cos(alpha) ;
    sa = sin(alpha) ;
    Ty = [ca , 0 ,  sa , 0 ; 
          0 , 1 , 0 , 0 ; 
          - sa , 0 , ca , 0; 
            0 , 0 , 0 , 1 ] ;
end

