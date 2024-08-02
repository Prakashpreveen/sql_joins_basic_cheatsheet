																			-- INNER JOIN
-- INNER JOIN join ON one field:
-- An inner join between two tables will return only records where a joining field,such as a key, finds a match in both tables.

select * from artist_table as art
inner join album_table as alb
on art.artist_id = alb.artist_id;

-- INNER JOIN with USING;
select * from artist_table as art 
inner join album_table as alb
using (artist_id);


																				-- SELF JOIN
-- Self-joins are used to compare values in a table to other values of the same table by joining different parts of a table together.    
                                                                            
select 
alb1.album_id as album1_id,
alb1.title as album1_title,
alb2.album_id as album2_id,
alb2.title as album2_title,
art.name as artist_name
from album_table alb1
inner join 
album_table alb2 on alb1.artist_id = alb2.artist_id
inner join
artist_table art on alb1.artist_id = art.artist_id
where
alb1.album_id <> alb2.album_id;

																				-- LEFT JOIN
-- LEFT JOIN on one field:
-- A left join keeps all of the original records in the left table and returns missing values for any columns from the right table where the joining field did not find a match. 

select * from artist_table as art
left join album_table as alb
on art.artist_id = alb.artist_id;	

																				-- RIGHT JOIN
-- RIGHT JOIN on one field:
-- A right join keeps all of the original records in the right table and returns missing values for any columns from the left table where the joining field did not find a match. 
-- Right joins are far less common than left joins, because right joins can always be rewritten as left joins.

select * from artist_table as art
right join album_table as alb
on art.artist_id = alb.artist_id;

																				-- FULL JOIN OR FULL OUTER JOIN
-- FULL JOIN on one field:
-- A full join combines a left join and right join. A full join will return all records from a table, irrespective of whether there is a match on the joining field in the other table, returning null values accordingly.
-- NOTE: (In MySQL there is no commnad called 'FULL OUTER JOIN' so need to perform both LEFT and RIGHT JOIN with the help of UNION)

select * from artist_table as art
left join album_table as alb
on art.artist_id = alb.artist_id

union                                                                                

select * from artist_table as art
right join album_table as alb
on art.artist_id = alb.artist_id;                                                                                

																				-- CROSS JOIN
-- CROSS JOIN ON creates all possible combinations of two tables. CROSS JOIN does not require a field to join.

select name,title from artist_table
cross join album_table;                                                                                

																				-- SET THEORY OPERATORS IN SQL                                                                               
-- UNION:
-- The operator is used to vertically combine the results of two statements. For to work without errors, all statements must have the same number of columns and corresponding columns must have the same data type. does not return duplicates.

select artist_id
from artist_table
union
select artist_id
from album_table;                 

-- UNION ALL:
-- The operator works just like , but it returns duplicate values. The same restrictions of UNION hold true for UNION ALL.

select artist_id
from artist_table
union all
select artist_id
from album_table;

-- INTERSECT:
-- The operator returns only identical rows from two tables. 

select artist_id
from artist_table
intersect
select artist_id
from album_table;

-- EXCEPT:
-- The operator returns only those rows from the left table that are not present in the right table.

select artist_id
from artist_table
except
select artist_id
from album_table;

-- SEMI JOIN:
-- A semi join chooses records in the first table where a condition is met in the second table. A semi join makes use of a clause to use the second table as a filter for the first. 

select * from album_table
where artist_id in
(select artist_id from artist_table);	

-- ANTI JOIN:
-- The anti join chooses records in the first table where a condition is met in the second table. It makes use of a clause to use exclude values from the second table.

select * from album_table
where artist_id not in
(select artist_id from artist_table);