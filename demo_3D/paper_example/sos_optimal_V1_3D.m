function [V, kk] = sos_optimal_V1_3D(f,gg,B,u1,u2,u3,l_au,l_us,V_degree,C,gamma,V_o)

pvar x1 x2 x3 Vtol2 Vtol1 cc1 cc2 cc3;
x = [x1;x2;x3];
%%
[L1,L1_Q] = sosdecvar('L1_w',monomials(x,0:l_au/2));
[L2,L2_Q] = sosdecvar('L2_w',monomials(x,0:l_au/2));
[L3,L3_Q] = sosdecvar('L3_w',monomials(x,0:l_us/2));
[L4,L4_Q] = sosdecvar('L4_w',monomials(x,0:l_us/2));
[L5,L5_Q] = sosdecvar('L5_w',monomials(x,0:l_us/2));
[L6,L6_Q] = sosdecvar('L6_w',monomials(x,0:l_us/2));
%%
% [L1,L1_Q] = polydecvar('L1_w',monomials(x,0:l_au));
% [L2,L2_Q] = polydecvar('L2_w',monomials(x,0:l_au));
% [L3,L3_Q] = polydecvar('L3_w',monomials(x,0:l_us));
% [L4,L4_Q] = polydecvar('L4_w',monomials(x,0:l_us));
% [L5,L5_Q] = polydecvar('L5_w',monomials(x,0:l_us));
% [L6,L6_Q] = polydecvar('L6_w',monomials(x,0:l_us));
%%
% [V,vc] = polydecvar('v_w',[x1^4; x2^4; x1^2*x2^2;x1^2;x2^2;x1*x2]);
[V,vc] = polydecvar('v_w',monomials(x,0:V_degree));
%%
% Vdot = jacobian(V, x1)*(f(1)+gg(1)*u1)+ jacobian(V, x2)*(f(2)+gg(2)*u2);
Vdot = jacobian(V, x1)*(f(1)+gg(1)*u1)+jacobian(V, x2)*(f(2)+gg(2)*u2)+jacobian(V, x3)*(f(3)+gg(3)*u3);
%% Constraint
V_o_dot = jacobian(V_o, x1)*(f(1)+gg(1)*u1)+jacobian(V_o, x2)*(f(2)+gg(2)*u2)+jacobian(V_o, x3)*(f(3)+gg(3)*u3);
%%
pcr_11 = L1 >= 0;
pcr_12 = L2 >= 0;
pcr_13 = L3 >= 0;
pcr_14 = L4 >= 0;
pcr_15 = L5 >= 0;
pcr_16 = L6 >= 0;
%%
pconstr_1 = V-L1*B-Vtol2 >= 0;
%%
pconstr_2 = -Vdot-L2*B-gamma*B+Vtol2 <= 0;
% pconstr_2 = Vdot+L2*B+gamma*B+Vtol2 >= 0;
pconstr_3 = Vtol2 >= 0;
% %% Lyapunov promise + add
% pconstr_4 = V_o_dot + Vdot*L6 - Vtol2 <= 0; 
%%
pcr_21 = V-C(1)*L3 <= 0;
pcr_22 = V-C(2)*L4 <= 0;
pcr_23 = V-C(3)*L5 <= 0;
%% Original
% pconstr = [pcr_11;pcr_12;pconstr_1;pconstr_2;pconstr_3;pcr_21;pcr_22;pcr_23];
%% ADD L3 L4 L5 SOS constraint
pconstr = [pcr_11;pcr_12;pcr_13;pcr_14;pcr_15;pconstr_1;pconstr_2;pconstr_3;pcr_21;pcr_22;pcr_23];
%% ADD Lyapuno constraint
% pconstr = [pcr_11;pcr_12;pcr_13;pcr_14;pcr_15;pcr_16;pconstr_1;pconstr_2;pconstr_3;pcr_21;pcr_22;pcr_23];
%%
obj = Vtol2;
%%
opts = sosoptions;
opts.form = 'kernel';
opts.solver = 'mosek';
[info,dopt] = sosopt(pconstr,x,obj,opts);
% [info,dopt] = sosopt(pconstr,x,opts);
if info.feas
    kk = 1;
    V = subs(V,dopt)
else
    kk = 0;
    V  = 0;
    fprintf('Advanced Lyapunov SOS Factor L can not find.======\n');
    return;
end

end
