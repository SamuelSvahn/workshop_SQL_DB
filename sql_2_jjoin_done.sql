# SQL Join exercise
#
use world;
#
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
	select* from city where name like 'ping%' order by population;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
	select* from city where name like 'ran%' order by population desc;
#
# 3: Count all cities
	select count(*) from city;
#
# 4: Get the average population of all cities
	select avg(population) from city;
#
# 5: Get the biggest population found in any of the cities
	select max(population) from city;
#
# 6: Get the smallest population found in any of the cities
	select min(population) from city;
#
# 7: Sum the population of all cities with a population below 10000
	select sum(population) from city where population < 10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
	select count(*) from city where countrycode in ('moz','vnm');
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
    select count(name), countrycode from city where countrycode in ('moz','vnm') group by countrycode;
#
# 10: Get average population of cities in MOZ and VNM
	select avg(population), countrycode from city where countrycode in ('moz','vnm') group by countrycode;
#
# 11: Get the countrycodes with more than 200 cities	
    select count(name), countrycode from city group by countrycode having count(name)>200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
	select count(name), countrycode from city group by countrycode having count(name)>200 order by count(name) desc;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
	select language from countrylanguage inner join city where population between 400 and 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
    select city.name, cl.language from city, countrylanguage cl, country c
    where(city.population between 500 and 600)
    and city.countrycode=c.code
    and c.code=cl.countrycode;

# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
	
    select name from city where countrycode=(select countrycode from city where population=122199);
    
    SELECT city2.name FROM city city1,city city2 WHERE city1.countrycode=city2.countrycode AND city1.population=122199;

# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
    
    SELECT city2.name FROM city city1,city city2 WHERE city1.countrycode=city2.countrycode AND city1.population=122199 AND city2.population<>122199;

# 17: What are the city names in the country where Luanda is capital?
	
    
    SELECT cn.name FROM city yc,country c,city cn WHERE yc.name="luanda" AND yc.id=c.capital AND c.code=cn.countrycode;
    
    
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
	
    SELECT oci.name FROM city yci,country yco,country oco,city oci WHERE yci.name="Yaren" AND yci.id=yco.capital AND yco.region=oco.region AND oco.capital=oci.id;

# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT language FROM city,country cc,country rc,countrylanguage cl WHERE city.name="riga" AND city.countrycode=cc.code AND cc.region=rc.region AND rc.code=cl.countrycode;

# 20: Get the name of the most populous city
	SELECT name FROM city tc WHERE tc.population=(SELECT max(population) FROM city);
