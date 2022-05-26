function T = TDH(p)
d = p(1);
theta = p(2) ;
r = p(3);
alpha = p(4);
T1= Ttr([0,0,d]);
T2=Tz(theta);
T3=Ttr([r,0,0]);
T4=Tx(alpha);
T = T1*T2*T3*T4;
end

