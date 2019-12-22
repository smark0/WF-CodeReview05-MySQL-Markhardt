
-- returns all values from table User:

SELECT * FROM `User`;

--return selected 'user' from table User:

SELECT usr_id, usr_first_name, usr_last_name
FROM `User`;

--returns user with the user first name 'George'

SELECT usr_id, usr_first_name,
FROM `User`
WHERE usr_first_name = 'George';

-- returns the last name 'Clooney':

SELECT usr_id, usr_first_name, usr_last_name
FROM `User`
WHERE usr_last_name = 'Clooney';

-- returns all cars with are available right now:

SELECT car_id, car_mod, car_type, available
FROM `Car_park`
WHERE available = 1;

--changes specific users address
UPDATE `User`
SET usr_address = 'Walt Disney Street 1' 
WHERE usr_id = 5;


-- returns all from the table:

SELECT * FROM `Inquiry`;


--returns  payment dates for User:

SELECT usr_id, usr_first_name, usr_last_name, first_payment, 
FROM `Account`
INNER JOIN `payment` ON fk_payment_id = payment_id
INNER JOIN `invoice` ON fk_invoice_id = invoice_id
INNER JOIN `User` ON fk_usr_id = usr_id
;

-- returns all invoices and payments for all users:
SELECT usr_id, usr_first_name, usr_last_name, first_payment, invoice_id, invoice_amount
FROM `Account`
INNER JOIN `payment` ON fk_payment_id = payment_id
INNER JOIN `invoice` ON fk_invoice_id = invoice_id
INNER JOIN `User` ON fk_usr_id = usr_id
;

--returns cars at the pick up and dropoff location:

SELECT car_id, car_mod, address_sl, address_el 
FROM `locations`
INNER JOIN `Car_park` ON fk_car_id = car_id
INNER JOIN `start_loc` ON fk_start_loc_id = start_loc_id
INNER JOIN `end_loc` ON fk_end_loc_id = end_loc_id;

-- counts all cars which are available

SELECT COUNT(*) FROM `Car_park`
WHERE available = 1;





