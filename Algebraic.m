% Copyright Preda Diana 314CA 2021 - 2022

function R = Algebraic(nume, d)
	% Functia care calculeaza vectorul PageRank folosind varianta algebrica de calcul.
	% Intrari: 
	%	-> nume: numele fisierului in care se scrie;
	%	-> d: probabilitatea ca un anumit utilizator sa continue navigarea la o pagina urmatoare.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.

 file = fopen(nume, 'r');
 
 % citim numarul de noduri
 N = fscanf(file, '%d', 1);

 % initializam matricea cu o
 R = zeros(N, 1);
 A = zeros(N);
 V = zeros(N, 1);
 
 i = 1;
 j = 1;
 
 for i = 1:N
   % citim nr pagini web
   nr_page = fscanf(file, '%f', 1);
   
   % citim nr linkuri 
   nr_link = fscanf(file, '%f', 1);
    j = 1;
    while (j <= nr_link)
    % citim vectorul din fisier
    V = fscanf(file, '%f', 1);
    A(nr_page, V) = 1;
    j++;
   endwhile
 endfor
 
 for i = 1:N
    A(i, i) = 0;
 endfor
 
 for i = 1:N
   V(i) = sum(A(i, :));
 endfor
 
  M = zeros(N);
  M = (diag(1./V)) * A;
  M = M';

 % calcularea vectorului R folosind formula data 
 R = (PR_Inv(eye(N) - d * M)) * (1-d) / N * (ones(N,1));
 
 fclose(file);
  
 endfunction