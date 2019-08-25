even(N):-0 is N mod 2.
odd(N):-1 is N mod 2.
e_o_list([],0,0).
e_o_list([H|T],Ne,No):-
    even(H),
    e_o_list(T,Ne1,No),
    Ne is Ne1+1.
e_o_list([H|T],Ne,No):-
    odd(H),
    e_o_list(T,Ne,No1),
    No is No1+1.
odd_and_even(L):-
    e_o_list(L,Ne,No),
    write('odd: '),
    writeln(No),
    write('even: '),
    writeln(Ne).