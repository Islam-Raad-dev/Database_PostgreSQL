-- Car Rental Database

-- Requirments:

-- 1. Customer Management:

--  Customer Management: The system should save customers
-- personal information: Name, contact information, and a
-- driver's license number.

-- 2. Vehicles Information:

--  The system should maintain an up-to-date information of
-- available vehicles, including information such as make,
-- model, year, mileage, and rental rates, fuel type (Gaz,
-- Electric,.etc.) , plate number, Vehicle Category (4x4,
-- Sedan, ..etc.)

--  Vehicle Fuel Types:

-- o Gasoline (Petrol).
-- o Diesel
-- o Electric
-- o Hybrid


-- 3. Vehicle Booking:

--  When a customer rents a vehicle System should keep booking
-- information: customer who rented this vehicle, rental
-- start date, rental end date, pickup location, drop of
-- location, Initial rental days, initial total due amount,
-- initial vehicle check notes.


-- 4. Rental Transaction:

--  Customer should pay for the rent and a transaction should
-- be logged in the system to keep the following information:
-- Payment Details, initial paid amount.


-- 5. Vehicle Return:

--  When customer returns a vehicle, the system should
-- calculate and keep the Actual Return Date, calculate
-- actual rental days, record the final vehicle check notes,
-- specify if there are additional charges.

--  Original Transaction should be updated and record all
-- differences in reservation and calculate the actual final
-- amount due, and calculate the remaining amount, if they
-- customer need refund, we pay it back.

--  Save the current Milage, and calculate the consumed
-- Mileage by customer during the rent period.

-----------------------------------------------------------------------

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255) NOT NULL,
    driver_license_number VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE vehicle_categories (
    id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE vehicles (
    id SERIAL PRIMARY KEY,
    make VARCHAR(100) NOT NULL,
    model VARCHAR(100) NOT NULL,
    manufacture_year INT NOT NULL,
    current_mileage INT NOT NULL,
    daily_rental_rate DECIMAL(10, 2) NOT NULL,
    fuel_type VARCHAR(50) CHECK (fuel_type IN ('Gasoline', 'Diesel', 'Electric', 'Hybrid')),
    plate_number VARCHAR(50) UNIQUE NOT NULL,
    category_id INT REFERENCES vehicle_categories(id) ON DELETE RESTRICT
);

CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id) ON DELETE RESTRICT,
    vehicle_id INT REFERENCES vehicles(id) ON DELETE RESTRICT,
    rental_start_date DATE NOT NULL,
    rental_end_date DATE NOT NULL,
    pickup_location VARCHAR(255) NOT NULL,
    dropoff_location VARCHAR(255) NOT NULL,
    initial_rental_days INT NOT NULL,
    initial_total_due DECIMAL(10, 2) NOT NULL,
    initial_check_notes TEXT,
    start_mileage INT NOT NULL,
    actual_return_date DATE,
    actual_rental_days INT,
    final_check_notes TEXT,
    additional_charges DECIMAL(10, 2) DEFAULT 0.00,
    end_mileage INT,
    consumed_mileage INT
);

CREATE TABLE rental_transactions (
    id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(id) ON DELETE RESTRICT,
    payment_details VARCHAR(255) NOT NULL,
    initial_paid_amount DECIMAL(10, 2) NOT NULL,
    actual_final_amount_due DECIMAL(10, 2),
    remaining_balance DECIMAL(10, 2)
);