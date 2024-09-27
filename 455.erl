-spec find_content_children(G :: [integer()], S :: [integer()]) -> integer().

find_content_children(G, S) ->
    find(lists:reverse(lists:sort(G)), lists:reverse(lists:sort(S))).

find(G, S) -> find(G, S, 0).
find([], _, Count) -> Count;
find(_, [], Count) -> Count;
find([G | Gs], [S | Ss], Count) ->
    case G =< S of
        true -> find(Gs, Ss, Count + 1);
        false -> find(Gs, [S | Ss], Count)
    end.