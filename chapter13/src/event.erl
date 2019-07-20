%%% @author gradie <gradie@gradie-Aspire-ES1-572>
%%% @copyright (C) 2019, gradie
%%% @doc
%%%
%%% @end
%%% Created : 19 Jul 2019 by gradie <gradie@gradie-Aspire-ES1-572>

-module(event).
-compile(export_all). %% To be fixed.
-include_lib("../include/event_handler.hrl").

start(EventName,Delay) ->
  spawn(?MODULE,init,[self(),EventName,Delay]).

start_link(EventName,Delay) ->
  spawn_link(?MODULE,init,[self(),EventName,Delay]).

%%% event's innards
init(Server,EventName,Datetime) ->
  loop(#state{ server=Server,name=EventName,to_go=time_to_go(Datetime) }).

%% Loop uses a list for times in order to go around the ~49 days limit
%% on timeouts.
loop(S = #state{ server=Server,to_go=[T|Next] }) ->
  receive
    {Server,Ref,cancel} -> Server ! {Ref,ok}
  after T * 1000 ->
      if Next =:= [] -> Server ! {done,S#state.name};
         Next =/= [] -> loop(S#state{to_go=Next})
      end
  end.

cancel(Pid) ->
  %% Monitor in case the process is already dead.
  Ref = erlang:monitor(process, Pid),
  Pid ! {self(),Ref,cancel},
  receive
    {Ref,ok} ->
      erlang:demonitor(Ref,[flush]),
      ok;
    {'DOWN',Ref,process,Pid,_Reason} ->
      ok
  end.

%%%======================================================================
%%% INTERNAL FUNCTIONS
%%%======================================================================
time_to_go(TimeOut={{_Year,_Month,_Day},{_H,_M,_S}}) ->
  Now  = calendar:local_time(),
  ToGo = calendar:datetime_to_gregorian_seconds(TimeOut) - calendar:datetime_to_gregorian_seconds(Now),
  Secs = if ToGo > 0 -> ToGo;
            true     -> 0
         end,
  normalize(Secs).
             
%% Because Erlang is limited to about 49 days (49*24*60*60*1000) in
%% milliseconds, the following function is used.
normalize(N) ->
  Limit = 49*24*60*60,
  [N rem Limit | lists:duplicate(N div Limit,Limit)].
