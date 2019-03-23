%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created : 26 Feb 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(patternmatching).
-export([ greet/2, 
	  same/2, 
	  insert/2,  
	  beach/1 ]).

greet(male, Name) ->
    io:format("Hello, Mr. ~s!~n", [Name]);
greet(female, Name) ->
    io:format("Hello, Mrs. ~s!~n", [Name]);
greet(_Gender, Name) ->
    io:format("Hello, ~s!~n", [Name]).

same(X, X) ->
    true;
same(_X, _Y) ->
    false.

insert(X, []) ->
    [X];
insert(X, Set) ->
    case lists:member(X, Set) of
	true ->
	    Set;
	false ->
	    [X | Set]
    end.

beach(Temperature) ->
    case Temperature of
	{celsius, N} when N >= 20, N =< 45 ->
	    'favorable';
	{kelvin, N} when N >= 293, N =< 318 ->
	    'scientifically favorable';
	{fahrenheit, N} when N >= 68, N =< 113 ->
	    'favorable in the US';
	_Unknown ->
	    'avoid beach'
    end.
