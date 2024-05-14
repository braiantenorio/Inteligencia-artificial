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

