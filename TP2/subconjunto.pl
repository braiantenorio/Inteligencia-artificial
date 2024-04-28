subconjunto([], []).
subconjunto([X|Resto], [X|Sub]) :- subconjunto(Resto, Sub).
subconjunto([_|Resto], Sub) :- subconjunto(Resto, Sub).

