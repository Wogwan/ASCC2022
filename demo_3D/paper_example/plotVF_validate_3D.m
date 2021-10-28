clear
format long
hold on;
dom = 4;
figure(21);clf;
set(gcf,'Position',[300 400 1300 500]);
%%
subplot(131);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = -cos(x1).^2.*sin(x1)-x1.^2;
v = -x2.*x1.^3-x2;  
w = 1-x1.^2.*x3-(exp(2.*x3).*cos(x3).^2).^(1/4); 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');

%%
subplot(132);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = -cos(x1).^2.*sin(x1)-x1.^2;
v = -x2.*x1.^3-x2;  
w = 1-x1.^2.*x3-(exp(2.*x3).*cos(x3).^2).^(1/4); 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');

%%
subplot(133);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = -cos(x1).^2.*sin(x1)-x1.^2;
v = -x2.*x1.^3-x2;  
w = 1-x1.^2.*x3-(exp(2.*x3).*cos(x3).^2).^(1/4); 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');
