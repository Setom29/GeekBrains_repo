DROP DATABASE IF EXISTS notes_bot;
CREATE DATABASE notes_bot;

USE notes_bot;

CREATE TABLE users(
	id SERIAL PRIMARY KEY,
	telegram_id BIGINT UNSIGNED NOT NULL,
	first_name VARCHAR(150) NOT NULL,
	last_name VARCHAR(150) NOT NULL,
	added_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	is_adm BOOLEAN DEFAULT FALSE,
	INDEX (telegram_id),
    INDEX (is_adm)
);

CREATE TABLE profiles( -- table for user's info
	user_id BIGINT UNSIGNED NOT NULL PRIMARY KEY,
	phone CHAR(11) NOT NULL UNIQUE,
	email VARCHAR(150) UNIQUE,
    INDEX (user_id),
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE projects(
	id SERIAL PRIMARY KEY,
	name VARCHAR(150) UNIQUE NOT NULL,
	description VARCHAR(255) NOT NULL,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
	INDEX (name)
);

CREATE TABLE project_members(
	project_id BIGINT UNSIGNED NOT NULL,
	user_id BIGINT UNSIGNED NOT NULL,
	INDEX (project_id),
	INDEX (user_id),
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE notes(
	id SERIAL PRIMARY KEY,
	project_id BIGINT UNSIGNED NOT NULL,
	file_name VARCHAR(255) COMMENT '/files/folder/img.png',
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE docs(
	id SERIAL PRIMARY KEY,
	project_id BIGINT UNSIGNED NOT NULL,
	file_name VARCHAR(255) COMMENT '/files/folder/img.png',
	added_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (project_id) REFERENCES projects(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE messages(  -- history of messages
	id SERIAL PRIMARY KEY,
    user_id BIGINT UNSIGNED,
	txt TEXT,
	created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL ON UPDATE CASCADE
);

CREATE TABLE unknown_members(
	id SERIAL PRIMARY KEY,
	telegram_id BIGINT UNSIGNED NOT NULL,
	first_name VARCHAR(150),
	last_name VARCHAR(150)
);

CREATE TABLE commands( -- description for all available commands
	id SERIAL PRIMARY KEY,
	name VARCHAR(150),
	description TEXT
);

CREATE TABLE stickers( -- bot sends stickers on words from column text_for_stickers
	id SERIAL PRIMARY KEY,
	sticker_id VARCHAR(150) NOT NULL,
	text_for_sticker VARCHAR(150) NOT NULL
);



