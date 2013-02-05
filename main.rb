
require 'httparty'
require 'JSON'
require 'pry'

conn = PG.connect(:dbname =>'moviez', :host => 'localhost')
conn.exec( "select * from film" ) do |result|
  result.each do |row|
  end
end

composite = "http://www.omdbapi.com/?i=&t="
puts 'type the movie name you would like to look up.'
ft = gets.split.join("+").to_s

mov_name = composite + ft

input = HTTParty.get(mov_name)

names = JSON(input.body)


puts "title: #{names.values.join("\n")}"
# puts "shit, an error."

# puts "{names.values}"



