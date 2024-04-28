rotar([], []).
rotar(Lista, Rotada) :-
    append(Prefijo, [Ultimo], Lista),
    append([Ultimo], Prefijo, Rotada).
