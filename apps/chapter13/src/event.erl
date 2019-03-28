-module(event).
-export([loop/1]).
-record(state, {server, name="",to_go=0}).

loop(S = #state{server=Server}) ->
    receive
        {Server, Ref, cancel} ->
            Server ! {Ref, ok}
    after timer:seconds(S#state.to_go) ->
        Server ! {done, S#state.name}
    end.
