buscar(Start, Goal) :-
    dfs(Start, Goal, [Start]).

dfs(Goal, Goal, _).
dfs(State, Goal, Visited) :-
    transicion(State, Next),
    \+ member(Next, Visited),
    write(Next), nl,
    dfs(Next, Goal, [Next|Visited]).

transicion(a,b).
transicion(a,c).
transicion(b,d).
transicion(b,e).
transicion(e,g).
transicion(e,f).
transicion(c,i).
transicion(i,salida).
transicion(g,salida).

