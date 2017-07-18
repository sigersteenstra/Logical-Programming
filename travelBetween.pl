directTrain(forbach,saarbruecken).
directTrain(freyming,forbach).
directTrain(fahlquemont,stAvold).
directTrain(stAvold,forbach).
directTrain(saarbruecken,dudweiler).
directTrain(metz,fahlquemont).
directTrain(nancy,metz).

travelBetween(X,Y):- directTrain(X,Y).
travelBetween(X,Y):- directTrain(X,Z), travelBetween(Z,Y).

travel(X,Y,go(X,Y)):- directTrain(X,Y).
travel(X,Y,go(X,Z,R)):- directTrain(X,Z), travel(Z,Y,R).
