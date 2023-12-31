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

-- Create the vets table
CREATE TABLE vets (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    age INTEGER,
    date_of_graduation DATE
);

-- Create the specializations join table
CREATE TABLE specializations (
    vet_id INTEGER REFERENCES vets(id),
    species_id INTEGER REFERENCES species(id),
    PRIMARY KEY (vet_id, species_id)
);

-- Create the visits join table
CREATE TABLE visits (
    id SERIAL PRIMARY KEY,
    animal_id INTEGER REFERENCES animals(id),
    vet_id INTEGER REFERENCES vets(id),
    date_of_visit DATE
);

-- alter table owners with new column email
ALTER TABLE owners ADD COLUMN email VARCHAR(120);
EXPLAIN ANALYZE SELECT * FROM owners where email = 'owner_18327@mail.com';
EXPLAIN ANALYZE SELECT * FROM visits where vet_id = 2;
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits where animal_id = 4;
CREATE INDEX visits_animal_id ON visits(animal_id);
CREATE INDEX visits_vet_id ON visits(vet_id);
CREATE INDEX owners_email ON owners(email);