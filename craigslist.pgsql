DROP DATABASE craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE categories
(
    id SERIAL,
    name TEXT NOT NULL,

);

CREATE TEABLE regions
(
    id SERIAL,
    name TEXT NOT NULL,
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT,
    password TEXT,
    preferred_region_id
)

CREATE TABLE posts
(
    id SERIAL,
    title TEXT NOT NULL,
    summary TEXT NOT NULL,
    user TEXT NOT NULL,
    location_of_post TEXT,
    region_id TEXT REFERENCES regions,
    category_id TEXT REFERENCES categories,
    user_id
);