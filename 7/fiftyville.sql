-- The first clue is that the crime happened on the 28th and on Humphrey
select * from crime_scene_reports WHERE description like '%Humphrey%' and day = 28;

-- The answer to the above query being "Humphrey Street | Theft of the CS50 duck took place at 10:15am at the Humphrey Street bakery. Interviews were conducted today with three witnesses who were present at the time – each of their interview transcripts mentions the bakery."

-- What are the interview transcripts that mention the bakery?

SELECT * FROM interviews WHERE day = 28 and transcript like "%bakery%";

-- From the above clue we get the following three clues

-- 1. The thief left in a car and drove away in a war within about 10 minutes of the theft
-- 2. The theif withdrew cash from an ATM on Leggett street
-- 3. The theif talked on the phone for less than and asked someone on the other end to buy the theif the first flight out of Fiftyville on the 29th.

-- So, what ar the liscence plates and who do they belong to?

-- Let us look into the flight.

WITH fiftyville_airport AS (
  SELECT id
  FROM airports
  WHERE city = 'Fiftyville'
),
relevant_flight AS (
  SELECT id
  FROM flights
  WHERE origin_airport_id in fiftyville_airport
  AND day = 29
  ORDER BY hour, minute
  LIMIT 1
),
relevant_passenger as (
  select *
  from passengers
  where flight_id in relevant_flight
)
SELECT * FROM relevant_passenger;



WITH probably_guilty_plates AS (
  SELECT license_plate
  FROM bakery_security_logs
  WHERE day = 28 AND hour = 10 AND minute BETWEEN 15 AND 25
),
probably_guilty_people AS (
  SELECT phone_number
  FROM people
  WHERE license_plate IN (SELECT license_plate FROM probably_guilty_plates)
),
probably_guilty_phone AS (
  SELECT *
  FROM phone_calls
  WHERE duration <= 60 AND
        (receiver IN (SELECT phone_number FROM probably_guilty_people) OR
        caller IN (SELECT phone_number FROM probably_guilty_people))
),
fiftyville_airport AS (
  SELECT id
  FROM airports
  WHERE city = 'Fiftyville'
),
relevant_flight AS (
  SELECT id
  FROM flights
  WHERE origin_airport_id IN (SELECT id FROM fiftyville_airport)
  AND day = 29
  ORDER BY hour, minute
  LIMIT 1
),
relevant_passenger AS (
  SELECT *
  FROM passengers
  WHERE flight_id IN (SELECT id FROM relevant_flight)
)
SELECT *
FROM people
WHERE phone_number IN (SELECT caller FROM probably_guilty_phone) AND
      passport_number IN (SELECT passport_number FROM relevant_passenger);

-- Bruce?
select * FROM people where id in (select person_id from bank_accounts where account_number in (select account_number FROM atm_transactions where atm_location like '%Leggett%' and day = 28 and transaction_type = 'withdraw'));
