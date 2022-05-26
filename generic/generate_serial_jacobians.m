function J = generate_serial_jacobians( fun , inputs )

    n = length(inputs(:,1)) ;
    I = length(inputs(1,:)) ;
    T_out = zeros(4,4,n+1)  ;
    
    T_out(:,:,1) = eye(4)   ;
    
    
    J = zeros(6,I,n) ;
    
    for i = 1 : n
        T_out(:,:,i+1) = T_out(:,:,i) *  feval( fun , inputs(i,:) ) ;
    end
    
    for i = 1 : n
        x = inputs(1,:) ;
        f = @(x) (ni(T_out(:,:,i) * fun(x))) ;
        J(:,:,i) = jacobianest(f,x) ;
    end
    
    
    
end

