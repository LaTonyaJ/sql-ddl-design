DROP DATABASE medical_center_db;

CREATE DATABASE medical_center_db;

\c medical_center_db;

CREATE TABLE doctors
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    specialty TEXT
);

CREATE TABLE diseases
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL UNIQUE,
    descript TEXT
);

CREATE TABLE patients
(
    id SERIAL PRIMARY KEY,
    first_name TEXT NOT NULL,
    birthday DATE NOT NULL,
    insurance TEXT
);

CREATE TABLE visits
(
    id SERIAL PRIMARY KEY,
    doctor_id INTEGER REFERENCES doctors,
    patient_id INTEGER REFERENCES patients,
    visit_date DATE
);

CREATE TABLE diagnosis
(
    id SERIAL PRIMARY KEY,
    disease_id INTEGER REFERENCES diseases,
    visit_id INTEGER REFERENCES visits,
    notes TEXT
);



INSERT INTO doctors(first_name, specialty) VALUES('Bob', 'Cardiologist');
INSERT INTO doctors(first_name, specialty) VALUES('Dr. Johnson', 'Pediatrition'), ('Ronald', 'Therapist');

INSERT INTO diseases(title) VALUES('Cancer');
INSERT INTO diseases(title) VALUES('Lepard');
INSERT INTO diseases(title) VALUES('IBS');

INSERT INTO patients(first_name, birthday) VALUES('Kendra', '1992-09-23');
INSERT INTO patients(first_name, birthday) VALUES('Ken', '1965-04-22');

INSERT INTO visits(doctor_id, patient_id) VALUES (1,1), (1,2), (3,1), (2,2);

INSERT INTO diagnosis(disease_id, visit_id) VALUES (3,1), (1,1);
