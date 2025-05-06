function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = unemployment_NK_argentina_1990.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(30, 1);
    residual(1) = (y(9)) - (y(27)*T(1));
    residual(2) = (params(1)*y(1)) - (1);
    residual(3) = (y(15)) - (y(5)-params(10)-params(7)/y(9)+y(15)*params(1)*(1-params(6)));
    residual(4) = (y(3)) - ((1-params(6))*y(3)+y(14)*y(4));
    residual(5) = (y(6)) - (T(3)*T(4));
    residual(6) = (y(8)*y(29)) - (y(7)-y(7)*(1-params(2)));
    residual(7) = ((1-params(2))*y(13)+y(6)*params(3)*y(24)/y(7)) - (y(1)*y(13));
    residual(8) = (y(29)*y(13)) - (1+params(15)/2*y(29)*y(13)*(1+(-y(8))/y(8)));
    residual(9) = (y(16)) - (y(6)*(1-params(3))*y(24)/y(3)-y(5)+params(1)*(1-params(6))*y(16));
    residual(10) = (params(11)*y(14)^params(8)) - (y(16));
residual(11) = 1-params(14)+params(14)*y(10)-params(19)*y(11)*(y(11)-(y(11)))+(y(11)-(y(11)))*y(11)*params(1)*params(19);
    residual(12) = (y(15)*(1-y(28)*params(12))) - (y(16)*y(28)*params(12));
    residual(13) = (y(24)) - (y(10));
    residual(14) = (y(6)) - (y(2)+y(8)+y(17)+y(6)*T(5)+y(4)*T(6));
    residual(15) = (y(4)) - (1-y(3));
    residual(16) = (y(1)) - (y(12)/y(11));
    residual(17) = (y(12)) - (T(7)*T(12)*y(30));
    residual(18) = (y(17)) - ((y(6))*params(9)*y(26));
residual(19) = y(18);
residual(20) = y(19);
residual(21) = y(20);
    residual(22) = (y(21)) - (y(11)-(y(11)));
    residual(23) = (y(22)) - (y(12)-(y(12)));
    residual(24) = (y(23)) - (y(4)-(y(4)));
    residual(25) = (log(y(25))) - (log(y(25))*params(23)+x(1));
    residual(26) = (log(y(26))) - (log(y(26))*params(24)+x(2));
    residual(27) = (log(y(27))) - (log(y(27))*params(25)+x(3));
    residual(28) = (log(y(29))) - (log(y(29))*params(27)+x(5));
    residual(29) = (log(y(28))) - (log(y(28))*params(26)+x(4));
    residual(30) = (log(y(30))) - (log(y(30))*params(28)+x(6));
end
