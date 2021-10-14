%%
clear all;
dbstop if error
format long

%%
syms x1 x2
dttr = 0.01;                                               % Recording step size for taining data (default = 0.3)
Ttr = 10;                                                 % Simulation time for training per starting point (default = 3)
ntr = floor(Ttr/dttr);
noise = 0.00001;                                             % Obervation noise
sn = noise*[1 1]';                                        % Observation noise (default = 1e-1)
it = 600;
%     it = real(size(Xtr_1)/300*200);
poly_deg = 4;
dxdt2 = 0;
X = [1];
m = 0.15;
g = 9.8;
l = 0.5;
miu = 0.05;

%% Chebyshev interpolants value
tic
sz = 6;
deg = 4;
f2_p = -miu/(m*l^2)*x2;
f2_np = g/l*sin(x1);
f2 = f2_p + f2_np;
y = chebfun(char(f2_np),[-sz,sz],'splitting','on'); % Modified here with different non-polynomial g
y_deg = minimax(y,deg); c_deg = chebcoeffs(y_deg);
T = chebyshevT([0:deg],x1);
f2_mid = vpa(T*c_deg);
x_change = x1/sz;
f2_appro_data = subs(f2_mid,x1,x_change);
f2_appro = f2_appro_data + f2_p;
% g_error = g - g_appro;
% x = [(-2:0.04:2)'];
% y = double(subs(g_error,x1,x));
% xtest = (-2:0.1:2)';
% ytest = double(subs(g_error,x1,xtest));
toc

%%
% [~,f,g] = sos_model('2d_1');                              % Obtain the original funciton
% dotx0 = f;
% dotx1 = f+g;

% Set parameters
dXtr_0 = [];                                              % Collecting training model for learning the difference in real and approximated dynamic systems
Xtr_0 = [];                                               % Collecting the Xtr_1 = [x1 x2] data by ode45 with setting
x0tr = [-0.5 -0.4; 0.2 -0.4];
% x0test = [; ];

E = 2;                                                    % Dimensions of the state space
dynt = @(t,x) dyn_65_test_original(0,x);                                 % dynamical system to be learned
dyn = @(x) dynt(0,x);                                     % time independent handle to dynamics

% Generate Training data
Nx0tr = size(x0tr,2)/2;
for i = 1:length(x0tr(1,:))
    if i == 1
        [t,xtr] = ode45(dynt,0:dttr:Ttr,x0tr(:,i)'); xtr = xtr';                                     % obtain the trajectories from the ODE45 with given sample time and given sample time-step
        x = xtr(:,1:end-1)';
        dtr = (xtr(:,2:end)-xtr(:,1:end-1))/dttr;
%         noise_over_measurement = mvnrnd(zeros(E,1),diag(sn.^2),ntr)';                                                 % Obtain the xdot not directly, but with approximated differential method
%         real_dtr = dtr + noise_over_measurement;
%         real_dtr = dtr; 
        g_error = double(subs(f2_appro,{x1,x2},{x(:,1),x(:,2)}));
        y = dtr(2,:)'-g_error;
    elseif i == 2
        [t,xtr] = ode45(dynt,0:dttr:Ttr,x0tr(:,i)'); xtr = xtr';
        xtest = xtr(:,1:end-1)';
        dtr = (xtr(:,2:end)-xtr(:,1:end-1))/dttr;
%         noise_over_measurement = mvnrnd(zeros(E,1),diag(sn.^2),ntr)';                                                 % Obtain the xdot not directly, but with approximated differential method
%         real_dtr = dtr + noise_over_measurement;
%         real_dtr = dtr; 
        g_error = double(subs(f2_appro,{x1,x2},{xtest(:,1),xtest(:,2)}));
        ytest = dtr(2,:)'-g_error;
    end
end

%%
% % [~,f,g] = sos_model('2d_1');                              % Obtain the original funciton
% % dotx0 = f;
% % dotx1 = f+g;
% 
% % Set parameters
% dXtr_0 = [];                                              % Collecting training model for learning the difference in real and approximated dynamic systems
% Xtr_0 = [];                                               % Collecting the Xtr_1 = [x1 x2] data by ode45 with setting
% x0tr = [-0.5 -0.4; 0.2 -0.4];
% % x0test = [; ];
% 
% E = 2;                                                    % Dimensions of the state space
% dynt = @(t,x) dyn2D(0,x);                                 % dynamical system to be learned
% dyn = @(x) dynt(0,x);                                     % time independent handle to dynamics
% grid_min = 2*[-1.0;-1.0]; grid_max = 2*[1.0;1.0];         % Checking grid
% 
% % Generate Training data
% Nx0tr = size(x0tr,2)/2;
% for i = 1:length(x0tr(1,:))
%     if i == 1
%         [t,xtr] = ode45(dynt,0:dttr:Ttr,x0tr(:,i)'); xtr = xtr';                                     % obtain the trajectories from the ODE45 with given sample time and given sample time-step
%         x = xtr(:,1:end-1)';
%         dtr = (xtr(:,2:end)-xtr(:,1:end-1))/dttr;
% %         noise_over_measurement = mvnrnd(zeros(E,1),diag(sn.^2),ntr)';                                                 % Obtain the xdot not directly, but with approximated differential method
% %         real_dtr = dtr + noise_over_measurement;
%         real_dtr = dtr; 
%         y = real_dtr(2,:)';
%     elseif i == 2
%         [t,xtr] = ode45(dynt,0:dttr:Ttr,x0tr(:,i)'); xtr = xtr';
%         xtest = xtr(:,1:end-1)';
%         dtr = (xtr(:,2:end)-xtr(:,1:end-1))/dttr;
% %         noise_over_measurement = mvnrnd(zeros(E,1),diag(sn.^2),ntr)';                                                 % Obtain the xdot not directly, but with approximated differential method
% %         real_dtr = dtr + noise_over_measurement;
%         real_dtr = dtr; 
%         ytest = real_dtr(2,:)';
%     end
% end

%%
[mean1,hyp1,delta,rmse] = gpr_xdot2(x,y,xtest,ytest,it,noise,poly_deg);            % GP learning for the xdot2 dynamic systems
pvar x1 x2
X1 = p2s(monomials(x1,(0:poly_deg)));
X2 = p2s(monomials(x2,(0:poly_deg)));
for i = 2:length(X1)
    X = [X; X1(i); X2(i)];
end
for i = 1:length(X)
    dxdt2 = vpa(dxdt2 + X(i)*mean1(i));
end

g_learn = f2_appro + dxdt2
figure(2); clf; syms x1 x2;
y1 = double(subs(g_learn,{x1,x2},{xtest(:,1),xtest(:,2)}));
plot3(xtest(:,1),xtest(:,2),y1(:,1),'b*'); hold on;
y2 = double(subs(f2,{x1,x2},{xtest(:,1),xtest(:,2)}));
plot3(xtest(:,1),xtest(:,2),y2(:,1),'ro'); hold on;

% g_chen = x1^2*x2-0.000006835767242-0.499957335901158*x1-0.125778690105319*x1^2+0.219390279834309*x1^3+0.220632156887092*x1^4+0.716967859965359*x1^5;
% g_chen = g_appro-0.000012375514062-0.500513008926802*x1+0.000542745343764*x2-0.119189589668064*x1^2-0.042173724594621*x1*x2+0.040714585039343*x2^2+0.305748528980397*x1^3+0.536554408293197*x1^2*x2+0.091448317009191*x1*x2^2-0.100083169093395*x2^3;
% g_chen = x1^2*x2-0.000007031474139-0.500009736044418*x1+0.126057255453549*x1^2+0.103008552092872*x1^3-0.168853172050168 *x1^4+0.264932312148793*x1^5;
% y3 = double(subs(g_chen,{x1,x2},{xtest(:,1),xtest(:,2)}));
% plot3(xtest(:,1),xtest(:,2),y3(:,1),'m^'); hold on;