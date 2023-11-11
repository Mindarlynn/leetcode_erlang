-spec length_of_longest_substring(S :: unicode:unicode_binary()) -> integer().

skip_set(S, Set, I, J) ->
    SI = lists:nth(I, S),
    SJ = lists:nth(J, S),
    case SI == SJ of
        true -> {I + 1, Set};
        false -> skip_set(S, sets:del_element(SI, Set), I + 1, J)
    end.

get_substr_len(S, Set, I, J, Max) ->
    case length(S) < J of
        true -> Max;
        false ->
            SJ = lists:nth(J, S),
            case sets:is_element(SJ, Set) of
                false -> get_substr_len(S, sets:add_element(SJ, Set), I, J + 1, lists:max([Max, J - I + 1]));
                true -> 
                    {NewI, NewSet} = skip_set(S, Set, I, J),
                    get_substr_len(S, NewSet, NewI, J + 1, Max)
            end
    end.

length_of_longest_substring(<<>>) -> 0;
length_of_longest_substring(S) ->
    SS = binary_to_list(S),
    get_substr_len(SS, sets:new(), 1, 1, 0).
