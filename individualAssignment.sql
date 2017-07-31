SET SERVEROUTPUT ON
DECLARE

memID members.memberID%type:='&Please_Enter_the_member_id';
equipID equipment.equipmentID%type:= '&Please_Enter_the_id_of_the_Equipment_you_wish_to_use';
bookSTime gymbooking.gbStart%type:= '&Please_enter_start_time_for_booking';
bookETime gymbooking.gbEnd%type:= '&Please_enter_end_time_for_booking';
BEGIN
MAKEGYMBOOKING(equipID, memID, bookSTime, bookETime);
DBMS_OUTPUT.PUT_LINE('Success!'||equipID||'');
END;

SELECT * from gymbooking;
SELECT * from hallroster;


SELECT equipmentID FROM hallRoster 
UNION
SELECT equipmentID FROM GymBooking;

SELECT equipmentID FROM hallRoster 
UNION ALL
SELECT equipmentID FROM GymBooking;

SELECT members.mName, equipment.equipmentname, gymbooking.gbstart, gymbooking.gbend  
FROM members
INNER JOIN gymbooking ON members.memberID = gymbooking.memberID
INNER JOIN equipment ON gymbooking.equipmentID = equipment.equipmentID;

SELECT members.mName, activityMember.activityName, gradeMember.gradeNumber
FROM members
FULL OUTER JOIN activityMember ON members.memberID = activityMember.memberID
FULL OUTER JOIN gradeMember ON members.memberID = gradeMember.memberID;



Select * from gymbooking 
where EQUIPMENTID like 2 
and GBDATE like '05-NOV-15' 
and GBSTARTTIME like TO_DATE('12:00', 'HH24:MI') 
and GBENDTIME like TO_DATE('13:00', 'HH24:MI');

GRANT EXECUTE ON MAKEGYMBOOKING TO pgood;
GRANT EXECUTE ON CHECKEQUIPMENTUSE TO pgood;
GRANT EXECUTE ON CHECKTRAINERUSE TO pgood;
GRANT EXECUTE ON FULLMEMBER TO pgood;
GRANT EXECUTE ON MAKEANEWBOOKING TO pgood;

Select * from gymbooking;


memID members.memberID%type:= '&Please_Enter_Member_id';
and GBSTARTTIME like TO_DATE(bookSTime, 'HH24:MI') 
and GBENDTIME like TO_DATE(bookETime, 'HH24:MI')


SET SERVEROUTPUT ON
DECLARE

equipID equipment.equipmentID%type:= '&Please_Enter_the_idname_of_the_Equipment_you_wish_to_use';
equipName equipment.equipmentName%type:= '&Please_Enter_the_name_of_the_Equipment_you_wish_to_use';
bookDate gymbooking.gbDate%type:= '&Please_enter_date_for_booking';
memId members.memberID%type;
BEGIN
Select memberId into memId
from gymbooking 
where EQUIPMENTID like equipID 
and GBDATE like bookDate 
;
DBMS_OUTPUT.PUT_LINE('Success!'||memId||'');
END;
