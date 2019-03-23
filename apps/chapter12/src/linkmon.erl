-module(linkmon).
-export([start_critic/0, judge/ 2, critic/0, restarter/0, chain/1, myproc/0]).

start_critic() ->
    spawn(?MODULE, critic, []).

judge(Band, Album) ->
    Ref = make_ref(),
    critic ! {self(), Ref, {Band, Album}},
    receive
      {Ref, Criticism} -> Criticism 
      after 2000 -> timeout
    end.

critic() ->
    receive
        {From, Ref, {"Rage Against the Turing Machine", "Unit Testify"}} ->
            From ! {Ref, "They are great!"};
        {From, Ref, {"System of a Downtime", "Memorize"}} ->
            From ! {Ref, "They're not Johnny Crash but they're good."};
        {From, Ref, {"Johnny Crash", "The Token Ring of Fire"}} ->
            From ! {Ref, "Simply incredible."};
        {From, Ref, {_Band, _Album}} ->
            From ! {Ref, "They are terrible!"}
    end,
    critic().

restarter() ->
    process_flag(trap_exit, true),
    Pid = spawn_link(trap_exit, true),
    register(critic, Pid),
    receive
        {'EXIT', Pid, normal} -> % not a cash
            ok;
        {'EXIT', Pid, shutdown} -> % manual termination, not a crash
            ok;
        {'EXIT', Pid, _} -> restarter()
    end.

myproc() -> timer:sleep(5000), exit(reason).

chain(0) ->
    receive
      _ -> ok after 2000 -> exit("chain dies here")
    end;
chain(N) ->
    Pid = spawn(fun () -> chain(N - 1) end),
    link(Pid),
    receive _ -> ok end.
