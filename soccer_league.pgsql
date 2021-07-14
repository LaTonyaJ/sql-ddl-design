DROP DATABASE soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL,
    name TEXT NOT NULL,
    ranking INTEGER
    
);

CREATE TABLE players
(
    id SERIAL,
    first_name TEXT NOT NULL,
    last_name TEXT,
    team_id NOT NULL,
    jersey_number INTEGER UNIQUE,
    games_scored_in TEXT,
    total_goals INTEGER
);

CREATE TABLE games
(
    id SERIAL,
    game_date DATE NOT NULL,
    winner TEXT,
    opponent TEXT,
    score TEXT NOT NULL,
    refs TEXT NOT NULL,
    players_id NOT NULL
);

