function q = IK_LM(J,T,P_obj,q0,W,lambda,err_max,iter_max)
    error = 10^3 ;
    i = 0 ;
    q = q0 ;
    P = T(q) ;
    while error <= err_max && i<iter_max
        J = J(q) ;
        J_c = J' * J ;
        e = diag(W) * ( P_obj - P ) ;
        dq = pinv( J_c + lambda * diag( J_c ) ) * J' * e ;
        q = q + dq ;
    end
    
end

