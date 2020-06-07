CREATE DATABASE Hospital;
use Hospital
CREATE TABLE Patient (
    PatientID int NOT NULL PRIMARY KEY,
    FirstName varchar(255),
    Age int ,
	Gender varchar(255),
);
CREATE TABLE Rooms (
    RoomID int NOT NULL ,
    RoomNumber int NOT NULL,
	BedNumber int NOT NULL,
    ID int FOREIGN KEY REFERENCES Patient(PatientID)
);
CREATE TABLE prescription (
    PrescriptionID int NOT NULL PRIMARY KEY,
    Disease varchar(255) ,
	Treatment varchar(255) ,
	Payment money NOT NULL,
    ID int FOREIGN KEY REFERENCES Patient(PatientID)
);
CREATE TABLE doctor (
    DoctorID int NOT NULL PRIMARY KEY,
    FirstName varchar(255),
	Doctordepts varchar(255),
    ID int FOREIGN KEY REFERENCES Patient(PatientID)
);
CREATE TABLE nurse (
    NurseID int NOT NULL PRIMARY KEY,
    FirstName varchar(255),
    ID int FOREIGN KEY REFERENCES doctor(DoctorID)
);
--The Insertion
INSERT INTO Patient VALUES (1,'ahmed',20,'male');
INSERT INTO Patient VALUES (2,'mohamed',30,'male');
INSERT INTO Patient VALUES (3,'sara',40,'female');
INSERT INTO Rooms VALUES (1,201,4,1);
INSERT INTO Rooms VALUES (2,202,4,2);
INSERT INTO Rooms VALUES (3,202,4,3);
INSERT INTO prescription VALUES (1,'fever','cataflam',200,1);
INSERT INTO prescription VALUES (2,'fever','catafast',300,2);
INSERT INTO prescription VALUES (3,'heart attack','cardiac',500,3);
INSERT INTO doctor VALUES (1,'ahmed','abdominal',1);
INSERT INTO doctor VALUES (2,'mohamed','abdominal',2);
INSERT INTO doctor VALUES (3,'ola','cardiac',3);
INSERT INTO nurse VALUES (1,'nada',1);
INSERT INTO nurse VALUES (2,'gehad',2);
INSERT INTO nurse VALUES (3,'ola',3);
--The Update
UPDATE Patient SET  Age = 30 WHERE  PatientID = 1;
UPDATE Rooms SET  BedNumber = 5 WHERE RoomID  = 1;
UPDATE doctor SET  FirstName = 'emad' WHERE  DoctorID = 1;
UPDATE nurse SET  FirstName = 'amal' WHERE  NurseID = 1;
UPDATE prescription SET  Payment = 230 WHERE   PrescriptionID = 1;
--The Delete
DELETE FROM prescription WHERE PrescriptionID ='3';
DELETE FROM prescription WHERE Disease ='heart attack';
DELETE FROM prescription WHERE Treatment ='cardiac';
DELETE FROM prescription WHERE Payment = 500;
DELETE FROM prescription WHERE ID = 3;
--The Select by use the Functions
SELECT CONCAT( Payment , Treatment ) FROM Prescription ;
SELECT REPLACE('toctor', 'T', 'd');
SELECT DIFFERENCE('ahmed ', 'hamed');
SELECT LEN('prescription');
SELECT LOWER(FirstName) AS LowerrCaseFirstName FROM Patient;
SELECT UPPER(FirstName) AS UppercaseFirstName FROM Patient;
SELECT CURRENT_TIMESTAMP;
SELECT CAST(Payment AS int) FROM Prescription;
SELECT MAX(Payment) AS SmallestPayment FROM Prescription;
SELECT MIN (Payment) AS SmallestPayment FROM Prescription;
SELECT Age , patientID FROM patient WHERE Age IS NULL;
SELECT COUNT ( Payment ) FROM  Prescription
SELECT AVG ( Payment ) FROM Prescription
SELECT SUM ( Payment ) FROM Prescription 
SELECT POWER( Payment, 4) FROM Prescription
SELECT SQUARE(payment) FROM Prescription;
SELECT CONVERT(varchar, 25);
SELECT ABS (Payment) AS positivePayment FROM Prescription;
SELECT NULLIF('payment', 'payment');
SELECT ISNUMERIC (Payment) FROM Prescription
--Select Statements using Sub Query
SELECT FirstName
FROM Patient
WHERE PatientID= ANY (SELECT DoctorID FROM doctor 
WHERE FirstName = 'ahmed');
SELECT FirstName
FROM doctor
WHERE DoctorID= ANY (SELECT NurseID FROM nurse 
WHERE FirstName = 'amal');
SELECT Age
FROM patient
WHERE PatientID= ANY (SELECT DoctorID FROM doctor 
WHERE FirstName = 'mohamed');
--Select Statements using Count and Group Functions 
SELECT COUNT(PatientID) 
FROM Patient 
GROUP BY FirstName;
SELECT COUNT(DoctorID) 
FROM doctor 
GROUP BY FirstName;
--Select Statements using Different Joins
SELECT nurse.NurseID,nurse.FirstName 
FROM nurse 
INNER JOIN doctor  ON nurse.NurseID = doctor.DoctorID;

SELECT doctor.DoctorID, doctor.FirstName
FROM doctor
LEFT JOIN nurse ON doctor.DoctorID = nurse.NurseID
ORDER BY doctor.FirstName;

SELECT doctor.DoctorID, doctor.FirstName
FROM doctor
RIGHT JOIN nurse ON doctor.DoctorID = nurse.NurseID
ORDER BY doctor.FirstName;

SELECT doctor.FirstName, nurse.NurseID
FROM doctor 
FULL OUTER JOIN nurse ON  doctor.DoctorID = nurse.NurseID
ORDER BY doctor.FirstName;

SELECT doctor.FirstName  AS doctorname, nurse.FirstName AS nursename 
FROM doctor ,nurse WHERE  DoctorID = NurseID



