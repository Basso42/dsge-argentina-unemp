function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(1) = y(2)^(-params(4));
T(2) = y(7)^params(3);
T(3) = params(21)*y(25)*T(2);
T(4) = y(3)^(1-params(3));
T(5) = params(19)/2*(y(11)-(y(11)))^2;
T(6) = params(11)/(1+params(8))*y(14)^(1+params(8));
T(7) = y(12)^params(16);
T(8) = (y(11)/(y(11)))^params(18);
T(9) = (y(12))*T(8);
T(10) = (y(6)/(y(6)))^params(17);
T(11) = T(9)*T(10);
T(12) = T(11)^(1-params(16));
end
