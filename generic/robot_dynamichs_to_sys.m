function sys = robot_dynamichs_to_sys(M,C,G,E,x,x_dot,u)
    %take in input parameter of standard robotic equation and give as
    %output the system in space state form
    
    %[q_dot ] = f1 + g1 * u1
    %[q_ddot] = f2 + g2 * u2

    %u1         --> input joint velocity
    %u2         --> input joint acceleration
    %q          --> joint position
    %q_dot      --> joint velocity
    %mu_visc    --> coefficient vector of viscous dissipative forces
    %               proportuional to q_dot    
    
    
    nX = length(x);
    nQ = length(u);
    f = simplify([x_dot ; - pinv(M) * ( C * x_dot + G)]);
    g = simplify([zeros(nQ,nQ) ; pinv(M) * eye(nQ)]); 


    sys = f + g * u - E * x_dot ;
end

