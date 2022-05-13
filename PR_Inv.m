% Copyright Preda Diana 314CA 2021 - 2022

function F = PR_Inv(A)
	% Functia care calculeaza inversa matricii A folosind factorizari Gram-Schmidt
 % matricea initiala
 % aplicam algortimul Gram-Schmidt pe coloane si rezolvam sistemul superior triunghiular
 [N N] = size(A);
 % initializez Q si R

 Q = zeros(N);
 R = zeros(N);
 F = zeros(N);
 I = eye(N, N);
  
  i = 1;

 for i = 1: N
   v = A(:, i);
     j = 1;
    while j <= i-1
       aux = Q(:, j);
       R(j, i) = aux' * v;
       v = v - R(j, i) * aux;
       j++;
     endwhile
   
   %pun rezultatele obtinute tot pe coloane
   R(i, i) = norm(v);
   Q(:, i) = v / R(i, i);
 endfor

  for i = 1:N
   % se calculeaza inversa
   F(:, i) = SST(R, Q' * I(:,i));
  endfor
 
 endfunction