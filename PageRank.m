% Copyright Preda Diana 314CA 2021 - 2022

function [PR1 PR2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

  % deschidem fisierul din care citim
  file = fopen(nume, 'r');
  % citim numarul de noduri
  N = fscanf(file, '%d', 1);
  % vector in care se apeleaza functia de apartenenta
  y = zeros(N,1);
  
  % se deschide fisierul cu rezultate
  fisier_output = fopen(strcat(nume, '.out'), 'w');
  fprintf(fisier_output, '%d\n', N);
  fprintf(fisier_output, '\n');
  
 % initializam matricea cu o
 A = zeros(N);
 L = zeros(N, 1);
 R = zeros(N, 1);

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
 val1 = fscanf(file, '%f',1);
 val2 = fscanf(file, '%f',1);
 fclose(file);
 % se foloseste algoritmul Iterativ
 PR1 = Iterative(nume, d, eps);

 % se foloseste algoritmul Algebraic
 PR2 = Algebraic(nume, d);

 % se scrie rezultatul in fisier
 fprintf(fisier_output, '%f\n', PR1);
 fprintf(fisier_output,'\n');

 % se scrie rezultatul in fisier
 fprintf(fisier_output, '%f\n' , PR2);
 fprintf(fisier_output,'\n');
 
 [R, index] = sort(PR2, 'descend');
 	
 i = 1;

 while i <= N
    y = Apartenenta(R(i), val1, val2);
    fprintf(fisier_output, '%i %i %.6f\n', i, index(i), y);
    i++;
  endwhile
  
  fclose(fisier_output);
  endfunction
