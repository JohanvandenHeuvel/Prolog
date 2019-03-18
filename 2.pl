leaf.

node(X, Y) :-
    X,
    Y.

isBinaryTree(Term) :-
    Term.

nnodes(leaf, 1).
nnodes(node(X, Y), N) :-
    nnodes(X, Sum1),
    nnodes(Y, Sum2),
    N is Sum1 + Sum2 + 1.


    
