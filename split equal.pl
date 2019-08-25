splitEqual([],[],[]).
splitEqual([H1,H2|T],L1,L2):-
    splitEqual(T,T1,T2),
    L1=[H1|T1],
    L2=[H2|T2].