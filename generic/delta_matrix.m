function M_delta = delta_matrix(v,h)
   n = length(v) ;
   M_delta = zeros(n) ;
   for i = 1 : n
       for j = 1 : n
           v_delta = zeros(1,n);
           v_delta(j) = h ;
       M_delta(:,j) =  v' + v_delta ;
       end
   end
end

       
