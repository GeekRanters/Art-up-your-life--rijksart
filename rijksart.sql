CREATE DATABASE rijksart;

\c rijksart

CREATE TABLE artobjects(
  id SERIAL PRIMARY KEY,
  objectNumber TEXT NOT NULL,
  title TEXT NOT NULL,
  principalMaker TEXT,
  description TEXT,
  webImage TEXT,
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

CREATE TABLE tag_artobjects(
	id SERIAL PRIMARY KEY,
	tag_id INTEGER NOT NULL,
  artobject_id INTEGER NOT NULL,
  FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE RESTRICT,
  FOREIGN KEY (artobject_id) REFERENCES artobjects(id) ON DELETE RESTRICT
);

CREATE TABLE user_artobjects(
	id SERIAL PRIMARY KEY,
	user_id INTEGER NOT NULL,
  artobject_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (artobject_id) REFERENCES artobjects(id) ON DELETE CASCADE
);
