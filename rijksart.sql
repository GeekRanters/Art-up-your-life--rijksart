CREATE DATABASE rijksart;

\c rijksart

CREATE TABLE artObjects(
  id SERIAL PRIMARY KEY,
  objectNumber TEXT NOT NULL,
  principalMaker TEXT,
  label TEXT NOT NULL,
  webImage TEXT NOT NULL,
  subject TEXT,
  colors TEXT
  );

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email_address TEXT NOT NULL,
  password_digest TEXT NOT NULL
);

CREATE TABLE artObjects_tags(
  id SERIAL PRIMARY KEY,
  art TEXT,
  FOREIGN KEY (art) REFERENCES artObject (id) ON DELETE RESTRICT,
  tag TEXT,
  FOREIGN KEY (tag) REFERENCES tag (id) ON DELETE RESTRICT
);

HAVE NOT BUILT TABLES BELOW:

CREATE TABLE collection(
  id SERIAL PRIMARY KEY,
  name TEXT,
  art TEXT NOT NULL,
  FOREIGN KEY (art) REFERENCES artObject (id) ON DELETE RESTRICT
);
