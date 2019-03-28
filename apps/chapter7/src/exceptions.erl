%%% @author ericson_comment <ericson@ericson-Aspire-ES1-572>
%%% @copyright (C) 2019, ericson_comment
%%% @doc
%%%
%%% @end
%%% Created :  4 Mar 2019 by ericson_comment <ericson@ericson-Aspire-ES1-572>

-module(exceptions).
-export([black_knight/1, whoa/0, im_impressed/0, sword/1]).

sword(1) -> throw(slice);
sword(2) -> erlang:error(cut_arm);
sword(3) -> exit(cut_leg);

sword(4) -> throw(punch);
sword(5) -> exit(cross_bridge).
black_knight(Attack) when is_function(Attack, 0) ->
    try Attack() of
	_ -> "None shall pass."
    catch
	throw:slice -> "It is but a scratch.";
	error:cut_arm -> "I've had worse.";
	exit:cut_leg -> "Come on you pansy!";
	_:_ -> "Just a flesh wound."
    end.

whoa() ->
    try
	talk(),
	% _Knight = "None shall pass!",
	% _Doubles = [N*2 || N <- lists:seq(1,100)],
	throw(up),
	_WillReturnThis = tequila
    of
	tequila -> "Hey, this worked!"
    catch
	Exception:Reason -> {caught, Exception, Reason}
    end.

im_impressed() ->
    try
	talk(),
	% _Knight = "None shall pass!",
	% _Doubles = [N*2 || N <- lists:seq(1,100)],
	throw(up)
	% _WillReturnThis = tequila
    catch
	Exception:Reason -> {caught, Exception, Reason}
    end.

talk() -> "blah blah".
