increment(X,Y):- Y is X+1.

sum(X,Y,Z):- Z is X+Y.

addone([],[]).
addone([A|As],[B|Bs]):- B is A+1, addone(As,Bs).

roman(i,1).
roman(v,5).
roman(x,10).
roman(l,50).
roman(c,100).
roman(d,500).
roman(m,1000).

len(List,Length):- acclen(List,0,Length).
acclen([],Acc,Acc).
acclen([_|T],OldAcc,Length):- NewAcc is OldAcc + 1, acclen(T,NewAcc,Length).

rom2int(A,X):- rom2intlist(A,B), romadd(B,0,X).
rom2intlist([],[]).
rom2intlist([A|As],[B|Bs]):- roman(A,B), rom2intlist(As,Bs).
romadd([],Acc,Acc).
romadd([H],OldAcc,Sum):-
  NewAcc is OldAcc + H,
  romadd([],NewAcc,Sum).
romadd([H1,H2],OldAcc,Sum):-
  (H1<H2 -> NewAcc is OldAcc - H1),
  romadd([H2],NewAcc,Sum).
romadd([H1,H2],OldAcc,Sum):-
  (H1>=H2, NewAcc is OldAcc + H1),
  romadd([H2],NewAcc,Sum).
romadd([H1,H2|T],OldAcc,Sum):- 
  len(T,Tlength),
  Tlength>0,
  (H1>=H2 -> NewAcc is OldAcc + H1; NewAcc is OldAcc - H1),
  romadd([H2|T],NewAcc,Sum).

box(K):- K>0, drawbox(K,0), drawbox2(K), drawbox3(K,1), drawbox4(K).

drawbox(K,K).
drawbox(K,0):- tab(K), K2 is K+1, write2(K2), nl, drawbox(K,1).
drawbox(K,Acc):- 
  Acc < K, Acc > 0,
  K2 is K-Acc,
  tab(K2),
  write('/'),
  tab(K),
  write('/'),
  K3 is Acc-1,
  tab(K3),
  write('|'),
  nl,
  NewAcc is Acc+1,
  drawbox(K,NewAcc).

drawbox2(K):- 
  write('/'), write2(K), write('/'),
  K2 is K-1, tab(K2), write('|'), nl.

drawbox3(K,K).
drawbox3(K,Acc):-
  Acc < K, Acc > 0,
  write('|'), tab(K), write('|'),
  K2 is K-Acc, tab(K2), write('/'), nl,
  NewAcc is Acc+1,
  drawbox3(K,NewAcc).
  
drawbox4(K):-
  write('|'), write2(K), write('|/').

write2(0).
write2(K):- K>0, write('_'), NewK is K-1, write2(NewK).
