%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  1 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(recursion).
-export([len/1, tail_len/1, fac/1, tail_fac/2, duplicate/2]).


len([]) -> 0;
len([_H | T]) -> 1 + len(T). 
    
tail_len(List) ->
    tail_len(List, 0).

tail_len([], Acc) ->
    Acc;
tail_len([_H | T], Acc) ->
    tail_len(T, Acc + 1).

fac(0) ->
    1;
fac(N) ->
    N * fac(N -1).

tail_fac(1, Acc) ->
    Acc;
tail_fac(N, Acc) when N > 0 ->
    tail_fac(N - 1, Acc * N).

duplicate(1, V) ->
    [V];
duplicate(N, V) ->
    [V | duplicate(N - 1, V)].

