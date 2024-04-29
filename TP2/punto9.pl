sublista(Sublista, Lista) :-
    sufijo(Sufijo, Lista),
    prefijo(Sublista, Sufijo).

prefijo([], []).
prefijo([X|Xs], [X|Prefijo]) :-
    prefijo(Xs, Prefijo).

sufijo(Sufijo, Lista) :-
    append(_, Sufijo, Lista).

infijo(Infijo, Lista) :-
    append(Prefijo, Sufijo, Lista),
    prefijo(_, Prefijo),
    sufijo(_, Sufijo),
    append(Infijo, _, Sufijo).

