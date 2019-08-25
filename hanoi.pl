% 1,2,3
% [big,mid,small]
initialstate([1, 1, 1]).
goalstate([3, 3, 3]).

next(S1, S2):-
    move_small_disk(S1, S2); move_mid_disk(S1, S2); move_large_disk(S1, S2).
move_small_disk([X1, X2, X3], [X1, X2, X4]):-valid(X4), X3\=X4.
move_mid_disk([X1, X2, X3], [X1, X4, X3]):-valid(X4), X2\=X4, X2\=X3, X4\=X3.
move_large_disk([X1, X2, X3], [X4, X2, X3]):-valid(X4), X1\=X4, X1\=X2, X1\=X3, X4\=X2, X4\=X3.
valid(1). valid(2). valid(3).

solve(State,SolutionList):-
    solve(State,[],SolutionList).
solve(State,_,[State]):-
    goalstate(State),!.
solve(State,Path,[State|T]):-
    next(State,NextState),not(member(NextState,Path)),%to avoid loops
    solve(NextState,[State|Path],T).