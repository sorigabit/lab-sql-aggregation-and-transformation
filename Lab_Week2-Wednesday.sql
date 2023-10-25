USE sakila;

# Determine the shortest and longest movie durations and name the values as max_duration and min_duration.
SELECT MAX(length) as max_duration, MIN(length) as min_duration
FROM film;

#Express the average movie duration in hours and minutes. Don't use decimals

SELECT CONCAT(FLOOR(AVG(length)/60) , 'h' , (FLOOR(AVG(length)) % 60)) as average_duration
FROM film;

#SELECT AVG(LENGTH) AS 'avg', CONCAT(FLOOR(AVG(LENGTH)/60),'h:', LPAD(MOD(AVG(LENGTH),60),2,0),'m') AS 'average_movie_duration' FROM film;


#2.1 Calculate the number of days that the company has been operating.
SELECT DATEDIFF(MAX(rental_date), MIN(rental_date)) as 'days'
FROM rental;

#Retrieve rental information and add two additional columns to show the month and weekday of the rental. Return 20 rows of results.


SELECT *, date_format(rental_date, '%M') AS 'month', 
date_format(rental_date, '%a') AS 'weekday'
FROM rental
LIMIT 20;

#You need to ensure that customers can easily access information about the movie collection. To achieve this, retrieve the film titles and their rental duration. If any rental duration value is NULL, replace it with the string 'Not Available'. Sort the results of the film title in ascending order.

SELECT film_id, title, IFNULL(rental_duration, 'Not Available') as rental_duration
FROM film
ORDER BY title ASC;

#Challenge2
#The total number of films that have been released.

SELECT COUNT(DISTINCT film_id)
FROM film;

#The number of films for each rating.

SELECT rating, COUNT(DISTINCT film_id) as 'Number_of_films'
FROM film
GROUP BY rating;

#he number of films for each rating, sorting the results in descending order of the number of films

Select rating, COUNT(DISTINCT film_id) as "Number_of_films"
FROM film
GROUP by rating
ORDER BY Number_of_films DESC;

#2.1 The mean film duration for each rating, and sort the results in descending order of the mean duration. Round off the average lengths to two decimal places.

Select rating, COUNT(DISTINCT film_id) as "Number_of_films", ROUND(AVG(length),2) as mean_duration
FROM film
GROUP by rating
ORDER BY mean_duration DESC;

#2.2 Identify which ratings have a mean duration of over two hours in order to help select films for customers who prefer longer movies.

Select rating, COUNT(DISTINCT film_id) as "Number_of_films", (ROUND(AVG(length),2)) > 120 as "Over 120 min"
FROM film
GROUP by rating;

#bonus
SELECT last_name, COUNT(DISTINCT first_name) as "how_many" 
FROM actor
GROUP BY last_name
ORDER BY how_many ASC;






















