/*
:- dynamic sumlst/2.
accumulatesum( _ , [] ). 
accumulatesum(L,[H|T]):-
    sumlst(L,S1), 
    retract(sumlst(L,S1)), 
    S2 is S1+H, 
    assert(sumlst(L,S2)), 
    accumulatesum(L,T).
assertsum([]):- 
    retractall(sumlst([],_)), 
    assert(smlst([],0)).
assertsum([H|T]):- 
    retractall(sumlst([H|T],_)), 
    assert(sumlst([H|T],0)), 
    accumulatesum([H|T],[H|T]).
*/
:-dynamic maxlst/2.
auxassert(_,[]):-
    !.
auxassert(L,[H|T]):-
    maxlst(L,Max),
    H>Max,
    retract(maxlst(L,Max)),
    assert(maxlst(L,H)),
    writeln("maxlst predicate is asserted"),
    auxassert(L,T).
auxassert(L,[H|T]):-
    maxlst(L,Max),
    Max>=H,
    auxassert(L,T).
assertmax([]):-
    assert(maxlst([],undefined)),
    writeln("maxlst predicate is asserted").
assertmax([H|T]):-
    retractall(maxlst([H|T],_)),
    assert(maxlst([H|T],H)),
    writeln("maxlst predicate is asserted"),
    auxassert([H|T],T).










    