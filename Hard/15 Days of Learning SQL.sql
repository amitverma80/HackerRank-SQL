with cte as(
    select submission_date, hacker_id, name from(
        select row_number() over (partition by tmp.submission_date order by tmp.dateCount desc, tmp.hacker_id) as rownum, submission_date, hacker_id, name  from
        (
            select s.submission_date,  h.hacker_id, h.name, count(h.hacker_id)dateCount
            from hackers h
            inner join submissions s on (h.hacker_id = s.hacker_id) group by s.submission_date,  h.hacker_id, h.name
        )tmp
    )tmp1 where rownum=1
),
dwc as(
    select tmp.submission_date, count(tmp.hacker_id) as hcount from (
        select s1.hacker_id, s1.submission_date,count(distinct s2.submission_date) sc, datediff(day, '2016-03-01', s1.submission_date) dd
                from submissions s1
                inner join submissions s2 on (s1.hacker_id = s2.hacker_id and s1.submission_date >= s2.submission_date)
                group by s1.hacker_id, s1.submission_date
                 ) tmp where sc-dd=1
        group by tmp.submission_date
)
Select c.submission_date, d.hCount, c.hacker_id, c.name 
from cte c
inner join dwc d ON (c.submission_date = d.submission_date);