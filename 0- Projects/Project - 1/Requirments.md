# Clinic Database Requirements

## 1. Patients
Stores information about patients.
* **Unique identifier**
* **Name**
* **Date of birth**
* **Gender**
* **Contact information** (phone number, email)
* **Address**

## 2. Doctors
Stores information about doctors.
* **Unique identifier**
* **Name**
* **Specialization**
* **Date of birth**
* **Gender**
* **Contact information** (phone number, email)
* **Address**

## 3. Appointments
Stores information about appointments.
* **Unique identifier**
* **Patient**
* **Doctor**
* **Appointment date and time**
* **Appointment status**

### Appointment Status:
1. **Pending:** The appointment has been scheduled but has not yet occurred.
2. **Confirmed:** The appointment has been confirmed by both the patient and the healthcare provider.
3. **Completed:** The appointment has taken place as scheduled.
4. **Canceled:** The appointment has been canceled either by the patient or the healthcare provider.
5. **Rescheduled:** The appointment has been rescheduled for a different date or time.
6. **No Show:** The patient did not show up for the appointment without canceling or rescheduling.

## 4. Medical Records
Stores medical records for patients. For each attended appointment there should be a medical record.
* **Unique identifier**
* **Patient**
* **Doctor**
* **Description of the visit**
* **Diagnosis**
* **Prescribed medication**
* **Additional notes**

## 5. Prescription
Stores information about prescribed medications. For each medical record there should be at most one prescription.
* **Unique identifier**
* **Medical record**
* **Medication name**
* **Dosage**
* **Frequency**
* **Start date**
* **End date**
* **Special instructions**

## 6. Payments
Stores information about payments. Payment is per appointment.
* **Unique identifier**
* **Patient**
* **Payment date**
* **Payment method**
* **Amount paid**
* **Additional notes**