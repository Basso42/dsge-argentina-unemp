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
    T = unemployment_NK_argentina_1990.dynamic_resid_tt(T, y, x, params, steady_state, it_);
end
residual = zeros(30, 1);
    residual(1) = (y(21)) - (y(39)*T(1));
    residual(2) = (T(2)*y(13)) - (1);
    residual(3) = (y(27)) - (y(17)-params(10)-params(7)/y(21)+params(1)*(1-params(6))*y(48));
    residual(4) = (y(15)) - ((1-params(6))*y(2)+y(26)*y(16));
    residual(5) = (y(18)) - (T(4)*T(5));
    residual(6) = (y(20)*y(41)*T(8)) - (y(19)-y(4)*(1-params(2)));
    residual(7) = ((1-params(2))*y(47)+params(3)*y(50)*y(43)/y(19)) - (y(13)*y(25));
    residual(8) = (y(41)*y(25)) - (1+T(6)*y(41)*y(25)*T(9)+T(11)*T(12));
    residual(9) = (y(28)) - (y(18)*(1-params(3))*y(36)/y(15)-y(17)+T(2)*(1-params(6))*y(49));
    residual(10) = (params(11)*y(26)^params(8)) - (y(28));
residual(11) = 1-params(14)+params(14)*y(22)-params(19)*y(23)*(y(23)-(steady_state(11)))+T(14)*(y(46)-(steady_state(11)));
    residual(12) = (y(27)*(1-y(40)*params(12))) - (y(28)*y(40)*params(12));
    residual(13) = (y(36)) - (y(22));
    residual(14) = (y(18)) - (y(14)+y(20)+y(29)+y(18)*T(15)+y(16)*T(16));
    residual(15) = (y(16)) - (1-y(15));
    residual(16) = (y(13)) - (y(24)/y(46));
    residual(17) = (y(24)) - (T(17)*T(21)*y(42));
    residual(18) = (y(29)) - ((steady_state(6))*params(9)*y(38));
    residual(19) = (y(30)) - (log(y(18)/y(3)));
    residual(20) = (y(31)) - (log(y(14)/y(1)));
    residual(21) = (y(32)) - (log(T(7)));
    residual(22) = (y(33)) - (y(23)-(steady_state(11)));
    residual(23) = (y(34)) - (y(24)-(steady_state(12)));
    residual(24) = (y(35)) - (y(16)-(steady_state(4)));
    residual(25) = (log(y(37))) - (params(23)*log(y(7))+x(it_, 1));
    residual(26) = (log(y(38))) - (params(24)*log(y(8))+x(it_, 2));
    residual(27) = (log(y(39))) - (params(25)*log(y(9))+x(it_, 3));
    residual(28) = (log(y(41))) - (params(27)*log(y(11))+x(it_, 5));
    residual(29) = (log(y(40))) - (params(26)*log(y(10))+x(it_, 4));
    residual(30) = (log(y(42))) - (params(28)*log(y(12))+x(it_, 6));

end
