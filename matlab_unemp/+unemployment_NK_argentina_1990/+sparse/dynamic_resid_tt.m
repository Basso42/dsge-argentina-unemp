function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 21
    T = [T; NaN(21 - size(T, 1), 1)];
end
T(1) = y(32)^(-params(4));
T(2) = params(1)*y(69)/y(39);
T(3) = y(7)^params(3);
T(4) = params(21)*y(55)*T(3);
T(5) = y(33)^(1-params(3));
T(6) = params(15)/2;
T(7) = y(38)/y(8);
T(8) = 1-T(6)*(T(7)-1)^2;
T(9) = 1+y(38)*(3*y(38)/y(8)-4)/y(8);
T(10) = 1-y(68)/y(38);
T(11) = params(15)*y(73)*T(2)*y(89)*T(10);
T(12) = (y(68)/y(38))^2;
T(13) = y(66)*y(69)*params(1)*params(19)/y(39)/y(36);
T(14) = T(13)*y(71);
T(15) = params(19)/2*(y(41)-(steady_state(11)))^2;
T(16) = params(11)/(1+params(8))*y(44)^(1+params(8));
T(17) = y(12)^params(16);
T(18) = (steady_state(12))*(y(41)/(steady_state(11)))^params(18);
T(19) = (y(36)/(steady_state(6)))^params(17);
T(20) = T(18)*T(19);
T(21) = T(20)^(1-params(16));
end
