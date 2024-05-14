buscar(Frontera, Solucion):- 
    writeln(Frontera),
    breadthfirst([[Frontera]], Solucion).

breadthfirst([[Frontera|Camino]|_], [Frontera|Camino]):- 
    final(Frontera).
breadthfirst([Camino|Caminos], Solucion):- 
    extender(Camino, NCaminos), 
    append(Caminos, NCaminos, Caminos1), 
    breadthfirst(Caminos1, Solucion).

extender([Frontera|Camino], NCaminos):- 
    bagof([NNodo, Frontera|Camino], 
        (transicion(Frontera, NNodo), 
         not(member(NNodo, [Frontera|Camino])), 
         writeln(NNodo) 
        ), 
    NCaminos), 
    !.
extender(_, []).

transicion(a,b).
transicion(a,c).
transicion(b,d).
transicion(b,e).
transicion(e,g).
transicion(e,f).
transicion(c,i).
transicion(i,salida).
transicion(g,salida).
final(salida).

