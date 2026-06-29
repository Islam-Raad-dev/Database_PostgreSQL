
-- Clinic Database

-- Requirments:

-- 1. Patients:

-- • The database should store information about patients.
-- • Each patient should have a unique identifier, a name, a
-- date of birth, gender, contact information (phone number,
-- email), and address.

-- 2. Doctors:

-- • The database should store information about doctors.
-- • Each doctor should have a unique identifier, a name,
-- specialization, a date of birth, gender, contact
-- information (phone number, email), and address.

-- 3. Appointments:

-- • The database should store information about appointments.
-- • Each appointment should have a unique identifier, a
-- patient, a doctor, appointment date and time, and
-- appointment status.

-- • Appointment Status:

-- 1. Pending: The appointment has been scheduled but has not
-- yet occurred.

-- 2. Confirmed: The appointment has been confirmed by both
-- the patient and the healthcare provider.

-- 3. Completed: The appointment has taken place as scheduled.

-- 4. Canceled: The appointment has been canceled either by
-- the patient or the healthcare provider.

-- 5. Rescheduled: The appointment has been rescheduled for a
-- different date or time.

-- 6. No Show: The patient did not show up for the appointment
-- without canceling or rescheduling.

-- 4. Medical Records:

-- • The database should store medical records for patients.
-- • For each attended appointment there should be a medical
-- record.
-- • Each medical record should have a unique identifier, a
-- patient, a doctor, a description of the visit, diagnosis,
-- prescribed medication, and any additional notes.

-- 5. Prescription:

-- • The database should store information about prescribed
-- medications.
-- • For each medical record there should be at most one
-- prescription.
-- • Each prescription should have a unique identifier, a
-- medical record, medication name, dosage, frequency, start
-- date, end date, and any special instructions.

-- 6. Payments:

-- • The database should store information about payments.
-- • Payment is per appointment.
-- • Each payment should have a unique identifier, a patient, a
-- payment date, payment method, amount paid, and any additional
-- notes.


-----------------------------------------------------------------------


CREATE TYPE appointment_status AS ENUM (
    'Pending', 'Confirmed', 'Completed', 'Canceled', 'Rescheduled', 'No Show'
);

CREATE TYPE gender_type AS ENUM (
    'Male', 'Female'
);


-----------------------------------------------------------------------

CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    specialization_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE patients (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender gender_type NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE doctors (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    specialization_id INT NOT NULL REFERENCES specializations(id),
    birth_date DATE NOT NULL,
    gender gender_type NOT NULL,
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    address TEXT NOT NULL
);

CREATE TABLE appointments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES patients(id),
    doctor_id INT NOT NULL REFERENCES doctors(id),
    app_date TIMESTAMP NOT NULL,
    status appointment_status NOT NULL DEFAULT 'Pending'
);

CREATE TABLE medical_records (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE REFERENCES appointments(id),
    patient_id INT NOT NULL REFERENCES patients(id),
    doctor_id INT NOT NULL REFERENCES doctors(id),
    visit_description TEXT NOT NULL,
    diagnosis TEXT NOT NULL,
    additional_notes TEXT
);

CREATE TABLE prescriptions (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    medical_record_id INT NOT NULL UNIQUE REFERENCES medical_records(id), 
    medication_name VARCHAR(255) NOT NULL,
    dosage VARCHAR(100) NOT NULL,
    frequency VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    special_instructions TEXT
);

CREATE TABLE payments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    appointment_id INT NOT NULL REFERENCES appointments(id),
    patient_id INT NOT NULL REFERENCES patients(id),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    payment_method VARCHAR(50) NOT NULL,
    amount_paid NUMERIC(10, 2) NOT NULL,
    additional_notes TEXT
);