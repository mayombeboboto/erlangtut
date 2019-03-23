-module(dolphins).
-export([dolphin1/0]).

dolphin1() ->
    receive
        {From, do_a_flip} ->
            From !"How abount no?";
        {From, fish} ->
            From ! "So long and thanks for all the fish!~n";
        _Pattern -> io:format("Heh, we're smarter than you humans.")
    end,
    dolphin1().