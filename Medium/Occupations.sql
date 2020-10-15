select min(Doctor), min(Professor),min(Singer),  min(Actor)
from(
select ROW_NUMBER() OVER(PARTITION By Doctor,Actor,Singer,Professor order by name asc) AS Rownum, 
case when Doctor=1 then name else Null end as Doctor,
case when Actor=1 then name else Null end as Actor,
case when Singer=1 then name else Null end as Singer,
case when Professor=1 then name else Null end as Professor
from occupations
pivot
( count(occupation)
for occupation in(Doctor, Actor, Singer, Professor)) as p

) temp

group by Rownum  ;
