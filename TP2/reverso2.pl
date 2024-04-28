reverso2([], []).
reverso2([X|Xs], Reversed) :-
    is_list(X),
    reverso2(X, ReversedX),
    reverso2(Xs, ReversedXs),
    append(ReversedXs, [ReversedX], Reversed).
reverso2([X|Xs], Reversed) :-
    reverso2(Xs, ReversedXs),
    append(ReversedXs, [X], Reversed).
