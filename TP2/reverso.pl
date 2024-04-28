reverso([], []).
reverso([X|Xs], Reversed) :- reverso(Xs, ReversedXs), append(ReversedXs, [X], Reversed).
