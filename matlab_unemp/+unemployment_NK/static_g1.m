function g1 = static_g1(T, y, x, params, T_flag)
% function g1 = static_g1(T, y, x, params, T_flag)
%
% File created by Dynare Preprocessor from .mod file
%
% Inputs:
%   T         [#temp variables by 1]  double   vector of temporary terms to be filled by function
%   y         [M_.endo_nbr by 1]      double   vector of endogenous variables in declaration order
%   x         [M_.exo_nbr by 1]       double   vector of exogenous variables in declaration order
%   params    [M_.param_nbr by 1]     double   vector of parameter values in declaration order
%                                              to evaluate the model
%   T_flag    boolean                 boolean  flag saying whether or not to calculate temporary terms
%
% Output:
%   g1
%

if T_flag
    T = unemployment_NK.static_g1_tt(T, y, x, params);
end
g1 = zeros(34, 34);
g1(1,2)=(-(y(30)*getPowerDeriv(y(2),(-params(4)),1)));
g1(1,9)=1;
g1(1,30)=(-T(1));
g1(2,1)=params(1);
g1(3,5)=(-1);
g1(3,9)=(-params(7))/(y(9)*y(9));
g1(3,15)=1-params(1)*(1-params(6));
g1(4,3)=1-(1-params(6));
g1(4,4)=(-y(14));
g1(4,14)=(-y(4));
g1(5,3)=(-(T(3)*getPowerDeriv(y(3),1-params(3),1)));
g1(5,6)=1;
g1(5,7)=(-(T(4)*params(26)*y(28)*getPowerDeriv(y(7),params(3),1)));
g1(5,28)=(-(T(4)*params(26)*T(2)));
g1(6,7)=(-(1-(1-params(2))));
g1(6,8)=y(32);
g1(6,32)=y(8);
g1(7,1)=(-y(13));
g1(7,6)=params(3)*y(27)/y(7);
g1(7,7)=(-(y(6)*params(3)*y(27)))/(y(7)*y(7));
g1(7,13)=1-params(2)-y(1);
g1(7,27)=y(6)*params(3)/y(7);
g1(8,13)=y(32)-(1+(-y(8))/y(8))*y(32)*params(15)/2;
g1(8,32)=y(13)-(1+(-y(8))/y(8))*params(15)/2*y(13);
g1(9,3)=(-((-(y(6)*(1-params(3))*y(27)))/(y(3)*y(3))));
g1(9,5)=1;
g1(9,6)=(-((1-params(3))*y(27)/y(3)));
g1(9,16)=1-params(1)*(1-params(6));
g1(9,27)=(-(y(6)*(1-params(3))/y(3)));
g1(10,14)=params(11)*getPowerDeriv(y(14),params(8),1);
g1(10,16)=(-1);
g1(11,10)=params(14);
g1(11,11)=(y(11)-(y(11)))*params(1)*params(19)-params(19)*(y(11)-(y(11)));
g1(12,15)=1-y(31)*params(12);
g1(12,16)=(-(y(31)*params(12)));
g1(12,31)=y(15)*(-params(12))-y(16)*params(12);
g1(13,6)=y(20)*(1-params(25))*params(22)*(1-y(18))*getPowerDeriv(y(6),(-params(25)),1);
g1(13,10)=(-1);
g1(13,18)=(-((-(params(23)*getPowerDeriv(y(18),params(24),1)))-T(5)*(-(y(20)*(1-params(25))*params(22)))));
g1(13,20)=T(5)*(1-y(18))*(1-params(25))*params(22);
g1(13,27)=1;
g1(14,6)=y(20)*params(22)*T(15)/(params(23)*params(24))*T(16);
g1(14,18)=(-1);
g1(14,20)=T(16)*params(22)*T(6)/(params(23)*params(24));
g1(15,2)=(-1);
g1(15,4)=(-T(8));
g1(15,6)=1-T(7);
g1(15,8)=(-1);
g1(15,14)=(-(y(4)*params(11)/(1+params(8))*getPowerDeriv(y(14),1+params(8),1)));
g1(15,19)=(-1);
g1(16,3)=1;
g1(16,4)=1;
g1(17,1)=1;
g1(17,11)=(-((-y(12))/(y(11)*y(11))));
g1(17,12)=(-(1/y(11)));
g1(18,6)=(-(params(22)*(1-y(18))*T(15)));
g1(18,17)=1;
g1(18,18)=(-(T(6)*(-params(22))));
g1(19,6)=(-(y(33)*T(9)*T(11)*((y(6))-y(6))/((y(6))*(y(6)))*getPowerDeriv(y(6)/(y(6)),params(17),1)*T(17)));
g1(19,11)=(-(y(33)*T(9)*T(17)*T(12)*(y(12))*((y(11))-y(11))/((y(11))*(y(11)))*getPowerDeriv(y(11)/(y(11)),params(18),1)));
g1(19,12)=1-y(33)*(T(14)*getPowerDeriv(y(12),params(16),1)+T(9)*T(17)*T(10)*T(12));
g1(19,33)=(-(T(9)*T(14)));
g1(20,6)=(-(params(9)*y(29)));
g1(20,19)=1;
g1(20,29)=(-((y(6))*params(9)));
g1(21,20)=1;
g1(21,34)=(-params(20));
g1(22,21)=1;
g1(23,22)=1;
g1(24,23)=1;
g1(25,24)=1;
g1(26,25)=1;
g1(27,26)=1;
g1(28,28)=1/y(28)-params(28)*1/y(28);
g1(29,29)=1/y(29)-params(29)*1/y(29);
g1(30,30)=1/y(30)-params(30)*1/y(30);
g1(31,32)=1/y(32)-params(32)*1/y(32);
g1(32,31)=1/y(31)-params(31)*1/y(31);
g1(33,33)=1/y(33)-params(33)*1/y(33);
g1(34,34)=1/y(34)-params(34)*1/y(34);

end
