-module(basic_SUITE).
-include_lib("common_test/include/ct.hrl").
-export([all/0]).
-export([test1/1, test2/1]).

all() -> [teest1, test2].

test1(Config) ->
    erlang:display({config, Config}),
    1 = 1.

test2(_Config) ->
    A = 0,
    1/A.











