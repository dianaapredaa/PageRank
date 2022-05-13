% Copyright Preda Diana 314CA 2021 - 2022

function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1

  % calculam parametrii a si b
  b = val1/(val1-val2);
  a = 1 / (val2 - val1);

  % stiind intervalul, calculam y
  if x > val1 && x < val2
    y = a * x + b;
  endif
  if x < val1 && x >= 0
    y = 0;
  endif
  if x >= val2 && x <= 1
    y = 1;
  endif
  endfunction
