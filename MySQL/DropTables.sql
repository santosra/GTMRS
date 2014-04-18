set foreign_key_checks = 0;
DROP TABLE IF EXISTS SendsMessageToDoctor, SendsMessageToPatient, Performs, Appointments,
	CommunicatesWith, Prescription, VisitDiagnosis, Visit, Surgery_PreOp_Meds, Surgery,
	Doctor_Rating, Doctor_Availability, Patient, Payment_Information, Admin, User, 
	Doctor, Patient_Allergies;
set foreign_key_checks = 1;