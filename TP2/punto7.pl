lista([]).
lista([X|R]) :- lista(R).

concatenar([],L2,L2).
concatenar(L1,[],L1).
concatenar([X|R], L, [X|Z]) :- concatenar(R,L,Z).
