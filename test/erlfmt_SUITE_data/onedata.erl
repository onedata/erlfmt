%%%--------------------------------------------------------------------
%%% @author Author
%%% @copyright (C) data
%%% This software is released under the MIT license
%%% cited in 'LICENSE.txt'.
%%% @end
%%%--------------------------------------------------------------------
%%% @doc
%%% doc.
%%% @end
%%%--------------------------------------------------------------------
-module(onedata).

-inlude("foo.hrl").
-inlude("bar.hrl").

%% API
-export([foo/1]).
-export([bar/0]).


% aggregator function applied when a new measurement is inserted into a time window
-type aggregator() :: sum | max | min | last | first | avg.
-export_type([aggregator/0]).

-define(WEEK_RESOLUTION, 648000).  %- 7 days

%% erlfmt:ignore
-define(MONTH_RESOLUTION, 2592000).  % 30 days

%% erlfmt:ignore-begin
-define(YEAR_RESOLUTION, 31536000).  % 365 days

-record(struct, {
    a,
    b, % comment 2
    c % comment 3
}).
%% erlfmt:ignore-end

%%%===================================================================
%%% API functions
%%%===================================================================

qwe(#struct{
    a = 1,
    b = 2
}) ->
    atom.



-spec foo
    (0) -> 0;
    (1..3) -> 1;
    (4..5) -> 2;
    (6..9) -> 4.
foo(0) -> 0;

foo(1) -> 1;
foo(2) -> 1;
foo(3) -> 1;


foo(4) -> 2;
foo(5) -> 2;

foo(X) when
    X == 6;
    X == 7;
    X == 8;
    X == 9
    ->
    4.

%% commentos
-spec bar() -> ok | error.
bar() ->
    case method_to_json('POST') of

        <<"POST">> -> ok;


        <<"PUT">> ->
            foo(1),
            error;
        <<"GET">> -> foo(5), error
    end.

duh() ->
    lists:map(fun(Element) ->
        Element * 2
    end, lists:seq(10, 20)),

    callback(fun(Element) ->
        Element * 2
    end),

    true andalso
        1111111111111111111111111111111111111111111111111111111111 +  111111111111111111111111111111111111111111111,
    A = case 1111111111111111111111111111111111111111111111111111111111 +  1111111111111111111111111111111 of
        1 -> case 2 of
            5 -> #{
                key => case 7 of
                    8 -> 9
                end
            }
        end;
        3 -> 4
    end.


%%%===================================================================
%%% Internal functions
%%%===================================================================

%% @private
-spec method_to_json(atom()) -> binary().
method_to_json('POST') -> <<"POST">>;
method_to_json('PUT') -> <<"PUT">>;
method_to_json('GET') -> <<"GET">>.
