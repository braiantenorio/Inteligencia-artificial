:- op(500, xfx, en).
:- op(200, xfx, produce).
:- op(300, fx, concatenar).
:- op(100, xfx, con).


X en [X|_].
X en [_|Y] :- X en Y.

concatenar [] con L produce L.
concatenar [H|L1] con L2 produce [H|L3]:- concatenar L1 con L2 produce L3.


