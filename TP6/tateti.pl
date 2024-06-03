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

play :- preguntarFicha.

preguntarFicha:- nl, write('Elija ficha (x u o)'), nl,
  read(Jugador), nl,
  TableroInicial = [0,0,0,0,0,0,0,0,0],
  play([x,play,TableroInicial],Jugador).

play([Jugador, play, Tablero], Jugador) :- !,
    nl, write('Ingrese proximo movimiento'), nl,
    read(Pos), nl,  
    (
      movJugador([Jugador, play, Tablero], [ProximoJugador, Estado, NuevoTablero], Pos), !,
      show(NuevoTablero),
      (
        Estado = win, !,                     
        write(Jugador), write(' Gana'), nl, nl
        ;
        Estado = draw, !,                           
        nl, write('End of game : '),
        write(' Empate'), nl, nl
        ;
        play([ProximoJugador, play, NuevoTablero], Jugador) 
      )
      ;
      write('Movimiento ilegal!'), nl,               
      play([Jugador, play, Tablero], Jugador)       
    ).

play([Player, play, Board], HumanPlayer) :-
    nl, write('Computadora: '), nl, nl,
    % Compute the best move
    bestMove([Player, play, Board], [NextPlayer, State, BestSuccBoard]),
    show(BestSuccBoard),
    (
      State = win, !,                                
      write(Player), write('Gana'), nl, nl
      ;
      State = draw, !,                               
      nl,write('Empate'), nl, nl
      ;
      % Else -> continue the game
      play([NextPlayer, play, BestSuccBoard], HumanPlayer)
    ).

bestMove(Pos, NextPos) :-
    minimax(Pos, NextPos, _).
  
movJugador([X1, play, Tablero], [X2, Estado, NuevoTablero], Pos) :-
    proxJugador(X1, X2),
    set1(Pos, X1, Tablero, NuevoTablero),
    (
      posGanadora(X1, NuevoTablero), !, Estado = win ;
      posEmpate(X1,NuevoTablero), !, Estado = draw ;
      Estado = play
    ).

set1(1, E, [X|Ls], [E|Ls]) :- !, X = 0.

set1(P, E, [X|Ls], [X|L2s]) :-
    number(P),
    P1 is P - 1,
    set1(P1, E, Ls, L2s).

% dice que NextPos es un movimiento legal desde Pos
%move(Pos, NextPos):-.
% el move que lleve a un estado ganador
% son 4, uno que lleva a ademas a play, perdedor y empate
move([X1,play,Tablero],[X2,win,NuevoTablero]):-
  proxJugador(X1,X2), %ver que ficha juega
  movAux(X1,Tablero,NuevoTablero), %
  posGanadora(X1,NuevoTablero), !. %para saber si este movimiento me llevo a un estado ganador

move([X1, play, Tablero], [X2, draw, NuevoTablero]):-
  proxJugador(X1,X2),
  movAux(X1,Tablero,NuevoTablero),
  posEmpate(X1,NuevoTablero),!.

move([X1,play,Tablero], [X2, play, NuevoTablero]):-
  proxJugador(X1,X2),
  movAux(X1,Tablero,NuevoTablero).

movAux(J,[0|R],[J|R]).
movAux(J,[C|R],[C|R2]):- movAux(J,R,R2).

% dice que Pos tiene un valor igual a Val
utility([o,win,_],1).
utility([x,win,_],-1). 
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

posEmpate(_,Tablero):- \+ member(0,Tablero).

igual(J,J,J,J).

proxJugador(x,o).
proxJugador(o,x).

show([X1, X2, X3, X4, X5, X6, X7, X8, X9]) :-
    write('   '), showAux(X1),
    write(' | '), showAux(X2),
    write(' | '), showAux(X3), nl,
    write('  -----------'), nl,
    write('   '), showAux(X4),
    write(' | '), showAux(X5),
    write(' | '), showAux(X6), nl,
    write('  -----------'), nl,
    write('   '), showAux(X7),
    write(' | '), showAux(X8),
    write(' | '), showAux(X9), nl.



% show2(+Term)
% Write the term to current outupt
% Replace 0 by ' '.
showAux(X) :-
    X = 0, !,
    write(' ').

showAux(X) :-
    write(X).
