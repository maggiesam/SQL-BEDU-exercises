-- SESIÓN 4 RETOS
-- María Magdalena Castro Sam

USE MiBase;

-- RETO 1
CREATE TABLE Movies (
   id INT PRIMARY KEY, 
   title VARCHAR(80), 
   genres VARCHAR(60) );
   
   CREATE TABLE Ratings (
   userid INT,
   movieid INT,
   rating INT,
   time_stamp BIGINT,
   FOREIGN KEY (userid) REFERENCES users(id),
   FOREIGN KEY (movieid) REFERENCES Movies(id) );
   
-- RETO 2
SELECT *
FROM Movies;
INSERT INTO Movies (id,title,genres) VALUES (8450,'Arrival','Science Fiction');

SELECT *
FROM ratings;
INSERT INTO ratings (userid,movieid,rating,time_stamp) VALUES (10,5580,5,10030760);