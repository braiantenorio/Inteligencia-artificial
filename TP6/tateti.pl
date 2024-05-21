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
move(Pos, NextPos):-.

% dice que Pos tiene un valor igual a Val
utility(Pos,1).
utility(Pos,-1).
utility(Pos,0).

% dice que el jugador actual que esta en la Pos es min
min_to_move():-.

% dice que el jugador actual que esta en la Pos es max
max_to_move(Pos):-.


