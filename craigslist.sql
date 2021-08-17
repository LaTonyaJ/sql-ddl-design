DROP DATABASE craigslist;

CREATE DATABASE craigslist;

\c craigslist;

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE regions
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username TEXT NOT NULL,
    user_password TEXT NOT NULL,
    preferred_region_id INTEGER REFERENCES regions
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    summary TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users,
    post_location TEXT,
    region_id INTEGER NOT NULL REFERENCES regions,
    category_id INTEGER NOT NULL REFERENCES categories
);

INSERT INTO categories(title) VALUES('jobs'), ('pets'), ('fun'), ('community');
INSERT INTO regions(title) VALUES('Atlanta'), ('San Francisco'), ('Seattle'), ('Los Angeles');
INSERT INTO users(username, user_password, preferred_region_id)
VALUES('tink', 'tink870', 4), ('champ', 'champ870', 4), ('Jo', 'Help123', 3);
INSERT INTO posts(title, summary, user_id, region_id, category_id)
VALUES('Need Work', 'Looking for developer job', 1, 4, 1),
('Want to Trend?', 'Hire a social media marketer', 2, 4, 1),
('Example', 'Post some', 3, 1, 4);