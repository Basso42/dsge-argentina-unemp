function [y, T] = dynamic_10(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(60)=y(38)-(steady_state(4));
  y(59)=y(46)-(steady_state(12));
  y(58)=y(45)-(steady_state(11));
  y(57)=log(y(42)/y(8));
  y(56)=log(y(36)/y(2));
  y(55)=log(y(40)/y(6));
  y(51)=T(12)*params(22)*(1-y(52));
end
