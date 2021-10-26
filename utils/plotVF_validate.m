function plotVF_validate

% hold on
format long

hold on;
syms x1 x2;
dom = 4;

%% sos_model 2d5
% Original system
% figure(20);clf;
% f = @(t,x) [
% x(2)-x(1)
% x(1)^2*x(2)-(exp(2*x(1))*cos(x(1))^2)^(1/4)+1];

%%
% figure(20);clf;
% m = 0.15;
% g = 9.8;
% l = 0.5;
% miu = 0.05;
% f = @(t,x) [
% x(2)
% g/l*sin(x(1))-miu/(m*l^2)*x(2)];

%%
% GP system
% figure(21);clf;
% f = @(t,x) [
% x(2); -(1-x(1))^2*x(1)-x(2)];

figure(21);clf;
f = @(t,x)[
    -1*x(1)+1*x(2)+3*(exp(x(2))-1);
    -1*x(1)-1*x(2)+1*x(1)*x(2)+x(2)*cos(x(2))
    ];

% figure(21);clf;
% f = @(t,x)[
% -0.42*x(1)-1.05*x(2)-2.3*x(1)^2-0.5*x(1)*x(2)-x(1)^3
% 1.98*x(1)+x(1)*x(2)
%     ];


%%
% % GP system
% figure(22);clf;
% f = @(t,x) [
% x(2)-x(1)
% x(1)^2*x(2)-0.000007031474139-0.500009736044418*x(1)+0.126057255453549*x(1)^2+0.103008552092872*x(1)^3-0.168853172050168 *x(1)^4+0.264932312148793*x(1)^5;
% ];

%% Plot ROA
% [ts1,ys1] = ode45(f,[0,20],[0.45;-0.51]);
% plot(ys1(:,1),ys1(:,2), 'r','linewidth',3), hold on;


%% Field [-2 2]
vectfield(f,-dom:0.4:dom,-dom:0.4:dom); hold on; % field [-5 5 -5 5]

for xd = -dom:0.5:dom
    for yd = -dom:0.5:dom
        [ts,ys] = ode45(f,[0,20],[xd;yd]);
        h1 = plot(ys(:,1),ys(:,2), 'k');hold on;
    end
end


xlim([-dom dom]); ylim([-dom dom]);
% xlim([-6 6]); ylim([-8 8]);
% plot(0,0,'co','linewidth',3);hold on;

set(gca, 'LooseInset', [0,0,0,0]);
title('');

end