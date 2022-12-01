# general req
select * from countries;

select * from competitions;

select countries.id, countries.name, countries.iso2, count(countries.id) as 'count'
from countries, competitions where countries.id = competitions.countryId
group by countries.id;

select count(*) from competitions where countryId = 'Morocco';

select eventId, count(*) as count from results group by eventId order by count DESC;



# statistics
select id, name, COUNT(distinct(results.competitionId)), AVG(results.average) from persons, results
where results.personId = persons.id and results.eventId = 333 and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = 333 and results.average > 0
group by personId;


select distinct(results.competitionId) from persons, results where name = 'Feliks Zemdegs' and results.personId = persons.id;

select * from persons, results
where name = 'Feliks Zemdegs' and results.personId = persons.id and results.eventId = 333;