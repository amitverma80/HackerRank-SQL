DECLARE @num INT = 20

WHILE @num > 0
 BEGIN
  SELECT REPLICATE('* ', @num)
  SET @num-=1
 END