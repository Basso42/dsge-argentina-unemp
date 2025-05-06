function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(21, 1);
end
[T_order, T] = unemployment_NK_argentina_1990.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(30, 1);
    residual(1) = (y(39)) - (y(57)*T(1));
    residual(2) = (T(2)*y(31)) - (1);
    residual(3) = (y(45)) - (y(35)-params(10)-params(7)/y(39)+params(1)*(1-params(6))*y(75));
    residual(4) = (y(33)) - ((1-params(6))*y(3)+y(44)*y(34));
    residual(5) = (y(36)) - (T(4)*T(5));
    residual(6) = (y(38)*y(59)*T(8)) - (y(37)-y(7)*(1-params(2)));
    residual(7) = ((1-params(2))*y(73)+params(3)*y(84)*y(66)/y(37)) - (y(31)*y(43));
    residual(8) = (y(59)*y(43)) - (1+T(6)*y(59)*y(43)*T(9)+T(11)*T(12));
    residual(9) = (y(46)) - (y(36)*(1-params(3))*y(54)/y(33)-y(35)+T(2)*(1-params(6))*y(76));
    residual(10) = (params(11)*y(44)^params(8)) - (y(46));
residual(11) = 1-params(14)+params(14)*y(40)-params(19)*y(41)*(y(41)-(steady_state(11)))+T(14)*(y(71)-(steady_state(11)));
    residual(12) = (y(45)*(1-y(58)*params(12))) - (y(46)*y(58)*params(12));
    residual(13) = (y(54)) - (y(40));
    residual(14) = (y(36)) - (y(32)+y(38)+y(47)+y(36)*T(15)+y(34)*T(16));
    residual(15) = (y(34)) - (1-y(33));
    residual(16) = (y(31)) - (y(42)/y(71));
    residual(17) = (y(42)) - (T(17)*T(21)*y(60));
    residual(18) = (y(47)) - ((steady_state(6))*params(9)*y(56));
    residual(19) = (y(48)) - (log(y(36)/y(6)));
    residual(20) = (y(49)) - (log(y(32)/y(2)));
    residual(21) = (y(50)) - (log(T(7)));
    residual(22) = (y(51)) - (y(41)-(steady_state(11)));
    residual(23) = (y(52)) - (y(42)-(steady_state(12)));
    residual(24) = (y(53)) - (y(34)-(steady_state(4)));
    residual(25) = (log(y(55))) - (params(23)*log(y(25))+x(1));
    residual(26) = (log(y(56))) - (params(24)*log(y(26))+x(2));
    residual(27) = (log(y(57))) - (params(25)*log(y(27))+x(3));
    residual(28) = (log(y(59))) - (params(27)*log(y(29))+x(5));
    residual(29) = (log(y(58))) - (params(26)*log(y(28))+x(4));
    residual(30) = (log(y(60))) - (params(28)*log(y(30))+x(6));
end
