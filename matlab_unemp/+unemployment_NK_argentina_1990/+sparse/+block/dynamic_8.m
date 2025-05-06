function [y, T] = dynamic_8(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(53)=y(34)-(steady_state(4));
  y(52)=y(42)-(steady_state(12));
  y(51)=y(41)-(steady_state(11));
  y(50)=log(y(38)/y(8));
  y(49)=log(y(32)/y(2));
  y(48)=log(y(36)/y(6));
end
