resolver(Nodo, Solucion):-breadthfirst([[Nodo]], Solucion).

breadthfirst([[Nodo|Camino]|_], [Nodo|Camino]):- final(Nodo).
breadthfirst([Camino|Caminos], Solucion):- extender(Camino, NCaminos), append(Caminos, NCaminos, Caminos1), 
breadthfirst(Caminos1, Solucion).

extender([Nodo|Camino], NCaminos):- bagof([NNodo, Nodo|Camino], 
  (transicion(Nodo,NNodo), not(member(NNodo,[Nodo|Camino]))), NCaminos), !.

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


% la i en minuscula por que es constante
% inicio(estado(3,3,i))
% fin(estado(0,0,d))

% aca movemos el bote de izquierda a derecha entonces serian 10



mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
% cruzo 1M y 1C
  NCMI is CMI-1,
  NCCI is CCI-1,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI>0,
  CCI>0


