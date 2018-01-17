CREATE DATABASE rijksart;

\c rijksart

CREATE TABLE artObjects(
  id SERIAL PRIMARY KEY,
  objectNumber TEXT NOT NULL,
  principalMaker TEXT,
  description TEXT NOT NULL,
  webImage TEXT NOT NULL,
  museumurl TEXT NOT NULL,
  subject TEXT,
  colors TEXT
  );

CREATE TABLE tags(
  id SERIAL PRIMARY KEY,
  label TEXT
);

CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email TEXT NOT NULL,
  password_digest TEXT NOT NULL
);

CREATE TABLE artObjects_tags(
	id SERIAL PRIMARY KEY,
	tag_id INTEGER NOT NULL,
  art_object_id INTEGER NOT NULL,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE RESTRICT,
  FOREIGN KEY (art_object_id) REFERENCES artobjects(id) ON DELETE RESTRICT
);

CREATE TABLE artObjects_favourites(
	id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL,
  art_object_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT,
  FOREIGN KEY (art_object_id) REFERENCES artobjects(id) ON DELETE RESTRICT
);
