nietos(X,Z) :- (padre(X, Y); madre(X,Y)), (padre(Y,Z); madre(Y,Z)).
abuelas(X,Z) :- madre(X,Y), (padre(Y,Z); madre(Y,Z)).


hermano(X,Y) :- madre(Z,X),madre(Z,Y).
tia(X,Y) :- (madre(Z,Y); padre(Z,Y)), hermano(X,Z), mujer(X).
cunada(X,Y) :- (esposos(Z,Y);esposos(Y,Z)), hermano(Z,X),mujer(X).
suegro(X,Y) :- (esposos(Z,Y);esposos(Y,Z)), padre(X,Z).


% Base de datos
esposos(jorge, maria).
esposos(tomas, lucia).
esposos(facundo, rosa).
esposos(carlos, diana).
esposos(marcos, ana).
esposos(andres, sara).
madre(maria, margarita).
madre(maria, rosa).
madre(rosa, eduardo).
madre(rosa, carlos).
madre(rosa, andres).
madre(rosa, ana).
madre(lucia, diana).
madre(diana, guille).
madre(diana, francisco).
madre(ana, pedro).
madre(ana, sabrina).
madre(sara, beatriz).
madre(sara, eugenia).
padre(jorge, margarita).
padre(jorge, facundo).
padre(tomas, diana).
padre(facundo, carlos).
padre(facundo, ana).
padre(facundo, andres).
padre(facundo, eduardo).
padre(carlos, guille).
padre(carlos, francisco).
padre(marcos, pedro).
padre(marcos, sabrina).
padre(andres, beatriz).
padre(andres, eugenia).
mujer(maria).
mujer(margarita).
mujer(rosa).
mujer(lucia).
mujer(diana).
mujer(ana).
mujer(sara).
mujer(sabrina).
mujer(beatriz).
mujer(eugenia).
