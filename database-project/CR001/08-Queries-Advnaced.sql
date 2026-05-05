
-- Advanced Level
-- 1
SELECT 
    al.name,
    COUNT(DISTINCT f.fNumber) AS total_flights,
    COUNT(DISTINCT b.passenger_id) AS total_passengers,
    SUM(b.price) AS total_revenue
FROM Airline al
LEFT JOIN Flight f ON al.airline_id = f.airline_id
LEFT JOIN Booking b ON f.fNumber = b.flight_number
GROUP BY al.name;

-- 2
SELECT TOP 1
    g.gate_code,
    g.terminal,
    a.name AS airport_name,
    COUNT(f.fNumber) AS flight_count
FROM Gate g
JOIN Flight f ON g.gate_id = f.gate_id
JOIN Airport a ON g.airport_id = a.IATA_code
GROUP BY g.gate_code, g.terminal, a.name
ORDER BY flight_count DESC;

-- 3
SELECT 
    f.fNumber,
    al.name,
    COUNT(d.delay_id) AS total_delays,
    SUM(d.duration_minutes) AS total_delay_minutes
FROM Flight f
JOIN Airline al ON f.airline_id = al.airline_id
JOIN FlightDelayLog d ON f.fNumber = d.fNumber
GROUP BY f.fNumber, al.name;

-- 4
SELECT 
    p.full_name,
    bg.type,
    COUNT(bg.baggage_id) AS total_baggage
FROM Passenger p
JOIN Booking b ON p.PID = b.passenger_id
JOIN Baggage bg ON b.BID = bg.booking_id
GROUP BY p.full_name, bg.type;

-- 5
SELECT 
    f.fNumber,
    a1.name AS origin,
    a2.name AS destination,
    SUM(b.price) AS total_revenue
FROM Flight f
JOIN Airline al ON f.airline_id = al.airline_id
JOIN Airport a1 ON f.from_airport = a1.IATA_code
JOIN Airport a2 ON f.to_airport = a2.IATA_code
LEFT JOIN Booking b ON f.fNumber = b.flight_number
WHERE al.country = 'USA'
GROUP BY f.fNumber, a1.name, a2.name;

SELECT * from Airline

-- 6 
SELECT 
    f.fNumber,
    al.name AS airline_name,
    g.gate_code,
    a1.city AS origin_city,
    a2.city AS destination_city,

    COUNT(DISTINCT b.passenger_id) AS total_passengers,
    COUNT(DISTINCT bg.baggage_id) AS total_baggage,

    ISNULL(SUM(d.duration_minutes), 0) AS total_delay_minutes,
    SUM(b.price) AS total_revenue

FROM Flight f
JOIN Airline al ON f.airline_id = al.airline_id
LEFT JOIN Gate g ON f.gate_id = g.gate_id
JOIN Airport a1 ON f.from_airport = a1.IATA_code
JOIN Airport a2 ON f.to_airport = a2.IATA_code

LEFT JOIN Booking b ON f.fNumber = b.flight_number
LEFT JOIN Baggage bg ON b.BID = bg.booking_id
LEFT JOIN FlightDelayLog d ON f.fNumber = d.fNumber

GROUP BY 
    f.fNumber, al.name, g.gate_code, a1.city, a2.city

ORDER BY total_revenue DESC;