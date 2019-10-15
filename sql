--Which are the 10 longest R rated movies?

SELECT
	title
	,length

FROM 
	film

WHERE
	rating = 'R'

ORDER BY 
	length DESC

LIMIT 10;

-- What are the NEXT 10 longest R rated movies?
-- hint: google "how to get next 10 records in sql"

SELECT
	title
	,length

FROM 
	film

WHERE
	rating = 'R'

ORDER BY 
	length DESC

LIMIT 10

OFFSET 10;


--How many films are as long as the longest film?
-- RETURN an exact number


SELECT
	title
	,MAX(length) as longest

FROM
	film

--Which are the 10 longest R rated movies, SORTED IN ALPHABETICAL ORDER?
-- hint: might need a subquery

SELECT
	title

FROM
		(SELECT
			title
			,length

		FROM 
			film

		WHERE
			rating = 'R'

		ORDER BY 
			length DESC

		LIMIT 10) as want_sort

ORDER BY
	title

--Which are the 10 kids films with the longest description?
-- G, PG, PG-13
--hint: google "SQL count length of string"


SELECT
	title
	,LENGTH(description)

FROM
	film

WHERE
	rating IN ('G', 'PG', 'PG-13')	

GROUP BY
	title
	,description

ORDER BY
	LENGTH(description) DESC

LIMIT 10;

-- How many unique release_years are there in the dvd rental database?
-- Return an exact number

-- There are 0 unique release years

SELECT 
	release_year
	,COUNT(release_year)

FROM
	film
		
GROUP BY
	release_year

HAVING
	COUNT(release_year) = 1