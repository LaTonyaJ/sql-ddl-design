DROP DATABASE medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db

CREATE TABLE doctors
(
    id SERIAL,
    first_name TEXT NOT NULL PRIMARY KEY,
    office_number TEXT,
    speacialty TEXT
);

CREATE TABLE diseases
(
    id SERIAL,
    name TEXT NOT NULL UNIQUE,
    symptoms TEXT,
    treatment TEXT
);

CREATE TABLE patients
(
    id SERIAL,
    first_name TEXT NOT NULL,
    date_seen TIMESTAMP,
    doctor TEXT NOT NULL REFERENCES doctors(first_name),
    diagnosis TEXT REFERENCES diseases(name)
);

INSERT INTO doctors(first_name, speacialty) VALUES('Bob', 'Cardiologist');
INSERT INTO doctors(first_name, speacialty) VALUES('Dr. Johnson', 'Pediatrition');

INSERT INTO diseases(name) VALUES('Cancer');
INSERT INTO diseases(name) VALUES('Lepard');
INSERT INTO diseases(name) VALUES('IBS');

INSERT INTO patients(first_name, doctor) VALUES('Kendra', 'Bob');
INSERT INTO patients(first_name, doctor, diagnosis) VALUES('Ken', 'Bob', 'IBS');


