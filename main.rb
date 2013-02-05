require 'httparty'
require 'json'
require 'pry'
require 'pg'

conn = PG.connect(:dbname =>'moviedatabase', :host => 'localhost')
conn.exec( "select * from moviedata" ) do |result|
  result.each do |row|
  end
end
# conn.close

composite = "http://www.omdbapi.com/?i=&t="
puts 'type the movie name you would like to look up.'
ft = gets.split.join("+").to_s

mov_name = composite + ft

input = HTTParty.get(mov_name)

names = JSON(input.body)

# puts "title: #{names.values.join("\n")}"

sqc = "insert into moviedata (Title, Year, Rated, Released, Runtime, Genre, Directors, Writers, Actors,imdbRating) values ('#{names["Title"]}', '#{names["Year"]}', '#{names["Rated"]}', '#{names["Released"]}', '#{names["Runtime"]}', '#{names["Genre"]}', '#{names["Directors"]}', '#{names["Writers"]}', '#{names["Actors"]}', '#{names["imdbRating"]}');"
#sql = "insert into moviedata (title, year, rated, released, runtime, genre, director, writer, actors, poster, imdbrating, imdbvotes, imdbID) values ('#{data['Title']}', '#{data['Year']}', '#{data['Rated']}', '#{data['Released']}', '#{data['Runtime']}', '#{data['Genre']}', '#{data['Director']}', '#{data['Writer']}', '#{data['Actors']}', '#{data['Plot']}', '#{data['Poster']}', '#{data['imdbRating']}', '#{data['imdbVotes']}', '#{data['imdbID']}')"

conn.exec(sqc)
conn.close
