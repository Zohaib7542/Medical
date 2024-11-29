
Create database hospital
use hospital



CREATE TABLE patients (
  id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(50) NOT NULL,
  age VARCHAR(3) NOT NULL,
  gender VARCHAR(7) NOT NULL,
  PRIMARY KEY (id)  
);

CREATE TABLE doctors (
  id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
  NAME VARCHAR(255) NOT NULL,
  department VARCHAR(100) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE appointments (
  id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
  patient_id MEDIUMINT(8) NOT NULL,
  doctor_id MEDIUMINT(8) NOT NULL,
  appointment_date DATE NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (patient_id) REFERENCES patients (id),
  FOREIGN KEY (doctor_id) REFERENCES doctors (id)
);

CREATE TABLE ambulance (
id MEDIUMINT(8) NOT NULL AUTO_INCREMENT,
PRIMARY KEY(id)
)

Insert into ambulance(ID)
values(101)

drop table patients;


select * from patients
select * from doctors
select * from appointments
select * from ambulance

ALTER TABLE patients
MODIFY COLUMN age TINYINT UNSIGNED NOT NULL,
ADD CONSTRAINT chk_age CHECK (age BETWEEN 0 AND 120);

ALTER TABLE patients
MODIFY COLUMN gender ENUM('Male', 'Female', 'Other') NOT NULL;

------------------------------

ALTER TABLE doctors
MODIFY COLUMN id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE appointments DROP FOREIGN KEY appointments_ibfk_2;
ALTER TABLE doctors MODIFY COLUMN id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE appointments MODIFY COLUMN doctor_id MEDIUMINT(8) UNSIGNED NOT NULL;

ALTER TABLE appointments 
ADD CONSTRAINT appointments_ibfk_2 FOREIGN KEY (doctor_id) REFERENCES doctors(id);

--------------------------------

ALTER TABLE patients MODIFY COLUMN id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT;
ALTER TABLE doctors MODIFY COLUMN id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT;


ALTER TABLE appointments DROP FOREIGN KEY appointments_ibfk_1;
ALTER TABLE appointments DROP FOREIGN KEY appointments_ibfk_2;

ALTER TABLE appointments
MODIFY COLUMN id MEDIUMINT(8) UNSIGNED NOT NULL AUTO_INCREMENT,
MODIFY COLUMN patient_id MEDIUMINT(8) UNSIGNED NOT NULL,
MODIFY COLUMN doctor_id MEDIUMINT(8) UNSIGNED NOT NULL;


ALTER TABLE appointments
ADD CONSTRAINT appointments_ibfk_1 FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT appointments_ibfk_2 FOREIGN KEY (doctor_id) REFERENCES doctors(id) ON DELETE CASCADE ON UPDATE CASCADE;





