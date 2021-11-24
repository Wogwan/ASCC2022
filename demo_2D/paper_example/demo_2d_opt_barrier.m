clear;tic;
pvar x1 x2 u htol epsi;
x = [x1;x2];
dom = 10;
%%
f = [x2-x1
    -0.23606416828637188828796009029584*x1^4+0.24650838581310801777701368775053*x1^3+x1^2*x2-0.7173309565565305634393666878168*x1^2+0.26453823849708858750862106035129*x1+0.03729676680157056195552556232542*x2^4+0.01893812978180069162004173222158*x2^3+0.13680422363948308017711497086566*x2^2+0.043563863537901807709840085180986*x2+0.23883336887991710173473336453753
    ];
gg = [1;1];
%%
V = 1*x1^4+1*x2^4+1*x1^2*x2^2+1*x1^2+1*x2^2+1*x1*x2;
% C0 = 1.0e+02*1.714593951979031;
C0 = 1.0e+2*2.121924848371969;
%%
C1 = (x1+5)^2+(x2-8)^2-6;
C2 = (x1+7)^2+(x2+7)^2-6;
C3 = (x1-6)^2+(x2+2)^2-6;
C = [C1;C2;C3];
trace_Q1 = 1; trace_Q = 0; mm = 0; kk = 1; iter = 0;
k = ['r','g','b','m','c','k','y'];
%%
sol_B = C0 - V;
solh = sol_B;
%%
% k_u = 4; k_h = 4; % L_us = 4; L_au = 2; gamma = 0;
%% Test
% k_u = 4; k_h = 4; L_us = 8; L_au = 8;
% k_u = 4; k_h = 4; L_us = 6; L_au = 6;
k_u = 4; k_h = 4; L_us = 6; L_au = 4;
%%
% V_us = 8; V_au = 8; V_degree = 2;
% V_us = 6; V_au = 6; V_degree = 4;
V_us = 4; V_au = 4; V_degree = 4;
%%
gamma = 0;
%%
figure_id = 12;
figure(figure_id);clf;hold on;
domain = [-dom dom -dom dom];
xlim([-dom dom]); ylim([-dom dom]); hold on;
[~,~]=pcontour(V,C0,domain,'b'); hold on;
[~,~]=pcontour(C1,0,domain,'k'); hold on;
[~,~]=pcontour(C2,0,domain,'k'); hold on;
if length(C) == 3
    [~,~]=pcontour(C(3),0,domain,'k');            % Plot the original Lyapunov sublevel set
end
axis(domain); TRACE = [];
Barrier = []; Control = []; Barrier_plus = [];
%%
while 1
    iter = iter+1
    record_Q = trace_Q
    %%
    [SOLu1,SOLu2,SOL1,SOL2,kk] = sos_function_1(f,k_u,L_au,solh,V,gamma,gg);
    if kk == 0
        break
    end
    Control = [Control; [SOLu1 SOLu2]];
    %%
    %     [solh,trace_Q,kk]=sos_function_2(i,f,k_h,SOLu1,SOLu2,SOL1,SOL2,gamma,V,C,dom,gg,L_us,sol_B);
    [solh,trace_Q,kk] = sos_function_2(iter,f,k_h,SOLu1,SOLu2,SOL1,SOL2,gamma,V,C,dom,gg,L_us,figure_id);
    if kk == 0
        break
    end
    TRACE = [TRACE; double(trace_Q)];
    Barrier = [Barrier; solh];
    %% Optimal the set
    kk = 1; OO = 0;
    [solh1, kk] = sos_optimal_V1_2D(f,gg,solh,SOLu1,SOLu2,V_au,V_us,V_degree,C,gamma);
    figure(figure_id+1);clf;hold on;
    [~,~]=pcontour(V,C0,domain,'b'); hold on;
    [~,~]=pcontour(C1,0,domain,'k'); hold on;
    [~,~]=pcontour(C2,0,domain,'k'); hold on;
    [~,~]=pcontour(C(3),0,domain,'k');
    [~,~]=pcontour(solh,0,domain,'r'); hold on;
    if mod(iter,7) == 0
        [~,~]=pcontour(solh1,0,domain,k(7)); hold on;             % Plot the original Lyapunov sublevel set
    else
        [~,~]=pcontour(solh1,0,domain,k(mod(iter,7))); hold on;             % Plot the original Lyapunov sublevel set
    end
    refreshdata; drawnow;
    solh = solh1;
    Barrier_plus = [Barrier_plus;solh1];
    %%
    if kk == 0
        fprintf('Advanced Barrier Function can not find.======\n');
    end
end

A = [];
for iter = 1:length(Barrier)
    A = [A; [Control(iter,:) Barrier(iter)] Barrier_plus(iter)];
end