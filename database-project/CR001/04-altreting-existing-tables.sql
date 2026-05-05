-- adding new column airline_id to Flight table to establish relationship with Airline
ALTER TABLE Flight
ADD airline_id INT NOT NULL DEFAULT 1; -- Assuming 1 is a valid airline_id for existing records 

ALTER TABLE Flight ALTER COLUMN airline_id INT NULL;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Airline
FOREIGN KEY (airline_id) REFERENCES Airline(airline_id)
ON DELETE SET NULL;


-- adding column gate_id into flght table to establish relationship with Gate
ALTER TABLE Flight
ADD gate_id INT NULL;

ALTER TABLE Flight
ADD CONSTRAINT FK_Flight_Gate
FOREIGN KEY (gate_id) REFERENCES Gate(gate_id)
ON DELETE SET NULL;






SELECT * FROM Flight

SELECT * FROM Booking
sELECT * FROM Baggage