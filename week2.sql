insert into CD_ATTENDEE (CODER_ID, CODER_NAME, CODER_DATE_OF_BIRTH) VALUES (5000, 'John', '10-JAN-02');
SElECT * from CD_ATTENDEE;
Commit;
SElECT * from CD_ATTENDEE;


alter session set current_schema = jgeorge;
SELECT * FROM JGEORGE.ACADEMIC;

insert into JGEORGE.ACADEMIC (ACADEMIC_ID , ACADEMIC_NAME) values (ACAD_SEQ.nextval, 'george');
commit;
