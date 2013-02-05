create table moviedata
(
  id serial8 primary key,
  Title varchar(40),
  Year varchar(4),
  Rated varchar(10),
  Released varchar(30),
  Runtime varchar(20),
  Genre varchar(60),
  Directors varchar(80),
  Writers varchar(80),
  Actors varchar(250),
  imdbRating float4


);