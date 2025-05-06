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
    T = unemployment_NK_argentina_1990.static_g1_tt(T, y, x, params);
end
g1 = zeros(30, 30);
g1(1,2)=(-(y(27)*getPowerDeriv(y(2),(-params(4)),1)));
g1(1,9)=1;
g1(1,27)=(-T(1));
g1(2,1)=params(1);
g1(3,5)=(-1);
g1(3,9)=(-params(7))/(y(9)*y(9));
g1(3,15)=1-params(1)*(1-params(6));
g1(4,3)=1-(1-params(6));
g1(4,4)=(-y(14));
g1(4,14)=(-y(4));
g1(5,3)=(-(T(3)*getPowerDeriv(y(3),1-params(3),1)));
g1(5,6)=1;
g1(5,7)=(-(T(4)*params(21)*y(25)*getPowerDeriv(y(7),params(3),1)));
g1(5,25)=(-(T(4)*params(21)*T(2)));
g1(6,7)=(-(1-(1-params(2))));
g1(6,8)=y(29);
g1(6,29)=y(8);
g1(7,1)=(-y(13));
g1(7,6)=params(3)*y(24)/y(7);
g1(7,7)=(-(y(6)*params(3)*y(24)))/(y(7)*y(7));
g1(7,13)=1-params(2)-y(1);
g1(7,24)=y(6)*params(3)/y(7);
g1(8,13)=y(29)-(1+(-y(8))/y(8))*y(29)*params(15)/2;
g1(8,29)=y(13)-(1+(-y(8))/y(8))*params(15)/2*y(13);
g1(9,3)=(-((-(y(6)*(1-params(3))*y(24)))/(y(3)*y(3))));
g1(9,5)=1;
g1(9,6)=(-((1-params(3))*y(24)/y(3)));
g1(9,16)=1-params(1)*(1-params(6));
g1(9,24)=(-(y(6)*(1-params(3))/y(3)));
g1(10,14)=params(11)*getPowerDeriv(y(14),params(8),1);
g1(10,16)=(-1);
g1(11,10)=params(14);
g1(11,11)=(y(11)-(y(11)))*params(1)*params(19)-params(19)*(y(11)-(y(11)));
g1(12,15)=1-y(28)*params(12);
g1(12,16)=(-(y(28)*params(12)));
g1(12,28)=y(15)*(-params(12))-y(16)*params(12);
g1(13,10)=(-1);
g1(13,24)=1;
g1(14,2)=(-1);
g1(14,4)=(-T(6));
g1(14,6)=1-T(5);
g1(14,8)=(-1);
g1(14,14)=(-(y(4)*params(11)/(1+params(8))*getPowerDeriv(y(14),1+params(8),1)));
g1(14,17)=(-1);
g1(15,3)=1;
g1(15,4)=1;
g1(16,1)=1;
g1(16,11)=(-((-y(12))/(y(11)*y(11))));
g1(16,12)=(-(1/y(11)));
g1(17,6)=(-(y(30)*T(7)*T(9)*((y(6))-y(6))/((y(6))*(y(6)))*getPowerDeriv(y(6)/(y(6)),params(17),1)*T(13)));
g1(17,11)=(-(y(30)*T(7)*T(13)*T(10)*(y(12))*((y(11))-y(11))/((y(11))*(y(11)))*getPowerDeriv(y(11)/(y(11)),params(18),1)));
g1(17,12)=1-y(30)*(T(12)*getPowerDeriv(y(12),params(16),1)+T(7)*T(13)*T(8)*T(10));
g1(17,30)=(-(T(7)*T(12)));
g1(18,6)=(-(params(9)*y(26)));
g1(18,17)=1;
g1(18,26)=(-((y(6))*params(9)));
g1(19,18)=1;
g1(20,19)=1;
g1(21,20)=1;
g1(22,21)=1;
g1(23,22)=1;
g1(24,23)=1;
g1(25,25)=1/y(25)-params(23)*1/y(25);
g1(26,26)=1/y(26)-params(24)*1/y(26);
g1(27,27)=1/y(27)-params(25)*1/y(27);
g1(28,29)=1/y(29)-params(27)*1/y(29);
g1(29,28)=1/y(28)-params(26)*1/y(28);
g1(30,30)=1/y(30)-params(28)*1/y(30);

end
