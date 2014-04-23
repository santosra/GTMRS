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
New patient registration
Upon clicking create account
Check username is not in database*/





#Creating new user
INSERT INTO (depending on what drop down is selected)
(username, password)
VALUES ($username, $password);

/*Create Profile
New Patient 
upon filling out fields and clicking submit*/
INSERT INTO Patient
(name, homePhone, income, dob, gender, address, workPhone, emergencyName, emergencyPhone, weight, height, patientUsername)
VALUES ($name, $homePhone, $income, $dob, $gender, $address, $workPhone, $contactName, $contactPhone, $weight, $height, );

#New Doctor
INSERT INTO Doctor
(licenseNO, firstName, lastName, dob, workPhone, specialty, roomNO, homeAddress, gender, doctor_Availability)
VALUES ($licenseNO, $firstName, $lastName, $dob, $workPhone, $specialty, $roomNO, $homeAddress, $gender, $doctor_Availability);

#New Admin
INSERT INTO Administrator
(username, password)
VALUES 
($username, $password);


/*Update Patient
repopulate with previous information*/
SELECT name, homePhone, income, dob, gender, address, workPhone, contactName, contactPhone, weight, height FROM Patient;
#assume $username is managed by application also username is the primary key
UPDATE Patient
SET name=$name, homePhone=$homePhone, income=$income, dob=$dob, gender=$gender, address=$address , workPhone=$workPhone, contactName=$contactName, contactPhone, weight=$weight, height=$height;
WHERE username=$username;

/*Update Doctor
repopulate with previous information*/
SELECT licenseNO, firstName, lastName, dob, workPhone, specialty, roomNO, homeAddress FROM Doctor;
#assume $username is managed by application also username is the primary key
UPDATE Doctor
SET licenseNO =$ licenseNO, firstName=$firstName, lastName=$lastName, dob=$dob, workPhone=$workPhone, specialty=$specialty , roomNO=$roomNO, homeAddress=$homeAddress
WHERE username=$username;



#Updating availability
SELECT date, sTime, eTime
FROM Availability
UPDATE Availibility
SET date=$date, sTime=$sTime, eTime=$eTime
WHERE username=$username

/*Appointments
View doctor info and availability to schedule an appointment 
They choose the specialty from a dropdown menu
They choose which time works best for them and click request appointment*/
SELECT firstName, lastName, Doctor.workPhone, roomNO, to, from, day, rating)
FROM Doctor, Doctor_Availability, Rates
WHERE specialty=$specialty

/*Update availability whenever user makes a new appointment
Update doctor’s appointments whenever user makes a new appointment*/
SELECT date, sTime, eTime
FROM Availability
DELETE date,sTime, eTime
WHERE 













/*Show Appointments to doctor if day selected show all appointments for that day or no day selected show month in general
when a day is selected
Availibility
Assume username is primary key and is managed by application
Creating availibility*/
(INSERT INTO Doctor_Availability
(doctorUsername, startTime, endTime, day)
VALUES ($doctorUsername, $startTime, $endTime, $day)

SELECT *
FROM Availability 
WHERE Availability.username = Doctor.username AND Availability.date=$date;

#Patient visit history
SELECT *
FROM Visits, Prescription
WHERE Visits.patient=Patient.name AND Prescription.patient=Patient.name;


#Surgery Record
SELECT *
FROM Surgery
Where Surgery.patient = Patient.name;


#Message from patient to doctor
SELECT *
FROM SendMessageToDoctor
WHERE doctor = doctor.name;

#Message from doctor to patient
SELECT *
FROM SendsMessageToPatient


//Updating
UPDATE Patient
FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser= Patient
#New doctor registration
UPDATE Doctor
FROM User
WHERE Username= $Username AND Password= ConfirmPassword AND TypeOfUser= Doctor
#New admin registration
UPDATE Admin
FROM User
WHERE Username= $Username AND Password=ConfirmPassword AND TypeOfUser=Admin



//Visit History
SELECT Doctor.firstName, dateOfVisit, diastolicPressure, systolicPressure, medicineName, dosage, duration, notes, diagnosis FROM Visit, VisitDiagnosis, Prescription, Doctor 
	WHERE Doctor.doctorUsername='WilkinsC'
