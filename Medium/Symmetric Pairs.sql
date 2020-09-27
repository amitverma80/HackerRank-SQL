SELECT distinct f1.x, f1.Y
FROM functions f1 
INNER JOIN functions f2 ON (f1.x = f2.y and f2.x = f1.y)
where f1.x<=f1.y
Group by f1.x, f1.y
Having COUNT(f1.X)>1 or f1.X<f1.Y
ORDER BY f1.X 