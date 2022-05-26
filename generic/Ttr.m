function Ttr = Ttr(X)
%TX Summary of this function goes here
%   Detailed explanation goes here
    x = X(1) ; 
    y = X(2) ;
    z = X(3) ;
    Ttr = [1 , 0 , 0 , x ;
           0 , 1 , 0 , y ;
           0 , 0 , 1 , z ;
           0 , 0 , 0 , 1 ];
end
