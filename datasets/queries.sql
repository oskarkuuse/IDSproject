-- general req
select * from countries;

select * from competitions;

select * from results where average <= 0;

select countries.id, countries.name, countries.iso2, count(countries.id) as 'count'
from countries, competitions where countries.id = competitions.countryId
group by countries.id;

select count(*) from competitions where countryId = 'Morocco';

select eventId, count(*) as count from results group by eventId order by count DESC;

select COUNT(distinct(results.competitionId)) as comps from persons, results
where results.personId = persons.id
group by personId;


-- statistics
select id, name, COUNT(distinct(results.competitionId)), AVG(results.average) from persons, results
where results.personId = persons.id and results.eventId = '333' and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = '333' and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = '222' and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = '444' and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = '555' and results.average > 0
group by personId;

select COUNT(distinct(results.competitionId)) as comps, AVG(results.average) as compAVG from persons, results
where results.personId = persons.id and results.eventId = '333bf' and results.average > 0
group by personId;

select distinct(results.competitionId) from persons, results where name = 'Feliks Zemdegs' and results.personId = persons.id;
select * from persons, results
where name = 'Feliks Zemdegs' and results.personId = persons.id and results.eventId = 333;


select eventId, personId, AVG(average) from results
where (eventId = '333' or eventId = '444') and average > 0
group by eventId, personId;

select eventId, personId, MIN(average) as AVG from results
where (eventId = '333' or eventId = '444') and average > 0
group by eventId, personId;

select 333avg.AVG as '333', 444avg.AVG as '444' from 333avg, 444avg where 333avg.personId = 444avg.personId;


