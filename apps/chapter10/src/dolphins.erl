%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  5 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(dolphins).
-export([dolphin1/0, dolphin2/0]).

dolphin1() ->
    receive
	do_a_flip ->
	    io:format("How about no?~n");
	fish ->
	    io:format("So long and thanks for all the fish!~n");
	_ ->
	    io:format("Heh, we're smarter than humans.~n")
    end.

dolphin2() ->
    receive
	{From, do_a_flip} ->
	    From ! "How about no?";
	{From, fish}  ->
	    From ! "So long and thanks for all the fish!";
	_ ->
	    io:format("Heh, we're smarter than you humans.~n")
    end.
