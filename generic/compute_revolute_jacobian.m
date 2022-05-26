function J = compute_revolute_jacobian(T,Te)
R = T(1:3,1:3);
Pi = T(1:3,4);
Pe = Te(1:3,4);
z = R(1:3,3);
dp = Pe-Pi;
Jr = [ cross(z,dp) ; z ] ;
J = [eye(3),zeros(3);zeros(3),R^-1] * Jr;
end

