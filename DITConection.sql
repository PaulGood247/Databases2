Alter session set current_schema = BUILDER2;
SELECT * FROM BUILDER2.STOCK;
DESCRIBE BUILDER2.STOCK;
alter session set current_schema = pgood;
Alter session set current_schema = BUILDER2;
SELECT * FROM STOCK;
