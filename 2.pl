% Facts.
leaf.

% Nodes consist of two elements:
% a node, which results in a recursion;
% a leaf, which is a fact.
node(X, Y) :-
    X,
    Y.

% Term is a binaryTree if it consists of nodes and leafs.
isBinaryTree(Term) :-
    Term.

% Count the number of nodes.
nnodes(leaf, 1).
nnodes(node(X, Y), N) :-
    % Recurse for each member of the tree
    nnodes(X, Sum1), nnodes(Y, Sum2),
    % Add 1 for each recursion step, i.e. the depth
    N is Sum1 + Sum2 + 1.

% Create a binary tree of depth N.
makeBinary(N, Tree) :-
    isBinaryTree(Tree).

    
