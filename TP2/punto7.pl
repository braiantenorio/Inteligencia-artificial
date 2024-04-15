list([]).
lista([X|R]) :- lista(R).

conc([],L2L2)
conc(L1,[],L1)
conc([X|R], L, [X|Z]) :- conc(R,L,Z)a
