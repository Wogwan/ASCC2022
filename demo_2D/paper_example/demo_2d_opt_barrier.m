clear;tic;
pvar x1 x2 u htol epsi;
x = [x1;x2];
%%
f = [x2-x1
    0.15432387994108778662817450645485*x1^4+0.23541948636981062330190921043309*x1^3+0.41058519554981867980300888929277*x1^2+x1*x2-0.46368439821849470143059572061854*x1+0.018934809918422834673634724822477*x2^4+0.053017123265488262651157214122577*x2^3+0.1081959091461522914912052328873*x2^2-0.9986920403516159766305754219573*x2-0.0018682553605258930828902919074608
    ];
gg = [1;1];
dom = 10;
%%
C1 = (x1+3)^2+(x2-4)^2-1;
C2 = (x1+1)^2+(x2+4)^2-1;
C3 = (x1-3)^2+(x2-2)^2-1;
C = [C1;C2;C3];
% C = [C1;C2];
epsi = 1e-10;
trace_Q1 = 1; trace_Q = 0;
mm = 0; kk = 1; i = 0;
%%
V = 1*x1^4+2*x2^4+2*x1^2*x2^2+1*x1^2+1*x2^2+1*x1*x2; 
if length(C) == 3
    C0 = 59.903496442963558;
else 
    C0 = 1.0e+02*1.904223157470122;
end
    sol_B = C0 - V;
solh = sol_B;
%%
% k_u = 4;
% k_h = 1;
% L_us = 4;
% L_au = 4;
% gamma = 2;
%%
k_u = 4;
k_h = 4;
L_us = 6;
L_au = 6;
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
    [~,~]=pcontour(C(3),0,domain,'r');            % Plot the original Lyapunov sublevel set
end      
axis(domain); TRACE = [];
Barrier = []; Control = [];
%%
while 1
    i = i+1
    record_Q = trace_Q
    %%
    [SOLu1,SOLu2,SOL1,SOL2,kk] = sos_function_1(f,k_u,L_au,solh,V,gamma,gg);
    if kk == 0
        break
    end
    Control = [Control; [SOLu1 SOLu2]];
    %%
%     [solh,trace_Q,kk]=sos_function_2(i,f,k_h,SOLu1,SOLu2,SOL1,SOL2,gamma,V,C,dom,gg,L_us,sol_B);
    [solh,trace_Q,kk] = sos_function_2(i,f,k_h,SOLu1,SOLu2,SOL1,SOL2,gamma,V,C,dom,gg,L_us,figure_id);
    if kk == 0
        break
    end
    TRACE = [TRACE; double(trace_Q)];
    Barrier = [Barrier; solh];
end