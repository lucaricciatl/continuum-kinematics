function X_dot = num_der( fun , X )
%NUM_DER Summary of this function goes here
%   Detailed explanation goes here
delta = 10^(-10) ;

f_minus = fun( X - delta ) ;
f_plus = fun( X + delta ) ;

X_dot = ( f_plus - f_minus ) / ( 2 * delta ) ;

end

