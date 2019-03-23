%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  6 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(hhfuns).
-compile(export_all).

one() -> 1.
two() -> 2.

add() ->
    one() + two().

map(_F, []) -> [];
map(F, [H|T]) -> [F(H)|map(F,T)].

incr(X) -> 
    X + 1.

decr(X) ->
    X - 1.
    
a() ->
    Secret = "pony",
    fun() -> Secret end.

b(F) ->
    "a/0's password is "++F().
    


