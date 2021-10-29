function [mean1,hyp1,delta,rmse] = gpr_xdot1(x,y,xtest,ytest,it,noise,poly_deg)

%%SOS_GP_CHECK_XDOT2 generates the xdot2 value [MEAN] to construct the polynomial function
% In:
%     Xtr_0      double   400  x  2   Input training X
%     dXtr_0     double   400  x  2   Input training Y
% Out:
%     mean1      double   6  x  1    Learned kernel with polynomial m
% Copyright (c) by Huang Hejun (CUHK) under BSD License 
% Last modified: Huang Hejun 2021-05

tic
syms x1 x2;
dxdt2 = 0;
X = [1];

%% Mean function
m1 = {@meanPoly,poly_deg}; 
hyp_m1 = zeros([2*poly_deg 1]);
m2 = {@meanConst}; hyp_m2 = -0.15;
meanfunc = {'meanSum',{m2,m1}}; hyp.mean = [hyp_m2; hyp_m1]; 
%%
% deg = 3;
% m1 = {@meanConst}; hyp_m1 = 0;
% m2 = {@meanLinear}; hyp_m2 = [0;0];
% msu = {'meanSum',{m1,m2}};  hypsu = [hyp_m1; hyp_m2];    % 1+2*x1+3*x2
% mpo = {'meanPow',deg,msu};       hyppo = hypsu;            % third power
% meanfunc = mpo; hyp.mean = hyppo; 

%% Cov function
% sf = 1; ell = 2; 
% cov1 = {@covSEiso}; hyp_cov1 = log([ell;sf/2]); 
% cov2 = {@covConst}; hyp_cov2 = 0; 
% covfunc = {'covSum',{cov1,cov2}}; hyp.cov = [hyp_cov1; hyp_cov2]; 
%%
sf = 0.05; ell = 0.2; 
cov1 = {@covSEiso}; hyp_cov1 = log([ell;sf/2]); 
covfunc = cov1; hyp.cov = hyp_cov1; 

%     covfunc = {'covRQard'}; hyp.cov = log([L;sf]); 
%     covfunc = {'covMaterniso',3}; hyp.cov = log([ell;sf]); % Matern class d=3

%% Lik function
likfunc = @likGauss; sn = noise; hyp.lik = log(sn);

%% Inf function
%     inf_list = {'infGaussLik','infLaplace','infEP','infVB','infKL'};% inference algs
inf_func = {'infGaussLik'};

%%
hyp1 = minimize(hyp, @gp, -it, inf_func, meanfunc, covfunc, likfunc, x, y);

%%
% [ymu, ys2, fmu, fs2] = gp(hyp, inf_func, meanfunc, covfunc, likfunc, x, y, xtest);  
[ymu, ys2, fmu, fs2] = gp(hyp1, inf_func, meanfunc, covfunc, likfunc, x, y, xtest);    
mean1 = hyp1.mean;   
%%
% dxdt2 = (mean1(1)+mean(2)*x1+mean(3)*x2)^deg;
%%
pvar x1 x2
X1 = p2s(monomials(x1,(1:poly_deg)));
X2 = p2s(monomials(x2,(1:poly_deg)));
for i = 1:length(X1)
    X = [X; X1(i); X2(i)];
end
for i = 1:length(X)
    dxdt2 = dxdt2 + X(i)*mean1(i);
end

%%
% sigma = 2*real(sqrt(mean(ys2)));
% c = 0;
% x_error = abs(y - ymu);    
% for n = 1:length(y)
%     % check if the event occurs
%     if x_error(n,1) >= sigma
%         % find the number of occurrences
%         c = c + 1;
%     end
% end    
% delta = c/length(y)
delta = 0;
toc

%%
% % Plot Method 1
% plot3(xtest(:,1),xtest(:,2),ytest(:,1),'b*'); hold on;    
% plot3(xtest(:,1),xtest(:,2),ymu(:,1),'g^'); hold on;
% plot3(xtest(:,1),xtest(:,2),fmu(:,1),'mo'); hold on;

m = size(x,1);
n = size(xtest,1);

% Plot Method 2
figure(800);clf;
Output = [ymu+2*sqrt(ys2);flipdim(ymu-2*sqrt(ys2),1)];
error = abs(ytest-ymu);
rmse = sqrt(sum(error.^2)/n) 
subplot(211);hold on;
fill([(1:n)'; flipdim((1:n)',1)], Output, [0 7 0]/8, 'EdgeColor', [0 7 0]/8);
hold on
plot((1:n)',ymu,'ko','LineWidth',1);
plot((1:n)',ytest, 'r+', 'LineWidth',1);
xlabel('x'); ylabel('y');
legend('2\sigma^2GP','GP predict','real data');
xlim([0 length(x)]); ylim([-1 1])
time1 = toc
txt = ['GPML Time: ' num2str(time1) 's RMSE:' num2str(rmse)];
text(40,-0.5,txt)

% % Plot Method 3
subplot(212);hold on;
syms x1 x2
dXtr_3 = [];
for num = 1:length(xtest(:,1))
    num_0 = vpa(subs(dxdt2,[x1,x2],[xtest(num,1),xtest(num,2)]));
    dXtr_3 = [dXtr_3; num_0];
end
dXtr_3 = reshape(double(dXtr_3),1,[])';
Output_2 = [dXtr_3+2*sqrt(ys2);flipdim(dXtr_3-2*sqrt(ys2),1)];
error_2 = abs(ytest-dXtr_3);
rmse_poly = sqrt(sum(error_2.^2)/n) 

fill([(1:n)'; flipdim((1:n)',1)], Output_2, [0 7 0]/8, 'EdgeColor', [0 7 0]/8);
hold on
plot((1:n)',dXtr_3,'ko','LineWidth',1);
plot((1:n)',ytest, 'r+', 'LineWidth',1);
xlabel('x'); ylabel('y');
legend('2\sigma^2GP','GP predict','real data');
xlim([0 length(x)]); ylim([-1 1])
% time2 = toc
txt = ['Polynomial mean GPML Time: ' num2str(time1) 's RMSE:' num2str(rmse_poly)];
text(40,-0.5,txt)
% error_result = sqrt(sum(ymu-dXtr_3).^2/n)

end