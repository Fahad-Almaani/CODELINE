
--  insert data intp Airline table
INSERT INTO Airline (iata_code, name, country, contanct_email) VALUES 
('AA', 'American Airlines', 'USA', 'aa@gmail.com'),
('OM', 'Oman Airlines', 'USA', 'om@gmail.com'),
('UA', 'UAE Airlines', 'USA', 'ua@gmail.com');



-- insert data into Gate table
SELECT * FROM Gate
SELECT * FROM Airport
INSERT INTO Gate (gate_code,terminal,airport_id) VALUES
('G105','T1','DXB'),
('G104','T2','JFK'),
('G103','T10','LHR'),
('G102','T1','MCT'),
('G101','T2','NRT'),
('G102','T3','MCT'),
('G103','T4','MCT'),
('G104','T5','MCT'),
('G105','T6','MCT');
SELECT * FROM Gate

-- update existing Flight records to set airline_id and gate_id
-- updates flight number 101 to 106 to have airline_id 1 and gate_id 1
UPDATE Flight 
SET gate_id=11
where fNumber IN (101, 102) 


UPDATE Flight 
SET gate_id=9
where fNumber IN (103, 104) 


UPDATE Flight 
SET gate_id=4
where fNumber IN (105, 106) 



select * from Flight
SELECT * FROM Airline


-- adding 10 recored for baggage table
INSERT INTO Baggage (weight_kg, type, booking_id, tag_number) VALUES
(23.5, 'Checked', 1, 'TAG001'),
(30.0, 'Checked', 3, 'TAG003'),
(10.0, 'Cabin', 4, 'TAG004'),
(25.0, 'Checked', 5, 'TAG005'),
(20.0, 'Cabin', 6, 'TAG006'),
(28.0, 'Checked', 7, 'TAG007'),
(12.0, 'Cabin', 8, 'TAG008'),
(18.0, 'Cabin', 10, 'TAG010');


-- insert data into FlightDelayLog table 4 logs
INSERT INTO FlightDelayLog (fNumber, duration_minutes, reason) VALUES
(101, 60, 'Technical issue'),
(107, 45, 'Weather conditions'),
(103, 30, 'Air traffic control'),
(104, 90, 'Crew availability');