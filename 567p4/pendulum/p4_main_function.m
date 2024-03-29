% function [coe,bar_exist,region,sys_d2] = p4_main_function(k)
%%
close all;clear all; clc;
k = 1; % Check first Iteration?
if k == 2
    sosaddpath
end

syms x1 x2;
%% Collect data
sys = p4_system_formulate;
sys.f = p4_gp;
%% Check Lyapunov sublevel set function
sys = p4_s1_lya_sublevelset(sys);
%% Check permissive barrier function and optimal output
% sys = s2_opt_barrier(sys);
[opt_input, sys] = p4_s2_opt_barrier(sys);
bar_flag = sys.exist_bar;
%% Check permissive Lyapunov function
if isequal(bar_flag,1)
    % [opt_input, ~] = s3_opt_lyapunov(sys);
    [coe, fac] = coeffs(p2s(opt_input));
    coe = double(coe);
    fac = char(fac);
    save('..\res\mat\gp_coe.mat','coe')
    mid_ = sys.perm_b;
    mid_ = p2s(mid_);
    [region, sys_bc] = coeffs(mid_);
    region = double(region);
    %         sys.exist_bar = 1;
else
    %         sys.exist_bar = 0;
    mid_ = sys.cv-(x1^2+x2^2+x1*x2);
    [region, sys_bc] = coeffs(mid_);
    region = double(region);
    if isequal(opt_input,0)
        load ..\res\mat\gp_coe.mat
    else
        [coe, fac] = coeffs(p2s(opt_input));
        coe = double(coe);
    end
end
bar_exist = sys.exist_bar;
mid_sys_f = sys.f2;
[sys_d2, sys_fac] = coeffs(mid_sys_f);
sys_d2 = double(sys_d2);
% end
fprintf('END\n');
% end