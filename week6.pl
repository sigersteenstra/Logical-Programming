/* Exercise 10.1 */
p(1). 
p(2):- !. 
p(3).

/*
?- p(X).
X = 1 ;
X = 2.

?- p(X),p(Y).
X = Y, Y = 1 ;
X = 1,
Y = 2 ;
X = 2,
Y = 1 ;
X = Y, Y = 2.

?- p(X),!,p(Y).
X = Y, Y = 1 ;
X = 1,
Y = 2.
*/

/* Exercise 10.2 */
class(Number,positive):- Number>0, !. 
class(0,zero):- !. 
class(Number,negative):- Number<0.

/* Exercise 10.3 normal */l
split([],[],[]).
split([H|T],[H|P],N):- class(H,X), (X=positive;X=zero), split(T,P,N).
split([H|T],P,[H|N]):- class(H,X), X=negative, split(T,P,N).

/* Exercise 10.3 improved */
split2([],[],[]):- !.
split2([H|T],[H|P],N):- class(H,X), (X=positive;X=zero), !, split2(T,P,N).
split2([H|T],P,[H|N]):- split2(T,P,N).


/* Exercise 10.4 */
reverse(L1,L2):- accReverse(L1,[ ],L2). 
accReverse([ ],L,L).
accReverse([H|T],Acc,Rev):- accReverse(T,[H|Acc],Rev). 

directTrain(saarbruecken,dudweiler). 
directTrain(forbach,saarbruecken). 
directTrain(freyming,forbach). 
directTrain(stAvold,freyming). 
directTrain(fahlquemont,stAvold). 
directTrain(metz,fahlquemont). 
directTrain(nancy,metz).

directTrain2(X,Y):- directTrain(X,Y).
directTrain2(X,Y):- directTrain(Y,X).

route(X,Y,R):- route(X,Y,[X],R).
route(Y,Y,Rev,R):- reverse(Rev,R).
route(X,Y,Rev,R):- directTrain2(X,Z), not(member(Z,Rev)), route(Z,Y,[Z|Rev],R).


/* Exercise 10.5 */
loves(vincent,mia).
loves(marsellus,mia).
jealous(X,Y):- loves(X,Z), loves(Y,Z), not(X=Y).


/* Helen's Diner */
man(victor).
man(jim).
man(roger).
woman(helen).
woman(esther).
woman(anna).

leftof([X,Y|_], X,Y).
leftof([_|L],X,Y) :- leftof(L,X,Y).
table(T):- T = [helen,X2,X3,X4,X5,X6,helen].

uniq([]).
uniq([X|L]):- uniq(L), not(member(X,L)).

chop([X|L]):- uniq(L).

dinner(H,T):- table(T), man(H),
  clue1(T), clue2(T,H),
  clue3(T), clue4(T,H), chop(T).

clue1(T):- 
  leftof(T,victor,W),
  leftof(T,W,M),
  leftof(T,M,anna),
  woman(W), man(M).
clue2(T,H):- 
  leftof(T,esther,M), leftof(T,M,W),
  leftof(T,W,M1), leftof(T,M1,W1), 
  leftof(T,W1,H), man(M), woman(W),
  man(M1), woman(W1).
clue3(T):-
  leftof(T,jim,W), leftof(T,W,roger),
  woman(W).
clue4(T,H):-
  not(leftof(T,helen,H)), not(leftof(T,H,helen)), !.
