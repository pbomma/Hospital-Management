/*
drop database hospital_management;
*/


/*Creating a database hospital_management*/


create database if not exists hospital_management;

/* Making outpatient_clinic Default Databse*/

use hospital_management;

/* creating table : patient  */

create table if not exists patient_table
(
patient_id int not null unique auto_increment,
patient_firstname varchar(50) not null,
patient_lastname varchar(50),
patient_dob date not null,
patient_gender varchar(20),
patient_phone bigint,
patient_ssn bigint not null unique,
patient_city varchar(50),
patient_state varchar(50),
patient_zipcode int,
preferred_pharmacy varchar(50),
patient_email varchar(50),
primary key(patient_id)
);

/* auto_increment to patient_id*/

alter table patient_table auto_increment=1001;

/*dumping data into patient_table*/

Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Smith','John','1974-06-23','M','9805981234','smith@gmail.com',123456789,'Charlotte','North Carolina',28223,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('John',' Wick','1980-02-27','M','9805981235','wick@gmail.com',123456780,'Charlotte','North Carolina',28200,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Jacob','Tyler','1960-06-14','M','9805981236','jacob@gmail.com',123456781,'Charlotte','North Carolina',28225,'Walgreens pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Michael','James','1985-08-22','M','9805981237','james@gmail.com',123456782,'Charlotte','North Carolina',28222,'Health Mart pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Joshua','John','1982-05-12','M','9805981238','josh@gmail.com',123456783,'Charlotte','North Carolina',28242,'Walgreens pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Mathew','Jonathan','1970-09-30','M','9805981239','johna@gmail.com',123456784,'Charlotte','North Carolina',28220,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Ethan','Nathan','1976-08-03','M','9805981240','nat@gmail.com',123456785,'Charlotte','North Carolina',27006,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Emma','Mia','2000-07-23','F','9805981241','emma@gmail.com',123456786,'Charlotte','North Carolina',27007,'Costco pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values(' Emily','Alisa','2005-06-15','F','9805981242','alisa@gmail.com',123456787,'Charlotte','North Carolina',27009,'Giant pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Anthony','Noah','1990-07-17','M','9805981243','ant@gmail.com',123456788,'Charlotte','North Carolina',27010,'Costco pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Mani','Sharma','2016-06-17','M','9905981244','man@gmail.com',123456771,'Charlotte','North Carolina',27021,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Jai',' Wick','1980-02-27','M','9805989235','jai@gmail.com',123456700,'Charlotte','North Carolina',28290,'CVS pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Jack','Tyler','1960-06-14','M','9805989236','jack@gmail.com',123456981,'Charlotte','North Carolina',29225,'Walgreens pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Mich','James','1985-08-22','M','9805981937','jam@gmail.com',123456982,'Charlotte','North Carolina',28922,'Health Mart pharmacy');
Insert into patient_table(patient_firstname,patient_lastname,patient_dob,patient_gender,patient_phone,patient_email,patient_ssn,patient_city,patient_state,patient_zipcode,preferred_pharmacy) 
values('Hemanth','Patel','1982-08-22','M','9805981000','jam@gmail.com',123456000,'Charlotte','North Carolina',28922,'Health Mart pharmacy');




/*delete from patient_table*/

/* creating a patient_Audit table*/
/*Drop table patient_audit;*/






CREATE TABLE patient_audit (
    id INT AUTO_INCREMENT PRIMARY KEY,
   patient_id INT NOT NULL,
changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL,
    foreign key(patient_id) references patient_table(patient_id)
);

/*creating  table : patient_history */

create table if not exists patient_history_table
(
patient_history_id int not null unique auto_increment,
patient_id int,
patient_history_known_allergies varchar(100),
patient_history_medical_conditions varchar(100),
patient_last_flushot_date date,
primary key(patient_history_id),
foreign key(patient_id) references patient_table(patient_id)
);

/* auto_increment to patient_history_id*/

alter table patient_history_table auto_increment=4001;

/*dumping data into table : patient_history*/

insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1004,'null','low blood pressure','2016-04-22');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1005,'null','asthma','2016-08-13');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1003,'food allergy','diabetes','2016-08-22');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1010,'eye allergy','null','2016-05-23');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1006,'skin allergy','depression','2016-10-19');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1008,'mold allergy','null','2016-11-06');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1001,'null','thyroid','2016-04-22');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1009,'null','sinus','2016-11-30');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1002,'pet allergy','high blood pressure','2015-10-02');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1007,'Latex allergy','migraine','2016-11-10');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1011,'accident','migraine','2016-08-19');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1012,'food allergy','migraine','2016-10-01');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1013,'severe allergy','migraine','2016-01-11');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1014,'high temperature','migraine','2016-12-10');
insert into patient_history_table (patient_id,patient_history_known_allergies,patient_history_medical_conditions,patient_last_flushot_date)
values(1014,'high temperature','migraine','2016-12-10');



/*creating  table : nurse */

create table if not exists nurse_table
(
nurse_id int not null unique auto_increment,
nurse_firstname varchar(50) not null,
nurse_lastname varchar(50),
nurse_address varchar(200),
nurse_ssn bigint not null unique,
nurse_email varchar(50),
nurse_phone bigint,
triage_nurse_available_days varchar(30),
triage_nurse_starttime time,
triage_nurse_endtime time,
primary key(nurse_id)
);

/* auto_increment to nurse_id*/

alter table nurse_table auto_increment=5001;

/*dumping data into nurse_table*/

Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Mary','Smith','9315,Adams Lane,Charlotte,NC,28223',123464398,'mary@gmail.com',9904568900,'M','8:00','17:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('John',' Rick','330,Orchard Road,Charlotte,NC,83384',123474398,'john@gmail.com',9904599900,'T','8:00','17:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Honey','Tyler','123,kittansett Drive,Charlotte,NC,28203',123465764,'Tyler@gmail.com',9904567654,'F','8:00','17:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Mitchel','James','212,Able Place,Charlotte,NC,28123',125642398,'james@gmail.com',9904998855,'Sa','8:00','22:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Malini','John','212,Aalto Place,Charlotte,NC,28223',123469988,'malini@gmail.com',9804599900,'M','17:00','8:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Roja','Jonathan','420,Baez Way,Charlotte,NC,28120',123989909,'roja@gmail.com',9804568880,'R','8:00','20:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Rajini','Nathan','120,Bando Lane,Charlotte,NC,28360',996655487,'raj@gmail.com',9904555500,'W','8:00','17:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Priyanka','Mia','360,Baffie Court,Charlotte,NC,27220',987678987,'priya@gmail.com',9904599990,'S','8:00','19:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Mounika','Reddy','123,Barker Way,Charlotte,NC,26789',987887787,'reddy@gmail.com',9904599990,'S','8:00','19:00');
Insert into nurse_table (nurse_firstname,nurse_lastname,nurse_address,nurse_ssn,nurse_email,nurse_phone,triage_nurse_available_days,triage_nurse_starttime,triage_nurse_endtime)
values('Pamela','Rao','223,Burton Lane,Charlotte,NC,26678',989955487,'rao@gmail.com',9904599990,'S','8:00','19:00');

/*creating the nurse_audit*/
CREATE TABLE nurse_audit (
    nurse_audit_id INT AUTO_INCREMENT PRIMARY KEY,
   nurse_id INT NOT NULL,
changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL,
    foreign key(nurse_id) references nurse_table(nurse_id)
);
/*create table : triage_nurse*/
create table if not exists triage_nurse_table
(
patient_id int not null,
nurse_id int not null,
triage_nurse_patient_symptoms varchar(200),
triage_nurse_comments varchar(200) not null,
foreign key(patient_id) references patient_table(patient_id),
foreign key(nurse_id) references nurse_table(nurse_id)
);

/*dumping data into triage_nurse_table*/

Insert into  triage_nurse_table 
values (1001,5001,'thyroid','visit doctor');
Insert into  triage_nurse_table 
values (1010,5004,'eye burning','use eye drops and visit doctor');
Insert into  triage_nurse_table 
values (1008,5003,'mold allergy','visit doctor');
Insert into  triage_nurse_table 
values (1002,5010,'scratches of pet','visit doctor');
Insert into  triage_nurse_table 
values (1007,5009,'Latex due to exessive use of gloves','avoid bananas, chestnuts, kiwi and visit doctor');
Insert into  triage_nurse_table 
values (1006,5008,'rashes on the back','visit doctor');
Insert into  triage_nurse_table 
values (1003,5006,'diarrhea,indigestion,vomiting','visit doctor');
Insert into  triage_nurse_table 
values (1009,5005,'sinus','avoid icecreams,cold drinks and visit doctor');
Insert into  triage_nurse_table 
values (1005,5002,'asthma','do yoga and visit doctor');
Insert into  triage_nurse_table 
values (1004,5007,'low blood pressure','visit doctor');

/*create table : doctors_profile*/

create table if not exists doctor_profile_table
(
doctor_profile_id int not null unique auto_increment,
doctor_profile_specialization varchar(50) not null,
doctor_profile_accepts_new_patients varchar(20),
primary key (doctor_profile_id)
);

/* auto_increment to doctor_profile_id*/

alter table doctor_profile_table auto_increment=7001;

/*dumping data into doctor_profile_table*/

Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('pediatrician','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('gynaecologist','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('dermatologist','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('dentist','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('Allergy and immunology','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('General Physician','y');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('Allergy and immunology','n');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('gynaecologist','n');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('dentist','n');
Insert into doctor_profile_table (doctor_profile_specialization,doctor_profile_accepts_new_patients)
values('General Physician','y');

/*create table : doctor*/
create table if not exists doctor_table
(
doctor_id int not null unique auto_increment,
doctor_firstname varchar(200),
doctor_lastname varchar(200),
doctor_profile_id int not null,
doctor_address varchar(500),
doctor_ssn bigint not null unique,
doctor_phone bigint,
doctor_email varchar(50),
doctor_available_days varchar(30),
doctor_active varchar(30),
primary key (doctor_id),
foreign key (doctor_profile_id) references doctor_profile_table(doctor_profile_id)
);
/*creating doctor_audit */

CREATE TABLE doctor_audit (
    doctor_audit_id INT AUTO_INCREMENT PRIMARY KEY,
   doctor_id INT NOT NULL,
changedat DATETIME DEFAULT NULL,
    action VARCHAR(50) DEFAULT NULL,
    foreign key(doctor_id) references doctor_table(doctor_id)
);

/* auto_increment to doctor_id*/

alter table doctor_table auto_increment=8001;

/*dumping data into doctor_table*/

Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Nicholas','Jose',7001,'102,Burns Drive,Charlotte,28223',123556698,9802234567,'Nicholas@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Grace','Nathan',7002,'122,John Drive,Charlotte,28439',123559998,9802234520,'Grace@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Sophia','Garcia',7003,'225,Callaway Drive,Charlotte,28340',123666698,9802234540,'Sophia@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Maria','Hernandez',7004,'146,Canal Street,Charlotte,28120',124444698,9802234230,'Maria9@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('James','Johnson',7005,'238,Cambio Court,Charlotte,28320',123551111,9802234590,'James8@gmail.com','M,T,W,R,F','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Julius','Ceaser',7006,' 276,Cambio Court,Charlotte,28320',123558888,9802666695,'Julicea0@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Rajini','Nathanial',7007,'160,Bando Lane,Charlotte,NC,28360',127777698,992228887,'praj@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Mitchel','Johny',7008,'252,Able Place,Charlotte,NC,28123',133332398,9904444855,'james1@gmail.com','M,T,W,R,F,S','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Pam','Rao',7009,'243,Burton Lane,Charlotte,NC,26678',133332000,9904888990,'rao@gmail.com','S,M,T','y');
Insert into doctor_table (doctor_firstname,doctor_lastname,doctor_profile_id,doctor_address,doctor_ssn,doctor_phone,doctor_email,doctor_available_days,doctor_active)
values('Honey','Ross',7010,'123,kittansett Drive,Charlotte,NC,28203',123465764,9904569994,'Tyler@gmail.com','F,S,M,T','y');


/*create table : appointment_type*/

create table if not exists appointment_type_table
(
appointment_type_id int not null unique auto_increment,
appointment_type_categories nvarchar(50),
primary key (appointment_type_id)
);

/* auto_increment to appointment_type_id*/

alter table appointment_type_table auto_increment=9001;

/*dumping data into appointment_type_table*/

Insert into appointment_type_table(appointment_type_categories)
values('new patient');
Insert into appointment_type_table(appointment_type_categories)
values('sick visit');
Insert into appointment_type_table(appointment_type_categories)
values('follow up visit');
Insert into appointment_type_table(appointment_type_categories)
values('second opinion');
Insert into appointment_type_table(appointment_type_categories)
values('consultation');

/*create table : appointment*/
create table if not exists appointment_table
(
appointment_id int not null unique auto_increment,
patient_id int,
doctor_id int,
appointment_type_id int,
appointment_date date,
appointment_time time,
primary key(appointment_id),
foreign key(patient_id) references patient_table(patient_id),
foreign key(doctor_id) references doctor_table(doctor_id) ,
foreign key(appointment_type_id) references appointment_type_table(appointment_type_id)
); 


/*auto_increment for appointment_id*/

alter table appointment_table auto_increment=2001;

/*dumping data into appointment_table*/

Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1001,8001,9001,'2017-07-13','14:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1002,8002,9002,'2017-06-22','8:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1003,8003,9003,'2017-05-18','8:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1004,8004,9004,'2017-06-17','16:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1005,8005,9005,'2017-05-23','18:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1006,8006,9001,'2017-06-10','10:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1007,8007,9002,'2017-05-01','8:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1008,8008,9003,'2017-06-11','10:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1009,8009,9004,'2017-05-19','11:00');
Insert into appointment_table(patient_id,doctor_id,appointment_type_id,appointment_date,appointment_time)
values(1010,8010,9005,'2017-08-13','11:00');






/*create table : auto_reminder*/

create table if not exists auto_reminder_table
(
auto_reminder_id int not null unique auto_increment,
patient_history_id int not null,
auto_reminder_type varchar(50),
primary key(auto_reminder_id),
foreign key(patient_history_id) references patient_history_table(patient_history_id) 
);

/*auto_increment for auto_reminder_id*/

alter table auto_reminder_table auto_increment=12001;


/*dumping data into auto_reminder_table*/

Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4004,'last flushot');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4001,'annual checkup');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4005,'annual checkup');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4003,'annual checkup');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4007,'annual checkup');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4006,'annual checkup');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4008,'last flushot');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4010,'last flushot');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4002,'last flushot');
Insert into auto_reminder_table(patient_history_id,auto_reminder_type)
values(4009,'annual checkup');


/*create table : emergency*/

create table if not exists emergency_table
(
emergency_id int not null unique auto_increment,
patient_id int not null,
emergency_reason varchar(100),
foreign key (patient_id) references patient_table(patient_id),
primary key (emergency_id)
);

/* auto_increment to emergency_id*/

alter table emergency_table auto_increment=13001;

/*dumping data into emergency_table*/

Insert into emergency_table(patient_id,emergency_reason)
values(1011,'accident');
Insert into emergency_table(patient_id,emergency_reason)
values(1012,'food allergy');
Insert into emergency_table(patient_id,emergency_reason)
values(1013,'severe allergy');
Insert into emergency_table(patient_id,emergency_reason)
values(1014,'high temperature');

/*create table : emergency*/

create table if not exists reminders_table
(
reminder_id int not null ,
appointment_id int,
reminder_date datetime,
primary key (reminder_id),
foreign key (appointment_id) references appointment_table(appointment_id)
);

/*dumping data into table : reminders*/

Insert into reminders_table
values(14001,2001,'2017-07-12 08:00:00');
Insert into reminders_table
values(14002,2002,'2017-06-21 08:00:00');
Insert into reminders_table
values(14003,2003,'2017-05-17 08:00:00');
Insert into reminders_table
values(14004,2004,'2017-06-16 08:00:00');
Insert into reminders_table
values(14005,2005,'2017-05-22 08:00:00');
Insert into reminders_table
values(14006,2006,'2017-06-09 08:00:00');
Insert into reminders_table
values(14007,2007,'2017-05-01 08:00:00');
Insert into reminders_table
values(14008,2008,'2017-06-10 08:00:00');
Insert into reminders_table
values(14009,2009,'2017-05-18 08:00:00');
Insert into reminders_table
values(14010,2010,'2017-08-12 08:00:00');

/*create table : doctor_referral_table*/

create table if not exists doctor_referral_table
(
referral_doctor_id int not null unique auto_increment,
referral_firstname varchar(50),
referral_lastname varchar (50),
referral_specialization varchar(50),
referral_hospitalname varchar(50),
primary key (referral_doctor_id)
);

/* auto_increment to referral_doctor_id*/

alter table doctor_referral_table auto_increment=15001;

/*dumping data into doctor_referral_table*/

Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Nicholas','Jose','pediatrician','Alleghany Memorial Hospital');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Grace','Nathan','gynaecologist','Annie Penn Hospital');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Sophia','Garcia','dermatologist','Betsy Johnson Regional Hospital');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Maria','Hernandez','dentist','CarolinaEast Medical Center');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('James','Johnson','Allergy and immunology','Cape Fear Valley Hoke Hospital');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Julius','Ceaser','General Physician','Carolinas ContinueCARE Hospital at Pineville');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Rajini','Nathanial','Allergy and immunology','Carolinas HealthCare System NorthEast');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Mitchel','Johny','gynaecologist','New Hanover Regional Medical Center');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Pam','Rao','dentist','Novant Health Brunswick Medical Center');
Insert into doctor_referral_table(referral_firstname,referral_lastname,referral_specialization,referral_hospitalname)
values('Honey','Ross','General Physician','Novant Health Brunswick Medical Center');
/*create table : referral_table*/

create table if not exists referral_table
(
referral_id int not null unique auto_increment,
referral_doctor_id int,
doctor_id int,
primary key(referral_id),
foreign key (doctor_id) references doctor_table(doctor_id),
foreign key (referral_doctor_id) references doctor_referral_table(referral_doctor_id)
);

/* auto_increment to patient_id*/

alter table referral_table auto_increment=16001;

/*dumping data into table : referral_table*/

Insert into referral_table(referral_doctor_id,doctor_id)
values(15001,8001);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15002,8002);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15003,8003);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15004,8004);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15005,8005);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15006,8006);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15007,8007);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15008,8008);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15009,8009);
Insert into referral_table(referral_doctor_id,doctor_id)
values(15010,8010);

/*create table : visits*/

create table if not exists visit_table
(
visit_id int not null unique auto_increment,
appointment_id int,
emergency_id int,
visit_reason varchar(100) not null,
visit_observation varchar(100) not null,
primary key (visit_id),
foreign key (appointment_id) references appointment_table(appointment_id),
foreign key (emergency_id) references emergency_table(emergency_id)
);

/* auto_increment to visit_id*/

alter table visit_table auto_increment=17001;

/*dumping data into table : visit_table*/
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2001,null,'fever','medication for 3 days');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2002,null,'health issue','medication for a week');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2003,null,'skin allergy','medication for 2 days');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2004,null,'toothache','medication for 2 weeks');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2005,null,'food allergy','medication for a day');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2006,null,'fever','medication for 3 days');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2007,null,'allergy','blood work lab');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2008,null,'health issue','medication for a week');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2009,null,'toothache','medication for 4 days');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(2010,null,'back pain','advised to take an x-ray');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(null,13001,'accident','advised to take an x-ray');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(null,13002,'food allergy','advised for blood work');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(null,13003,'severe allergy','advice for blood work');
Insert into visit_table (appointment_id,emergency_id,visit_reason,visit_observation)
values(null,13004,'high temperature','antibiotics for 3 days');


/*create table : insurance_company*/


create table if not exists insurance_company_table
(
insurance_company_id int not null unique auto_increment,
insuance_compname varchar(50),
insurance_company_phone bigint,
insurance_company_address varchar(200),
primary key(insurance_company_id)
);

/* auto_increment to insurance_company_id*/

alter table insurance_company_table auto_increment=18001;

/*dumping data into insurance_company_table*/

Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('Golden Rule Insurance Company',9803187778,'70 Bowman St.South Windsor, CT 06074');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('Humana',9803186678,'44 Shirley Ave.Charlotte,NC 6018');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('IHC Group',9807776500,'690 kittensette dr, Charlotte, NC 28215');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('Nationwide Life Insurance Company',9808887778,'90 Bowman St.Windsor, CT 06074');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('Renaissance Dental',9803187999,'1502 Elk Street, BOONVILLE, NC, 29987');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('HCC Life Insurance Company',9803185555,'79 Shirley Ave.Charlotte,NC 26018');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('California Health Insurance',9803111111,'21 Barton Creek dr, Charlotte, NC 28215');
Insert into insurance_company_table(insuance_compname,insurance_company_phone,insurance_company_address)
values('UnitedHealthOne',9803166665,'874 Luke Lane,BELEWS CREEK,NC 27009');




/*create table : insurance*/



create table if not exists insurance_table
(
insurance_id int not null unique auto_increment,
patient_id int,
insurance_company_id int,
primary key(insurance_id),
foreign key(patient_id) references patient_table (patient_id),
foreign key (insurance_company_id) references insurance_company_table(insurance_company_id)
);

/* auto_increment to insurance_id*/

alter table insurance_table auto_increment=19001;

/*alter table hospital_management.insurance_table 

add constraint fk_insurance_compname foreign key(insuance_compname)
references insurance_company_table(insuance_compname)
*/


/*dumping data into table : insurance_table*/

Insert into insurance_table (patient_id,insurance_company_id)
values(1001,18001);
Insert into insurance_table (patient_id,insurance_company_id)
values(1002,18002);
Insert into insurance_table (patient_id,insurance_company_id)
values(1003,18003);
Insert into insurance_table (patient_id,insurance_company_id)
values(1004,18004);
Insert into insurance_table (patient_id,insurance_company_id)
values(1005,18005);
Insert into insurance_table (patient_id,insurance_company_id)
values(1006,18006);
Insert into insurance_table (patient_id,insurance_company_id)
values(1007,18007);
Insert into insurance_table (patient_id,insurance_company_id)
values(1008,18008);
Insert into insurance_table (patient_id,insurance_company_id)
values(1009,18006);
Insert into insurance_table (patient_id,insurance_company_id)
values(1010,18007);


/*create table : billing*/


create table if not exists  billing_table
(
bill_id int not null unique auto_increment,
patient_id int ,
visit_id int,
insurance_id int,
bill_amount float,
primary key (bill_id),
foreign key (patient_id) references patient_table(patient_id),
foreign key (visit_id) references visit_table(visit_id),
foreign key(insurance_id) references insurance_table(insurance_id)
);

/* auto_increment to bill_id*/

alter table billing_table auto_increment=21001;

/*dumping data into billing_table*/

Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1001,17001,19001,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1002,17002,19002,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1003,17003,19003,200);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1004,17004,19004,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1005,17005,19005,120);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1006,17006,19006,140);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1007,17007,19007,150);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1008,17008,19008,80);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1009,17009,19009,200);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1010,17010,19010,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1011,17011,19010,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1012,17012,19010,100);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1013,17013,19010,200);
Insert into billing_table (patient_id,visit_id,insurance_id,bill_amount)
values(1014,17014,19010,300);



/*create table : labtype*/

create table if not exists labtype_table
(
labtype_id int not null unique auto_increment,
labtype_type varchar(200),
primary key(labtype_id)
);

/* auto_increment to labtype_id*/

alter table labtype_table auto_increment=22001;

/*dumping data into labtype_table*/

Insert into labtype_table (labtype_type)
values('Blood work');
Insert into labtype_table (labtype_type)
values('CT scan');
Insert into labtype_table (labtype_type)
values('Endoscopy');
Insert into labtype_table (labtype_type)
values('X-ray');
Insert into labtype_table (labtype_type)
values('Lipid profile');
Insert into labtype_table (labtype_type)
values('ECG');
Insert into labtype_table (labtype_type)
values('Ultrasound');


/*create table : labs*/
create table if not exists lab_table
(
lab_id int not null unique auto_increment,
patient_id int,
doctor_id int,
labtype_id int,
visit_id int,
primary key(lab_id),
foreign key(patient_id) references patient_table(patient_id),
foreign key(doctor_id) references doctor_table(doctor_id),
foreign key(labtype_id) references labtype_table(labtype_id),
foreign key(visit_id) references visit_table(visit_id)
);

/* auto_increment to lab_table*/

alter table lab_table auto_increment=23001;

/*dumping data into lab_table*/

Insert into lab_table(patient_id,doctor_id,labtype_id,visit_id)
values(1007,8007,22001,17001);
Insert into lab_table(patient_id,doctor_id,labtype_id,visit_id)
values(1010,8010,22004,17002);
Insert into lab_table(patient_id,doctor_id,labtype_id,visit_id)
values(1011,8010,22004,17003);
Insert into lab_table(patient_id,doctor_id,labtype_id,visit_id)
values(1012,8007,22001,17004);
Insert into lab_table(patient_id,doctor_id,labtype_id,visit_id)
values(1013,8007,22001,17005);

/*create table : labresults_table*/
create table if not exists labresults_table
(
labresults_id int not null unique auto_increment,
patient_id int,
lab_result varchar(200),
primary key(labresults_id),
foreign key(patient_id) references patient_table (patient_id)
);


/* auto_increment to labresults_id*/

alter table labresults_table auto_increment=24001;

/*dumping data into labresults_table*/


Insert into labresults_table (patient_id,lab_result)
values(1007,'abc');
Insert into labresults_table (patient_id,lab_result)
values(1010,'def');
Insert into labresults_table (patient_id,lab_result)
values(1011,'ghi');
Insert into labresults_table (patient_id,lab_result)
values(1012,'jkl');
Insert into labresults_table (patient_id,lab_result)
values(1013,'mno');

/*create table : prescription*/


create table if not exists prescription_table
(
prescription_id int not null unique auto_increment,
patient_id int,
visit_id int,
primary key(prescription_id),
foreign key(patient_id) references patient_table(patient_id),
foreign key(visit_id) references visit_table(visit_id)
);

/* auto_increment to prescription_id*/

alter table prescription_table auto_increment=25001;

/*dumping data into prescription_table*/

Insert into prescription_table (patient_id,visit_id)
values(1001,17001);
Insert into prescription_table (patient_id,visit_id)
values(1002,17002);
Insert into prescription_table (patient_id,visit_id)
values(1003,17003);
Insert into prescription_table  (patient_id,visit_id)
values(1004,17004);
Insert into prescription_table  (patient_id,visit_id)
values(1005,17005);
Insert into prescription_table (patient_id,visit_id)
values(1006,17006);
Insert into prescription_table (patient_id,visit_id)
values(1007,17007);
Insert into prescription_table (patient_id,visit_id)
values(1008,17008);
Insert into prescription_table (patient_id,visit_id)
values(1009,17009);
Insert into prescription_table  (patient_id,visit_id)
values(1010,17010);
Insert into prescription_table  (patient_id,visit_id)
values(1011,17011);
Insert into prescription_table  (patient_id,visit_id)
values(1012,17012);
Insert into prescription_table  (patient_id,visit_id)
values(1013,17013);
Insert into prescription_table  (patient_id,visit_id)
values(1014,17014);



/*create table : pharmacy_table*/

create table if not exists pharmacy_table
(
pharmacy_id int not null unique auto_increment,
prescription_id int,
patient_id int,
pharmacy_name varchar(50),
pharmacy_address varchar(200),
pharmacy_phone bigint,
primary key(pharmacy_id),
foreign key(prescription_id) references prescription_table(prescription_id)
);

/* auto_increment to pharmacy_id*/

alter table pharmacy_table auto_increment=26001;

/*dumping data into pharmacy_table*/


Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25001,1001,'Cvs Pharmacy','9715,Charlotte,NC',9809809804);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25002,1002,'Giant Pharmacy','6789,Charlotte,NC',9909909903);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25003,1003,'Costco Pharmacy','8900,Charlotte,NC',9089089083);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25004,1004,'CVS pharmacy','9700,Charlotte,NC',7047047044);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25005,1005,'Walgreens Pharmacy','9701,Charlotte,NC',4804804804);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25006,1006,'Health Mart Pharmacy','9600,Charlotte,NC',9808908900);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25007,1007,'Walgreens Pharmacy','9770,Charlotte,NC',9809909909);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25008,1008,'CVS Pharmacy','9790,Charlotte,NC',9800080088);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25009,1009,'CVS Pharmacy','9720,Charlotte,NC',7044404404);
Insert into pharmacy_table (prescription_id,patient_id,pharmacy_name,pharmacy_address,pharmacy_phone)
values(25010,1010,'Costco Pharmacy','9680,Charlotte,NC',9803303309);


/*create table : pharmacy_prescription_table*/

create table if not exists pharmacy_prescription_table
(
pharmacy_id int,
prescription_id int,
foreign key(prescription_id) references prescription_table(prescription_id),
foreign key(pharmacy_id) references pharmacy_table(pharmacy_id)
);

/*dumping data into prescription_table*/

Insert into pharmacy_prescription_table 
values(26001,25001);
Insert into pharmacy_prescription_table 
values(26002,25002);
Insert into pharmacy_prescription_table 
values(26003,25003);
Insert into pharmacy_prescription_table 
values(26004,25004);
Insert into pharmacy_prescription_table 
values(26005,25005);
Insert into pharmacy_prescription_table 
values(26006,25006);
Insert into pharmacy_prescription_table 
values(26007,25007);
Insert into pharmacy_prescription_table 
values(26008,25008);
Insert into pharmacy_prescription_table 
values(26009,25009);
Insert into pharmacy_prescription_table 
values(26010,25010);

/*create table : bill_statement*/

create table if not exists bill_statement_table
(
bill_invoice_id int not null unique auto_increment,
patient_id int,
doctor_id int,
lab_id int,
visit_id int,
insurance_payment float,
total_amount float,
balance_amount float,
primary key(bill_invoice_id),
foreign key(patient_id) references patient_table(patient_id),
foreign key(doctor_id) references doctor_table(doctor_id),
foreign key(visit_id) references visit_table(visit_id),
foreign key(lab_id) references lab_table(lab_id)
);

/* auto_increment to bill_invoice_id*/

alter table bill_statement_table auto_increment=28001;


/*dumping data into bill_statement_table*/

Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1001,8001,null,17001,50,100,50);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1002,8002,null,17002,20,100,80);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1003,8003,null,17003,60,200,140);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1004,8004,null,17004,60,100,40);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1005,8005,null,17005,40,120,80);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1006,8006,null,17006,30,140,110);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1007,8007,23001,17007,50,150,100);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1008,8008,null,17008,20,80,60);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1009,8009,null,17009,100,200,100);
Insert into bill_statement_table (patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1010,8010,23002,17010,25,100,75);
Insert into bill_statement_table
(patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1011,8010,23003,17010,50,100,50);
Insert into bill_statement_table
(patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1012,8007,23004,17010,35,100,65);
Insert into bill_statement_table
(patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1013,8010,23005,17010,50,200,150);
Insert into bill_statement_table
(patient_id,doctor_id,lab_id,visit_id,insurance_payment,total_amount,balance_amount)
values(1014,8010,null,17010,100,300,200);

/*create table : payment_methods_table*/

create table if not exists payment_method_table
(
payment_method_id int not null unique auto_increment,
payment_types varchar(30),
primary key(payment_method_id)
);

/* auto_increment to payment_method_id*/

alter table payment_method_table auto_increment=29001;

/*dumping data into payment_method_table*/

Insert into payment_method_table (payment_types)
values('debit card');
Insert into payment_method_table (payment_types)
values('credit card');
Insert into payment_method_table (payment_types)
values('paypal');
Insert into payment_method_table (payment_types)
values('cash');


/*create table : payment_table*/

create table if not exists payment_table
(
payment_trans_id int not null unique auto_increment,
payment_method_id int,
bill_invoice_id int,
patient_id int,
payment_status varchar(30),
payment_date datetime ,
primary key (payment_trans_id),
foreign key(payment_method_id) references payment_method_table(payment_method_id),
foreign key(patient_id) references patient_table(patient_id)  ,
foreign key(bill_invoice_id) references bill_statement_table (bill_invoice_id)  
 );
 
 /* auto_increment to payment_trans_id*/

alter table payment_table auto_increment=3001; 

/*dumping data into payment_table*/


Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29001,28001,1001,'successful',' 2016-05-22 18:05:54');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29002,28002,1002,'successful',' 2017-03-12 18:09:04');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29003,28003,1003,'pending',' 2017-04-02 17:05:44');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29004,28004,1004,'successful','2016-05-22 11:54:54');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29001,28005,1005,'successful','2016-05-12 18:59:59');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29002,28006,1006,'successful',' 2016-05-22 12:05:01');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29003,28007,1007,'successful',' 2016-05-22 11:05:04');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29004,28008,1008,'successful',' 2016-05-22 17:05:05');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29001,28010,1009,'successful','2016-05-22 16:09:59');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29002,28011,1010,'successful',' 2016-05-22 14:08:07');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29003,28012,1011,'successful','2017-03-12 18:09:04');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29004,28013,1012,'pending',' 2017-05-12 12:00:00');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29001,28009,1013,'pending',' 2017-03-12 12:00:00');
Insert into payment_table(payment_method_id,bill_invoice_id,patient_id,payment_status,payment_date)
values(29002,28014,1014,'pending',' 2017-05-13 12:00:00');








