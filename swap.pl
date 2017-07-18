swap(leaf(X),leaf(X)).
swap(tree(X,Y),tree(Z,U)):- swap(X,U), swap(Y,Z).
