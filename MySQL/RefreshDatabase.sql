set foreign_key_checks = 0;
DROP TABLE IF EXISTS SendsMessageToDoctor, SendsMessageToPatient, Performs, Appointments,
	CommunicatesWith, Prescription, VisitDiagnosis, Visit, Surgery_PreOp_Meds, Surgery,
	Doctor_Rating, Doctor_Availability, Patient, Payment_Information, Admin, User, 
	Doctor, Patient_Allergies;
set foreign_key_checks = 1;

CREATE TABLE User (
	username VARCHAR(60),
	password VARCHAR(60),

	PRIMARY KEY (username)
) ENGINE=InnoDB;

CREATE TABLE Payment_Information (
	cardNumber VARCHAR(60),
	cardholderName VARCHAR(60),
	cvv INT,
	dateOfExpiry DATE,
	cardType VARCHAR(60),

	PRIMARY KEY (cardNumber)
) ENGINE=InnoDB;

CREATE TABLE Patient (
	patientUsername VARCHAR(60),
	name VARCHAR(60),
	dob DATE,
	gender VARCHAR(60),
	address VARCHAR(255),
	workPhone INT,
	homePhone INT,
	emergencyName VARCHAR(60),
	emergencyPhone INT,
	weight FLOAT,
	height FLOAT,
	annualIncome FLOAT,
	cardNumber VARCHAR(60),
	
	PRIMARY KEY (patientUsername),
	FOREIGN KEY (patientUsername) REFERENCES User (username) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cardNumber) REFERENCES Payment_Information (cardNumber)
) ENGINE=InnoDB;

CREATE TABLE Patient_Allergies (
	patientUsername VARCHAR(60),
	allergy VARCHAR(60),

	PRIMARY KEY (patientUsername, allergy),
	FOREIGN KEY (patientUsername) REFERENCES Patient (patientUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Doctor (
	doctorUsername VARCHAR(60),
	licenseNo INT,
	firstName VARCHAR(60),
	lastName VARCHAR(60),
	dob DATE,
	workPhone INT,
	homeAddress VARCHAR(255),
	specialty VARCHAR(60),
	roomNumber INT,

	PRIMARY KEY (doctorUsername),
	FOREIGN KEY (doctorUsername) REFERENCES User(username) ON DELETE CASCADE ON UPDATE CASCADE,
	UNIQUE (licenseNo)
) ENGINE=InnoDB;

CREATE TABLE Admin (
	adminUsername VARCHAR(60),

	PRIMARY KEY (adminUsername),
	FOREIGN KEY (adminUsername) REFERENCES User (username) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Doctor_Availability (
	doctorUsername VARCHAR(60),
	startTime TIME,
	endTime TIME,
	day DATE,

	PRIMARY KEY (doctorUsername, startTime, endTime, day),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor (doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Doctor_Rating (
	doctorUsername VARCHAR(60),
	patientUsername VARCHAR(60),
	rating INT,

	PRIMARY KEY (doctorUsername, patientUsername),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor (doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Surgery (
	cptCode INT,
	surgeryType VARCHAR(60),
	surgeryCost FLOAT,

	PRIMARY KEY (cptCode)
) ENGINE=InnoDB;

CREATE TABLE Surgery_PreOp_Meds (
	cptCode INT,
	preOpMedication VARCHAR(60),

	PRIMARY KEY (cptCode, preOpMedication),
	FOREIGN KEY (cptCode) REFERENCES Surgery (cptCode)
) ENGINE=InnoDB;

CREATE TABLE Visit (
	visitID INT,
	doctorUsername VARCHAR(60),
	patientUserName VARCHAR(60),
	dateOfVisit DATE,
	diastolicPressure FLOAT,
	systolicPressure FLOAT,
	billingAmount FLOAT,

	PRIMARY KEY (visitID),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor (doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (patientUsername) REFERENCES Patient (patientUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE VisitDiagnosis (
	visitID INT,
	diagnosis VARCHAR(60),

	PRIMARY KEY (visitID, diagnosis),
	FOREIGN KEY (visitID) REFERENCES Visit (visitID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Prescription (
	visitID INT,
	medicineName VARCHAR(60),
	dosage FLOAT,
	duration FLOAT,
	notes TEXT,
	ordered BOOLEAN,

	PRIMARY KEY (visitID, medicineName),
	FOREIGN KEY(visitID) REFERENCES Visit (visitID) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE CommunicatesWith (
	doctorSender VARCHAR(60),
	doctorReceiver VARCHAR(60),
	dateTime DATETIME,
	content TEXT,
	status VARCHAR(60),

	PRIMARY KEY (doctorSender, doctorReceiver, dateTime),
	FOREIGN KEY (doctorSender) REFERENCES Doctor(doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (doctorReceiver) REFERENCES Doctor(doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Appointments (
	doctorUsername VARCHAR(60),
	patientUsername VARCHAR(60),
	date DATE,
	time TIME,

	PRIMARY KEY (doctorUsername, patientUsername),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor (doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (patientUsername) REFERENCES Patient (patientUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE Performs (
	doctorUsername VARCHAR(60),
	patientUsername VARCHAR(60),
	cptCode INT,
	surgeryStartTime TIME,
	surgeryEndTime TIME,
	anesthesiaStartTime TIME,
	complications TEXT,
	numberOfAssistants INT,

	PRIMARY KEY (doctorUsername, patientUsername, cptCode),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor (doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (patientUsername) REFERENCES Patient (patientUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (cptCode) REFERENCES Surgery (cptCode)
) ENGINE=InnoDB;

CREATE TABLE SendsMessageToDoctor (
	patientUsername VARCHAR(60),
	doctorUsername VARCHAR(60),
	dateTime DATETIME,
	content TEXT,
	status VARCHAR(60),

	PRIMARY KEY (patientUsername, doctorUsername, dateTime),
	FOREIGN KEY (patientUsername) REFERENCES Patient(patientUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (doctorUsername) REFERENCES Doctor(doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE SendsMessageToPatient (
	doctorUsername VARCHAR(60),
	patientUsername VARCHAR(60),
	dateTime DATETIME,
	content TEXT,
	status VARCHAR(60),

	PRIMARY KEY (doctorUsername, patientUsername, dateTime),
	FOREIGN KEY (doctorUsername) REFERENCES Doctor(doctorUsername) ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY (patientUsername) REFERENCES Patient(patientUsername) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;

INSERT INTO User VALUES ('LozanoG', 'password');
INSERT INTO Payment_Information 
	VALUES ('5555555555555555', 'Gloria Lozano', 999, '2017-12-12', 'VISA');
INSERT INTO Patient
	VALUES ('LozanoG', 'Gloria', '1990-10-20', 'female', '555 Smallville Drive', 
	5555555555, 5555555555, 'mom', 1111111111, 120.0, 62.0, 5000.0, '5555555555555555');