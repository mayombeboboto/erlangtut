%%%-------------------------------------------------------------------
%%% @author gradie
%%% @copyright (C) 2019, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 09. Aug 2019 18:29
%%%-------------------------------------------------------------------
-module(event).
-author("gradie").
%%%-------------------------------------------------------------------
%% APIs
-export([start/2,start_link/2,init/3]).
-export([cancel/1]).
-export([loop/1]).
%%%-------------------------------------------------------------------
-record(state, { server,name = "",to_go = 0 }).
%%%-------------------------------------------------------------------
start(EventName,Delay) ->
  spawn(?MODULE,init,[self(),EventName,Delay]).

start_link(EventName,Delay) ->
  spawn_link(?MODULE,init,[self(),EventName,Delay]).

init(Server,EventName,Delay) ->
  loop(#state{server = Server, name = EventName, to_go = time_to_go(Delay)}).
%%%-------------------------------------------------------------------
cancel(Pid) ->
  %% Monitor in case the process is already dead.
  Ref = erlang:monitor(process,Pid),
  Pid ! {self(),Ref,cancel},
  receive
    {Ref,ok} ->
      erlang:demonitor(Ref,[flush]),
      ok;
    {'DOWN',Ref,process,Pid,_Reason} -> ok
  end.

%%%-------------------------------------------------------------------
loop(S = #state{ server = Server, to_go = [T | Next] }) ->
  receive
    {Server,Ref,cancel} -> Server ! {Ref,ok}
  after T*1000 -> % From second to millisecond
    if Next =:= [] ->
        Server ! {done, S#state.name};
       Next =/= [] ->
        loop(S#state{ to_go = Next })
    end
  end.

%%%-------------------------------------------------------------------
%%% HELPER FUNCTION
%%%-------------------------------------------------------------------
time_to_go(TimeOut = {{_D,_M,_Y},{_H,_Min,_S}}) ->
  Now  = calendar:local_time(),
  ToGo = calendar:datetime_to_gregorian_seconds(TimeOut) - calendar:date_to_gregorian_days(Now),

  Secs = if ToGo >  0 -> ToGo;
            ToGo =< 0 -> 0
         end,
  normalize(Secs).

%% Because Erlang is limited to about 49 days (49*24*60*60*1000) in
%% milliseconds, the following function is used.
normalize(N) ->
  Limit = 49*24*60*60,
  [N rem Limit | lists:duplicate(N div Limit, Limit)].
