-- general req
select * from countries;

select * from competitions;

select * from results where average <= 0;

select count(*) from persons;

select countries.id, countries.name, countries.iso2, count(countries.id) as 'count'
from countries, competitions where countries.id = competitions.countryId
group by countries.id;

select count(*) from competitions where countryId = 'Morocco';

select eventId, count(*) as count from results group by eventId order by count DESC;

select COUNT(distinct(results.competitionId)) as comps from persons, results
where results.personId = persons.id
group by personId;

select year, count(id) as count from competitions group by year order by year;

-- Countries by world records
select personCountryId as country, count(*) as records, count(distinct personId) as individuals from results
where regionalAverageRecord = 'WR' or regionalSingleRecord = 'WR'
group by personCountryId order by records DESC;

select personCountryId as country, sum(if(regionalAverageRecord = 'WR', 1, 0) + if(regionalSingleRecord = 'WR', 1, 0)) as records, count(distinct personId) as individuals from results
where regionalAverageRecord = 'WR' or regionalSingleRecord = 'WR'
group by personCountryId order by records DESC;

create view wrAVG as
select personCountryId as country, count(*) as records from results
where regionalAverageRecord = 'WR' group by personCountryId order by records DESC;

create view wrSINGLE as
select personCountryId as country, count(*) as records from results
where regionalSingleRecord = 'WR' group by personCountryId order by records DESC;

select * from wrAVG left join wrSINGLE on wrAVG.country = wrSINGLE.country
union all
select * from wrSINGLE left join wrAVG on wrAVG.country = wrSINGLE.country
where wrAVG.country is null;


-- statistics

-- TOPIC: competition participation vs averages
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


-- TOPIC: correlation between events
select eventId, personId, AVG(average) from results
where (eventId = '333' or eventId = '444') and average > 0
group by eventId, personId;

select eventId, personId, MIN(average) as AVG from results
where (eventId = '333' or eventId = '444') and average > 0
group by eventId, personId;

-- Example view for making queries on averages simpler
create view 333avg as
select eventId, personId, MIN(average) as AVG from results
where (eventId = '333') and average > 0
group by eventId, personId;

select 333avg.AVG as '333', 444avg.AVG as '444' from 333avg, 444avg where 333avg.personId = 444avg.personId;

select 333avg.AVG as '333', 222avg.AVG as '222' from 333avg, 222avg where 333avg.personId = 222avg.personId;

select 333avg.AVG as '333', pyramavg.AVG as 'pyraminx' from 333avg, pyramavg where 333avg.personId = pyramavg.personId;

select 333avg.AVG as '333', clockavg.AVG as 'clock' from 333avg, clockavg where 333avg.personId = clockavg.personId;


-- TOPIC: Solve difference
select value1, value2, value3, value4, value5 from results where eventId = '333'
and value1 != 0 and value1 != -2 and value2 != 0 and value2 != -2 and value3 != 0
and value3 != -2 and value4 != 0 and value4 != -2 and value5 != 0 and value5 != -2;

-- TOPIC: Performance over multiple events
select persons.id, count(distinct competitionId) as comps from persons, results, competitions where persons.id = results.personId
and results.competitionId = competitions.id and competitions.year = 2019 and eventId = '333' and month = 6
group by persons.id, month
order by comps DESC;

select distinct persons.id, MAX(average) as average from persons, results, competitions where persons.id = results.personId
and results.competitionId = competitions.id and competitions.year = 2019 and eventId = '333' and month = 6
and personId in ('2014PETE03', '2015JAEH01', '2011FERA01', '2014CHER05', '2013ROGA02') group by personId, competitionId, day order by personId, day;