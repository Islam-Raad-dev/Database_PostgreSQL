-- Simple library Databse

-- Requirments:

-- 1. Book Management:

--  Store and manage information about books, including title,
-- author(s), ISBN, publication date, genre, and additional
-- details.

--  Track availability status of book copies, indicating
-- whether they are available for borrowing or checked out by
-- users.

--  Manage multiple copies of a book, each with a unique
-- identifier (copy ID).

-- 2. User Management:

--  Maintain records of library users, including their
-- names, contact information, and library card numbers.

-- 3. Borrowing and Returns:

--  Enable users to borrow book copies from the library.
--  Track borrowing records, including the book copy
-- borrowed, user information, borrowing date, and due
-- date.

--  Handle the return process, updating the availability
-- status of book copies.

--  Check for any fines or penalties associated with late
-- returns or damaged book copies.

-- 4. Holds and Reservations:

--  Allow users to place holds or reservations on book
-- copies that are currently checked out.

--  Manage the order of reservations to ensure fairness.

-- 5. Fine Management:

--  Calculate and manage fines or penalties for late
-- returns book copies.

--  Keep track of the fine amount owed by each user.

--  Maintain the payment status to track whether fines
-- have been paid or are still pending.


-----------------------------------------------------------------------

CREATE TABLE authors (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL
);

CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(50) UNIQUE NOT NULL,
    publication_date DATE,
    genre VARCHAR(100),
    additional_details TEXT
);

CREATE TABLE book_authors (
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    author_id INT REFERENCES authors(id) ON DELETE CASCADE,
    PRIMARY KEY (book_id, author_id)
);

CREATE TABLE library_users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL,
    contact_info VARCHAR(255) NOT NULL,
    library_card_number VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE book_copies (
    id SERIAL PRIMARY KEY,
    book_id INT REFERENCES books(id) ON DELETE CASCADE,
    availability_status VARCHAR(20) DEFAULT 'AVAILABLE' CHECK (availability_status IN ('AVAILABLE', 'CHECKED_OUT', 'LOST'))
);

CREATE TABLE borrowing_records (
    id SERIAL PRIMARY KEY,
    copy_id INT REFERENCES book_copies(id) ON DELETE RESTRICT,
    user_id INT REFERENCES library_users(id) ON DELETE RESTRICT,
    borrowing_date DATE DEFAULT CURRENT_DATE,
    due_date DATE NOT NULL,
    return_date DATE,
    is_returned_damaged BOOLEAN DEFAULT FALSE
);

CREATE TABLE reservations (
    id SERIAL PRIMARY KEY,
    copy_id INT REFERENCES book_copies(id) ON DELETE CASCADE,
    user_id INT REFERENCES library_users(id) ON DELETE CASCADE,
    reservation_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'PENDING' CHECK (status IN ('PENDING', 'NOTIFIED', 'FULFILLED', 'CANCELLED'))
);

CREATE TABLE fines (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES library_users(id) ON DELETE CASCADE,
    borrowing_record_id INT REFERENCES borrowing_records(id) ON DELETE RESTRICT,
    fine_amount DECIMAL(10, 2) NOT NULL,
    is_paid BOOLEAN DEFAULT FALSE,
    fine_reason VARCHAR(50) CHECK (fine_reason IN ('LATE_RETURN', 'DAMAGED_COPY'))
);
