INSERT INTO Username VALUES('Gloria');
INSERT INTO User VALUES ('test', 'password');
INSERT INTO User VALUES ('LozanoG', 'password');
INSERT INTO User VALUES ('PetersonB', 'password');
INSERT INTO User VALUES ('WilkinsC', 'password');
INSERT INTO Payment_Information 
	VALUES ('5555555555555555', 'Gloria Lozano', 999, '2017-12-12', 'VISA');
INSERT INTO Patient
	VALUES ('LozanoG', 'Gloria', '1990-10-20', 'female', '555 Smallville Drive', 
	5555555555, 5555555555, 'mom', 1111111111, 120.0, 62.0, 5000.0, '5555555555555555');
INSERT INTO Patient_Allergies 
	VALUES ('LozanoG', 'Benadryl');
INSERT INTO Admin
	VALUES ('PetersonB');
INSERT INTO Doctor
	VALUES ('WilkinsC', 902000, 'Carl', 'Wilkins', '1989-03-10', 
	4071111111, '123 Alafaya Woods', 'Orthopedics', 101);
INSERT INTO Doctor_Availability
	VALUES ('WilkinsC', '08:00:00', '10:00:00', '2013-09-11');
	
INSERT INTO Visit
	VALUES (1, 'WilkinsC', 'LozanoG', '2013-10-20', 120.0, 
	80.0, 150.0);
INSERT INTO VisitDiagnosis
	VALUES (1, 'Flu');
