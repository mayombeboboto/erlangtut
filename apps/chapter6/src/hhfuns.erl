%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  2 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(hhfuns).
-export([one/0, two/0, add/2, map/2, incr/1, decr/1, a/0, b/1, result/2, base/0, filter/2]).

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

result(F, X) ->
    io:format("~s" ++ F(X) ++ "~n", [X]).

base() ->
    A = 1,
    B = fun() -> A + 1 end,
    A + B().

filter(_F, []) ->
    [];
filter(F, [H|T]) ->
    case F(H) of
	true -> [H|filter(F,T)];
	false -> filter(F,T)
    end.
	    

