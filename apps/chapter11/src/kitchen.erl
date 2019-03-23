-module(kitchen).
-export([start/1, fridge1/1, store/2, take/2]).

start(FoodList) ->
    spawn(?MODULE, fridge1, [FoodList]).

fridge1(FoodList) ->
    receive
        {From, {store, Food}} ->
            From ! {self(), {Food, stored}},
            fridge1([Food|FoodList]);
        {From, {take, Food}} ->
            case lists:member(Food, FoodList) of
                true ->
                    From ! {self(), {Food, retrieved}},
                    fridge1(lists:delete(Food, FoodList));                       
            false ->
                    From ! {self(), not_found},
                    fridge1(FoodList)
            end;
            terminate -> ok
    end.

store(Pid, Food) ->
    Pid ! {self(), {store, Food}},
    receive
        {Pid, Msg} -> Msg
    after 3000 -> % This pid times out if nothing happens within 3000 millisecond upon sendign a Msg
        timeout 
    end.

take(Pid, Food) ->
    Pid ! {self(), {take, Food}},
    receive
        {Pid, Msg} -> Msg
    after 3000 -> 
        timeout 
    end.