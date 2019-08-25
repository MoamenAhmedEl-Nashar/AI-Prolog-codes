/***************** Traveling Salesman Solution with Prolog ******************/

% road network Examples
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


/* 
    Description:
    * getpath predicate only calls the path predicate with initial inputs.
    Inputs:
    * Start: the first location of the salesman (the start city).
    * RoadNetwork: the map which connects cities with each other and shows costs.
    Outputs:
    * Total: the total cost of the visited path.
    * VisitedPath: the actual path of moves of the salesman.
*/
getpath(Start, RoadNetwork, Total, VisitedPath) :- 
    /* calling path predicate with CurrentLoc equals to the Start city, 
    an empty list of Visited cities, and zero total cost.
    */
    path(Start, Start, [], 0, RoadNetwork, Total, VisitedPath).



/*
    "Base Case (which stops the recursion)"
*/
path(Start, CurrentLoc, Visited, NewCost, RoadNetwork, NewCost, [Start|VisitedPath]):-
    length(RoadNetwork, NumberOfCities), % getting the NumberOfCities 
    length(Visited, NumberOfCities), % ensuring that the number of Visited cities equals the NumberOfCities
    Start = CurrentLoc, % ensuring that the final CurrentLoc is the same as the Start city.
    reverse(Visited, VisitedPath) . % reverse the Visited list to be read from left to right.

/*
    "Recursive Predicate"
    Description:
    * path predicate is the main function of solving the problem.
    * it generate any correct path but not the optimal one.
    Inputs:
    * Start: the first location of the salesman (the start city).
    * CurrentLoc: the current city which the salesman in.
    * Visited: a list of the cities which the salesman has visited.
    * Cost: the current resultant cost of moves.
    * RoadNetwork: the map which connects cities with each other and shows costs.
    Outputs:
    * Total: the total cost of the visited path.
    * VisitedPath: the actual path of moves of the salesman.
*/
path(Start, CurrentLoc, Visited, Cost, RoadNetwork, Total, VisitedPath) :-
    member((CurrentLoc, NerbyCities), RoadNetwork), % getting the list of cities that can be visited from the CurrentLoc
    member((NextLoc, Distance), NerbyCities), % get a nerby city and its cost(distance)
    NewCost is Cost + Distance, % update the new cost.
    not(member(NextLoc, Visited)), % ensure that this city was not visited before.
    % calling path predicate again but with updating its parameters.
    % the recursion stops when the base path predicate(above) is true.
    path(Start, NextLoc, [NextLoc|Visited], NewCost, RoadNetwork, Total, VisitedPath).


/*
    
    Description:
    * optimalSolution predicate is the interface that the user uses to solve the problem.
    * it generate only the optimal solution.
    Inputs:
    * StartCity: the first location of the salesman (the start city).
    * RoadNetwork: the map which connects cities with each other and shows costs.
    Outputs:
    * OptimalCost: the optimal total cost of the visited path.
    * SolutionPath: the optimal path of moves of the salesman.
*/
optimalSolution(StartCity, RoadNetwork, OptimalCost, SolutionPath) :-
    findall(
        solution(Cost, Path),
        getpath(StartCity, RoadNetwork, Cost, Path),
        Solutions
        ),
    sort(Solutions, SortedSolutions), 
    SortedSolutions = [solution(OptimalCost, SolutionPath) |_].