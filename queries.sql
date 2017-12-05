/*When an account is created with preferred site of IMDB, username of Person
 and password of badPassword123*/
INSERT INTO User (
	username,
	password,
	siteURL)
VALUES (
	"Person",
	"badPassword123"
	"http://www.imdb.com/");

/*Search by genre, user types in "Animated"*/
SELECT * FROM Movie
WHERE genre = "Animated";

/*
	In Flask it'd look like this: 
	
	db.execute ('select * from Movie where genre = ?', [USER_GENRE_INPUT])
	db.commit()
*/


/*Search for THE TITLE of a movie that have been released within the past 5 years*/
SELECT title 
FROM Movie
WHERE year >= 2012;


/*Here are just examples of other queries that'd be  possible similar to those above*/
SELECT * FROM Movie 
WHERE director = "George Lucas";

SELECT title 
FROM Movie
WHERE writer = "Joss Whedon";

/*Example of giving "Person" 3 favorite movies. ("Star Wars: Episode IV", "Avatar", "Inception"*/
INSERT INTO Favorite (
	username,
	movieID,
	userRating)
VALUES (
	"Person",
	(SELECT movieID
		FROM Movie
		WHERE title = "Star Wars: Episode IV"),
	9.5
);

INSERT INTO Favorite (
	username,
	movieID,
	userRating)
VALUES (
	"Person",
	(SELECT movieID
		FROM Movie
		WHERE title = "Avatar"),
	8.75
);

INSERT INTO Favorite (
	username,
	movieID,
	userRating)
VALUES (
	"Person",
	(SELECT movieID
		FROM Movie
		WHERE title = "Inception"),
	8.2
);


/*User exampleUser wants to see what favorite movies of his 
 were rated less highly on average than he rated them*/
SELECT title
FROM Movie
WHERE movieID = 
(SELECT movieID
FROM Favorite, Movie
WHERE username = "Person"
AND userRating > averageRating);

/*Let's now update a user's password. The user would type their password for 
confirmation 

In FLask:

@app.route('/<username>/passupdate', methods=['GET', 'POST'])
def update_password():
	db = get_db()
	if request.method == 'POST':
		nameInput = request.form['username']
		oldPasswordInput = request.form['password']
		if db.execute('select password from User where username = ?' [nameInput]) != oldPasswordInput:
			return redirect(url_for('update_password'))
		else:
			db.execute("update User set password = ? where username = ?", newPasswordInput, nameInput)
			db.commit()		
	return render_template('UpdateSuccess.html')

*/
UPDATE User 
SET password = "les;Ba%dPas9sword"
WHERE  username = "Person";

SELECT * FROM User
WHERE username = "Person";

/*
If we could implement the function to choose a users favorite site by 3 movies they rate 
it would look something like this. NOTE THIS IS PSEUDOCODE


userRatings[a, b, c]
movieIDS[a, b, c]

site1Sum = 0
site2Sum = 0
site3Sum = 0

for (int i = 0; i < 2, i++)
{
	site1Sum += (db.execute("select siteRating from Rates where siteURL = 'http://www.imdb.com/' and movieID = ?", [movieIDs[i]]) - userRating[i] //or flipped if userRating is bigger)
	site2Sum += (db.execute("select siteRating from Rates where siteURL = 'http://www.rottentomatoescom/' and movieID = ?", [movieIDs[i]]) - userRating[i] //or flipped if userRating is bigger)
	si3Sum += (db.execute("select siteRating from Rates where siteURL = 'http://www.metacritic.com/' and movieID = ?", [movieIDs[i]]) - userRating[i] //or flipped if userRating is bigger)
}

whichever is the least sum becomes the favorite site.
*/