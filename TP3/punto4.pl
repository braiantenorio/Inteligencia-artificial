resolver(Nodo, Solucion):-breadthfirst([[Nodo]], Solucion).

breadthfirst([[Nodo|Camino]|_], [Nodo|Camino]):- final(Nodo).
breadthfirst([Camino|Caminos], Solucion):- extender(Camino, NCaminos), append(Caminos, NCaminos, Caminos1), 
breadthfirst(Caminos1, Solucion).

extender([Nodo|Camino], NCaminos):- bagof([NNodo, Nodo|Camino], 
  (transicion(Nodo,NNodo), not(member(NNodo,[Nodo|Camino]))), NCaminos), writeln(NNodo), !.

extender(Camino, []).



% Arbol
transicion(a,c).
transicion(c,i).
transicion(i,salida).
transicion(a,b).
transicion(b,d).
transicion(b,e).
transicion(e,g).
transicion(e,f).
transicion(g,salida).
final(salida).
