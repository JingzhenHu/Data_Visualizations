#!/url/bin/env ruby
#Journey Hu, 45221362
# CRCP 3310 Project4: A Relational Database Management Systems
# This program allows to see the songs stored ina sqlite3 database and prompts
# users to add new artists, albums, genres, and songs

require 'sqlite3' # import the library
#constant
DB_FILE_NAME = "songs.sqlite3.db"

SOL_DISPLAY_ALL_SONGS = "select artists.name as artistName, albums.name as albumName,songs.name as songName,genres.name as genresName from artists,albums,songs,genres
   where artists.id = albums.artist_id and genres.id = songs.genre_id and albums.id = songs.album_id;"
SQL_SELECT_GENRES = "SELECT name FROM genres;"
SQL_SELECT_ALBUMS = " SELECT name FROM albums"
SQL_SELECT_ARTISTS = "SELECT name FROM artists"
# Connect the database and open the data
db = SQLite3::Database.new(DB_FILE_NAME)
# Display menu
puts "Welcome to the music database!"
puts "	1. Display all song information."
puts "	2. Add a new genre."
puts "	3. Add a new artist."
puts "	4. Add a new album."
puts "	5. Add a new song."
puts "Enter a choice: ____ "

option = gets.chomp

if(option.to_i == 1)
	#puts "artistName         albumName             songName         genresName"
	printf "%-20s %-45s %-30s %-20s \n","artistName","albumName","songName","genresName"
	db.execute(SOL_DISPLAY_ALL_SONGS) do |row| #loop 
		#puts "#{row[0]}    #{row[1]}     #{row[2]}      #{row[3]}"
		printf  "%-20s %-45s %-30s %-20s \n","#{row[0]}","#{row[1]}","#{row[2]}","#{row[3]}"
	end
end

if(option.to_i == 2)
	puts "Genres in the database: "
	db.execute(SQL_SELECT_GENRES) do |row|
		puts row
	end
	puts "New genre name: ___"
	genreName = gets.chomp
	SQL_INSERT_GENRE = "INSERT INTO genres(name) VALUES('" + genreName +"');"
	#puts SQL_INSERT_GENRES
	db.execute(SQL_INSERT_GENRE)
end

if(option.to_i == 3)
	puts "Artists in the database: "
	db.execute(SQL_SELECT_ARTISTS) do |row|
		puts row
	end
	puts "New artist name: ___"
	artistName = gets.chomp
	SQL_INSERT_ARTIST = "INSERT INTO artists(name) VALUES('" + artistName +"');"
	db.execute(SQL_INSERT_ARTIST)
end

if(option.to_i == 4)
	puts "Albums in the database: "
	db.execute(SQL_SELECT_ALBUMS) do |row|
		puts row
	end
	puts "New album name: ___"
	albumName = gets.chomp
	db.execute("SELECT * FROM artists") do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	puts "Select an artist: ____"
	artistID = gets.chomp
	SQL_INSERT_ALBUM = "INSERT INTO albums(name, artist_id) VALUES('" + albumName + "', " + artistID + ");"
	db.execute(SQL_INSERT_ALBUM)
end

if(option.to_i == 5)
	puts "Add a new song!"
	puts "Song name: ___ "
	songName = gets.chomp;
	puts "Genres: "
	db.execute("SELECT * FROM genres") do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	puts "Select a genre: ___ "
	genreOP = gets.chomp
	puts "Albums: "
	db.execute("SELECT id, name FROM albums") do |row|
		puts "#{row[0]}. #{row[1]}"
	end
	puts "Select a album: ___ "
	albumOP = gets.chomp
	SQL_INSERT_SONG = "INSERT INTO songs(name, genre_id, album_id) VALUES('" + songName +"', " + genreOP + ", " + albumOP + ");"
	db.execute(SQL_INSERT_SONG)
end

db.close # close the database
# chmod u+x songs.rb and use ./songs.rb to execute the program



