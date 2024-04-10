member(X,[X|Xs]).
member(X,[Y|Ys]):-member(X,Ys).

elim_rep([],[]).
elim_rep([X|Xs],Ys]):-member(X,Xs),elim_rep(Xs,Ys).
elim_rep([X|Xs],[X|Ys]):-elim_rep(Xs,Ys).
