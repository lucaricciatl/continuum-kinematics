function W_new = force_changepole(W_old,p_old,p_new)
    W_new = [eye(3) , zeros(3) ; hat(p_new - p_old) , eye(3)] * W_old;
end

