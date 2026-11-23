
CREATE DATABASE IF NOT EXISTS library_management;

USE library_management;

-- USERS TABLE
CREATE TABLE IF NOT EXISTS Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(100) NOT NULL,
    dob DATE,
    email VARCHAR(150) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(30) NOT NULL,
    is_active BOOLEAN DEFAULT TRUE
);

-- BOOKS TABLE
CREATE TABLE IF NOT EXISTS Books (
    isbn VARCHAR(20) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(150) NOT NULL,
    genre VARCHAR(100),
    total_copies INT NOT NULL DEFAULT 1,
    available_copies INT NOT NULL DEFAULT 1,
    CHECK (total_copies >= 0),
    CHECK (available_copies >= 0),
    CHECK (available_copies <= total_copies)
);

-- LOANS TABLE
CREATE TABLE IF NOT EXISTS Loans (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    isbn VARCHAR(20) NOT NULL,
    user_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    due_date DATE NOT NULL,
    return_date DATE,
    status VARCHAR(30) NOT NULL DEFAULT 'Borrowed',

    FOREIGN KEY (isbn) REFERENCES Books(isbn),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
