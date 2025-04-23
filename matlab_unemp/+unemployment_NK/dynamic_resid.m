function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
% function residual = dynamic_resid(T, y, x, params, steady_state, it_, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T             [#temp variables by 1]     double   vector of temporary terms to be filled by function
%   y             [#dynamic variables by 1]  double   vector of endogenous variables in the order stored
%                                                     in M_.lead_lag_incidence; see the Manual
%   x             [nperiods by M_.exo_nbr]   double   matrix of exogenous variables (in declaration order)
%                                                     for all simulation periods
%   steady_state  [M_.endo_nbr by 1]         double   vector of steady state values
%   params        [M_.param_nbr by 1]        double   vector of parameter values in declaration order
%   it_           scalar                     double   time period for exogenous variables for which
%                                                     to evaluate the model
%   T_flag        boolean                    boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   residual
%

if T_flag
    T = unemployment_NK.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(34, 1);
    residual(1) = (y(22)) - (y(43)*T(1));
    residual(2) = (T(2)*y(14)) - (1);
    residual(3) = (y(28)) - (y(18)-params(10)-params(7)/y(22)+params(1)*(1-params(6))*y(53));
    residual(4) = (y(16)) - ((1-params(6))*y(2)+y(27)*y(17));
    residual(5) = (y(19)) - (T(4)*T(5));
    residual(6) = (y(21)*y(45)*T(8)) - (y(20)-y(4)*(1-params(2)));
    residual(7) = ((1-params(2))*y(52)+params(3)*y(55)*y(48)/y(20)) - (y(14)*y(26));
    residual(8) = (y(45)*y(26)) - (1+T(6)*y(45)*y(26)*T(9)+T(11)*T(12));
    residual(9) = (y(29)) - (y(19)*(1-params(3))*y(40)/y(16)-y(18)+T(2)*(1-params(6))*y(54));
    residual(10) = (params(11)*y(27)^params(8)) - (y(29));
residual(11) = 1-params(14)+params(14)*y(23)-params(19)*y(24)*(y(24)-(steady_state(11)))+T(14)*(y(51)-(steady_state(11)));
    residual(12) = (y(28)*(1-y(44)*params(12))) - (y(29)*y(44)*params(12));
    residual(13) = (y(40)) - (y(23)-params(23)*y(31)^params(24)-y(33)*(1-params(25))*params(22)*(1-y(31))*T(15));
    residual(14) = ((y(33)*params(22)*T(16)/(params(23)*params(24)))^(1/(params(24)-1))) - (y(31));
    residual(15) = (y(19)) - (y(15)+y(21)+y(32)+y(19)*T(17)+y(17)*T(18));
    residual(16) = (y(17)) - (1-y(16));
    residual(17) = (y(14)) - (y(25)/y(51));
    residual(18) = (y(30)) - (T(16)*params(22)*(1-y(31)));
    residual(19) = (y(25)) - (T(19)*T(23)*y(46));
    residual(20) = (y(32)) - ((steady_state(6))*params(9)*y(42));
    residual(21) = (y(33)) - (params(20)*y(47));
    residual(22) = (y(34)) - (log(y(19)/y(3)));
    residual(23) = (y(35)) - (log(y(15)/y(1)));
    residual(24) = (y(36)) - (log(T(7)));
    residual(25) = (y(37)) - (y(24)-(steady_state(11)));
    residual(26) = (y(38)) - (y(25)-(steady_state(12)));
    residual(27) = (y(39)) - (y(17)-(steady_state(4)));
    residual(28) = (log(y(41))) - (params(28)*log(y(7))+x(it_, 1));
    residual(29) = (log(y(42))) - (params(29)*log(y(8))+x(it_, 2));
    residual(30) = (log(y(43))) - (params(30)*log(y(9))+x(it_, 3));
    residual(31) = (log(y(45))) - (params(32)*log(y(11))+x(it_, 5));
    residual(32) = (log(y(44))) - (params(31)*log(y(10))+x(it_, 4));
    residual(33) = (log(y(46))) - (params(33)*log(y(12))+x(it_, 6));
    residual(34) = (log(y(47))) - (params(34)*log(y(13))+x(it_, 7));

end
