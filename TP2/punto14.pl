:- op(500, xfx, en).
:- op(200, xfx, produce).
:- op(300, fx, concatenar).
:- op(100, xfx, con).


miembro(X, [X|Y]).
miembro(X, [Y|Z]) :- miembro(X,Z).

%concatenar([],L2,L2).
%concatenar(L1,[],L1).
%concatenar([X|R], L, [X|Z]) :- concatenar(R,L,Z).

sublista(Sublista, Lista) :-
    sufijo(Sufijo, Lista),
    prefijo(Sublista, Sufijo).

prefijo([], []).
prefijo([X|Xs], [X|Prefijo]) :-
    prefijo(Xs, Prefijo).

sufijo(Sufijo, Lista) :-
    append(_, Sufijo, Lista).


X en [X|_].
X en [_|Y] :- X en Y.

concatenar [] con L produce L.
concatenar [H|L1] con L2 produce [H|L3]:- concatenar L1 con L2 produce L3.


