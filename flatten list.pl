islist([_|_]).
myflatten([],[]).
myflatten([H|T],L):-
    not(islist(H)),
    myflatten(T,L1),
    L=[H|L1].
myflatten([H|T],L):-
    islist(H),
    myflatten(T,L1),
    myflatten(H,L2),
    append(L2,L1,L).