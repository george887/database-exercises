USE albums_db;
SELECT * 
from albums
where artist = 'Pink Floyd';

SELECT `release_date`
from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band";

SELECT genre
from albums
where name = 'Nevermind';

SELECT *
from albums
where release_date BETWEEN '1990' AND '1999';

SELECT *
from albums
where release_date BETWEEN '1990' AND '1999'
and sales < 20;
# Does not show "Hard rock" or "Progressive rock" due to us asking specificly rock 
SELECT *
from albums
where genre = 'Rock';