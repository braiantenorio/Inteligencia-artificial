max(X, Y, Z) :-
    (X >= Y ->
        Z is X
    ;
        Z is Y
    ).

maxlista(X, [X]).
maxlista(X, [H|T]) :-
    maxlista(Y, T),
    X is max(H, Y).


sumlista(0, []).
sumlista(X, [H|T]) :-
    sumlista(SumT, T),
    X is H + SumT.


ordenada([]).
ordenada([_]).
ordenada([X,Y|T]) :-
    X =< Y,
    ordenada([Y|T]).

