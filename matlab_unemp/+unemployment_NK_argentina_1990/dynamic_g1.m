function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
% function g1 = dynamic_g1(T, y, x, params, steady_state, it_, T_flag)
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
%   g1
%

if T_flag
    T = unemployment_NK_argentina_1990.dynamic_g1_tt(T, y, x, params, steady_state, it_);
end
g1 = zeros(30, 57);
g1(1,14)=(-(y(39)*getPowerDeriv(y(14),(-params(4)),1)));
g1(1,21)=1;
g1(1,39)=(-T(1));
g1(2,13)=T(2);
g1(2,21)=y(13)*T(23);
g1(2,45)=y(13)*params(1)/y(21);
g1(3,17)=(-1);
g1(3,21)=(-params(7))/(y(21)*y(21));
g1(3,27)=1;
g1(3,48)=(-(params(1)*(1-params(6))));
g1(4,2)=(-(1-params(6)));
g1(4,15)=1;
g1(4,16)=(-y(26));
g1(4,26)=(-y(16));
g1(5,15)=(-(T(4)*getPowerDeriv(y(15),1-params(3),1)));
g1(5,18)=1;
g1(5,4)=(-(T(5)*params(21)*y(37)*getPowerDeriv(y(4),params(3),1)));
g1(5,37)=(-(T(5)*params(21)*T(3)));
g1(6,4)=1-params(2);
g1(6,19)=(-1);
g1(6,5)=y(20)*y(41)*(-(T(6)*(-y(20))/(y(5)*y(5))*2*(T(7)-1)));
g1(6,20)=y(41)*T(8)+y(20)*y(41)*(-(T(6)*2*(T(7)-1)*1/y(5)));
g1(6,41)=y(20)*T(8);
g1(7,13)=(-y(25));
g1(7,43)=params(3)*y(50)/y(19);
g1(7,19)=(-(params(3)*y(50)*y(43)))/(y(19)*y(19));
g1(7,25)=(-y(13));
g1(7,47)=1-params(2);
g1(7,50)=params(3)*y(43)/y(19);
g1(8,5)=(-(T(6)*y(41)*y(25)*(y(5)*y(20)*(-(3*y(20)))/(y(5)*y(5))-y(20)*(3*y(20)/y(5)-4))/(y(5)*y(5))));
g1(8,20)=(-(T(6)*y(41)*y(25)*(3*y(20)/y(5)-4+y(20)*3/y(5))/y(5)+T(12)*params(15)*y(47)*T(2)*y(51)*(-((-y(44))/(y(20)*y(20))))+T(11)*(-y(44))/(y(20)*y(20))*2*y(44)/y(20)));
g1(8,44)=(-(T(12)*params(15)*y(47)*T(2)*y(51)*(-(1/y(20)))+T(11)*2*y(44)/y(20)*1/y(20)));
g1(8,21)=(-(T(12)*T(10)*params(15)*y(47)*y(51)*T(23)));
g1(8,45)=(-(T(12)*T(10)*params(15)*y(47)*y(51)*params(1)/y(21)));
g1(8,25)=y(41)-T(9)*y(41)*T(6);
g1(8,47)=(-(T(12)*T(10)*params(15)*T(2)*y(51)));
g1(8,41)=y(25)-T(9)*T(6)*y(25);
g1(8,51)=(-(T(12)*T(10)*params(15)*T(2)*y(47)));
g1(9,15)=(-((-(y(18)*(1-params(3))*y(36)))/(y(15)*y(15))));
g1(9,17)=1;
g1(9,18)=(-((1-params(3))*y(36)/y(15)));
g1(9,21)=(-(y(49)*(1-params(6))*T(23)));
g1(9,45)=(-(y(49)*(1-params(6))*params(1)/y(21)));
g1(9,28)=1;
g1(9,49)=(-(T(2)*(1-params(6))));
g1(9,36)=(-(y(18)*(1-params(3))/y(15)));
g1(10,26)=params(11)*getPowerDeriv(y(26),params(8),1);
g1(10,28)=(-1);
g1(11,18)=(y(46)-(steady_state(11)))*y(46)*(-(y(43)*y(45)*params(1)*params(19)/y(21)))/(y(18)*y(18));
g1(11,43)=(y(46)-(steady_state(11)))*y(46)*y(45)*params(1)*params(19)/y(21)/y(18);
g1(11,21)=(y(46)-(steady_state(11)))*y(46)*y(43)*(-(y(45)*params(1)*params(19)))/(y(21)*y(21))/y(18);
g1(11,45)=(y(46)-(steady_state(11)))*y(46)*y(43)*params(1)*params(19)/y(21)/y(18);
g1(11,22)=params(14);
g1(11,23)=(-(params(19)*y(23)+params(19)*(y(23)-(steady_state(11)))));
g1(11,46)=T(14)+T(13)*(y(46)-(steady_state(11)));
g1(12,27)=1-y(40)*params(12);
g1(12,28)=(-(y(40)*params(12)));
g1(12,40)=y(27)*(-params(12))-y(28)*params(12);
g1(13,22)=(-1);
g1(13,36)=1;
g1(14,14)=(-1);
g1(14,16)=(-T(16));
g1(14,18)=1-T(15);
g1(14,20)=(-1);
g1(14,23)=(-(y(18)*params(19)/2*2*(y(23)-(steady_state(11)))));
g1(14,26)=(-(y(16)*params(11)/(1+params(8))*getPowerDeriv(y(26),1+params(8),1)));
g1(14,29)=(-1);
g1(15,15)=1;
g1(15,16)=1;
g1(16,13)=1;
g1(16,46)=(-((-y(24))/(y(46)*y(46))));
g1(16,24)=(-(1/y(46)));
g1(17,18)=(-(y(42)*T(17)*T(18)*1/(steady_state(6))*getPowerDeriv(y(18)/(steady_state(6)),params(17),1)*T(22)));
g1(17,23)=(-(y(42)*T(17)*T(22)*T(19)*(steady_state(12))*1/(steady_state(11))*getPowerDeriv(y(23)/(steady_state(11)),params(18),1)));
g1(17,6)=(-(y(42)*T(21)*getPowerDeriv(y(6),params(16),1)));
g1(17,24)=1;
g1(17,42)=(-(T(17)*T(21)));
g1(18,29)=1;
g1(18,38)=(-((steady_state(6))*params(9)));
g1(19,3)=(-((-y(18))/(y(3)*y(3))/(y(18)/y(3))));
g1(19,18)=(-(1/y(3)/(y(18)/y(3))));
g1(19,30)=1;
g1(20,1)=(-((-y(14))/(y(1)*y(1))/(y(14)/y(1))));
g1(20,14)=(-(1/y(1)/(y(14)/y(1))));
g1(20,31)=1;
g1(21,5)=(-((-y(20))/(y(5)*y(5))/T(7)));
g1(21,20)=(-(1/y(5)/T(7)));
g1(21,32)=1;
g1(22,23)=(-1);
g1(22,33)=1;
g1(23,24)=(-1);
g1(23,34)=1;
g1(24,16)=(-1);
g1(24,35)=1;
g1(25,7)=(-(params(23)*1/y(7)));
g1(25,37)=1/y(37);
g1(25,52)=(-1);
g1(26,8)=(-(params(24)*1/y(8)));
g1(26,38)=1/y(38);
g1(26,53)=(-1);
g1(27,9)=(-(params(25)*1/y(9)));
g1(27,39)=1/y(39);
g1(27,54)=(-1);
g1(28,11)=(-(params(27)*1/y(11)));
g1(28,41)=1/y(41);
g1(28,56)=(-1);
g1(29,10)=(-(params(26)*1/y(10)));
g1(29,40)=1/y(40);
g1(29,55)=(-1);
g1(30,12)=(-(params(28)*1/y(12)));
g1(30,42)=1/y(42);
g1(30,57)=(-1);

end
