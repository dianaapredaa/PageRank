% Copyright Preda Diana 314CA 2021 - 2022

function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
 
 % deschidem fisierul din care citim
 file = fopen(nume, 'r');
 
 % citim numarul de noduri
 N = fscanf(file, '%d', 1);

 % initializam matricea cu o
 R = zeros(N, 1);
 A = zeros(N);
 L = zeros(N, 1);
 M = zeros(N, N);

 i = 1;
 
 for i = 1:N
   % citim nr pagini web
   nr_page = fscanf(file, '%f', 1);
   
   % citim nr linkuri 
   nr_link = fscanf(file, '%f', 1);
   j = 1;
   while j <= nr_link
    % citim vectorul din fisier
    V = fscanf(file, '%f', 1);
    A(nr_page, V) = 1;
    j++;
   endwhile
 endfor
 
 fclose(file);
 
 for i = 1:N
    A(i, i) = 0;
 endfor
 
 % calcular nr linkuri / pagina
 for i = 1:N
   L(i) = sum(A(i, :));
 endfor
 
   M = (diag(1./L)) * A;
   M = M';
   
   j = 1;
   while j <= N
    R2(j, 1) = 1/N;
    j = j + 1;
   endwhile
  
  % se calculeaza vectorului R pana cand eroarea obtinuta este mai mica decat eps
  norma = norm(R - R2);

  while  norma >= eps
    R = d * M * R2  + ((1 - d) / N) * (ones(N,1));
    
    norma = norm(R - R2);
    if norma >= eps
      R2 = R;
    endif
    % daca eroarea obtinuta este mai mica decat valoarea variabilei eps
    % ne intoarcem la R-ul anterior
    if norma <= eps
     norma = eps;
     R = R2;
    endif

    % daca a fost atins scopul, procesul se termina
    if(norma == eps)
      break
    endif
  endwhile
endfunction
