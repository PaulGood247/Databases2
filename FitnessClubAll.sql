DROP TABLE Activity CASCADE CONSTRAINTS PURGE;
DROP TABLE ActivityMember CASCADE CONSTRAINTS PURGE;
DROP TABLE HallRoster CASCADE CONSTRAINTS PURGE;
DROP TABLE Grade CASCADE CONSTRAINTS PURGE;
DROP TABLE GradeMember CASCADE CONSTRAINTS PURGE;
DROP TABLE PoolRoster CASCADE CONSTRAINTS PURGE;
DROP TABLE Trainer CASCADE CONSTRAINTS PURGE;
DROP TABLE Telephone CASCADE CONSTRAINTS PURGE;
DROP TABLE Members CASCADE CONSTRAINTS PURGE;
DROP TABLE Equipment CASCADE CONSTRAINTS PURGE;
DROP TABLE GymBooking CASCADE CONSTRAINTS PURGE;
DROP TABLE PoolBooking CASCADE CONSTRAINTS PURGE;
DROP SEQUENCE member_id_seq;
DROP SEQUENCE trainer_id_seq;
DROP SEQUENCE equipment_id_seq;
DROP SEQUENCE prsession_id_seq;
DROP SEQUENCE hrsession_id_seq;

CREATE TABLE Members (
	memberId             NUMBER(5) NOT NULL ,
	mName                VARCHAR2(60) NOT NULL ,
	mAddress             VARCHAR2(100) NOT NULL ,
	mType                VARCHAR2(10) NOT NULL ,
	feesPaid             NUMBER(8,2) NULL ,
	feesDue              NUMBER(8,2) NULL ,
CONSTRAINT member_type_values CHECK (mType IN ('Full', 'Swimming')),
CONSTRAINT member_primary_key PRIMARY KEY (memberId)
);
CREATE SEQUENCE member_id_seq START WITH 1;

INSERT INTO Members (memberId, mName, mAddress, mType, feesPaid, feesDue) 
    VALUES (member_id_seq.nextval, 'John Spencer', 'Ballymun Road', 'Full', 0, 0);
INSERT INTO Members (memberId, mName, mAddress, mType, feesPaid, feesDue) 
   VALUES (member_id_seq.nextval, 'Marx Thompson', 'Santry Avenue', 'Swimming', 200,300);
INSERT INTO Members (memberId, mName, mAddress, mType, feesPaid, feesDue) 
    VALUES (member_id_seq.nextval, 'Anne Brittain ', 'Temple Bar', 'Swimming', 150, 50);
INSERT INTO Members (memberId, mName, mAddress, mType, feesPaid, feesDue) 
    VALUES (member_id_seq.nextval, 'Richard Good', 'Waterford Road', 'Full', 0, 0);
INSERT INTO Members (memberId, mName, mAddress, mType, feesPaid, feesDue) 
    VALUES (member_id_seq.nextval, 'Frank Doyle', 'Kevin Street', 'Full', 100, 100);



CREATE TABLE Telephone (
	memberId             NUMBER(5) NOT NULL ,
	phoneNumber          VARCHAR2(11) NULL ,
CONSTRAINT  telepone_primary_key PRIMARY KEY (memberId),
CONSTRAINT fk_mebmer_telephone FOREIGN KEY (memberId) REFERENCES Members (memberId)
);

INSERT INTO Telephone VALUES (1, '+0848444484');
INSERT INTO Telephone VALUES (2, '+0879032193');
INSERT INTO Telephone VALUES (3, '+5419283092');
INSERT INTO Telephone VALUES (4, '48572039471');
INSERT INTO Telephone VALUES (5, '93058342350');


CREATE TABLE Trainer (
	trainerId            NUMBER(5) NOT NULL ,
	trainerName          VARCHAR2(60) NOT NULL ,
	trainerDayOff1       NUMBER(1) NULL ,
	trainerDayOff2        NUMBER(1) NULL ,
CONSTRAINT trainer_primary_key PRIMARY KEY (trainerId)
);
CREATE SEQUENCE trainer_id_seq START WITH 1;

INSERT INTO Trainer VALUES (trainer_id_seq.nextval, 'Carlos Jose', 3, 7);
INSERT INTO Trainer VALUES (trainer_id_seq.nextval, 'Juan Pablo', 4, 5);
INSERT INTO Trainer VALUES (trainer_id_seq.nextval, 'Ciaran Allen', 6, 7);
INSERT INTO Trainer VALUES (trainer_id_seq.nextval, 'Josh Barret', 1, 3);
INSERT INTO Trainer VALUES (trainer_id_seq.nextval, 'Paola Caffrey', 2, 3);


CREATE TABLE Grade (
	gradeNumber          NUMBER(1) NOT NULL ,
  gradeDesc            VARCHAR(60) NULL,
CONSTRAINT gradenumber_values CHECK (gradeNumber IN (1, 2, 3, 4)),
CONSTRAINT grade_primary_key PRIMARY KEY (gradeNumber)
);

INSERT INTO Grade values (1, '');
INSERT INTO Grade values (2, '');
INSERT INTO Grade values (3, '');
INSERT INTO Grade values (4, '');


CREATE TABLE GradeMember (
  gradeNumber          NUMBER(1) NOT NULL ,
	memberId             NUMBER(5) NULL ,
	gradeStartDate       DATE NOT NULL ,
CONSTRAINT fk_grademember_grade FOREIGN KEY (gradeNumber) REFERENCES Grade (gradeNumber),
CONSTRAINT fk_grademember_members FOREIGN KEY (memberId) REFERENCES Members (memberId)
);

INSERT INTO GradeMember values (1, 1, '13-OCT-15');
INSERT INTO GradeMember values (1, 1, '13-NOV-15');
INSERT INTO GradeMember values (1, 2, '27-OCT-15');
INSERT INTO GradeMember values (2, 4, '07-FEB-14');
INSERT INTO GradeMember values (3, 5, '20-OCT-13');
INSERT INTO GradeMember values (4, 3, '27-AUG-15');


CREATE TABLE PoolRoster (
  prSessionId          NUMBER(5) NOT NULL ,
	gradeNumber          NUMBER(1) NULL ,
	prType               VARCHAR2(10) NOT NULL ,
	prStart          TIMESTAMP NOT NULL ,
	prEnd            TIMESTAMP NOT NULL ,
	trainerId            NUMBER(5) NULL ,
CONSTRAINT pr_type_values CHECK (prType IN ('Public', 'Private')),
CONSTRAINT poolroster_primary_key PRIMARY KEY (prSessionId),
CONSTRAINT fk_poolroster_grade FOREIGN KEY (gradeNumber) REFERENCES Grade (gradeNumber),
CONSTRAINT fk_poolroster_trainer FOREIGN KEY (trainerId) REFERENCES Trainer (trainerId)
);
CREATE SEQUENCE prsession_id_seq START WITH 1;

INSERT INTO PoolRoster (prSessionId , gradeNumber, prType, prDate, prStartTime, prEndTime, trainerId) 
  values (prsession_id_seq.nextval, 1, 'Private', TO_DATE('15/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('15/11/15 12:00', 'dd/mm/yy hh24:mi'), 1 );
INSERT INTO PoolRoster (prSessionId , prType, prStartTime, prDate, prEndTime) 
  values (prsession_id_seq.nextval, 'Public', TO_DATE('15/11/15 13:00', 'dd/mm/yy hh24:mi'), TO_DATE('15/11/15 15:00', 'dd/mm/yy hh24:mi'));
INSERT INTO PoolRoster (prSessionId , gradeNumber, prType, prDate, prStartTime, prEndTime, trainerId) 
  values (prsession_id_seq.nextval, 4, 'Private', TO_DATE('15/11/15 15:00', 'dd/mm/yy hh24:mi'), TO_DATE('15/11/15 17:00', 'dd/mm/yy hh24:mi'), 3 );
INSERT INTO PoolRoster (prSessionId , prType, prStartTime, prDate, prEndTime) 
  values (prsession_id_seq.nextval, 'Public', TO_DATE('16/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('16/11/15 12:00', 'dd/mm/yy hh24:mi'));
INSERT INTO PoolRoster (prSessionId , gradeNumber, prType, prDate, prStartTime, prEndTime, trainerId) 
  values (prsession_id_seq.nextval, 2, 'Private', TO_DATE('16/11/15 12:00', 'dd/mm/yy hh24:mi'), TO_DATE('16/11/15 13:00', 'dd/mm/yy hh24:mi'), 4 );


CREATE TABLE Activity (
	activityName         VARCHAR2(40) NOT NULL ,
  maxMembers           NUMBER(2) NOT NULL,
	activityDesc         VARCHAR2(60) NULL ,
CONSTRAINT hallroster_activity_values CHECK (activityName IN ('Football', 'Basketball', 'Yoga', 'Taekwondo')),
CONSTRAINT activity_primary_key PRIMARY KEY (activityName)
);

INSERT INTO Activity VALUES ('Basketball' , 20, '');
INSERT INTO Activity VALUES ('Taekwondo' , 20, '');
INSERT INTO Activity VALUES ('Football' , 20, '');
INSERT INTO Activity VALUES ('Yoga' , 20, '');


CREATE TABLE ActivityMember (
  activityName         VARCHAR2(40) NOT NULL ,
	memberId             NUMBER(5) NULL , 
CONSTRAINT fk_activitymember_members FOREIGN KEY (memberId) REFERENCES Members (memberId),
CONSTRAINT fk_activitymember_activity FOREIGN KEY (activityName) REFERENCES Activity (activityName)
);

INSERT INTO ActivityMember VALUES ('Taekwondo' , 1);
INSERT INTO ActivityMember VALUES ('Basketball' , 1);
INSERT INTO ActivityMember VALUES ('Taekwondo' , 4);
INSERT INTO ActivityMember VALUES ('Football' , 5);
INSERT INTO ActivityMember VALUES ('Yoga' , 4);


CREATE TABLE Equipment (
	equipmentId          NUMBER(5) NOT NULL ,
	equipmentName        VARCHAR2(40) NOT NULL ,
CONSTRAINT equipment_primary_key PRIMARY KEY (equipmentId)
);
CREATE SEQUENCE equipment_id_seq START WITH 1;

INSERT INTO Equipment values (equipment_id_seq.nextval, 'Multi Adjustable Bench');
INSERT INTO Equipment values (equipment_id_seq.nextval, 'Stepper');
INSERT INTO Equipment values (equipment_id_seq.nextval, 'Leg Press');
INSERT INTO Equipment values (equipment_id_seq.nextval, 'Triceps Extension');
INSERT INTO Equipment values (equipment_id_seq.nextval, 'Pectoral Fly');


CREATE TABLE HallRoster (
  hrSessionId          NUMBER(5) NOT NULL,
	activityName         VARCHAR2(40) NOT NULL ,   
	hrStart          TIMESTAMP NOT NULL ,
	hrEnd            TIMESTAMP NOT NULL ,
	trainerId            NUMBER(5) NOT NULL ,
  equipmentId          NUMBER(5) NULL ,
CONSTRAINT hallroster_primary_key PRIMARY KEY (hrSessionId),
CONSTRAINT fk_hallroster_equipment FOREIGN KEY (equipmentId) REFERENCES Equipment (equipmentId),
CONSTRAINT fk_hallroster_activity FOREIGN KEY (activityName) REFERENCES Activity (activityName),
CONSTRAINT fk_hallroster_trainer FOREIGN KEY (trainerId) REFERENCES Trainer (trainerId)
);
CREATE SEQUENCE hrsession_id_seq START WITH 1;


INSERT INTO HallRoster 
    VALUES (hrsession_id_seq.nextval, 'Taekwondo', TO_DATE('01-11-15', 'DD-MM-YY'), TO_DATE('12:00', 'HH24:MI'), TO_DATE('13:00', 'HH24:MI'), 1, 2);
INSERT INTO HallRoster 
    VALUES (hrsession_id_seq.nextval, 'Football', TO_DATE('01/11/15 13:00', 'dd/mm/yy hh24:mi'), TO_DATE('11/11/15 15:00', 'dd/mm/yy hh24:mi'), 3, 3);
INSERT INTO HallRoster 
    VALUES (hrsession_id_seq.nextval, 'Yoga', TO_DATE('01/11/15 14:00', 'dd/mm/yy hh24:mi'), TO_DATE('01/11/15 18:00', 'dd/mm/yy hh24:mi'), 5, 1);
INSERT INTO HallRoster 
    VALUES (hrsession_id_seq.nextval, 'Basketball', TO_DATE('12/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('12/11/15 11:00', 'dd/mm/yy hh24:mi'), 4, 2);
INSERT INTO HallRoster 
    VALUES (hrsession_id_seq.nextval, 'Football', TO_DATE('15/11/15 13:00', 'dd/mm/yy hh24:mi'), TO_DATE('15/11/15 14:00', 'dd/mm/yy hh24:mi'), 2, 5);


CREATE TABLE GymBooking (
	memberId             NUMBER(5) NOT NULL ,
	equipmentId          NUMBER(5) NOT NULL ,
	gbStart          TIMESTAMP NOT NULL ,
	gbEnd            TIMESTAMP NOT NULL ,
CONSTRAINT gymbooking_primary_key PRIMARY KEY (memberId,equipmentId),
CONSTRAINT fk_gymbooking_members FOREIGN KEY (memberId) REFERENCES Members (memberId),
CONSTRAINT fk_gymbooking_equipment FOREIGN KEY (equipmentId) REFERENCES Equipment (equipmentId)
);

INSERT INTO GymBooking VALUES (1, 1, TO_DATE('11/11/15 09:00', 'dd/mm/yy hh24:mi'), TO_DATE('11/11/15 10:00', 'dd/mm/yy hh24:mi'));
INSERT INTO GymBooking VALUES (3, 2, TO_DATE('05/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('05/11/15 11:00', 'dd/mm/yy hh24:mi'));
INSERT INTO GymBooking VALUES (4, 5, TO_DATE('06/11/15 09:00', 'dd/mm/yy hh24:mi'), TO_DATE('06/11/15 10:00', 'dd/mm/yy hh24:mi'));
INSERT INTO GymBooking VALUES (2, 3, TO_DATE('11/11/15 13:00', 'dd/mm/yy hh24:mi'), TO_DATE('11/11/15 14:00', 'dd/mm/yy hh24:mi'));
INSERT INTO GymBooking VALUES (1, 5, TO_DATE('09/11/15 11:00', 'dd/mm/yy hh24:mi'), TO_DATE('09/11/15 12:00', 'dd/mm/yy hh24:mi'));


CREATE TABLE PoolBooking (
	memberId             NUMBER(5) NOT NULL ,
	pbStart          TIMESTAMP NOT NULL ,
	pbEnd            TIMESTAMP NOT NULL ,
	trainerId            NUMBER(5) NULL ,
CONSTRAINT poolbooking_primary_key PRIMARY KEY (memberId),
CONSTRAINT fk_poolbooking_trainer FOREIGN KEY (trainerId) REFERENCES Trainer (trainerId),
CONSTRAINT fk_poolbooking_members FOREIGN KEY (memberId) REFERENCES Members (memberId)
);


INSERT INTO PoolBooking values (1, TO_DATE('02/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('02/11/15 11:00', 'dd/mm/yy hh24:mi'), 1);
INSERT INTO PoolBooking values (5, TO_DATE('02/11/15 10:00', 'dd/mm/yy hh24:mi'), TO_DATE('02/11/15 11:00', 'dd/mm/yy hh24:mi'), 5);
INSERT INTO PoolBooking values (2, TO_DATE('03/11/15 11:00', 'dd/mm/yy hh24:mi'), TO_DATE('03/11/15 12:00', 'dd/mm/yy hh24:mi'), 4);
INSERT INTO PoolBooking values (4, TO_DATE('03/11/15 12:00', 'dd/mm/yy hh24:mi'), TO_DATE('03/11/15 13:00', 'dd/mm/yy hh24:mi'), 4);
INSERT INTO PoolBooking values (3, TO_DATE('04/11/15 13:00', 'dd/mm/yy hh24:mi'), TO_DATE('04/11/15 14:00', 'dd/mm/yy hh24:mi'), 2);


--Trainer
GRANT SELECT ON PoolRoster TO pjusti;
GRANT SELECT ON PoolBooking TO pjusti;
GRANT SELECT ON HallRoster TO pjusti;
GRANT SELECT ON GymBooking TO pjusti;
GRANT INSERT ON Telephone TO pjusti;

--Member
GRANT SELECT ON Member TO pgood;
GRANT INSERT ON Member TO pgood;
GRANT UPDATE ON memberName TO pgood;
GRANT UPDATE ON mAddress TO pgood;

GRANT SELECT ON Telephone TO  pgood;
GRANT INSERT ON Telephone TO  pgood;
GRANT UPDATE ON phoneNumber TO pgood;

GRANT SELECT ON GymBooking TO  pgood;
GRANT INSERT ON GymBooking TO pgood;

GRANT SELECT ON PoolBooking TO pgood;
GRANT INSERT ON PoolBooking TO  pgood;

GRANT SELECT ON HallRoster TO pgood;

GRANT SELECT ON PoolRoster TO pgood;

GRANT SELECT ON ActivityMember TO pgood;
GRANT SELECT ON GradeMember TO pgood;

--Receptionist
GRANT SELECT ON PoolRoster TO alahs; 
GRANT INSERT ON PoolRoster TO alahs;
GRANT SELECT ON PoolBooking TO alahs; 
GRANT INSERT ON PoolBooking TO alahs;
GRANT SELECT ON HallRoster TO alahs; 
GRANT INSERT ON HallRoster TO alahs;
GRANT SELECT ON GymBooking TO alahs;
GRANT INSERT ON GymBooking TO alahs;
GRANT SELECT ON Grade TO alahs;
GRANT INSERT ON Grade  TO alahs;
GRANT SELECT ON activity  TO alahs;
GRANT INSERT ON activity  TO alahs;


create or replace TRIGGER gym_booking_clash_trigger 
BEFORE INSERT ON GYMBOOKING 
FOR EACH ROW
DECLARE
 pool_booking_clash EXCEPTION;
 poolBookingStart poolBooking.pbStart%type;
 poolBookingEnd poolBooking.pbEnd%type;
BEGIN
SELECT pbstart , pbend INTO poolBookingStart, poolBookingEnd FROM poolbooking WHERE memberId = :NEW.memberId;

IF (poolBookingStart BETWEEN :NEW.gbstart AND :NEW.gbend) OR (poolBookingEnd BETWEEN :NEW.gbstart AND :NEW.gbend) THEN 
RAISE pool_booking_clash;
END IF;

EXCEPTION
WHEN pool_booking_clash THEN
 RAISE_APPLICATION_ERROR(-200006,'This member has a pool booking between these times');
END;


Create TABLE telephone_deleted_log (
TableName varchar2(20),
UserName varchar2(20),
DateOfDelete date,
MemberId number(5),
PhoneNumber varchar2(11));

CREATE OR REPLACE TRIGGER log_deleted_telephone
AFTER DELETE ON telephone
FOR EACH ROW
BEGIN
INSERT INTO telephone_deleted_log
(TableName, UserName, DateOfDelete,MemberId,
PhoneNumber)
VALUES(
'TELEPHONE', TO_CHAR(USER), SYSDATE,
:old.memberID, :old.phoneNumber);
END;



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

GRANT EXECUTE ON MAKEGYMBOOKING TO pgood;
GRANT EXECUTE ON CHECKEQUIPMENTUSE TO pgood;
GRANT EXECUTE ON CHECKTRAINERUSE TO pgood;
GRANT EXECUTE ON FULLMEMBER TO pgood;
GRANT EXECUTE ON MAKEANEWBOOKING TO pgood;
