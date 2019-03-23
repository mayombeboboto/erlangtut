%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  4 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(records).
-export([first_robot/0, admin_panel/1, adult_section/1, update_user/1]).

-include("../include/records.hrl").

%% Use pattern matching to filter.
admin_panel(#user{name = Name, group = admin}) ->
    Name ++ " is allowed!";
admin_panel(#user{name = Name}) ->
    Name ++ " is not allowed".

%% Can extend user without problem.
adult_section(U = #user{}) when U#user.age >= 18 ->
    allowed;
adult_section(_) ->
    forbidden.

first_robot() ->
    #robot{name="Mechatron",
	   type=handmade,
	   details=["Moved by a small inside"]}.
-spec update_user(#user{}) -> {updated_user, #user{}}.
update_user(User1) ->
    NewGroup = User1#user.group,
    UpdatedUser = User1#user{group = [admin|NewGroup]},
    {updated_user, UpdatedUser}.
    

