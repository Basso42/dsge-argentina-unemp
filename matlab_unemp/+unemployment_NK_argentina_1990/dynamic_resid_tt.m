function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
% function T = dynamic_resid_tt(T, y, x, params, steady_state, it_)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double  vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double  vector of endogenous variables in the order stored
%                                                    in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double  matrix of exogenous variables (in declaration order)
%                                                    for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double  vector of steady state values
%   params        [M_.param_nbr by 1]        double  vector of parameter values in declaration order
%   it_           scalar                     double  time period for exogenous variables for which
%                                                    to evaluate the model
%
% Output:
%   T           [#temp variables by 1]       double  vector of temporary terms
%

assert(length(T) >= 21);

T(1) = y(14)^(-params(4));
T(2) = params(1)*y(45)/y(21);
T(3) = y(4)^params(3);
T(4) = params(21)*y(37)*T(3);
T(5) = y(15)^(1-params(3));
T(6) = params(15)/2;
T(7) = y(20)/y(5);
T(8) = 1-T(6)*(T(7)-1)^2;
T(9) = 1+y(20)*(3*y(20)/y(5)-4)/y(5);
T(10) = 1-y(44)/y(20);
T(11) = params(15)*y(47)*T(2)*y(51)*T(10);
T(12) = (y(44)/y(20))^2;
T(13) = y(43)*y(45)*params(1)*params(19)/y(21)/y(18);
T(14) = T(13)*y(46);
T(15) = params(19)/2*(y(23)-(steady_state(11)))^2;
T(16) = params(11)/(1+params(8))*y(26)^(1+params(8));
T(17) = y(6)^params(16);
T(18) = (steady_state(12))*(y(23)/(steady_state(11)))^params(18);
T(19) = (y(18)/(steady_state(6)))^params(17);
T(20) = T(18)*T(19);
T(21) = T(20)^(1-params(16));

end
