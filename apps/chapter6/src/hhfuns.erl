%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  2 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add(X, Y) -> X() + Y().

map(_, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> X + 1.
decr(X) -> X - 1.


a() ->
    Secret = "pony",
    fun() -> Secret end.

b(F) ->
    "a/0's password is " ++ F().

function(X) ->
    fun(X) when is_atom(X) ->
	    " is atom";
       (X) when is_list(X) ->
	    " is a list";
       (_X) ->
	    " is neither an atom nor a list"
    end.

result(F, X) ->
    io:format("~s" ++ F(X) ++ "~n", [X]).

base() ->
    A = 1,
    B = fun() -> A + 1 end,
    A + B().

filter(F, []) ->
    [];
filter(F, [H|T]) ->
    case F(H) of
	true -> [H|filter(F,T)];
	false -> filter(F,T)
    end.
	    

