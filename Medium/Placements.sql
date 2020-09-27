SELECT NAME FROM(
    SELECT S.Id SID, S.NAME, f.friend_id FID, p1.Salary S1, p2.Salary  S2
    FROM Students S
    INNER JOIN friends f ON (S.Id = f.id )
    inner join packages p1 ON(S.Id = p1.Id)
    inner join packages p2 ON(f.friend_id = p2.Id) 
   
  ) A WHERE S2>S1 
   ORDER BY S2;