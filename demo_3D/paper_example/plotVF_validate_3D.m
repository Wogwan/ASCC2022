clear;close all;
format long
dom = 10;
figure(21);clf;
set(gcf,'Position',[300 400 1300 500]);
%%
subplot(131);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = x2+x3.^2;
v = x3-x1.^2-x1.*sin(x1);  
w = -x1-2.*x2-x3+x3.^2-(exp(2.*x3).*cos(x3).^2).^(1/4); 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');

%%
subplot(132);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = x3.^2+x2;
v = 0.079555000763811410411950351704878.*x1.^4+0.000000000000000045815761159119561307074167378723.*x1.^3-1.7359477394917732691788832729192.*x1.^2-0.00000000000000046785300166333387878484908981305.*x1+x3-0.12189271531118343883104415681373;  
w = x2.^3-2.*x2-3.1534767198336317584050902951276.*x3.^4-3.84522290457359261495184910018.*x3.^3+1.7197668990517760434499905386474.*x3.^2+0.054189659882359464404544269200414.*x3-x1-0.90689932330114281233690576300432; 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');

%%
subplot(133);hold on;
[x1, x2, x3] = meshgrid(-dom:dom/20:dom);
u = x2-x3.^2;
v = x3-x1.^2;  
w = -x1-2.*x2-x3+x2.^3; 
h1 = streamslice(x1, x2, x3, u, v, w, dom, -dom, -dom);
set(h1,'color',[182 182 182]/255);
box on; view(-150, 30);hold on;
set(gca, 'LooseInset', [0,0,0,0]);
xlim([-dom dom]); ylim([-dom dom]); zlim([-dom dom]);
title('');
