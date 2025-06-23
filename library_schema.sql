
-- Create the Library database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Author Table
CREATE TABLE IF NOT EXISTS Author (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

-- Book Table
CREATE TABLE IF NOT EXISTS Book (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    genre VARCHAR(50),
    published_year YEAR,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Member Table
CREATE TABLE IF NOT EXISTS Member (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    join_date DATE
);

-- Borrowing Table
CREATE TABLE IF NOT EXISTS Borrowing (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    borrow_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Member(member_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Sample Data Insertion
INSERT INTO Author (name) VALUES ('J.K. Rowling'), ('George Orwell');
INSERT INTO Book (title, author_id, genre, published_year)
VALUES 
('Harry Potter and the Philosopher\'s Stone', 1, 'Fantasy', 1997),
('1984', 2, 'Dystopian', 1949);
INSERT INTO Member (name, join_date)
VALUES ('Alice', '2024-01-10'), ('Bob', '2024-03-22');
INSERT INTO Borrowing (member_id, book_id, borrow_date, return_date)
VALUES (1, 1, '2025-06-20', NULL);
