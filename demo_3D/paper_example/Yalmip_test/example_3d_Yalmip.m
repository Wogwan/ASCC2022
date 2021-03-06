clear all

%Init system
sdpvar x1 x2 x3 u1 u2
f = [x2+x3^2; 
    0.032985569548582671650649444927694*x1^4-0.25190811831004457417622406696696*x1^3-0.87515455184313891217181756710402*x1^2+0.98308426849193212652503840824162*x1+0.0064285707919207223451363297783701*x2^4+0.0078332491243005321346348779343316*x2^3-0.010712089673140650150640063031915*x2^2+0.053882908343556683294917064586116*x2-0.12661718463574700432872077726643*x3^4+0.29574073949289136908902264622157*x3^3-0.0045483349953734054579856938005378*x3^2+0.87242974766040720657755969114078*x3-0.018123100035730797166089643002492+u1; 
    -0.0045563969102914974457219088321835*x1^4+0.098282761847104382901818553364137*x1^3-x1^2*x3-0.63059661735708949503731446384336*x1^2+0.39788196631989014573349550119019*x1-0.022706448443695230465788625906498*x2^4-0.05009258712024410725716094816562*x2^3+0.042410939116867982234815315223386*x2^2+0.26685438332235023040084342937917*x2-3.7823648546322456986956694890978*x3^4+4.5017165904882983085144587676041*x3^3-0.78859871736978876704104137550797*x3^2+0.95794780260139500427385428338312*x3+0.91223086905465527163918611344087+u2];
v = 5*x1^2+10*x1*x2+2*x1*x3+10*x2^2+6*x2*x3+4*x3^2;
cc = 1;
gamma = 2;
k_u = 2;
k_L = 4;
k_h = 4;

% safety constraints
c1 = (x1-2)^2+(x2-2)^2+(x3-2)^2-1;
c2 = (x1+3)^2+(x2+2)^2+(x3+1)^2-1;
c3 = (x1+0)^2+(x2-0)^2+(x3-6)^2-4;
c4 = (x1+0)^2+(x2-0)^2+(x3+6)^2-4;
figure(1);clf;hold on;
c1s = char(sdisplay(c1));
c2s = char(sdisplay(c2));
c3s = char(sdisplay(c3));
c4s = char(sdisplay(c4));
xran=[-8 8 -8 8 -8 8];
smrplot(c1s,0,xran,[400 100],'r-');
smrplot(c2s,0,xran,[400 100],'r-');
smrplot(c3s,0,xran,[400 100],'r-');
smrplot(c4s,0,xran,[400 100],'r-');
refreshdata; drawnow;
% % largest level set
for ii = 1:10
    
    % fix cc search for u, L1
    [uu1 u1c u1v] = polynomial([x1 x2 x3], k_u, 0);
    [uu2 u2c u2v] = polynomial([x1 x2 x3], k_u, 0);
    [L1 L1c L1v] = polynomial([x1 x2 x3], k_L, 0);
    
    Vdot = jacobian(v, x1)*(x2-x3^2) + jacobian(v, x2)*(x3-x1^2+uu1) + jacobian(v, x3)*(-x1-2*x2-x3+x2^3+uu2);
    F = [sos(L1), sos(-Vdot - L1*(cc - v)),max(abs([u1c; u2c]))<100];
    [sol,vv,QQ] = solvesos(F,1,[],[L1c;u1c;u2c]);
    %solL1 = clean(value(L1c)'*L1v,1e-6);
    %solu = clean(value(uc)'*uv,1e-6);
    solL1 = value(L1c)'*L1v;
    solu1 = value(u1c)'*u1v;
    solu2 = value(u2c)'*u2v;
    sdisplay(solL1)
    sdisplay(solu1)
    
    % fix solu,solL1 search for vc
    sdpvar vc
    [uu1 u1c u1v] = polynomial([x1 x2 x3], k_u, 0);
    [uu2 u2c u2v] = polynomial([x1 x2 x3], k_u, 0);
    [L2 L2c L2v] = polynomial([x1 x2], k_L, 0);
    [L3 L3c L3v] = polynomial([x1 x2], k_L, 0);
    [L4 L4c L4v] = polynomial([x1 x2], k_L, 0);
    [L5 L5c L5v] = polynomial([x1 x2], k_L, 0);
    
    Vdot = jacobian(v, x1)*(x2-x3^2) + jacobian(v, x2)*(x3-x1^2+uu1) + jacobian(v, x3)*(-x1-2*x2-x3+x2^3+uu2);
    F = [sos(L2),sos(L3), sos(-Vdot - solL1*(vc - v)), sos(-(vc-v)+c1*L2), sos(-(vc-v)+c2*L3), sos(-(vc-v)+c3*L4), sos(-(vc-v)+c4*L5),vc>0,max(abs([u1c; u2c]))<100];
    [sol,vv,QQ] = solvesos(F,-vc,[],[u1c;u2c;L2c;L3c;L4c; L5c; vc]);
    %solu = clean(value(uc)'*uv,1e-6);
    solv = value(vc);
    
    cc = solv;
    % smr variables
    solh = value(vc) -v;
    figure(1);hold on;
    hs = char(sdisplay(solh));
    xran=[-8 8 -8 8];
    smrplot(hs,0,xran,[300 50],'y-');
    axis(xran)
    refreshdata; drawnow;
end

figure(1);hold on;
solh = value(vc) -v;
hs = char(sdisplay(solh));
xran=[-8 8 -8 8];
smrplot(hs,0,xran,[300 50],'b-');
refreshdata; drawnow;

cc=16.5615917452;
% find barrier certificates
% init h with CLF
solh = cc - v;
hinit = char(sdisplay(solh));
xran=[-8 8 -8 8 -8 8];
smrplot(hinit,0,xran,[300 50],'m-');
axis(xran)
refreshdata; drawnow;

for ii = 1:20
    ii
    sdpvar htol
    % fix h search for u, L1, L2
    [u1 u1c u1v] = polynomial([x1 x2 x3], k_u, 1);
    [u2 u2c u2v] = polynomial([x1 x2 x3], k_u, 1);
    [L1 L1c L1v] = polynomial([x1 x2 x3], k_L, 0);
    [L2 L2c L2v] = polynomial([x1 x2 x3], k_L, 0);
    
    hdot = jacobian(solh, x1)*(x2-x3^2) + jacobian(solh, x2)*(x3-x1^2+u1) + jacobian(solh, x3)*(-x1-2*x2-x3+x2^3+u2);
    Vdot = jacobian(v, x1)*(x2-x3^2) + jacobian(v, x2)*(x3-x1^2+u1) + jacobian(v, x3)*(-x1-2*x2-x3+x2^3+u2);
    F = [sos(L1), sos(L2), sos(-Vdot + L1*(-solh)), sos(hdot + gamma*solh + L2*(-solh)-htol), htol>=0, max(abs([u1c; u2c]))<=100];
    [sol,vv,QQ] = solvesos(F,-htol,[],[L1c;L2c;u1c;u2c]);
    %solL1 = clean(value(L1c)'*L1v,1e-6);
    %solL2 = clean(value(L2c)'*L2v,1e-6);
    %solu = clean(value(uc)'*uv,1e-6);
    solL1 = value(L1c)'*L1v;
    solL2 = value(L2c)'*L2v;
    solu1 = value(u1c)'*u1v;
    solu2 = value(u2c)'*u2v;
    %sdisplay(solL1)
    %sdisplay(solL2)
    %sdisplay(solu1)
    %sdisplay(solu2)
    
    
    
    % fix u, L1, L2, search for h, L3, L4
    [h hc hv] = polynomial([x1 x2 x3], k_h, 0);
    [L3 L3c L3v] = polynomial([x1 x2 x3], k_L, 0);
    [L4 L4c L4v] = polynomial([x1 x2 x3], k_L, 0);
    [L5 L5c L5v] = polynomial([x1 x2 x3], k_L, 0);
    [L6 L6c L6v] = polynomial([x1 x2 x3], k_L, 0);
    hdot = jacobian(h, x1)*(x2-x3^2) + jacobian(h, x2)*(x3-x1^2+solu1) + jacobian(h, x3)*(-x1-2*x2-x3+x2^3+solu2);
    Vdot = jacobian(v, x1)*(x2-x3^2) + jacobian(v, x2)*(x3-x1^2+solu1) + jacobian(v, x3)*(-x1-2*x2-x3+x2^3+solu2);
    % F = [sos(L3), sos(L4),sos(-Vdot + solL1*(-h)), sos(hdot + gamma*h + solL2*(-h)), sos(-h+c1*L3), sos(-h+c2*L4), sos(-h+c3*L5), sos(-h+c4*L6)];
    F = [sos(L3), sos(L4),sos(L5),sos(L6),sos(-Vdot + solL1*(-h)), sos(hdot + gamma*h + solL2*(-h)), sos(-h+c1*L3), sos(-h+c2*L4), sos(-h+c3*L5), sos(-h+c4*L6)];
    
    [sol,vv,QQ] = solvesos(F,-hc(1)-hc(5)-hc(7)-hc(10),[],[L3c;L4c;L5c;L6c;hc]);
    %solL3 = clean(value(L3c)'*L3v,1e-6);
    %solL4 = clean(value(L4c)'*L4v,1e-6);
    %solh = clean(value(hc)'*hv,1e-6);
    % temph = clean(value(hc)'*hv,1e-6);
    if value(hc(1)) < 1
        break;
    else
        %    solh = clean(value(hc)'*hv,1e-6);
        solh = value(hc)'*hv;
    end
    sdisplay(solh)
    % smr variables
    figure(1);hold on;
    hs = char(sdisplay(solh));
    xran=[-8 8 -8 8 -8 8];
    smrplot(hs,0,xran,[300 50],'m-');
    axis(xran)
    refreshdata; drawnow;
    view(-120,0)
end


figure(1);hold on;
hs = char(sdisplay(solh));
xran=[-8 8 -8 8 -8 8];
smrplot(hs,0,xran,[300 50],'b--');
axis(xran)
refreshdata; drawnow;

%% double check
hdot = jacobian(solh, x1)*(x2-x3^2) + jacobian(solh, x2)*(x3-x1^2+solu1) + jacobian(solh, x3)*(-x1-2*x2-x3+x2^3+solu2);

% solh:  114.3555451+1.4686*x1+7.2121*x2+19.8479*x3-24.5412*x3^2-14.7734*x1^2-26.0129*x1*x2-15.5440*x1*x3-28.3492*x2^2-27.5651*x2*x3
% solu1: -43.0365*x1-92.6311*x2-31.4178*x3
% solu2: -2.2003*x1-8.2927*x2-4.9452*x3
% optc: 13.0124
