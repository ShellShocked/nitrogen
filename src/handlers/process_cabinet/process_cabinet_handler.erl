% Nitrogen Web Framework for Erlang
% Copyright (c) 2008-2009 Rusty Klophaus
% See MIT-LICENSE for licensing information.

%
% The process_cabinet handler allows you to associate a process with
% a key and later retrieve the process.
%
% Next Steps 
% ----------
% - Create an implementation using Ulf Wiger's "gproc" project.
%   http://www.erlang.se/workshop/2007/proceedings/02wiger.pdf
%   http://svn.ulf.wiger.net/gproc/
%

-module (process_cabinet_handler).
-export ([
	behaviour_info/1,
	get_pid/1,
	get_pid/2
]).



% get_pid(Key, State) -> {ok, Pid, NewState}.
% Get the process associated with this Key.
get_pid(Key) ->
	_Pid = wf_handler:call_readonly(process_cabinet_handler, get_pid, [Key]).

% get_pid(Key, Function, State) -> {ok, Pid, NewState}.	
% Return the process associated with Key. If that process does not
% exist, then create a new process and associate it with Key.
get_pid(Key, Function) ->
	{ok, _Pid} = wf_handler:call(process_cabinet_handler, get_pid, [Key, Function]).

		

behaviour_info(callbacks) -> [
	{init, 2},      
	{finish, 2},
	{get_pid, 3},
	{get_pid, 4}
];

behaviour_info(_) -> undefined.