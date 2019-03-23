%%% @author Gradie Mayombe <GBMayombe@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, Gradie Mayombe
%%% @doc
%%%
%%% @end
%%% Created :  1 Mar 2019 by ericson_comment <GBMayombe@ericson-Aspire-ES1-572>
%%%---------------------------------------------------------------------------
-module(sorting).
%%%---------------------------------------------------------------------------
-export([ quicksort/1, lc_quicksort/1 ]).
%%%---------------------------------------------------------------------------

quicksort([]) -> [];
quicksort([Head|Tail]) ->
    {Greater, Smaller} = partition(Head, [], [], Tail),
    quicksort(Smaller) ++ [Head] ++ quicksort(Greater). 
    
partition(_Pivot, Greater, Smaller, []) -> {Smaller, Greater};
partition(Pivot, Greater, Smaller, [Head|Tail]) when Pivot > Head ->
    partition(Pivot, [Head|Greater], Smaller, Tail);
partition(Pivot, Greater, Smaller, [Head|Tail]) ->
    partition(Pivot, Greater, [Head|Smaller], Tail).

lc_quicksort([]) -> [];
lc_quicksort([Pivot|Rest]) ->
    Smaller = [X || X <- Rest, X =< Pivot],
    Greater = [X || X <- Rest, X > Pivot],
    lc_quicksort(Smaller) ++ [Pivot] ++ lc_quicksort(Greater).
		     

