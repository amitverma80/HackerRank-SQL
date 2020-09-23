DECLARE @num INT = 0

WHILE @num <= 20
 BEGIN
  SELECT REPLICATE('* ', @num)
  SET @num+=1
 END