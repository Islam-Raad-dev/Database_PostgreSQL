# Online Store Database Requirements

## 1. Product Catalog Management
Stores information about the products available for sale.
* **Attributes:** Product name, description, price, quantity in stock, images, and other relevant details.

## 2. Customer Information
Stores information about registered customers.
* **Attributes:** Customer name, contact details, shipping address, login credentials.

## 3. Order Information
Stores information about customer orders.
* **Attributes:** Order number, customer details, order date and time, purchased products, quantities, prices, and shipping method.
* **Order Status:** Pending, Processing, Shipped, Delivered, Cancelled, Refunded.

## 4. Payment Transaction
Stores information about payment transactions.
* **Attributes:** Transaction ID, customer details, payment amount, payment method, timestamp.

## 5. Shipping
Stores information about shipping and logistics.
* **Attributes:** Order ID, shipping carrier details, tracking number, estimated delivery date, actual delivery date, and related notes.
* **Shipping Status:**
  1. Processing
  2. Out for Delivery
  3. Delivered
  4. Return to Sender
  5. On Hold
  6. Delayed
  7. Lost

## 6. Reviews and Ratings
Stores customer reviews and ratings for products.
* **Attributes:** Product ID, customer ID, review text, rating score (1 to 5), timestamps.