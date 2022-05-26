function T = R_axis_angle(ax,angle)
%R_AXIS_ANGLE Summary of this function goes here
%   Detailed explanation goes here
r_x = ax(1);
r_y = ax(2);
r_z = ax(3);
theta = angle;


ct = cos(theta);
st = sin(theta);

T_11 = r_x^2 * ( 1 - ct ) + ct ;
T_12 = r_x * r_y * ( 1 - ct ) - r_z * st ;
T_13 = r_x * r_z * ( 1 - ct ) + r_y * st ; 
T_21 = r_x * r_y * ( 1 - ct ) + r_z * st ;
T_22 = r_y^2 * ( 1 - ct ) + ct ;
T_23 = r_x * r_z * ( 1 - ct ) + r_x * st ; 
T_31 = r_x * r_z * ( 1 - ct ) - r_y * st ;
T_32 = r_y * r_z * (1-ct) + r_x * st;
T_33 = r_z^2 * ( 1 - ct ) + ct;

T = [T_11 ,T_12 ,T_13,0;
     T_21 ,T_22 ,T_23,0;
     T_31 ,T_32 ,T_33,0;
     0    ,0    ,0   ,1];
 
end

