p(X,Y):-q(X,Z),r(Y,Z).
q(a,X):-r(X,c).
q(a,X):-r(c,X).
r(b,c).
r(c,b).
