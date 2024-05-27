minimax(Pos, BestNextPos, Val) :-              % Pos has successors
    bagof(NextPos, move(Pos, NextPos), NextPosList),
    best(NextPosList, BestNextPos, Val), !.

minimax(Pos, _, Val) :-                        % Pos has no successors
    utility(Pos, Val).

best([Pos], Pos, Val) :-
    minimax(Pos, _, Val), !.

best([Pos1 | PosList], BestPos, BestVal) :-
    minimax(Pos1, _, Val1),
    best(PosList, Pos2, Val2),
    betterOf(Pos1, Val1, Pos2, Val2, BestPos, BestVal).

betterOf(Pos0, Val0, _, Val1, Pos0, Val0) :-   % Pos0 better than Pos1
    min_to_move(Pos0),                         % MIN to move in Pos0
    Val0 > Val1, !                             % MAX prefers the greater value
    ;
    max_to_move(Pos0),                         % MAX to move in Pos0
    Val0 < Val1, !.                            % MIN prefers the lesser value

betterOf(_, _, Pos1, Val1, Pos1, Val1).        % Otherwise Pos1 better than Pos0

%[X1,X2...Xn]
%como definimos pos?
% dice que NextPos es un movimiento legal desde Pos
%move(Pos, NextPos):-.
% el move que lleve a un estado ganador
% son 4, uno que lleva a ademas a play, perdedor y empate
move([X1,play,Tablero],[X2,win,NuevoTablero]):-
  proximoJugador(X1,X2), %ver que ficha juega
  movAux(X1,Tablero,NuevoTablero), %
  posGanadora(X1,NuevoTablero), !. %para saber si este movimiento me llevo a un estado ganador
  %en el mov play no poner nada
  %en el mov lose poner posPerdedora

move([X1, play, Tablero], [X2, draw, NuevoTablero]):-
  proximoJugador(X1,X2),
  movAux(X1,Tablero,NuevoTablero),!. %va este cut???

move([X1,play,Tablero], [X2, lose, NuevoTablero]):-
  proximoJugador(X1,X2),
  movAux(X1,Tablero,NuevoTablero),
  % falta definir posPerdedora
  posPerdedora(X1,NuevoTablero),!.

movAux(J,[0|R],[J|R]).
movAux(J,[C|R],[C,R2]):- movAux(J,R,R2).

% dice que Pos tiene un valor igual a Val
utility([o,win,_],1).
utility([x,win,_],1). % 1 o -1?????
utility([_,draw,_],0).

% dice que el jugador actual que esta en la Pos es min
min_to_move([o,_,_]).

% dice que el jugador actual que esta en la Pos es max
max_to_move([x,_,_]).

posGanadora(J, [X1,X2,X3,X4,X5,X6,X7,X8,X9]):-
  igual(X1,X2,X3,J);
  igual(X4,X5,X6,J);
  igual(X7,X8,X9,J);
  igual(X1,X5,X9,J);
  igual(X3,X5,X7,J);
  igual(X1,X4,X7,J);
  igual(X2,X5,X8,J);
  igual(X3,X6,X9,J).

igual(J,J,J,J).

proxJugador(x,o).
proxJugador(o,x).


