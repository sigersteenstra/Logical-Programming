len(List,Length):- acclen(List,0,Length).
acclen([],Acc,Acc).
acclen([_|T],OldAcc,Length):- NewAcc is OldAcc + 1, acclen(T,NewAcc,Length).

append([],L,L).
append([H1|T1],L2,[H1|L3]):- append(T1,L2,L3).

prefix(P,L):- append(P,_,L).
suffix(S,L):- append(_,S,L).
sublist(Subl,L):- suffix(Suff,L), prefix(Subl,Suff).

naivereverse([],[]).
naivereverse([H|T],Rev):- naivereverse(T,X), append(X,[H],Rev).

reverse(L1,L2):- accReverse(L1,[ ],L2). 
accReverse([ ],L,L).
accReverse([H|T],Acc,Rev):- accReverse(T,[H|Acc],Rev). 




/* Exercise 6.1 */
doubled(L):- append(X,X,L).

/* Exercise 6.2 */
palindrome(L):- reverse(L,L).

/* Exercise 6.4 */
last(L,X):- reverse(L,[H|_]), H=X.
last2([X],X).
last2([_,H2|T],X):- last2([H2|T],X).

/* Exercise 6.5 */
swapfl([H1|L1],[H2|L2]):- 
  sublist(Subl,[H1|L1]), 
  sublist(Subl,[H2|L2]), 
  len(Subl,LenSubl),
  len([H1|L1],Len1),
  len([H2|L2],Len2),
  LenSubl is Len1-2,
  Len1=Len2,
  last(L1,E1),
  last(L2,E2),
  H1=E2,
  H2=E1.
/* Could this be more efficient? */


/* The Doctor problem */

doctorproblem:- 
  apps(X), members(X),
  clue1(X), clue2(X),
  clue3(X), clue4(X),
  write(X),nl.
apps(X):- X = [app(_,9,_), app(_,10,_), app(_,11,_), app(_,12,_)].
members(X):- 
  member(app(steven,_,_),X),
  member(app(billy,_,_),X),
  member(app(fernando,_,_),X),
  member(app(zachary,_,_),X).
clue1(X):-
  member(app(billy,9,_),X), member(app(_,11,heartburn),X);
  member(app(_,9,heartburn),X), member(app(billy,11,_),X).
clue2(X):-
  member(app(_,Y,heartburn),X), member(app(_,Z,hippain),X), Y is Z+2.
clue3(X):-
  member(app(billy,_,shingles),X); member(app(fernando,_,shingles),X).
clue4(X):-
  member(app(zachary,Y,_),X), member(app(_,Z,backpain),X), Y > Z.

member(X,[X|_]).
member(X,[_|Y]):- member(X,Y).
