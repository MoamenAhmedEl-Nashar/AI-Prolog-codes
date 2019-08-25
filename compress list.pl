compress([],[]).
compress([X],[X]).
compress([H|T],L):-
    compress(T,[NH|NT]),
    H = NH, L=[NH|NT].

compress([H|T],L):-
    compress(T,[NH|NT]),
    H \= NH, L=[H,NH|NT].

    
    