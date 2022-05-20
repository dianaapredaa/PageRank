# Copyright Preda Diana 314CA 2021 - 2022

Nume: Preda Diana
Grupa: 314CA

Tema 1: Page Rank

Algoritmul Iterativ:

Am deschis fisierul de input si am citit din acesta. De pe prima
linie am citit numarul de resure web. Apoi am citit listele de adiacenta
Folosind legaturile dintre un nod si vecinii sai, am creat matricea de
adiacenta. Consideram elementele de pe diagonala 1.
Intr-un vector auxliar am salvat numarul de linkuri corespunzatoare fiecarei
pagini. Am construit M, folosind inversa. Am initializat vectorul R2 si am
aplicat formula data. Am repetat algoritmul pana la toleranta dorita.

Algoritmul Algebraic
Am repetat citirea. M-am folosit de algoritmul Gram-Schmidt pentru a face
descompunerea QR. Pentru a afla inversa, am aplicat pentru fiecare coloana,
functia SST care rezolva un sistem superior triunghiular. Folosim formula data
calculam R.

Algoritmul PageRank
Am repetat citirea, citit si val1 si val2 de aceasta data. Am creat fisierul
de output. Am calculat matricea de adiacenta.
Am afisat cele doua matrice obtinute prin aplicarea algoritmilor Iterativ si
Algebraic. Am creat vectorul R, sortand descendent si am determinat gradul de
apartenenta pentru fiecare din elementele vectorului R, folosind functia
Apartenenta, implementata separat, si care verifica intervalul in care se afla
parametrul dat. Am printat rezultatele in fisierul de output.