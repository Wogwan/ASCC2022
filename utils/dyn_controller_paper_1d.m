function dxdt = dyn_controller_paper_1d(~,x)
%DYN2D time invariant 2D nonlinear time continous dynamics
% In:
%    t      ~       time (not used)
%    x    2 x N     state
% Out:
%    dxdt 2 x N     state derivative
% Copyright (c) by Huang Hejun (CUHK) under BSD License 
% Last modified: Huang Hejun 2021-05

% From main_total.m 25 line: dotx1 chebyshev approximation result with 4th order remainder
% dxdt(1,:) = x(2,:)-1.0*x(1,:);
% dxdt(2,:) = x(1,:)^2*x(2,:) - 0.38410921204577513909939057157317*x(1,:) + 1.2665468516202070398124490679947*x(1,:)^2 + 0.058711157666221952533547323582752*x(1,:)^3 - 0.28781069452828345056616399233462*x(1,:)^4 - 0.29722062523126249744542803910008;

dxdt(1,:) = -x(1,:)+1.0*x(2,:);
dxdt(2,:) = x(1,:)*x(2,:)-x(2,:)-0.6412404259490610917519385717848*x(1,:)+0.18930328655019243752930277777422*x(1,:)^2+0.14207824160065500533560393873982*x(1,:)^3+0.034401381209803084794253259638531*x(1,:)^4+0.043589540943100857361969246994704;

end