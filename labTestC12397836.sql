ALTER SESSION SET CURRENT_SCHEMA = BUILDER2;

select * from customer;

select sorderno , sum(unitcostprice * reoder_level)from stock where sorder > 3000 ;

select corderno, staff_name, staff_name from corder 
inner join staff on corder.staffpaid = staff.staff_no
inner join staff on corder.staffissued = staff.staff_no;

select sorderno, supplier_name, delivereddate from sorder 
inner join supplier on sorder.SUPPLIER_ID = supplier.SUPPLIER_ID
where sorder.DELIVEREDDATE is not null;

select customer_name,  count(corderno) from customer
inner join corder on customer.customer_id = corder.customer_id group by(customer_name);

select staff_name , staffissued from staff 
left outer join corder on staff.staff_no = corder.STAFFISSUED
where staffissued is null;

select customer_name, stock_code from customer 
inner join corder on customer.customer_id = corder.customer_id
inner join corderline on corder.corderno = corderline.corderno
where corderline.STOCK_CODE = 'C101' or corderline.STOCK_CODE = 'B141' ;

 