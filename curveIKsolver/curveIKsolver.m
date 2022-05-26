classdef curveIKsolver < handle
    %CURVEIKSOLVER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        N
        N_sec
        q
        l
        T
        J
        DH
        J_red
        
    end
    
    methods
        function self = curveIKsolver(N,l,q0)
            %CURVEIKSOLVER Construct an instance of this class
            %   Detailed explanation goes here
            N_size = size(N);
            self.q = q0;
            self.N = N;
            self.N_sec = N_size(1);
            self.l = l;
            
        end
        
        function DH = DH_vect(~,l,q)
            DH = zeros(5,4);
            k = q(1);
            b = q(2);
            t = q(3);
            theta = sqrt(k^2+b^2);
            
            if theta ~= 0
                L_a = 2*l * sin(theta/2) / theta;
            else
                L_a = l;
            end
            phi = atan2(k,b);
            psi = t;
            DH1 = [0,phi,0,pi/2];
            DH2 = [0,   theta/2+ pi/2,0,0];
            DH3 = [0,0,  L_a ,0];
            DH4 = [0,   theta/2- pi/2,0,-pi/2];
            DH5 = [0,psi-phi,0,0];      
            DH(1,:) = DH1;
            DH(2,:) = DH2;
            DH(3,:) = DH3;
            DH(4,:) = DH4;
            DH(5,:) = DH5;
        end

        function T = compute_T_module(~,T0,DH)
            T = zeros(4,4,5);
            T(:,:,1) = T0*TDH(DH(1,:));
            T(:,:,2) = T(:,:,1)*TDH(DH(2,:));
            T(:,:,3) = T(:,:,2)*TDH(DH(3,:));
            T(:,:,4) = T(:,:,3)*TDH(DH(4,:));
            T(:,:,5) = T(:,:,4)*TDH(DH(5,:));
        end
        
        function T = compute_T(self)
            T = zeros(4, 4, sum(self.N) * 5 ) ;
            T(:,:,1) = eye(4);
            p = 1;
            s = 1 ;
            np=0;
            v = 0;
            for i = 1 : sum(self.N)     
                DH_v = self.DH_vect(self.l(1) / self.N(1),self.q(1+v:3+v) / self.N(1)) ;
                Tp = T(:,:,p);
                Tm = self.compute_T_module( Tp , DH_v );
                T(:,:,1+p:5+p) = Tm;
                p = p+5;
                if i-np > self.N(s)
                    s = s + 1;
                    np = np + self.N(s) ;
                    v = v+3;
                end
            end
            self.T = T;
        end
                
        function J_red = compute_module_jacobian(self,Tm,T_ee)
                J1 = compute_revolute_jacobian(Tm(:,:,1),T_ee);
                J2 = compute_revolute_jacobian(Tm(:,:,2),T_ee);
                J3 = compute_traslational_jacobian(Tm(:,:,3),T_ee);
                J4 = compute_revolute_jacobian(Tm(:,:,4),T_ee);
                J5 = compute_revolute_jacobian(Tm(:,:,5),T_ee);
                J = [J1,J2,J3,J4,J5];
                J_red = [J1,J2+J3+J4,J5];

        end
                
        function J_red = compute_J(self)
            T_ee = self.T(:,:,end);
            J = zeros(6,sum(self.N) * 5-5);
            J_red = zeros(6,self.N_sec*3);
            p = 1;
            v = 0;
            np = 0;
            s = 1 ;
            for i = 1 : sum(self.N)
                Tm = self.T(:,:,1+p:5+p);
                Jm_red = self.compute_module_jacobian(Tm,T_ee);
                J_red(1:6,1+v:3+v) = J_red(1:6,1+v:3+v) + Jm_red;
                p = p+5;
                if i-np > self.N(s)
                    s = s + 1;
                    np = np + self.N(s) ;
                    v = v+3;
                end
            end
            
            self.J_red = J_red;

        end
        
        function q = IK_solve(self,goal,W)
           itermax = 500;
           for i = 1 : itermax
               self.compute_T();
               self.compute_J();
               P = ni(  self.T(:,:,end) );
               e = diag(W) * ( P - goal );
               J = self.J_red;
               Jalg =  J';
               J_inv = pinv(J)
               lamb = 1;
%                Jalg = - pinv( J'*J + lamb * diag(J'*J) ) * J';
%                Jalg = pinv(J)
               dq = - 0.8 * Jalg * e;
               for j = 1 : self.N_sec
                   s = 3*j-3;
                   dq(1+s) = dq(1+s) * sin(dq(2+s));
                   dq(2+s) = dq(1+s) * cos(dq(2+s));
                   dq(3+s) = dq(3+s);
               end
               self.q = self.q + dq;
               self.plotkint(i/itermax)
           end
        end
        
        function plotkin(self)
            T = self.T;
            p = zeros(3,sum(self.N));
            for i = 1 : sum(self.N)*5-1
                xi = ni(self.T(:,:,i));
                p(:,i) = xi(1:3);
            end
            p1 = plot3(p(1,:),p(2,:),p(3,:));
            p2 = plot3(p(1,:),p(2,:),p(3,:),'o','MarkerSize',10,'MarkerFaceColor','r');
            p1.LineWidth  = 5;
        end
        
        function plotkint(self,c)
            T = self.T;
            p = zeros(3,sum(self.N));
            for i = 1 : sum(self.N)*5-1
                xi = ni(self.T(:,:,i));
                p(:,i) = xi(1:3);
            end
            p1 = plot3(p(1,:),p(2,:),p(3,:),'Color',[c,0.1,1-c]);
            p1.LineWidth  = 0.1;
        end
    end
    
end

