-spec count_points(Points :: [[integer()]], Queries :: [[integer()]]) -> [integer()].

dist([X1 | [Y1 | R1]], [X2 | [Y2 | []]]) -> {hd(R1), math:sqrt(math:pow(X1-X2, 2) + math:pow(Y1-Y2, 2))}.

get_point_num_in_circle(_, []) -> [];
get_point_num_in_circle(Points, [H | T]) ->
    [lists:foldl(
        fun (X, Cnt) ->
            {R1, Dist} = dist(H, X),
            case R1 < Dist of
                true -> Cnt;
                false -> Cnt + 1
            end
        end,
        0, Points
    )] ++ get_point_num_in_circle(Points, T).

count_points(Points, Queries) ->
    get_point_num_in_circle(Points, Queries).