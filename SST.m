% Copyright Preda Diana 314CA 2021 - 2022

function x = SST(A, b)
  % Functie de rezolvare a unui sistem superior-triunghiular

  % initializez suma
  sum = 0;

  % se calculeaza marimea mat A
  [N N] = size(A);
  x(N) = b(N) / A(N, N);
  
  i = N;
  % rezolvarea sistemelului superior-triunghiular

  while (i > 0)
    for j = (i + 1) : N
      % calculez suma
      sum = sum + A(i, j) * x(j);
    endfor
    % impart la elementele de pe diagonala principala
    x(i) = (b(i) - sum) / A(i, i);
    i--;
    sum = 0;
  endwhile
 
endfunction