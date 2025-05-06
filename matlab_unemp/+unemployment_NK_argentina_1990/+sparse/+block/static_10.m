function [y, T] = static_10(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(23)=y(4)-(y(4));
  y(22)=y(12)-(y(12));
  y(21)=y(11)-(y(11));
end
