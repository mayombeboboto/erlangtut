%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created : 26 Feb 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(what_the_if).
-export([heh_fine/1]).

heh_fine(N) ->
    if N =:= 1 ->
	    works;
       true -> always_does %% This is Erlang's if's 'else!'
    end.


