resolver(Nodo, Solucion):-breadthfirst([[Nodo]], Solucion).

breadthfirst([[Nodo|Camino]|_], [Nodo|Camino]):- final(Nodo).
breadthfirst([Camino|Caminos], Solucion):- extender(Camino, NCaminos), append(Caminos, NCaminos, Caminos1), 
breadthfirst(Caminos1, Solucion).

extender([Nodo|Camino], NCaminos):- bagof([NNodo, Nodo|Camino], 
  (mover(Nodo,NNodo), not(member(NNodo,[Nodo|Camino]))), NCaminos), !.
extender(Camino, []).


final(estado(0,0,d)).
% la i en minuscula por que es constante
% inicio(estado(3,3,i))
% fin(estado(0,0,d))

% aca movemos el bote de izquierda a derecha entonces serian 10

% Izquierda a derecha
% cruzo 1M y 1C
mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
  NCMI is CMI-2,
  NCCI is CCI,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI>1.
  %CCI>0.

mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
  NCMI is CMI,
  NCCI is CCI-2,
  not(peligro(estado(NCMI,NCCI,_))),
  %CMI>0,
  CCI>1.

mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
  NCMI is CMI-1,
  NCCI is CCI-1,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI>0,
  CCI>0.

mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
  NCMI is CMI-1,
  NCCI is CCI,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI>0.
  %CCI>0.

mover(estado(CMI,CCI,i),estado(NCMI, NCCI, d)) :-  
  NCMI is CMI,
  NCCI is CCI-1,
  not(peligro(estado(NCMI,NCCI,_))),
  %CMI>0,
  CCI>0.

% Derecha a izquierda
mover(estado(CMI,CCI,d),estado(NCMI, NCCI, i)) :-  
  NCMI is CMI+2,
  NCCI is CCI,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI<2.
  %CCI>0.
  
mover(estado(CMI,CCI,d),estado(NCMI, NCCI, i)) :-  
  NCMI is CMI,
  NCCI is CCI+2,
  not(peligro(estado(NCMI,NCCI,_))),
  %CMI>0,
  CCI<2.
  
mover(estado(CMI,CCI,d),estado(NCMI, NCCI, i)) :-  
  NCMI is CMI+1,
  NCCI is CCI+1,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI<3,
  CCI<3.

mover(estado(CMI,CCI,d),estado(NCMI, NCCI, i)) :-  
  NCMI is CMI+1,
  NCCI is CCI,
  not(peligro(estado(NCMI,NCCI,_))),
  CMI<3.
  %CCI>0.
  
mover(estado(CMI,CCI,d),estado(NCMI, NCCI, i)) :-  
  NCMI is CMI,
  NCCI is CCI+1,
  not(peligro(estado(NCMI,NCCI,_))),
  %CMI>0,
  CCI<3.

peligro(estado(CMI,CCI,_)):-CMI<CCI, CMI\=0.
peligro(estado(CMI,CCI,_)):-CMI>CCI, CMI\=3.

