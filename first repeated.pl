r([],invalid):-!.
r([_],invalid):-!.
r([X,X|_],X):-!.
r([H1,H2|T],A):-
    H1 \= H2,
    r([H2|T],A).
