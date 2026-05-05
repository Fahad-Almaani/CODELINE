# CR-001 Summary

## What Changed and Why
This change adds airline operations details to the airport system. I added new tables (`Airline`, `Gate`, `Baggage`, `FlightDelayLog`) and connected them to existing data so we can track airline ownership, gate assignment, baggage, and delays.

## Existing Tables Modified
Only the `Flight` table was modified:
- Added `airline_id`
- Added `gate_id`
- Added foreign keys to `Airline(airline_id)` and `Gate(gate_id)`

## Challenges With Existing Data
`Flight` already had records, so adding a required FK column directly could fail. I first added `airline_id` with a temporary default, then changed it to nullable and applied the FK safely.

## Referential Actions Justification
- `Flight -> Airline` and `Flight -> Gate`: `ON DELETE SET NULL`
Reason: keep historical flight records even if airline or gate rows are removed.

- `Baggage -> Booking` and `FlightDelayLog -> Flight`: `ON DELETE CASCADE`
Reason: these rows are dependent child records and should be removed automatically when the parent is deleted.

## Most Complex Query (Task 5)
Task 5 query joins `Flight`, `Airline`, `Airport` (origin and destination), and `Booking`, then filters US airlines and calculates total revenue per flight.

How it works:
- Uses two joins to `Airport` to show both origin and destination names
- Uses `LEFT JOIN Booking` so flights with no bookings still appear
- Uses `SUM(b.price)` and `GROUP BY` to return revenue per flight route
