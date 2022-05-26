function Tz = Tz(alpha)
%TX Summary of this function goes here
%   Detailed explanation goes here
    ca = cos(alpha) ;
    sa = sin(alpha) ;
    Tz = [ca , - sa , 0 , 0; 
          sa , ca , 0 , 0;
          0 , 0 , 1 , 0;
          0 , 0 , 0 , 1];
end

