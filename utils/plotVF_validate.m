function plotVF_validate

% hold on
format long

hold on;
syms x1 x2;

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
figure(21);clf;
f = @(t,x) [
x(2)-x(1)
-0.31745697812144119120958407620492*x(1)^4-2.7394679079680317457246019330341*x(1)^3-3.3441954147084285153823657310568*x(1)^2+5.1105116545084232626550146960653*x(1)-0.00083489337766741759331440286828752*x(2)^4-0.048355556895224326152682436941177*x(2)^3-0.15227208293282215589847794490197*x(2)^2+0.95924959738009984988593714660965*x(2)-5.2311514088161876756544188538101
];

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
vectfield(f,-2:0.4:2,-2:0.4:2); hold on; % field [-5 5 -5 5]

for xd = -2:0.5:2
    for yd = -2:0.5:2
        [ts,ys] = ode45(f,[0,20],[xd;yd]);
        h1 = plot(ys(:,1),ys(:,2), 'k');hold on;
    end
end

xlim([-6 6]); ylim([-8 8]);
% plot(0,0,'co','linewidth',3);hold on;

set(gca, 'LooseInset', [0,0,0,0]);
title('');

end