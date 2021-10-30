-module(space_age).

-export([age/2]).
-define(FACTOR, 31557600).

age(mercury, Seconds) -> Seconds / ?FACTOR / 0.2408467;
age(venus, Seconds) -> Seconds / ?FACTOR / 0.61519726;
age(earth, Seconds) -> Seconds / ?FACTOR;
age(mars, Seconds) -> Seconds / ?FACTOR / 1.8808158;
age(jupiter, Seconds) -> Seconds / ?FACTOR / 11.862615;
age(saturn, Seconds) -> Seconds / ?FACTOR / 29.447498;
age(uranus, Seconds) -> Seconds / ?FACTOR / 84.016846;
age(neptune, Seconds) -> Seconds / ?FACTOR / 164.79132.
