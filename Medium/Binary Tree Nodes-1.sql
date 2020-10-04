SELECT BS.N, CASE WHEN BS.P IS NULL THEN 'Root'
        WHEN EXISTS (SELECT B.P FROM BST B WHERE B.P = BS.N) THEN 'Inner'        
        ELSE 'Leaf'
    END
FROM BST AS BS
ORDER BY BS.N