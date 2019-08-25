% write w to show long solution in swipl
initialstate(s(e,e,e,e)).
goalstate(s(w,w,w,w)).

% helper predicates for next 
safe(s(X,_,X,_)).
safe(s(X,X,_,X)).
opposite(w,e). 
opposite(e,w).
% next describes how to go from state to another based on the rules of the problem
next(s(F1,W,G,C),s(F2,W,G,C)):-
    opposite(F1,F2),safe(s(F2,W,G,C)).
next(s(F1,F1,G,C),s(F2,F2,G,C)):- 
    opposite(F1,F2),safe(s(F2,F2,G,C)). 
next(s(F1,W,F1,C),s(F2,W,F2,C)):- 
    opposite(F1,F2),safe(s(F2,W,F2,C)). 
next(s(F1,W,G,F1),s(F2,W,G,F2)):- 
    opposite(F1,F2),safe(s(F2,W,G,F2)).

% solve default DFS
/*
solve(State,SolutionList):-
    solve(State,[],SolutionList).
solve(State,_,[State]):-
    goalstate(State),!.
solve(State,Path,[State|T]):-
    next(State,NextState),not(member(NextState,Path)),%to avoid loops
    solve(NextState,[State|Path],T).
*/

% solve with limited DFS
/*
solve(State,SolutionList):-
    limitedDFS(State,10,SolutionList).
limitedDFS(State,_,[State]):-
    goalstate(State),!.
limitedDFS(State,MaxDepth,[State|T]):-
    MaxDepth>0,next(State,NewState),Depth is MaxDepth-1,limitedDFS(NewState,Depth,T).
*/

% solve with bfs , unlike dfs, we need to implement the queue Q
% Q=[path1 , path2 , path3 , ...]
% path1=[... , state3 , state2 , state1]
% bfs takes Q as an input.
solve(S,SolutionList):-
    bfs([[S]],SolutionList).
bfs([[S|RestOfStates]|_],[S|RestOfStates]):-
    goalstate(S),!.
bfs([P|RestOfPaths],SolutionList):-
    extend(P,NewPs),append(RestOfPaths,NewPs,NewQ),bfs(NewQ,SolutionList).
extend([S|RestOfStates],NewPs):-
    findall([NewS,S|RestOfStates],( next(S,NewS),not(member(NewS,RestOfStates)) ),NewPs).


    




