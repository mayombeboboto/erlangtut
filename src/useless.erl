%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created : 25 Feb 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>
%%%-----------------------------------------------------------------------
-module(useless).
%%%-----------------------------------------------------------------------
-export([add/2, 
	 hello/0, 
	 greet_and_add_two/1, 
	 hour_to_second/1, 
	 subtract/2]). 
%%%-----------------------------------------------------------------------
-define(HOUR, 3600).
-define(SUB(X, Y), X - Y).
%%%-----------------------------------------------------------------------
add(A, B) ->
    A + B.

%% Shows greetings.
%% io:format/1 is the standard function used to output text.
hello() ->
    io:format("Hello, world!~n").

greet_and_add_two(X) ->
    hello(),
    add(X, 2).

subtract(X, Y) ->
    %% Using a function macro.
    ?SUB(X, Y).

-ifdef(HOUR).
-define(HOUR_MSG(Hour), io:format("~w seconds ~n", [?HOUR * Hour])).
-else.
-define(HOUR(Hour), ok).
-endif.

hour_to_second(Hour) ->
    %% Using a constant macro.
    ?HOUR_MSG(Hour).








