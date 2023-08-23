-- Create the animals table
CREATE TABLE animals (
    id serial PRIMARY KEY,               
    name VARCHAR(100),                 
    date_of_birth DATE,                
    escape_attempts INTEGER,            
    neutered BOOLEAN,                  
    weight_kg DECIMAL(5, 2)           
);

-- Add a new column 'species' to the animals table
ALTER TABLE animals
ADD COLUMN species VARCHAR(255);

-- Create the owners table
CREATE TABLE owners (
    id SERIAL PRIMARY KEY,              
    full_name VARCHAR(255),             
    age INTEGER                         
);

-- Create the species table
CREATE TABLE species (
    id SERIAL PRIMARY KEY,             
    name VARCHAR(255)                   
);

-- Modify the animals table to establish relationships
ALTER TABLE animals
    DROP COLUMN species,               
    ADD COLUMN species_id INTEGER,     
    ADD COLUMN owner_id INTEGER;        

-- Add foreign key constraints to link species and owners
ALTER TABLE animals
    ADD CONSTRAINT fk_species          
    FOREIGN KEY (species_id) REFERENCES species(id),  
    ADD CONSTRAINT fk_owner             
    FOREIGN KEY (owner_id) REFERENCES owners(id);    
