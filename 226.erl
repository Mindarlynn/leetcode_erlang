%% Definition for a binary tree node.
%%
%% -record(tree_node, {val = 0 :: integer(),
%%                     left = null  :: 'null' | #tree_node{},
%%                     right = null :: 'null' | #tree_node{}}).

-spec invert_tree(Root :: #tree_node{} | null) -> #tree_node{} | null.

invert_tree(null)->
    null;

invert_tree(Root) ->
    #tree_node{val = Root#tree_node.val, left = invert_tree(Root#tree_node.right), right = invert_tree(Root#tree_node.left)}.