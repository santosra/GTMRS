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



#View Appointments 

SELECT *
	FROM Availability 
	WHERE Availability.username = Doctor.username AND Availability.date=$date;

SELECT COUNT*
	FROM Availability 
	WHERE MONTH($date) = $month AND YEAR($date)= $year
	GROUP BY date


#order Medication

INSERT INTO Prescription(visitID, medicineName, dosage, duration, notes, ordered) 
VALUES ($visitID, $medicineName, $dosage, $duration, $notes, $ordered)


#Payment info
INSERT INTO  Payment_Information (  cardNumber ,  cardholderName ,  cvv ,  dateOfExpiry ,  cardType ) 
VALUES (cardholderName,$cardNumber, $cvv, $dateOfExpiry, $cardType)



#View visit history
SELECT Doctor.firstName, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Doctor
	WHERE Visits.doctorUsername=Doctor.doctorUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.patientUsername= $patientUsername;
	

#View patient history	
SELECT Patiet.name, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Patient
	WHERE Visits.doctorUsername=Patient.patientUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.doctorUsername= $doctorUsername;


#Rating
UPDATE Doctor_Rating
	SET rating = $rating
	WHERE doctorUsername=$doctorUsername and patientUsername=$patientUsername;

INSERT INTO Doctor_Rating(doctorUsername, patientUsername, rating)
	VALUES ($doctorUsername, $patientUsername, $rating)


#record visit
INSERT INTO Visit(visitID, doctorUsername, patientUserName, dateOfVisit, diastolicPressure, systolicPressure, billingAmount)
VALUES ($visitID, $doctorUsername, $patientUserName, $dateOfVisit, $diastolicPressure, $systolicPressure, $billingAmount)


#Surgery Record

INSERT INTO Surgery
	VALUES ($cptCode, $surgeryType, $surgeryCost)


SELECT Patient FROM User
	WHERE Patient.name= $name
	
SELECT Patient.name, 



#View Message from patient to doctor

SELECT *
	FROM SendMessageToDoctor
	WHERE doctorUsername = $doctorUsername;

#View Message from doctor to patient
SELECT *
	FROM SendsMessageToPatient
	WHERE patientUsername= $patientUsername




	
	



	
#Everything below here hasnt been tested I just made rough copy without using database names

#scheduling appointment

SELECT $doctorUsername
FROM Appointments 
WHERE  date=$date , time=$time


#send message

INSERT INTO SendsMessageToDoctor(patientUsername, doctorUsername, dateTime, content, status) 
VALUES ($patientUsername, $doctorUsername, $dateTime, $content, $status)

INSERT INTO SendsMessageToPatient(doctorUsername, patientUsername, dateTime, content, status) 
VALUES ($doctorUsername, $patientUsername, $dateTime, $content, $status)

