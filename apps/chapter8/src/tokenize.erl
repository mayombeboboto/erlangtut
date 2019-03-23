%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created : 10 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(tokenize).

tokenize(Bin, Token) ->
    tokenize(Bin, Token, []).

tokenize(<<>>, _Token, Acc) ->
    Acc;
tokenize() ->



