function adj_ = Ad_comm( tw1 , tw2 )
%adj_comm compute commutator of tw1 1x6 respect tw2 1x6
%   given two twist tw1 tw2 operator commutator compute the derivate of 
%   vector field of tw1 respect tw2 

adj_ = Ad( tw1 ) * tw2 ;

end

