Alter session set current_schema = BUILDER2;
SELECT * FROM BUILDER2.STOCK;
DESCRIBE BUILDER2.STOCK;
Alter session set current_schema = pgood;
SELECT * FROM BUILDER2.STOCK;
Alter session set current_schema = BUILDER2;
SELECT * FROM STOCK;
Alter session set current_schema = pgood;


