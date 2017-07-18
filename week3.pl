second(X,[_,X|_]).

swap12([X,Y|Tail],[Y,X|Tail]).

tran(eins,one). 
tran(zwei,two). 
tran(drei,three). 
tran(vier,four). 
tran(fuenf,five). 
tran(sechs,six). 
tran(sieben,seven). 
tran(acht,eight). 
tran(neun,nine).

listtran([],[]).
listtran([A|As],[B|Bs]):- tran(A,B), listtran(As,Bs).

twice([],[]).
twice([A|As],[A,A|Bs]):- twice(As,Bs).

member(X,[X|Y]).
member(X,[Z|Y]):- member(X,Y).

middle([X|L],A,M):- middle(L,[Y|A],M).
middle([ML,MR|L],L,[ML,MR]). 
middle([M|L],L,[M]).
middle(L,M):- middle(L,[],M).
