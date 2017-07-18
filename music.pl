likes(johan,radiohead).
likes(johan,boomtown_rats).
likes(johan,yes).
likes(kees,rem).
likes(kees,kate_bush).
likes(pieter,snow_patrol).
likes(pieter,radiohead).
likes(jan,cranes).
likes(jan,queen).
likes(jan,david_bowie).
likes(marie,kate_bush).
likes(marie,david_bowie).
likes(silvia,cranes).
likes(silvia,radiohead).

diff(johan,kees).
diff(johan,pieter).
diff(johan,jan).
diff(johan,marie).
diff(johan,silvia).
diff(kees,pieter).
diff(kees,jan).
diff(kees,marie).
diff(kees,silvia).
diff(pieter,jan).
diff(pieter,marie).
diff(pieter,silvia).
diff(jan,marie).
diff(jan,silvia).
diff(marie,silvia).

diff2(X,Y):- diff(X,Y).
diff2(X,Y):- diff(Y,X).

same_taste(X,Y):- likes(X,Z), likes(Y,Z), diff2(X,Y).
