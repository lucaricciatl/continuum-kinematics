function [p,M,G,C] = christoffel(L,U,q,q_dot)

    p  =  (jacobian(L , q_dot)).';
    M  =  (jacobian(p , q_dot));
    G  =  (jacobian(U , q)).';

    c  =  sym(zeros([length(q) length(q) length(q)]));
    C  =  sym(zeros(size(M)));
    for i  =  1:length(q)
        for j  =  1:length(q)
            for k  =  1:length(q)
                c(i,j,k)  =  (1/2 * (diff(M(i,k),q(j)) + diff(M(i,j),q(k)) -  diff(M(j,k),q(i))));
                C(i,j)  =  C(i,j) + c(i,j,k) * q_dot(k);
            end
        end
    end
    
end

