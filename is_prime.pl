is_prime(1):-!,fail.
is_prime(N):-
    N1 is N-1,
    p(N,N1).
p(_,1):-!.
p(N,N1):-
    M is N mod N1,M>0,
    N2 is N1-1,
    p(N,N2).