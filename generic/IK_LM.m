function [ p , q ] = IK_LM(Jf,T,p_obj,q0,W,lambda,err_max,iter_max)
    i = 0 ;
    q = q0 ;
    p = ni(T(q)) ;
    e = diag(W) * ( p_obj - p ) ;
    while e' * e >= err_max^2  &&  i<=iter_max 
        J = Jf(q) ;
        J_c = J' * J ;
        e = diag(W) * ( p_obj - p ) ;
        dq = pinv( J_c + lambda * diag( J_c ) ) * J' * e ;
        q = q + dq ;
        p = ni(T(q)) ;
        i=i+1;
    end
    
end

