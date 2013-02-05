create table moviedata
(
  id bigint primary key,
  Title varchar(40),
  Year varchar(4) not null,
  Rated float4,
  Released varchar(20),
  Runtime varchar(20),
  Genre varchar(20),
  Directors varchar(40),
  Writers varchar(40),
  Actors varchar(80),
  Plot varchar(350),
  imdb_Rating float4
);


