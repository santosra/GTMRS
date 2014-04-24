/*Logging on to GTMRS 
If Null value returned, show login screen again
If not Null direct to appropriate page*/

SELECT EXISTS
(SELECT Username, Password FROM User
WHERE Username= $Username AND Password=$Password)

SELECT* FROM Patient
WHERE patientUsername= $patientUsername

SELECT* FROM Doctor
WHERE doctorUsername= $doctorUsername


/*New user registration


UPDATE Patient FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser= Patient

UPDATE Doctor FROM User
WHERE Username= $Username AND Password= ConfirmPassword AND TypeOfUser= Doctor

UPDATE Admin FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser=Admin


#Creating new user
INSERT INTO User
	VALUES ($username, $password);

/*Create Profile
New Patient 
upon filling out fields and clicking submit*/
INSERT INTO Patient
	VALUES ($patientUsername, $name, $dob, $gender, $address, $workPhone, $homePhone, 
	$emergencyName, $emergencyPhone, $weight, $height, $annualIncome, $cardNumber);


INSERT INTO Patient_Allergies 
	VALUES ($patientUsername, $allergies);


#New Doctor
INSERT INTO Doctor
	VALUES ($doctorUsername, $licenseNO, $firstName, $lastName, $dob, $workPhone, $homeAddress, $specialty, $roomNO);

INSERT INTO Doctor_Availability
	VALUES ($doctorUsername, $startTime, $endTime, $date);


#New Admin
INSERT INTO Administrator
	VALUES ($username, $password);


/*Update Patient
repopulate with previous information*/
*attribute=> any value that corresponds to that user

SELECT * FROM Patient;
	UPDATE Patient
	SET attribute=$attribute;
	WHERE patientUsername=$patientUsername;

/*Update Doctor
repopulate with previous information*/

SELECT* FROM Doctor;
	UPDATE Doctor
	SET attribute=$attribute 
	WHERE doctorUsername=$doctorUsername;



#Updating availability
SELECT * FROM Availability
	UPDATE Availibility
	SET attribute=$attribute
	WHERE doctorUsername=$doctorUsername



/*View Appointments 

SELECT *
	FROM Availability 
	WHERE Availability.username = Doctor.username AND Availability.date=$date;

SELECT COUNT*
	FROM Availability 
	WHERE MONTH($date) = $month AND YEAR($date)= $year
	GROUP BY date

/*View visit history
SELECT Doctor.firstName, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Doctor
	WHERE Visits.doctorUsername=Doctor.doctorUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.patientUsername= $patientUsername;
	

/*View patient history	
SELECT Patiet.name, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Patient
	WHERE Visits.doctorUsername=Patient.patientUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.doctorUsername= $doctorUsername;


#Surgery Record

INSERT INTO Surgery
	VALUES ($cptCode, $surgeryType, $surgeryCost)


SELECT Patient FROM User
	WHERE Patient.name= $name
	
SELECT Patient.name, 




/* View Message from patient to doctor

SELECT *
	FROM SendMessageToDoctor
	WHERE doctorUsername = $doctorUsername;

/* View Message from doctor to patient
SELECT *
	FROM SendsMessageToPatient
	WHERE patientUsername= $patientUsername




	
	
	
//Everything below here hasn't been tested I just made rough copy without using database names

#scheduling appointment

FROM APPOINTMENTS
SELECT * 
WHICH NOT TAKEN

// when someone selects an appointment and accepted by doctor mark it now as taken

#order medication 
INSERT INTO Orders (medicincename, dosage, duration, doctor,date)
VALUES($medicinename,$dosage,$duration,$doctor,$date)



#payment
INSERT INTO Payment Info
	VALUES ($cardholderName,$cardNumber, $CVV, $dateOfExpiry, $cardType,)


#updating rating

UPDATE Rating FROM Doctor
WHERE doctor.name=rating.doctor AND rating = $rating

#record visit

INSERT INTO Visits (date,patientname,systolic,diastolic,diagnosis,drug,dosage,duration,notes)
VALUES($date,$patientname, $systolic, $diastolic, $diagnosis, $drug, $dosage, $duration, $notes)


#send message

INSERT INTO Inbox (of reciever) (from, message,timestamp)
VALUES ($from, $message, $timestamp)



#view message

FROM Inbox
SELECT *
