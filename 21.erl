%% Definition for singly-linked list.
%%
%% -record(list_node, {val = 0 :: integer(),
%%                     next = null :: 'null' | #list_node{}}).

-spec merge_two_lists(List1 :: #list_node{} | null, List2 :: #list_node{} | null) -> #list_node{} | null.

merge_two_lists(List1, List2) ->
    case {List1, List2} of
        {null, null} -> null;
        {List1, null} -> List1;
        {null, List2} -> List2;
        {List1, List2} ->
            Val1 = List1#list_node.val,
            Val2 = List2#list_node.val,
            case Val1 < Val2 of
                true -> 
                    #list_node{val = Val1, next = merge_two_lists(List1#list_node.next, List2)};
                false ->
                    #list_node{val = Val2, next = merge_two_lists(List1, List2#list_node.next)}
            end
    end.
