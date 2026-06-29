# Car Rental Database Requirements

## 1. Customer Management
Stores personal and legal information for renters.
* **Name**
* **Contact Information**
* **Driver's License Number**

## 2. Vehicles Information
Maintains up-to-date data and specifications for the fleet.
* **Core Details:** Make, model, year, mileage, rental rates, plate number.
* **Vehicle Category:** (e.g., 4x4, Sedan).
* **Fuel Types:**
  * Gasoline (Petrol)
  * Diesel
  * Electric
  * Hybrid

## 3. Vehicle Booking
Logs reservation specifics and initial state at the time of rental.
* **Customer Reference**
* **Dates:** Rental start date, rental end date.
* **Locations:** Pickup location, drop-off location.
* **Initial Metrics:** Initial rental days, initial total due amount.
* **Condition:** Initial vehicle check notes.

## 4. Rental Transaction
Records the initial financial exchange.
* **Payment Details**
* **Initial Paid Amount**

## 5. Vehicle Return
Captures post-rental metrics, physical state, and executes financial reconciliation.
* **Time & Condition:** Actual return date, actual rental days, final vehicle check notes.
* **Mileage:** Records current mileage and calculates total consumed mileage during the rental period.
* **Financial Reconciliation:** Identifies additional charges, calculates the actual final amount due, determines the remaining amount, and triggers refund processing if overpaid. The original transaction is updated to record all differences between the reservation and the actual outcome.