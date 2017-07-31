select * from menu  ;

select rpad(menu_number , 20)as "Menu Number" , rpad(dish, 20) as "Dish"  ,rpad(food_comment, 20) as "Info",  rpad(price, 20) as"€"  
from menu
where menu_time like 'BREAK' ;

select * from table_booking where  status ='O' and book_date + (24/2) > book_date ;

select count(*) as "Number of Walk- ins" from table_booking where booking_name  is null and partysize > 0;

select * from table_booking;

select count(*) 
from table_booking where booking_name like '%Quaverly%' 
and book_date > systimestamp - interval '6' month;


