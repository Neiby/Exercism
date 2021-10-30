-module(bob).

-export([response/1]).

is_question(String) ->
    case lists:last(String) of
        $? -> true;
        _ -> false
    end.

is_upper(String) -> 
    case string:uppercase(String) of
        String -> true;
        _ -> false
    end.

is_alphaNum(String) -> 
    case re:run(String, "^[A-Za-z\!\?\.\,\s\']+$") of
        {match, _} -> true;
        nomatch    -> false
    end.

response("") -> "Fine. Be that way!";
response(Original) ->
    String = string:trim(Original),
    IsQuestion = is_question(String),
    IsUpper = is_upper(String),
    IsAlpha = is_alphaNum(String),
    io:format(IsAlpha),
    case {IsQuestion, IsUpper, IsAlpha} of
        {true, true, true} -> "Calm down, I know what I'm doing!";
        {true, false, true} -> "Sure.";
        {false, true, true} -> "Whoa, chill out!";
        _ -> "Whatever."
    end.