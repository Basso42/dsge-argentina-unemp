function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 23
    T = [T; NaN(23 - size(T, 1), 1)];
end
T(1) = y(36)^(-params(4));
T(2) = params(1)*y(77)/y(43);
T(3) = y(7)^params(3);
T(4) = params(26)*y(62)*T(3);
T(5) = y(37)^(1-params(3));
T(6) = params(15)/2;
T(7) = y(42)/y(8);
T(8) = 1-T(6)*(T(7)-1)^2;
T(9) = 1+y(42)*(3*y(42)/y(8)-4)/y(8);
T(10) = 1-y(76)/y(42);
T(11) = params(15)*y(81)*T(2)*y(100)*T(10);
T(12) = (y(76)/y(42))^2;
T(13) = y(74)*y(77)*params(1)*params(19)/y(43)/y(40);
T(14) = T(13)*y(79);
T(15) = y(40)^(-params(25));
T(16) = y(40)^(1-params(25));
T(17) = params(19)/2*(y(45)-(steady_state(11)))^2;
T(18) = params(11)/(1+params(8))*y(48)^(1+params(8));
T(19) = y(12)^params(16);
T(20) = (steady_state(12))*(y(45)/(steady_state(11)))^params(18);
T(21) = (y(40)/(steady_state(6)))^params(17);
T(22) = T(20)*T(21);
T(23) = T(22)^(1-params(16));
end
