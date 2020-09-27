/*
Enter your query here.
Please append a semicolon ";" at the end of the query and enter your query in a single line to avoid error.
*/
--Sql Server 2014 Express Edition
--Batches are separated by 'go'

DECLARE @counter INT =2
DECLARE @numb INT  = 5 
DECLARE @result VARCHAR(2000)
DECLARE @isPRIME INT =1
SET @result = '2&3&'

WHILE @numb <1000
 BEGIN
     SET @counter = 2
     SET @isPRIME = 1
     WHILE (@counter<=(@numb/2))
         BEGIN
             IF (@numb%@counter = 0)
               BEGIN
                SET @isPRIME = 0
                break
               END
             SET @counter +=1
         END
         IF @isPRIME=1
          BEGIN
           SET @result = CONCAT(@result, @numb, '&')
          END
     SET @numb +=1
 END
 SET @result = LEFT(@result, LEN(@result) - 1) 
 SELECT @result;