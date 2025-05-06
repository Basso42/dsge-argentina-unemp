function T = static_resid_tt(T, y, x, params)
% function T = static_resid_tt(T, y, x, params)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%
% Output:
%   T         [#temp variables by 1]  double   vector of temporary terms
%

assert(length(T) >= 12);

T(1) = y(2)^(-params(4));
T(2) = y(7)^params(3);
T(3) = params(21)*y(25)*T(2);
T(4) = y(3)^(1-params(3));
T(5) = params(19)/2*(y(11)-(y(11)))^2;
T(6) = params(11)/(1+params(8))*y(14)^(1+params(8));
T(7) = y(12)^params(16);
T(8) = (y(11)/(y(11)))^params(18);
T(9) = (y(12))*T(8);
T(10) = (y(6)/(y(6)))^params(17);
T(11) = T(9)*T(10);
T(12) = T(11)^(1-params(16));

end
