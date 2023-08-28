CREATE DATABASE clinic;

CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INTEGER
);

CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER,
    treatment_id INTEGER
);