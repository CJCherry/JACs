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

INSERT INTO RatingSite (
	siteURL,
	siteName)
VALUES (
	"http://www.imdb.com/",
	"IMDB");

INSERT INTO RatingSite (
	siteURL,
	siteName)
VALUES (
	"https://www.rottentomatoes.com/",
	"Rotten_tomatoes");

INSERT INTO RatingSite (
	siteURL,
	siteName)
VALUES (
	"http://www.metacritic.com/",
	"Metacritic");





INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Coco",
	2017,
	"Lee Unkrich",
	"Lee Unkrich",
	"Animation",
	8.7
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Coco"),
	8.9
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Coco"),
	9.4
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Coco"),
	8.0
);









INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Justice League",
	2017,
	"Chris Terrio",
	"Joss Whedon",
	"Action",
	6.6
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Justice League"),
	7.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Justice League"),
	8.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Justice League"),
	4.6
);





INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Moana",
	2016,
	"Jared Bush",
	"Ron Clements",
	"Animation",
	8.0
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Moana"),
	7.6
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Moana"),
	8.4
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Moana"),
	8.1
);






INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Star Wars: Episode I",
	1999,
	"George Lucas",
	"George Lucas",
	"Sci-Fi",
	6.0
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode I"),
	6.5
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode I"),
	6.6
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode I"),
	5.1
);





INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Star Wars: Episode IV",
	1977,
	"George Lucas",
	"George Lucas",
	"Sci-Fi",
	8.7
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode IV"),
	8.7
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode IV"),
	8.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode IV"),
	9.2
);






INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Baby Driver",
	2017,
	"Edgar Wright",
	"Edgar Wright",
	"Action",
	8.2
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Baby Driver"),
	7.8
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Baby Driver"),
	8.4
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Baby Driver"),
	8.6
);







INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Avatar",
	2009,
	"James Cameron",
	"James Cameron",
	"Sci-Fi",
	8.1
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Avatar"),
	7.8
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Avatar"),
	8.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Avatar"),
	8.3
);





INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Inception",
	2010,
	"Christopher Nolan",
	"Christopher Nolan",
	"Sci-Fi",
	8.2
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Inception"),
	8.8
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Inception"),
	8.4
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Inception"),
	7.4
);




INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Airplane!",
	1980,
	"Jim Abrahams",
	"David Zucker",
	"Comedy",
	7.6
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Airplane!"),
	7.8
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Airplane!"),
	7.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Airplane!"),
	7.8
);




INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"Pretty Woman",
	1990,
	"J.F Lawton",
	"Garry Marshall",
	"Romance",
	6.3
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Pretty Woman"),
	7.0
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Pretty Woman"),
	7.0
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "Pretty Woman"),
	5.1
);







INSERT INTO Movie (
	title,
	year,
	writer,
	director,
	genre,
	averageRating)
VALUES (
	"IT",
	2017,
	"Chase Palmer",
	"Andy Muschietti",
	"Horror",
	7.3
	);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.imdb.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "IT"),
	7.7
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.rottentomatoes.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "IT"),
	7.2
);

INSERT INTO Rates(
	siteURL,
	movieID,
	siteRating)
VALUES (
	"http://www.metacritic.com/",
	(SELECT movieID
		FROM Movie
		WHERE title = "IT"),
	7.0
);