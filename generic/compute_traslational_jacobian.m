function J = compute_traslational_jacobian(T,Te)
R = T(1:3,1:3);
Pi = T(1:3,4);
Pe = Te(1:3,4);
z = R(1:3,3);
Jr = [z;0;0;0];
J =  Jr;
end

