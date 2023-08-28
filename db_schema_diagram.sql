CREATE DATABASE clinic;

CREATE TABLE treatments (
    id SERIAL PRIMARY KEY,
    type VARCHAR(255),
    NAME VARCHAR(255)
);
-- invoices table
CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    paid_at TIMESTAMP,
    medical_history_id INTEGER
);
-- invoice-items table
CREATE TABLE invoice_items (
    id SERIAL PRIMARY KEY,
    unit_price DECIMAL,
    quantity INTEGER,
    total_price DECIMAL,
    invoice_id INTEGER,
    treatment_id INTEGER
);
-- foreign keys
ALTER TABLE invoice_items
    ADD CONSTRAINT fk_invoices
    FOREIGN KEY (invoice_id) REFERENCES invoices(id);

ALTER TABLE invoice_items
    ADD CONSTRAINT fk_treatments
    FOREIGN KEY (treatment_id) REFERENCES treatments(id);

-- invoice index keys 
CREATE INDEX idx_invoice_items_invoice_id ON invoice_items(invoice_id);
CREATE INDEX idx_invoice_items_treatment_id ON invoice_items(treatment_id);