
% road network
/* Ex1*/
/*
roadNetwork(
    [(a, [(b, 5), (f, 6)]),
      (b, [(a, 5), (e, 1), (c, 4)]),
      (c, [(b, 4), (f, 9), (d, 2)]),
      (d, [(e, 2), (c, 2), (f, 7)]),
      (e, [(b, 1), (d, 2)]),
      (f, [(a, 6), (c, 9), (d, 7)])]
    ).
*/
/* Ex2*/
roadNetwork(
    [(a, [(b, 2), (c, 4), (d, 1), (e,2),(f,5)]),
      (b, [(a, 2), (c, 1), (e, 2)]),
      (c, [(b, 1), (f, 3), (d, 2),(e,2)]),
      (d, [(e, 2), (c, 2), (f, 3),(a,1)]),
      (e, [(a, 2), (b, 2),(c,2),(d,2)]),
      (f, [(a, 5), (c, 3), (d, 3)])]
    ).
getpath(Start, RoadNetwork, Total, VisitedPath) :- 
    path(Start, Start, [], 0, RoadNetwork, Total, VisitedPath).

% path()
% base case
path(Start, CurrentLoc, Visited, NewCost, RoadNetwork, NewCost, [Start|VisitedPath]):-
    length(RoadNetwork, NumberOfCities), 
    length(Visited, NumberOfCities), 
    Start = CurrentLoc, reverse(Visited, VisitedPath) .
% recursion
path(Start, CurrentLoc, Visited, Cost, RoadNetwork, Total, VisitedPath) :-
    member((CurrentLoc, D), RoadNetwork),
    member((NextLoc, Distance), D), 
    NewCost is Cost + Distance, not(member(NextLoc, Visited)),
    path(Start, NextLoc, [NextLoc|Visited], NewCost, RoadNetwork, Total, VisitedPath).
