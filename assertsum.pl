/*iterate from last element to first element*/

:-dynamic sumlst/2.
p(_,[],0).
p(L,[H|T],Sum):-
    p(L,T,S),
    Sum is S+H,
    retractall(sumlst(L,_)),
    assert(sumlst(L,Sum)).
assertsum(L):-
    retractall(sumlst(L,_)),
    assert(sumlst(L,0)),
    p(L,L,_).
    

/*iterate from first element to last element*/
/*
:-dynamic sumlst/2.
p(L,[],S):-retractall(sumlst(L,_)),assert(sumlst(L,S)).
p(L,[H|T],Sum):-
    retractall(sumlst(L,_)),
    assert(sumlst(L,Sum)),
    S is Sum+H,p(L,T,S).
assertsum(L):-
    p(L,L,0).
*/