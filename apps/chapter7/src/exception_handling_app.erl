-module(exception_handling_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
    exception_handling_sup:start_link().

stop(_State) ->
    ok.
