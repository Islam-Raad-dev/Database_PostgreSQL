
-- Simple Clinic Database



-- 1. إنشاء أنواع بيانات مخصصة (ENUMs) للحالات والجنس بدلاً من الجداول المعقدة
CREATE TYPE appointment_status AS ENUM (
    'Pending', 'Confirmed', 'Completed', 'Canceled', 'Rescheduled', 'No Show'
);

CREATE TYPE gender_type AS ENUM (
    'Male', 'Female'
);


-----------------------------------------------------------------------

-- 2. جدول التخصصات (تم تعديله ليكون صفوفاً وليس أعمدة)
CREATE TABLE specializations (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    specialization_name VARCHAR(100) NOT NULL UNIQUE
);

-- 3. جدول المرضى
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

-- 4. جدول الأطباء
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

-- 5. جدول المواعيد
CREATE TABLE appointments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    patient_id INT NOT NULL REFERENCES patients(id),
    doctor_id INT NOT NULL REFERENCES doctors(id),
    app_date TIMESTAMP NOT NULL,
    status appointment_status NOT NULL DEFAULT 'Pending'
);

-- 6. جدول السجلات الطبية (تمت إضافة ارتباط بالموعد)
CREATE TABLE medical_records (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    appointment_id INT NOT NULL UNIQUE REFERENCES appointments(id),
    patient_id INT NOT NULL REFERENCES patients(id),
    doctor_id INT NOT NULL REFERENCES doctors(id),
    visit_description TEXT NOT NULL,
    diagnosis TEXT NOT NULL,
    additional_notes TEXT
);

-- 7. جدول الوصفات الطبية (وصفة واحدة كحد أقصى لكل سجل طبي)
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

-- 8. جدول المدفوعات (الدفع لكل موعد)
CREATE TABLE payments (
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    appointment_id INT NOT NULL REFERENCES appointments(id),
    patient_id INT NOT NULL REFERENCES patients(id),
    payment_date DATE NOT NULL DEFAULT CURRENT_DATE,
    payment_method VARCHAR(50) NOT NULL,
    amount_paid NUMERIC(10, 2) NOT NULL,
    additional_notes TEXT
);