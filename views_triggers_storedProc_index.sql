/*----------------*views_Triggers_indexes_storedProcedures*--------------------*/
/*patient view for doctor*/

create view vwdoctortopatienthistory 
as 
select  patient_table.patient_id, 
patient_firstname,patient_lastname,patient_dob,patient_gender,
patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date
from
patient_table join patient_history_table where patient_table.patient_id=patient_history_table.patient_id;

/*patient view to doctor*/

select * from vwdoctortopatienthistory;

/*nurse view for doctor*/

create view vwdoctortonurse 
as 
select nurse_table.nurse_id,nurse_firstname,nurse_lastname,triage_nurse_available_days,
triage_nurse_starttime,triage_nurse_endtime
from
triage_nurse_table join nurse_table where triage_nurse_table.nurse_id=nurse_table.nurse_id;

/*nurse view for doctor*/

select * from vwdoctortonurse;

/*view for doctor to patient_history and nurse */

create view vwdoctortonurseandpatienthistory
as 
select patient_history_table.patient_id,patient_firstname,patient_lastname,triage_nurse_table.nurse_id,nurse_firstname,nurse_lastname,triage_nurse_available_days,
triage_nurse_patient_symptoms,triage_nurse_comments
from
patient_history_table,triage_nurse_table,patient_table,nurse_table where patient_history_table.patient_id=triage_nurse_table.patient_id and
patient_history_table.patient_id = patient_table.patient_id and nurse_table.nurse_id=triage_nurse_table.nurse_id;

/*view for doctor to patient_history and nurse */

select * from vwdoctortonurseandpatienthistory;


/*view for doctor to patient_table,patient_history_table,pharmacy_table,prescription_table,lab results*/

create view vwdoctopathispharpresclabs
as
select 
patient_table.patient_id,patient_firstname,patient_lastname,patient_dob,patient_gender,
patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date,
lab_result
from
patient_table,patient_history_table,prescription_table,pharmacy_table,labresults_table
 where patient_table.patient_id=patient_history_table.patient_id and 
 prescription_table.prescription_id=pharmacy_table.prescription_id and labresults_table.patient_id= patient_table.patient_id;
 
 /*view for doctor to patient_table,patient_history_table,pharmacy_table,prescription_table,lab results*/
 select * from vwdoctopathispharpresclabs;
 
 /*view for patient about doctor from doctor_table and doctor_profile_table*/
 
 create view vwpattodoctorprof
 as
 select
 doctor_profile_table.doctor_profile_id,doctor_id,doctor_firstname,doctor_lastname,
 doctor_profile_specialization,doctor_profile_accepts_new_patients,doctor_available_days,doctor_active
 from
 doctor_profile_table,doctor_table where doctor_table.doctor_profile_id=doctor_profile_table.doctor_profile_id;
 
 /*view for patient about doctor from doctor_table and doctor_profile_table*/
 
 select * from vwpattodoctorprof;
 

 
 /*view for patient to appoint types*/
 
 create view vwpattoapptype
 as
 select * from appointment_type_table;
 
 /*view for patient to appoint types*/
 
 select * from vwpattoapptype;
 
 /*view for patient for his lab reults*/
 create view vwpattolabtypelabres
 as
 select lab_table.patient_id,labtype_id,lab_id,lab_result from lab_table,labresults_table
 where lab_table.patient_id=labresults_table.patient_id;
 
  /*view for patient for his lab reults*/
  select * from vwpattolabtypelabres;

/*view for patient for bill statement*/

create view vwpatbill
as
select
patient_table.patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount,
patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_city,patient_state,patient_zipcode
from patient_table,bill_statement_table where  patient_table.patient_id = bill_statement_table.patient_id;

/*view for patient for bill statement*/

select * from vwpatbill;



/*view for nurse about patient using patient_table,ptient_history_table,triage_nurse_table*/

create view nurtopat
as
select patient_table.patient_id,
patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,
patient_city,patient_state,patient_zipcode,preferred_pharmacy,
patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date,
triage_nurse_patient_symptoms,triage_nurse_comments
from patient_table,patient_history_table,triage_nurse_table where patient_table.patient_id=patient_history_table.patient_id
and patient_table.patient_id=triage_nurse_table.patient_id;

/*view for nurse about patient using patient_table,ptient_history_table,triage_nurse_table*/

select * from nurtopat;


/* Nurse to doctor details*/
create view vwnurtodocpro
 as
 select
 doctor_profile_table.doctor_profile_id,doctor_id,doctor_firstname,doctor_lastname,
 doctor_profile_specialization,doctor_profile_accepts_new_patients,doctor_available_days,doctor_active
 from
 doctor_profile_table,doctor_table where doctor_table.doctor_profile_id=doctor_profile_table.doctor_profile_id;
 
 Select * from vwnurtodocpro;
 
/*update the views*/ 
 update vwnurtodocpro
set doctor_profile_accepts_new_patients = 'No'
where doctor_firstname = 'Sophia';

Select * from vwnurtodocpro where doctor_firstname = 'Sophia' ;


  /*view for nurse to check how many appoinments does a specific dctor have*/
create view vwappoinments
as
select doctor_firstname,doctor_lastname,count(appointment_id) from 
appointment_table
join
doctor_table
on 
appointment_table.doctor_id = doctor_table.doctor_id ;


select * from vwappoinments;

/*view for cashier*/
create view vwbilltocashier
as
select patient_id,bill_amount
from billing_table
where bill_amount > 100
order by patient_id;

select * from vwbilltocashier;

/*view bill status details to cashier*/
create view vwbillstatus
as
select patient_id,payment_method_id
from payment_table
where payment_status='successful'
order by patient_id;

select * from vwbillstatus;

/*drop trigger after_patient_insert*/
/*creating a trigger for inserting into patient table*/

DELIMITER $$
CREATE TRIGGER after_patient_insert 
   after insert ON patient_table
    FOR EACH ROW 
BEGIN
    INSERT INTO patient_audit
    SET action = 'Insert',
     patient_id = new.patient_id,
        changedat = NOW(); 
END$$
DELIMITER ;
/*inserting values into patient_table*/

Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Hemanth','Patel','1982-08-22','M','9805981000','jam@gmail.com',123456001,'Charlotte','North Carolina',28922,'Health Mart pharmacy');


/*Check whether the changes are reflected in  the patient_audit table;*/
SELECT * FROM patient_audit;

/*creating a trigger for updating patient table*/

DELIMITER $$
CREATE TRIGGER before_patient_update 
    BEFORE UPDATE ON patient_table
    FOR EACH ROW 
BEGIN
    INSERT INTO patient_audit
    SET action = 'update',
     patient_id = OLD.patient_id,
	changedat = NOW(); 
END$$
DELIMITER ;

/*updating values from patient_table */
UPDATE patient_table 
SET 
    patient_lastname = 'Reddy'
WHERE
    patient_firstname = 'Hemanth';
    
    /*Check whether the changes are reflected in  the patient_audit table;*/
SELECT * FROM patient_audit;

/*creating a trigger for inserting into nurse table*/

DELIMITER $$
CREATE TRIGGER after_nurse_insert 
   after insert ON nurse_table
    FOR EACH ROW 
BEGIN
    INSERT INTO nurse_audit
    SET action = 'Insert',
     nurse_id = new.nurse_id,
        changedat = NOW(); 
END$$
DELIMITER ;

/*inserting values into nurse_table*/

Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Rajeev','Rao','221,Burton lane,Charlotte,NC,26600',989955008,'rajeev@gmail.com',9904599901,'S','8:00','19:00');

 /*Check whether the changes are reflected in  the patient_audit table;*/
SELECT * FROM nurse_audit;


/*creating a trigger for updating nurse table*/
DELIMITER $$
CREATE TRIGGER before_nurse_update 
    BEFORE UPDATE ON nurse_table
    FOR EACH ROW 
BEGIN
    INSERT INTO nurse_audit
    SET action = 'update',
    nurse_id = OLD.nurse_id,
	changedat = NOW(); 
END$$
DELIMITER ;



/*updating values from nurse_table */
UPDATE nurse_table 
SET 
    nurse_lastname = 'Reddy'
WHERE
    nurse_firstname = 'Rajeev';
    
    SELECT * FROM nurse_audit;


/*creating a trigger for inserting into doctor table*/

DELIMITER $$
CREATE TRIGGER after_doctor_insert 
   after insert ON doctor_table
    FOR EACH ROW 
BEGIN
    INSERT INTO doctor_audit
    SET action = 'Insert',
     doctor_id = new.doctor_id,
        changedat = NOW(); 
END$$
DELIMITER ;

/*inserting values into doctor_table*/
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('gynaecologist','n');


Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Anusha','Rani',7011,'122,kittan Drive,Charlotte,NC,28203',123465788,9904569009,'sneha@gmail.com','F,S,M,T','y');



 /*Check whether the changes are reflected in  the doctor_audit table;*/
SELECT * FROM doctor_audit;


/*creating a trigger for updating doctor table*/
DELIMITER $$
CREATE TRIGGER before_doctor_update 
    BEFORE UPDATE ON doctor_table
    FOR EACH ROW 
BEGIN
    INSERT INTO doctor_audit
    SET action = 'update',
    doctor_id = OLD.doctor_id,
	changedat = NOW(); 
END$$
DELIMITER ;



/*updating values from doctor_table */
UPDATE doctor_table 
SET 
    doctor_lastname = 'Raj'
WHERE
    doctor_firstname = 'Anusha';
    
    
    /*Indexes*/
    
    /*index for patient table*/
    
    create index ix_patient_lastname
    on patient_table (patient_lastname);
    
    /*index for doctor_table*/
    
    create index ix_doctor_firstname
    on doctor_table (doctor_firstname);
    
    /*index for appointment_table*/
    
    create index ix_appointment_date
    on  appointment_table(appointment_date);
    
    /*index for doctor_referral_table*/
   create index ix_referral_specialization
   on doctor_referral_table(referral_specialization);
  
  /*index for payment_table*/
  create index ix_payment_specialization
  on payment_table(payment_status);


    
    

/*----------------------------------------***STORED PROCEDURES***---------------------------------------------*/

/*stored procedure for a new patient insert*/
drop procedure if exists spPatIns;

delimiter $$
create procedure spPatIns
(in ins_patient_firstname varchar(50) , in ins_patient_lastname varchar(50), in ins_patient_dob  date , 
  in ins_patient_gender varchar(20), in ins_patient_phone bigint , in ins_patient_email varchar(50), in ins_patient_ssn bigint,
  in ins_patient_city varchar(50), in ins_patient_state varchar(50) , in ins_patient_zipcode int,
  in ins_preferred_pharmacy varchar(50) )
  begin 
  insert into 
  hospital_management.patient_table (patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,
  patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy)
  values(ins_patient_firstname,ins_patient_lastname,ins_patient_dob,ins_patient_gender,ins_patient_phone,
  ins_patient_email,ins_patient_ssn,ins_patient_city,ins_patient_state,ins_patient_zipcode,ins_preferred_pharmacy);
  
  select * from patient_table where patient_table.patient_ssn =  ins_patient_ssn;
  SELECT * FROM patient_audit ;
  end $$
  delimiter ;
  
  call  spPatIns('Smith','John','1984-06-23','M','9805986234',
  'smith1@gmail.com',123679,'Charlotte','North Carolina',28223,'CVS pharmacy');



/*stored procedure for a patient to confirm appointment*/

drop procedure if exists spPatApp;
delimiter $$
create procedure spPatApp
(
 in vis_patient_id int , 
 in vis_doctor_profile_specialization varchar(50) ,
 in vis_appointment_type_categories varchar(50),
 in vis_appointment_date date,
 in vis_appointment_time time
)
begin
declare app_type_id int;
declare app_id int;
declare d_id int;
declare vis_app_id int;

set d_id=(select doctor_table.doctor_id from doctor_table , doctor_profile_table
where  doctor_profile_specialization = vis_doctor_profile_specialization 
and doctor_table.doctor_profile_id=doctor_profile_table.doctor_profile_id);


set app_type_id = (select appointment_type_id from appointment_type_table where 
appointment_type_categories = vis_appointment_type_categories);

insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
 values (vis_patient_id ,d_id, app_type_id,vis_appointment_date,vis_appointment_time);


 set vis_app_id = (select appointment_id from appointment_table where patient_id=vis_patient_id order by appointment_id desc limit 1);
 
 select * from appointment_table where appointment_table.appointment_id=vis_app_id;
 
 
 end $$
 delimiter ;
 
call spPatApp(1009,'pediatrician','new patient','2017-04-13','16:00');






/*------------------------------------*ACCESS*---------------------------------*/
CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';




CREATE USER 'doctor'@'localhost' IDENTIFIED BY 'doctor'; 


CREATE USER 'nurse'@'localhost' IDENTIFIED BY 'nurse';


CREATE USER 'patient'@'localhost' IDENTIFIED BY 'patient';



create user 'cashier'@'localhost' IDENTIFIED BY 'cashier';






/*-----------------------------------------------**-----------------------------------------------------------*/

grant all on hospital_management.* to 'admin'@'localhost';

grant all on hospital_management.doctor_table to 'doctor'@'localhost';
grant select on hospital_management.vwdoctortopatienthistory to 'doctor'@'localhost';
grant select on hospital_management.vwdoctortonurse to 'doctor'@'localhost';
grant select on hospital_management.vwdoctortonurseandpatienthistory to 'doctor'@'localhost';
grant select on hospital_management.vwdoctopathispharpresclabs to 'doctor'@'localhost';

grant all on hospital_management.nurse_table to 'nurse'@'localhost';
grant all on hospital_management.nurtopat to 'nurse'@'localhost';
grant select,update on hospital_management.vwnurtodocpro to 'nurse'@'localhost';
grant select,update on hospital_management.vwappoinments to 'nurse'@'localhost';

grant all on hospital_management.patient_table to 'patient'@'localhost';
grant select on hospital_management.vwpattodoctorprof to 'patient'@'localhost';
grant select on hospital_management.vwpattoapptype to 'patient'@'localhost';
grant select on hospital_management.vwpattolabtypelabres to 'patient'@'localhost';
grant select on hospital_management.vwpatbill to 'patient'@'localhost';

grant select on hospital_management.vwbilltocashier to 'cashier'@'localhost';
grant select on hospital_management.vwbillstatus to 'cashier'@'localhost';


