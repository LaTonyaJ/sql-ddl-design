DROP DATABASE soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    games_won INTEGER
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    game_date DATE NOT NULL,
    home_team TEXT,
    opponent TEXT,
    score INTEGER NOT NULL,
    refs TEXT[] NOT NULL,
    players_id INTEGER NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    last_name TEXT NOT NULL,
    team_id INTEGER NOT NULL REFERENCES teams,
    jersey_number INTEGER UNIQUE
);


CREATE TABLE goals
(
    id SERIAL PRIMARY KEY,
    player_id INTEGER NOT NULL REFERENCES players,
    game_id INTEGER NOT NULL REFERENCES games
);

CREATE TABLE results
(
    id SERIAL PRIMARY KEY,
    game_id INTEGER NOT NULL REFERENCES games,
    winner TEXT,
    score TEXT 
);

