function T_out = generate_serial_sdr( fun , inputs )
    %compute all sdr composing transofrmation matrixs
    
    %fun = f(arg1 , arg2 , arg3 ...)
    %inputs = [args1 args2 args3 ... ] matrix
    %args = [ arg1 arg2 ag3 ... ] coloumn vector
    %args are vector or scalar
    
    n = length(inputs(:,1)) ;
    
    T_out = zeros(4,4,n+1)  ;
    
    T_out(:,:,1) = eye(4)   ;
    
    for i = 1 : n
        T_out(:,:,i+1) = T_out(:,:,i) *  feval( fun , inputs(i,:) ) ;
    end
    
end

