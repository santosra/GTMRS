/* 1. Logging on to GTMRS 
If Null value returned, show login screen again
If not Null direct to appropriate page*/
SELECT EXISTS
(SELECT Username, Password FROM User
WHERE Username= $Username AND Password=$Password)

SELECT* FROM Patient
WHERE patientUsername= $patientUsername

SELECT* FROM Doctor
WHERE doctorUsername= $doctorUsername



# 2. New user registration
UPDATE Patient FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser= Patient

UPDATE Doctor FROM User
WHERE Username= $Username AND Password= ConfirmPassword AND TypeOfUser= Doctor

UPDATE Admin FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser=Admin

#Creating new user
INSERT INTO User (username, password)
	VALUES ($username, $password);



/* 3. Create Profile
New Patient 
upon filling out fields and clicking submit*/
UPDATE Patient
SET name = $name, dob = $dob, gender = $gender, address = $address, workPhone = $wPhone, homePhone = $hPhone, emergencyName = $eName, emergencyPhone = $ePhone, weight = $weight, height = $height, annualIncome = $income
WHERE patientUsername= $Username ;

INSERT INTO Patient_Allergies (patientUsername, allergy)
	VALUES ($patientUsername, $allergy);

#New Doctor
UPDATE Doctor
SET licenseNo = $license, firstName = $fName, lastName = $lName, dob = $dob, workPhone = $wPhone, homeAddress = $address, specialty = $specialty, roomNumber = $room
WHERE doctorUsername= $Username;

INSERT INTO Doctor_Availability (doctorUsername, startTime, endTime, day)
	VALUES ($doctorUsername, $startTime, $endTime, $day);

#New Admin
INSERT INTO Administrator (username, password)
	VALUES ($username, $password);

/*Update Patient
repopulate with previous information
attribute=> any value that corresponds to that user*/

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



# 4. schedule appointment
SELECT $doctorUsername
FROM Appointments 
WHERE  date=$date , time=$time



# 5. order Medication
INSERT INTO Prescription(visitID, medicineName, dosage, duration, notes, ordered) 
VALUES ($visitID, $medicineName, $dosage, $duration, $notes, $ordered)



# 6. Payment information
INSERT INTO  Payment_Information (  cardNumber ,  cardholderName ,  cvv ,  dateOfExpiry ,  cardType ) 
VALUES (cardholderName,$cardNumber, $cvv, $dateOfExpiry, $cardType)



# 7. View visit history
SELECT Doctor.firstName, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Doctor
	WHERE Visits.doctorUsername=Doctor.doctorUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.patientUsername= $patientUsername;



# 8. Rate a doctor
UPDATE Doctor_Rating
	SET rating = $rating
	WHERE doctorUsername=$doctorUsername and patientUsername=$patientUsername;

INSERT INTO Doctor_Rating(doctorUsername, patientUsername, rating)
	VALUES ($doctorUsername, $patientUsername, $rating)



# 9. View Appointments 
SELECT *
	FROM Availability 
	WHERE Availability.username = Doctor.username AND Availability.date=$date;

SELECT COUNT*
	FROM Availability 
	WHERE MONTH($date) = $month AND YEAR($date)= $year
	GROUP BY date

	

# 10. Patient Visit History	
SELECT Patiet.name, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes,diagnosis
	FROM Visits, Prescription, VisitDiagnosis, Patient
	WHERE Visits.doctorUsername=Patient.patientUsername AND Visit.visitID= VisitDiagnosis.visitID AND Visit.visitID= Prescription.visitID
	AND Visit.doctorUsername= $doctorUsername;



#record visit
INSERT INTO Visit(visitID, doctorUsername, patientUserName, dateOfVisit, diastolicPressure, systolicPressure, billingAmount)
VALUES ($visitID, $doctorUsername, $patientUserName, $dateOfVisit, $diastolicPressure, $systolicPressure, $billingAmount)


#Surgery Record

INSERT INTO Surgery (cptCode, surgeryType, surgeryCost)
	VALUES ($cptCode, $surgeryType, $surgeryCost)


SELECT Patient FROM User
	WHERE Patient.name= $name
	
SELECT Patient.name, 

#Sends Message to doctor from patient
INSERT INTO SendsMessageToDoctor (patientUsername, doctorUsername, content)
VALUES ($patientUsername, $doctorUsername, $content)

#Sends Message to doctor from doctor
INSERT INTO CommunicatesWith (doctorSender, doctorReceiver, content)
VALUES ($doctorSender, $doctorReceiver, $content)

#Sends Message to patient from doctor
INSERT INTO SendsMessageToPatient (patientUsername, doctorUsername, content)
VALUES ($patientUsername, $doctorUsername, $content)

#View Message from patient to doctor

SELECT *
	FROM SendsMessageToDoctor
	WHERE doctorUsername = $doctorUsername;

#View Message from doctor to patient
SELECT *
	FROM SendsMessageToPatient
	WHERE patientUsername= $patientUsername




	
	



	
#Everything below here hasnt been tested I just made rough copy without using database names




#send message

INSERT INTO SendsMessageToDoctor(patientUsername, doctorUsername, dateTime, content, status) 
VALUES ($patientUsername, $doctorUsername, $dateTime, $content, $status)

INSERT INTO SendsMessageToPatient(doctorUsername, patientUsername, dateTime, content, status) 
VALUES ($doctorUsername, $patientUsername, $dateTime, $content, $status)

