-- Create Database
CREATE DATABASE event_management;
USE event_management;

-- Create Tables
CREATE TABLE events (
event_id INT PRIMARY KEY AUTO_INCREMENT,
event_name VARCHAR(100),
event_date DATE,
location VARCHAR(100)
);

CREATE TABLE participants (
participant_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
email VARCHAR(100)
);

CREATE TABLE registrations (
reg_id INT PRIMARY KEY AUTO_INCREMENT,
event_id INT,
participant_id INT,
registration_date DATE,
FOREIGN KEY (event_id) REFERENCES events(event_id),
FOREIGN KEY (participant_id) REFERENCES participants(participant_id)
);

-- Insert Data
INSERT INTO events (event_name, event_date, location) VALUES
('Tech Conference', '2025-06-10', 'Chennai'),
('AI Workshop', '2025-06-15', 'Bangalore');

INSERT INTO participants (name, email) VALUES
('Jaasim', '[jaasim@gmail.com](mailto:jaasim@gmail.com)'),
('Arun', '[arun@gmail.com](mailto:arun@gmail.com)'),
('Priya', '[priya@gmail.com](mailto:priya@gmail.com)');

INSERT INTO registrations (event_id, participant_id, registration_date) VALUES
(1, 1, '2025-05-20'),
(1, 2, '2025-05-21'),
(2, 3, '2025-05-22');

-- View all events
SELECT * FROM events;

-- View participants
SELECT * FROM participants;

-- Join Query (Important)
SELECT p.name, e.event_name, e.event_date
FROM registrations r
JOIN participants p ON r.participant_id = p.participant_id
JOIN events e ON r.event_id = e.event_id;

-- Count participants per event
SELECT e.event_name, COUNT(r.participant_id) AS total_participants
FROM events e
LEFT JOIN registrations r ON e.event_id = r.event_id
GROUP BY e.event_name;

-- Update example
UPDATE events
SET location = 'Hyderabad'
WHERE event_name = 'AI Workshop';

-- Delete example
DELETE FROM participants
WHERE name = 'Arun';
