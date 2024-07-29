-- Create all tables

-- Create Contacts table
CREATE TABLE contacts (
	contact_id INT NOT NULL,
	first_name VARCHAR(16) NOT NULL,
	last_name VARCHAR(16) NOT NULL,
	email VARCHAR(50) NOT NULL,
	CONSTRAINT pk_contacts PRIMARY KEY (
		contact_id
	)
);

-- Create Category table
CREATE TABLE category (
	category_id VARCHAR(4) NOT NULL,
	category VARCHAR(16) NOT NULL,
	CONSTRAINT pk_category PRIMARY KEY (
		category_id
	)
);

-- Create Subcategory table
CREATE TABLE subcategory (
	subcategory_id VARCHAR(8) NOT NULL,
	subcategory VARCHAR(20) NOT NULL,
	CONSTRAINT pk_subcategory PRIMARY KEY (
		subcategory_id
	)
);

-- Create Campaign table
CREATE TABLE campaign (
	cf_id INT NOT NULL,
	contact_id INT NOT NULL,
	company_name VARCHAR(50) NOT NULL,
	description TEXT NOT NULL,
	goal numeric(10,2) NOT NULL,
	pledged numeric(10,2) NOT NULL,
	outcome VARCHAR(50) NOT NULL,
	backers_count INT NOT NULL,
	country VARCHAR(2) NOT NULL,
	currency VARCHAR(3) NOT NULL,
	launched_date DATE NOT NULL,
	end_date DATE NOT NULL,
	category_id VARCHAR(4) NOT NULL,
	subcategory_id VARCHAR(8) NOT NULL,
	CONSTRAINT pk_campaign PRIMARY KEY (
		cf_id
	)
);

-- Add constraints after creating tables (best practice)
ALTER TABLE campaign ADD CONSTRAINT fk_campaign_contact_id FOREIGN KEY(contact_id)
REFERENCES contacts(contact_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_category_id FOREIGN KEY(category_id)
REFERENCES category(category_id);

ALTER TABLE campaign ADD CONSTRAINT fk_campaign_subcategory_id FOREIGN KEY(subcategory_id)
REFERENCES subcategory(subcategory_id);

-- Check the contents of each table using SELECT*
SELECT * FROM campaign
SELECT * FROM category
SELECT * FROM contacts
SELECT * FROM subcategory