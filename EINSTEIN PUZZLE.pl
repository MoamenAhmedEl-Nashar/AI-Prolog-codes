/*
 5 persons live in 5 adjacent houses. Each one has a different nationality, 
 favorite drink, smokes a different cigarette, owns a different pet 
 and lives in a house of a different color.
*/

/*
The norwegian lives in the first house to the left, The person who drinks milk lives in the middle, 
The Englishman lives in the red house, The spaniard owns a dog, The man in the green house drinks coffee, 
The ukrainian drinks tea, The green house is to the right of the ivory house, 
The person who owns a snail smokes Winston, 
The person who smokes Kools lives in the yellow house and lives next to the man who owns the horse, 
The person who smokes Chesterfield lives next to the man who owns the fox,
The person who smokes Luckystrike drinks Oj, The person in the blue house lives to the right of the norwejian.
*/

/*
Who drinks water? And who owns the zebra?
*/

/*
A suitable representation for the data is a list containing 5 elements, 
each of which represents one house from left to right.
*/

/*
A house can be represented by the structure: h(Nationality, Pet, Cigarettes, Drink, Color)
*/

/*
Each piece of information fixes some values in a house, e.g.
“The spaniard owns a dog” is represented by the structure: 
h(spaniard, dog, _, _, _) which is a member of the houses list.
*/

/*
The relations “lives next to” and “to the right of” are represented by the predicates nextto/3, iright/3.
*/
zebra(H, W, Z) :-
    H = [house(norwegian, _, _, _, _), _, house(_, _, _, milk, _), _, _], 
    member(house(englishman, _, _, _, red), H), 
    member(house(spaniard, dog, _, _, _), H), 
    member(house(_, _, _, coffee, green), H), 
    member(house(ukrainian, _, _, tea, _), H), 
    iright(house(_, _, _, _, ivory), house(_, _, _, _, green), H), 
    member(house(_, snails, winston, _, _), H), 
    member(house(_, _, kools, _, yellow), H), 
    nextto(house(_, _, chesterfield, _, _), 
    house(_, fox, _, _, _), H), 
    nextto(house(_, _, kools, _, _), 
    house(_, horse, _, _, _), H), 
    member(house(_, _, luckystrike, oj, _), H), 
    member(house(japanese, _, parliaments, _, _), H), 
    nextto(house(norwegian, _, _, _, _), house(_, _, _, _, blue), H), 
    member(house(W, _, _, water, _), H), 
    member(house(Z, zebra, _, _, _), H).

iright(Left, Right, [Left, Right | _]). 
iright(Left, Right, [_ | Rest]) :- 
    iright(Left, Right, Rest).
nextto(X, Y, List) :- 
    iright(X, Y, List). 
nextto(X, Y, List) :- 
    iright(Y, X, List).