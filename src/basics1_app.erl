-module(basics1_app).
%% ===================================================================
-behaviour(application).
%% ===================================================================
%% Application callbacks
%% ===================================================================
-export([start/2, stop/1]).
%% ===================================================================
-ifdef(TEST).

simple_test() ->
    ok = application:start(myapp),
    ?assertNot(undefined == whereis(myapp_sup)).

-endif.
%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    basics1_sup:start_link().

stop(_State) ->
    ok.
