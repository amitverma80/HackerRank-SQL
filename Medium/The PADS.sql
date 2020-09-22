SELECT CONCAT(name, '(', substring(occupation,1,1) , ')')
FROM OCCUPATIONS
Order BY Name
select 'There are a total of ' + CONVERT(VARCHAR(2) , C) +' ' + LOWER(occupation) +'s.' FROM (
select COUNT(occupation) C, occupation
FROM OCCUPATIONS
Group BY occupation) A
ORDER BY C, occupation