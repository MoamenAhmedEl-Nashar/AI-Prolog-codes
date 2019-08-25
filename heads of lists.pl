/*
Define a Prolog predicate heads(List1, List2) such that given a list of non-empty lists List1, 
it will return a list of their heads. For example, given the list [[a,b,c],[d,e,f,g],[h],[i,j]] as List1, 
it should return [a,d,h,i] as List2. The predicate should fail if List1 contains an empty list. 
For example it should fail if given the following list [[a,b,c],[d,e,f,g],[],[i,j]] as List1.
*/

%simple case
heads([],[]).
headsElement([H|_],H).

%longer lists
heads([H|T],L):-
    headsElement(H,H1),
    heads(T,L1),
    L = [H1|L1].