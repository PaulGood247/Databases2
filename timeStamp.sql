
DROP TABLE GYMBOOKING;
CREATE TABLE GymBooking (
  gbDateTime               TIMESTAMP NOT NULL
  );

SET SERVEROUTPUT ON
DECLARE
bookDateTime gymbooking.gbDateTime%type:= '&Please_enter_date_and_time_for_booking';
BEGIN 
INSERT INTO GymBooking Values (bookDateTime);
END;

SELECT * FROM gymbooking;

INSERT INTO GymBooking Values (TO_DATE('2003/05/03 21:02:44', 'yyyy/mm/dd hh24:mi:ss'));