select DISTINCT name FROM songs;
SELECT  name FROM songs ORDER BY tempo ASC;
SELECT  name FROM songs ORDER BY duration_ms DESC LIMIT 5;
 select name FROM songs WHERE danceability >= 0.75 and valence >= 0.75 and energy >= 0.75;
SELECT AVG(energy) FROM songs;
 select name FROM songs where artist_id == (select id from artists where name == "Post Malone");
select avg(energy)FROM songs where artist_id == (select id from artists where name == "Drake");
select name from songs where name like "%feat.%";
