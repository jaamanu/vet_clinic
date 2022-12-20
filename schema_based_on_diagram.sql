-- Create Patients Table
CREATE TABLE patients (
	id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  date_of_birth DATE
);

-- Create Medical Histories Table

CREATE TABLE medical_histories (
	id SERIAL PRIMARY KEY,
  admitted_at TIMESTAMP,
  patient_id INT REFERENCES patients(id),
  status VARCHAR(50)
);

-- Create Treatment Table

CREATE TABLE treatments (
	id SERIAL PRIMARY KEY,
  type VARCHAR (50),
  name VARCHAR (100)
);

-- Create Medical Treatment Table

CREATE TABLE medical_treatment (
	medical_histories_id INT REFERENCES medical_histories(id),
  treaments_id INT REFERENCES treatments (id)
);

-- Create Invoices Table

CREATE TABLE invoices (
	id SERIAL PRIMARY KEY,
  total_amount DECIMAL,
  generated_at TIMESTAMP,
  payed_at TIMESTAMP,
  medical_history_id INT REFERENCES medical_histories(id) UNIQUE
);

-- Create Invoice Items Table

CREATE TABLE invoice_items (
	id SERIAL PRIMARY KEY,
  unit_price DECIMAL,
  quantity INT,
  total_price DECIMAL,
  invoice_id INT REFERENCES invoices(id),
	treatment_id INT REFERENCES treatments(id)
);

-- Create index for all foreign key

CREATE INDEX ON invoices (medical_history_id);
CREATE INDEX ON medical_histories (patient_id);
CREATE INDEX ON medical_treatment (medical_histories_id);
CREATE INDEX ON medical_treatment (treaments_id);
CREATE INDEX ON invoice_items (invoice_id);
CREATE INDEX ON invoice_items (treatment_id);
