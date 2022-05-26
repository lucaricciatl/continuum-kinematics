function T = T_epcc(q)
%T_EPCC
%    extended PCC matrix
%    q = [l,epsilon, k , b , t]
%    T = T_EPCC(q)


in1 = q;
b = in1(4,:);
epsilon = in1(2,:);
k = in1(3,:);
l = in1(1,:);
t = in1(5,:);

if k^2 + b^2 >= 0.1
    t2 = b.^2;
    t3 = epsilon+1.0;
    t4 = k.^2;
    t5 = l.*t.*t3;
    t8 = t2+t4;
    t6 = cos(t5);
    t7 = sin(t5);
    t9 = 1.0./t8;
    t10 = sqrt(t8);
    t11 = 1.0./t10;
    t12 = l.*t3.*t10;
    t13 = cos(t12);
    t14 = sin(t12);
    t15 = t13-1.0;
    t16 = t2.*t9.*t15;
    t19 = b.*k.*t6.*t9.*t15;
    t20 = b.*k.*t7.*t9.*t15;
    t17 = -t16;
    t18 = t16+1.0;
    t21 = t13+t17;
    T = reshape([t20+t6.*t18,t19+t7.*t21,b.*t6.*t11.*t14+k.*t7.*t11.*t14,0.0,t19-t7.*t18,-t20+t6.*t21,-b.*t7.*t11.*t14+k.*t6.*t11.*t14,0.0,-b.*t11.*t14,-k.*t11.*t14,t13,0.0,b.*t9.*t15,k.*t9.*t15,t11.*t14,1.0],[4,4]);
else
    T = T_epcc_taylorized(q);
end

