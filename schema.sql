PRAGMA foreign_keys = ON;

DROP TABLE IF EXISTS Movie;
CREATE TABLE Movie (
	movieID 		INTEGER PRIMARY KEY AUTOINCREMENT,
  	title 			TEXT NOT NULL,
  	year 			INTEGER NOT NULL,
  	writer 			TEXT NOT NULL,
  	director 		TEXT NOT NULL,
  	genre 			TEXT NOT NULL,
  	averageRating 	REAL NOT NULL
);

DROP TABLE IF EXISTS User;
CREATE TABLE User (
	username 		TEXT PRIMARY KEY,
	password 		TEXT NOT NULL,
	siteURL 		TEXT NOT NULL,
	FOREIGN KEY(siteURL) REFERENCES RatingSite(siteURL)
			ON UPDATE CASCADE
);

DROP TABLE IF EXISTS RatingSite;
CREATE TABLE RatingSite (
	siteURL 		TEXT PRIMARY KEY,
	siteName		TEXT NOT NULL
);

DROP TABLE IF EXISTS Rates;
CREATE TABLE Rates (
	siteURL 		TEXT NOT NULL,
	movieID 		INTEGER NOT NULL,
	siteRating 		REAL NOT NULL UNIQUE,
	PRIMARY KEY (siteURL, movieID),
	FOREIGN KEY(siteURL) REFERENCES RatingSite(siteURL)
			ON UPDATE CASCADE,
	FOREIGN KEY(movieID) REFERENCES Movie(movieID)
			ON UPDATE CASCADE
);

DROP TABLE IF EXISTS Favorite;
CREATE TABLE Favorite (
	username 		TEXT NOT NULL,
	movieID 		INTEGER NOT NULL,
	userRating 		REAL NOT NULL UNIQUE,
	PRIMARY KEY (username, movieID),
	FOREIGN KEY(username) REFERENCES User(username)
			ON UPDATE CASCADE,
	FOREIGN KEY(movieID) REFERENCES Movie(movieID)
			ON UPDATE CASCADE
);
