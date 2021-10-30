-module(robot_simulator).

-export([advance/1, create/0, direction/1, left/1, place/3, position/1, right/1, main/1]).

main(Robot) ->
    receive
        advance ->
            NewRobot = advance_robot(Robot),
            main(NewRobot);
        {direction, Pid} -> 
            {Direction, _Position} = Robot,
            Pid ! {direction, Direction},
            main(Robot);
        left ->
            NewRobot = turn_left(Robot),
            main(NewRobot);
        right ->
            NewRobot = turn_right(Robot),
            main(NewRobot);
        {position, Pid} ->
            {_, Position} = Robot,
            Pid ! {position, Position},
            exit(normal);
        {place, Direction, Position} ->
            NewRobot = {Direction, Position},
            main(NewRobot)
    end.

advance_robot({north, {X,Y}}) -> {north, {X, Y+1}};
advance_robot({south, {X,Y}}) -> {south, {X, Y-1}};
advance_robot({east, {X,Y}}) -> {east, {X+1, Y}};
advance_robot({west, {X,Y}}) -> {west, {X-1, Y}}.

turn_left({north, {X,Y}}) -> {west, {X,Y}};
turn_left({south, {X,Y}}) -> {east, {X,Y}};
turn_left({east, {X,Y}}) -> {north, {X,Y}};
turn_left({west, {X,Y}}) -> {south, {X,Y}}.

turn_right({north, {X,Y}}) -> {east, {X,Y}};
turn_right({south, {X,Y}}) -> {west, {X,Y}};
turn_right({east, {X,Y}}) -> {south, {X,Y}};
turn_right({west, {X,Y}}) -> {north, {X,Y}}.

advance(RobotPid) -> 
    RobotPid ! advance.

create() -> 
    RobotPid = spawn_link(robot_simulator, main, [{}]),
    RobotPid.

place(RobotPid, Direction, Position) ->
    RobotPid ! {place, Direction, Position}. 

left(RobotPid) -> RobotPid ! left.

right(RobotPid) -> RobotPid ! right.

position(RobotPid) -> 
    RobotPid ! {position, self()},
    receive
        {position, Position} ->
            Position
    end.

direction(RobotPid) -> 
    RobotPid ! {direction, self()},
    receive
        {direction, Direction} -> 
            Direction
    end.
