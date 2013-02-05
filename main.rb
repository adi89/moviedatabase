require 'httparty'
require 'json'
require 'pry'
require 'pg'

conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
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

sql = "insert into moviedata (Title, Year, Rated, Released, Runtime, Genre, Directors, Writers, Actors, Plot, imdb_Rating) values ('#{names["Title"]}, #{names["Year"]}, #{names["Rated"]}, #{names["Released"]}, #{names["Runtime"]}, #{names["Genre"]}, #{names["Directors"]}, #{names["Writers"]}, #{names["Actors"]}, #{names["Plot"]}, #{names["imdb_Rating"]}')"

# binding.pry

conn.exec(sql)
conn.close
