pack([],[[]]).
pack([H],[[H]]).
pack([H1,H2|T],[[H1]|L1]):-
    H1\=H2,pack([H2|T],L1).
pack([H1,H2|T],[[H1|A]|T1]):-
    H1=H2,pack([H2|T],[A|T1]).

encode(L1,L2):-
    pack(L1,Lp),
    e(Lp,L2).
e([],[]).
e([[H|TR]|T],[[N,H]|T1]):-
    length([H|TR],N),
    e(T,T1).