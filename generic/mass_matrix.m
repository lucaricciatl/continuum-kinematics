function Ms = mass_matrix(m,Ig,g_bg,g_sb)
%MASS_MATRIX compute mass matrix of a body respect a given sdr
%   m --> mass
%   M --> mass matrix
%   Ig --> baricentric inertial tensor
%   Mg --> mass marix in baricentric sdr
%   Mb --> mass matrix in frame body
%   Ms -> mass matri in frame spatial
%   g_bg --> transformation matrix from sdr {b} to {g}
%   g_sb --> transformation matrix from sdr {s} to {b}

Mg = [ m * eye(3) , zeros(3) ; 
       zeros(3)   , Ig     ] ;

ni_g_bg = ni(g_bg) ;
ni_g_sb = ni(g_sb) ;


d_bg = ni_g_bg(1:3) ;
d_sb = ni_g_sb(1:3) ;

R_sb = g_sb(1:3,1:3) ;

d_sb_hat = hat(d_sb) ;
d_bg_hat = hat(d_bg) ;

Ms_11 = m * eye(3)  ;
Ms_12 = m * d_sb_hat' + m*d_bg_hat' ;
Ms_21 = m * d_sb_hat + m*d_bg_hat   ;
Ms_22 = m * ( d_sb_hat * d_sb_hat' ) + R_sb * Ig * R_sb' - ...
        m* ( ( d_bg_hat * d_sb_hat ) - ( d_sb_hat * d_bg_hat ) ) ;
    
Ms = [Ms_11 Ms_12 ; Ms_21 Ms_22 ]   ;

% adj_bg = Ad(g_bg) ;
% adj_sb = Ad(g_sb) ;
% adj_bg_inv = adj_bg^-1 ;
% adj_sb_inv = adj_sb^-1 ;
% 
% Mb = ( adj_bg_inv )' * Mg * adj_bg_inv ;
% 
% Ms = ( adj_sb_inv )' * Mb * adj_sb_inv ;

end

