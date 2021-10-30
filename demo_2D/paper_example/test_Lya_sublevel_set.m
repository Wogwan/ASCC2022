clear;
tic
pvar x1 x2 u1 u2 htol epsi;
x = [x1;x2];
%%
f = [x2-x1
    0.15432387994108778662817450645485*x1^4+0.23541948636981062330190921043309*x1^3+0.41058519554981867980300888929277*x1^2+x1*x2-0.46368439821849470143059572061854*x1+0.018934809918422834673634724822477*x2^4+0.053017123265488262651157214122577*x2^3+0.1081959091461522914912052328873*x2^2-0.9986920403516159766305754219573*x2-0.0018682553605258930828902919074608
    ];
gg = [1;1];
input = [gg(1)*u1;gg(2)*u2];
%%
% f = [x2; -x1];
% gg = [0;1];
%%
% V = x1^2+x1*x2+x2^2;
% V = 1*x1^4+1*x2^4+2*x1^2*x2^2+1*x1^2+1*x2^2+1*x1*x2;
V = 1*x1^4+2*x2^4+2*x1^2*x2^2+1*x1^2+1*x2^2+1*x1*x2;
%%
C0 = 0.1;
cc = 1;
k = 2;
k_l = 4;
dom = 5;
domain = [-dom dom -dom dom];
% C1 = (x1-3)^2+(x2-1)^2-1;
% C2 = (x1+3)^2+(x2+4)^2-1;
% C3 = (x1+4)^2+(x2-5)^2-1;
C1 = (x1+2)^2+(x2-3)^2-2;
C2 = (x1+3)^2+(x2+2)^2-1;
C3 = (x1-2)^2+(x2-2)^2-1;
%%
C4 = (x1-2)^2+(x2-6)^2-1;
C5 = -x2+2;
C6 = (x1+0.5)^2+(x2+3.25)^2-1;
C7 = -x2 - 4;
C8 = -x1 + 1;
C = [C1;C2;C3;C4;C5;C6;C7;C8];
kk = 1;
%%
figure(11);clf;hold on;
[~,~]=pcontour(C(1),0,domain,'r');            % Plot the original Lyapunov sublevel set
[~,~]=pcontour(C(2),0,domain,'r');            % Plot the original Lyapunov sublevel set
[~,~]=pcontour(C(3),0,domain,'r');            % Plot the original Lyapunov sublevel set
[~,~]=pcontour(V,C0,domain,'g');              % Plot the original Lyapunov sublevel set
solU = [];
v_c = [];
iter = 1;
%%
while abs(double(cc)-double(C0)) >= 1e-8
    iter = iter + 1;
    if iter ~= 1
        C0 = cc;
    end
    [solu1,solu2,solL,kk]= sos_function_v(f,gg,k,k_l,V,C0);
    if kk == 0
        break
    end
    [cc,kk,solu1,solu2] = sos_function_v2(f,gg,k,k_l,V,C,dom,solL);
    v_c = [v_c; double(cc)]
    solU = [solU;[solu1,solu2]];
    if kk == 0
        figure(11);hold on;
        [~,~]=pcontour(V,v_c(end),domain,'b');  
        break
    end
end
toc