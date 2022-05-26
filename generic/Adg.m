function adg = Adg(T)
%ADJOINT compute adjoiint operator of a matrix
%   computation of adjoint operator given matrix T 4x4 or a vector 1x6 . 
%   Result is a matrix 6x6

R = T(1:3,1:3) ;
d = T(1:3,4) ;

adg = [ R        , hat(d) * R ;
        zeros(3) , R        ] ;

end



