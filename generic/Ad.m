function adj = Ad(T)
%ADJOINT compute adjoiint operator of a matrix
%   computation of adjoint operator given matrix T 4x4 or a vector 1x6 . 
%   Result is a matrix 6x6

R = T(1:3,1:3) ;
d = T(1:3,4) ;

adj = [ R hat(d) ; zeros(3) R ] ;

end



