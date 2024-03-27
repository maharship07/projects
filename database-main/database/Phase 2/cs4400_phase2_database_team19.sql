-- CS4400: Introduction to Database Systems (Fall 2021)
-- Phase II: Create Table & Insert Statements [v0] Thursday, October 14, 2021 @ 2:00pm EDT
-- Last Edit on Wednesday, November 3, 2021 @ 1:00pm EDT

-- Team 19
-- Kurt Hu (khu72)
-- Won Yang (wyang342)
-- Vedant Amin (vamin9)
-- Maharshi Patel (mpatel602)

-- Directions:
-- Please follow all instructions for Phase II as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.
-- Create Table statements must be manually written, not taken from an SQL Dump file.
-- This file must run without error for credit.

-- ------------------------------------------------------
-- CREATE TABLE STATEMENTS AND INSERT STATEMENTS BELOW
-- ------------------------------------------------------
DROP DATABASE IF EXISTS cs4400_phase2;
CREATE DATABASE IF NOT EXISTS cs4400_phase2;
USE cs4400_phase2;

DROP TABLE IF EXISTS administrator;
CREATE TABLE administrator (
  email char(50) NOT NULL,
  fname char(20) NOT NULL,
  lname char(20) NOT NULL,
  pw char(20) NOT NULL,
  PRIMARY KEY (email)
);
INSERT INTO administrator VALUES ('mmoss1@travelagency.com', 'Mark', 'Moss', 'password1');
INSERT INTO administrator VALUES ('asmith@travelagency.com', 'Aviva', 'Smith', 'password2');

DROP TABLE IF EXISTS client;
CREATE TABLE client (
  email char(50) NOT NULL,
  fname char(20) NOT NULL,
  lname char(20) NOT NULL,
  pw char(10) NOT NULL,
  phone_number char(15) NOT NULL,
  PRIMARY KEY (email),
  UNIQUE (phone_number)
);
INSERT INTO client VALUES ('mscott22@gmail.com', 'Michael', 'Scott', 'password3', '555-123-4567');
INSERT INTO client VALUES ('arthurread@gmail.com', 'Arthur', 'Read', 'password4', '555-234-5678');
INSERT INTO client VALUES ('jwayne@gmail.com', 'John', 'Wayne', 'password5', '555-345-6789');
INSERT INTO client VALUES ('gburdell3@gmail.com', 'George', 'Burdell', 'password6', '555-456-7890');
INSERT INTO client VALUES ('mj23@gmail.com', 'Michael', 'Jordan', 'password7', '555-567-8901');
INSERT INTO client VALUES ('lebron6@gmail.com', 'Lebron', 'James', 'password8', '555-678-9012');
INSERT INTO client VALUES ('msmith5@gmail.com', 'Michael', 'Smith', 'password9', '555-789-0123');
INSERT INTO client VALUES ('ellie2@gmail.com', 'Ellie', 'Johnson', 'password10', '555-890-1234');
INSERT INTO client VALUES ('scooper3@gmail.com', 'Sheldon', 'Cooper', 'password11', '678-123-4567');
INSERT INTO client VALUES ('mgeller5@gmail.com', 'Monica', 'Geller', 'password12', '678-234-5678');
INSERT INTO client VALUES ('cbing10@gmail.com', 'Chandler', 'Bing', 'password13', '678-345-6789');
INSERT INTO client VALUES ('hwmit@gmail.com', 'Howard', 'Wolowitz', 'password14', '678-456-7890');
INSERT INTO client VALUES ('swilson@gmail.com', 'Samantha', 'Wilson', 'password16', '770-123-4567');
INSERT INTO client VALUES ('aray@tiktok.com', 'Addison', 'Ray', 'password17', '770-234-5678');
INSERT INTO client VALUES ('cdemilio@tiktok.com', 'Charlie', 'Demilio', 'password18', '770-345-6789');
INSERT INTO client VALUES ('bshelton@gmail.com', 'Blake', 'Shelton', 'password19', '770-456-7890');
INSERT INTO client VALUES ('lbryan@gmail.com', 'Luke', 'Bryan', 'password20', '770-567-8901');
INSERT INTO client VALUES ('tswift@gmail.com', 'Taylor', 'Swift', 'password21','770-678-9012');
INSERT INTO client VALUES ('jseinfeld@gmail.com', 'Jerry', 'Seinfeld', 'password22', '770-789-0123');
INSERT INTO client VALUES ('maddiesmith@gmail.com', 'Madison', 'Smith', 'password23', '770-890-1234');
INSERT INTO client VALUES ('johnthomas@gmail.com', 'John', 'Thomas', 'password24', '404-770-5555');
INSERT INTO client VALUES ('boblee15@gmail.com', 'Bob', 'Lee', 'password25', '404-678-5555');

DROP TABLE IF EXISTS owner_acct;
CREATE TABLE owner_acct (
  email char(50) NOT NULL,
  PRIMARY KEY (email),
  CONSTRAINT fk_owner_client_email FOREIGN KEY (email) REFERENCES client (email)
);
INSERT INTO owner_acct VALUES ('mscott22@gmail.com');
INSERT INTO owner_acct VALUES ('arthurread@gmail.com');
INSERT INTO owner_acct VALUES ('jwayne@gmail.com');
INSERT INTO owner_acct VALUES ('gburdell3@gmail.com');
INSERT INTO owner_acct VALUES ('mj23@gmail.com');
INSERT INTO owner_acct VALUES ('lebron6@gmail.com');
INSERT INTO owner_acct VALUES ('msmith5@gmail.com');
INSERT INTO owner_acct VALUES ('ellie2@gmail.com');
INSERT INTO owner_acct VALUES ('scooper3@gmail.com');
INSERT INTO owner_acct VALUES ('mgeller5@gmail.com');
INSERT INTO owner_acct VALUES ('cbing10@gmail.com');
INSERT INTO owner_acct VALUES ('hwmit@gmail.com');

DROP TABLE IF EXISTS customer;
CREATE TABLE customer (
  email char(50) NOT NULL, 
  card_number char(16) NOT NULL,
  card_cvv char(3) NOT NULL,
  card_expiry_date date NOT NULL, 
  current_location char(30) DEFAULT NULL,
  PRIMARY KEY (email),
  UNIQUE (card_number),
  CONSTRAINT fk_customer_client_email FOREIGN KEY (email) REFERENCES client (email)
);
INSERT INTO customer VALUES ('scooper3@gmail.com', '6518555974461663', '551', '2024-02-01', NULL);
INSERT INTO customer VALUES ('mgeller5@gmail.com', '2328567043101965', '644', '2024-03-01', NULL);
INSERT INTO customer VALUES ('cbing10@gmail.com', '8387952398279291', '201', '2023-02-01', NULL);
INSERT INTO customer VALUES ('hwmit@gmail.com', '6558859698525299', '102', '2023-04-01', NULL);
INSERT INTO customer VALUES ('swilson@gmail.com', '9383321241981836', '455', '2022-08-01', NULL);
INSERT INTO customer VALUES ('aray@tiktok.com', '3110266979495605', '744', '2022-08-01', NULL);
INSERT INTO customer VALUES ('cdemilio@tiktok.com', '2272355540784744', '606', '2025-02-01', NULL);
INSERT INTO customer VALUES ('bshelton@gmail.com', '9276763978834273', '862', '2023-09-01', NULL);
INSERT INTO customer VALUES ('lbryan@gmail.com', '4652372688643798', '258', '2023-05-01', NULL);
INSERT INTO customer VALUES ('tswift@gmail.com', '5478842044367471', '857', '2024-12-01', NULL);
INSERT INTO customer VALUES ('jseinfeld@gmail.com', '3616897712963372', '295', '2022-06-01', NULL);
INSERT INTO customer VALUES ('maddiesmith@gmail.com', '9954569863556952', '794', '2022-07-01', NULL);
INSERT INTO customer VALUES ('johnthomas@gmail.com', '7580327437245356', '269', '2025-10-01', NULL);
INSERT INTO customer VALUES ('boblee15@gmail.com', '7907351371614248', '858', '2025-11-01', NULL);

DROP TABLE IF EXISTS owner_rating;
CREATE TABLE owner_rating (
  owner_email char(50) NOT NULL, 
  customer_email char(50) NOT NULL,
  score decimal(5) NOT NULL,
  PRIMARY KEY (owner_email, customer_email),
  CONSTRAINT fk_owner_email FOREIGN KEY (owner_email) REFERENCES owner_acct (email),
  CONSTRAINT fk_customer_email FOREIGN KEY (customer_email) REFERENCES customer (email)
);
INSERT INTO owner_rating VALUES ('gburdell3@gmail.com', 'swilson@gmail.com', 5);
INSERT INTO owner_rating VALUES ('cbing10@gmail.com', 'aray@tiktok.com', 5);
INSERT INTO owner_rating VALUES ('mgeller5@gmail.com', 'bshelton@gmail.com', 4);
INSERT INTO owner_rating VALUES ('arthurread@gmail.com', 'lbryan@gmail.com', 4);
INSERT INTO owner_rating VALUES ('arthurread@gmail.com', 'tswift@gmail.com', 3);
INSERT INTO owner_rating VALUES ('lebron6@gmail.com', 'jseinfeld@gmail.com', 2);
INSERT INTO owner_rating VALUES ('hwmit@gmail.com', 'maddiesmith@gmail.com', 5);

DROP TABLE IF EXISTS customer_rating;
CREATE TABLE customer_rating (
  owner_email char(50) NOT NULL, 
  customer_email char(50) NOT NULL,
  score decimal(5) NOT NULL,
  PRIMARY KEY (owner_email, customer_email),
  CONSTRAINT fk_cr_owner_email FOREIGN KEY (owner_email) REFERENCES owner_acct (email),
  CONSTRAINT fk_cr_customer_email FOREIGN KEY (customer_email) REFERENCES customer (email)

);
INSERT INTO customer_rating VALUES ('gburdell3@gmail.com', 'swilson@gmail.com', 5);
INSERT INTO customer_rating VALUES ('cbing10@gmail.com', 'aray@tiktok.com', 5);
INSERT INTO customer_rating VALUES ('mgeller5@gmail.com', 'bshelton@gmail.com', 3);
INSERT INTO customer_rating VALUES ('arthurread@gmail.com', 'lbryan@gmail.com', 4);
INSERT INTO customer_rating VALUES ('arthurread@gmail.com', 'tswift@gmail.com', 4);
INSERT INTO customer_rating VALUES ('lebron6@gmail.com', 'jseinfeld@gmail.com', 1);
INSERT INTO customer_rating VALUES ('hwmit@gmail.com', 'maddiesmith@gmail.com', 2);

DROP TABLE IF EXISTS property;
CREATE TABLE property (
  p_name char(50) NOT NULL,
  owner_email char(50) NOT NULL,
  p_description char(200) DEFAULT NULL,
  capacity decimal(5),
  nightly_cost_per_person decimal(5),
  street char(50) NOT NULL,
  city char(30) NOT NULL,
  state_abbr char(2) NOT NULL,
  zip decimal(5) NOT NULL,
  PRIMARY KEY (p_name, owner_email),
  UNIQUE KEY unique_property_address (street, city, state_abbr, zip),
  CONSTRAINT fk_owner_acct_email FOREIGN KEY (owner_email) REFERENCES owner_acct (email)
);
INSERT INTO property VALUES ('Atlanta Great Property', 'scooper3@gmail.com', 'This is right in the middle of Atlanta near many attractions!', 4, 600, '2nd St', 'ATL', 'GA', 30008);
INSERT INTO property VALUES ('House near Georgia Tech', 'gburdell3@gmail.com', 'Super close to bobby dodde stadium!', 3, 275, 'North Ave', 'ATL', 'GA', 30008);
INSERT INTO property VALUES ('New York City Property', 'cbing10@gmail.com', 'A view of the whole city. Great property!', 2, 750, '123 Main St', 'NYC', 'NY', 10008);
INSERT INTO property VALUES ('Statue of Libery Property', 'mgeller5@gmail.com', 'You can see the statue of liberty from the porch', 5, 1000, '1st St', 'NYC', 'NY', 10009);
INSERT INTO property VALUES ('Los Angeles Property', 'arthurread@gmail.com', NULL, 3, 700, '10th St', 'LA', 'CA', 90008);
INSERT INTO property VALUES ('LA Kings House', 'arthurread@gmail.com', 'This house is super close to the LA kinds stadium!', 4, 750, 'Kings St', 'LA', 'CA', 90011);
INSERT INTO property VALUES ('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'Huge house that can sleep 12 people. Totally worth it!', 12, 900, 'Golden Bridge Pkwt', 'San Jose', 'CA', 90001);
INSERT INTO property VALUES ('LA Lakers Property', 'lebron6@gmail.com', 'This house is right near the LA lakers stadium. You might even meet Lebron James!', 4, 850, 'Lebron Ave', 'LA', 'CA', 90011);
INSERT INTO property VALUES ('Chicago Blackhawks House', 'hwmit@gmail.com', 'This is a great property!', 3, 775, 'Blackhawks St', 'Chicago', 'IL', 60176);
INSERT INTO property VALUES ('Chicago Romantic Getaway', 'mj23@gmail.com', 'This is a great property!', 2, 1050, '23rd Main St', 'Chicago', 'IL', 60176);
INSERT INTO property VALUES ('Beautiful Beach Property', 'msmith5@gmail.com', 'You can walk out of the house and be on the beach!', 2, 975, '456 Beach Ave', 'Miami', 'FL', 33101);
INSERT INTO property VALUES ('Family Beach House', 'ellie2@gmail.com', 'You can literally walk onto the beach and see it from the patio!', 6, 850, '1132 Beach Ave', 'Miami', 'FL', 33101);
INSERT INTO property VALUES ('Texas Roadhouse', 'mscott22@gmail.com', 'This property is right in the center of Dallas, Texas!', 3, 450, '17th Street', 'Dallas', 'TX', 75043);
INSERT INTO property VALUES ('Texas Longhorns House', 'mscott22@gmail.com', 'You can walk to the longhorns stadium from here!', 10, 600, '1125 Longhorns Way', 'Dallas', 'TX', 75001);

DROP TABLE IF EXISTS property_amenities;
CREATE TABLE property_amenities (
  owner_email char(50) NOT NULL,
  p_name char(50) NOT NULL,
  amenity char(50) NOT NULL,
  PRIMARY KEY (owner_email, p_name, amenity),
  CONSTRAINT fk_property_owner_email FOREIGN KEY (owner_email) REFERENCES property (owner_email),
  CONSTRAINT fk_property_p_name FOREIGN KEY (p_name) REFERENCES property (p_name)
);
INSERT INTO property_amenities VALUES ('scooper3@gmail.com', 'Atlanta Great Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('scooper3@gmail.com', 'Atlanta Great Property', 'Pets allowed');
INSERT INTO property_amenities VALUES ('scooper3@gmail.com', 'Atlanta Great Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('scooper3@gmail.com', 'Atlanta Great Property', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('gburdell3@gmail.com', 'House near Georgia Tech', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('gburdell3@gmail.com', 'House near Georgia Tech', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('gburdell3@gmail.com', 'House near Georgia Tech', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('cbing10@gmail.com', 'New York City Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('cbing10@gmail.com', 'New York City Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('mgeller5@gmail.com', 'Statue of Libery Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('mgeller5@gmail.com', 'Statue of Libery Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Los Angeles Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Los Angeles Property', 'Pets allowed');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Los Angeles Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'LA Kings House', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'LA Kings House', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'LA Kings House', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'LA Kings House', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Beautiful San Jose Mansion', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Beautiful San Jose Mansion', 'Pets allowed');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Beautiful San Jose Mansion', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Beautiful San Jose Mansion', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('arthurread@gmail.com', 'Beautiful San Jose Mansion', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('lebron6@gmail.com', 'LA Lakers Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('lebron6@gmail.com', 'LA Lakers Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('lebron6@gmail.com', 'LA Lakers Property', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('lebron6@gmail.com', 'LA Lakers Property', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('hwmit@gmail.com', 'Chicago Blackhawks House', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('hwmit@gmail.com', 'Chicago Blackhawks House', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('hwmit@gmail.com', 'Chicago Blackhawks House', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('hwmit@gmail.com', 'Chicago Blackhawks House', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('mj23@gmail.com', 'Chicago Romantic Getaway', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('mj23@gmail.com', 'Chicago Romantic Getaway', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('msmith5@gmail.com', 'Beautiful Beach Property', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('msmith5@gmail.com', 'Beautiful Beach Property', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('msmith5@gmail.com', 'Beautiful Beach Property', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('ellie2@gmail.com', 'Family Beach House', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('ellie2@gmail.com', 'Family Beach House', 'Pets allowed');
INSERT INTO property_amenities VALUES ('ellie2@gmail.com', 'Family Beach House', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('ellie2@gmail.com', 'Family Beach House', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('ellie2@gmail.com', 'Family Beach House', 'Full Kitchen');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Roadhouse', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Roadhouse', 'Pets allowed');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Roadhouse', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Roadhouse', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Longhorns House', 'A/C & Heating');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Longhorns House', 'Pets allowed');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Longhorns House', 'Wifi & TV');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Longhorns House', 'Washer and Dryer');
INSERT INTO property_amenities VALUES ('mscott22@gmail.com', 'Texas Longhorns House', 'Full Kitchen');

DROP TABLE IF EXISTS property_review;
CREATE TABLE property_review (
  p_name char(50) NOT NULL,
  property_owner_email char(50) NOT NULL,
  customer_email char(50) NOT NULL,
  content char(200) NOT NULL,
  score decimal(5) NOT NULL,
  PRIMARY KEY (p_name, property_owner_email, customer_email),
  CONSTRAINT fk_prv_property_name FOREIGN KEY (p_name) REFERENCES property (p_name),
  CONSTRAINT fk_prv_property_owner_email FOREIGN KEY (property_owner_email) REFERENCES property (owner_email),
  CONSTRAINT fk_prv_customer_email FOREIGN KEY (customer_email) REFERENCES customer (email)
);
INSERT INTO property_review VALUES ('House near Georgia Tech', 'gburdell3@gmail.com', 'swilson@gmail.com', "This was so much fun. I went and saw the coke factory, the falcons play, GT play, and the Georgia aquarium. Great time! Would highly recommend!", 5);
INSERT INTO property_review VALUES ('New York City Property', 'cbing10@gmail.com', 'aray@tiktok.com', "This was the best 5 days ever! I saw so much of NYC!", 5);
INSERT INTO property_review VALUES ('Statue of Libery Property', 'mgeller5@gmail.com', 'bshelton@gmail.com',"This was truly an excellent experience. I really could see the Statue of Liberty from the property!", 4);
INSERT INTO property_review VALUES ('Los Angeles Property', 'arthurread@gmail.com', 'lbryan@gmail.com', "I had an excellent time!", 4);
INSERT INTO property_review VALUES ('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'tswift@gmail.com', 'We had a great time, but the house wasn\'t fully cleaned when we arrived', 3);
INSERT INTO property_review VALUES ('LA Lakers Property', 'lebron6@gmail.com', 'jseinfeld@gmail.com', "I was disappointed that I did not meet lebron james", 2);
INSERT INTO property_review VALUES ('Chicago Blackhawks House', 'hwmit@gmail.com', 'maddiesmith@gmail.com', "This was awesome! I met one player on the chicago blackhawks!", 5);

DROP TABLE IF EXISTS property_reserve;
CREATE TABLE property_reserve (
  p_name char(50) NOT NULL,
  property_owner_email char(50) NOT NULL,
  customer_email char(50) NOT NULL,
  st_date date NOT NULL,
  end_date date NOT NULL,
  num_guests decimal (5) NOT NULL,
  PRIMARY KEY (p_name, customer_email, property_owner_email),
  CONSTRAINT fk_prs_property_name FOREIGN KEY (p_name) REFERENCES property (p_name),
  CONSTRAINT fk_prs_property_owner_email FOREIGN KEY (property_owner_email) REFERENCES property (owner_email),
  CONSTRAINT fk_prs_customer_email FOREIGN KEY (customer_email) REFERENCES customer (email)
);
INSERT INTO property_reserve VALUES ('House near Georgia Tech', 'gburdell3@gmail.com', 'swilson@gmail.com', '2021-10-19', '2021-10-25', 3);
INSERT INTO property_reserve VALUES ('New York City Property', 'cbing10@gmail.com', 'aray@tiktok.com', '2021-10-18', '2021-10-23', 2);
INSERT INTO property_reserve VALUES ('New York City Property', 'cbing10@gmail.com', 'cdemilio@tiktok.com', '2021-10-24', '2021-10-30', 2);
INSERT INTO property_reserve VALUES ('Statue of Libery Property', 'mgeller5@gmail.com', 'bshelton@gmail.com', '2021-10-18', '2021-10-22', 4);
INSERT INTO property_reserve VALUES ('Los Angeles Property', 'arthurread@gmail.com', 'lbryan@gmail.com', '2021-10-19', '2021-10-25', 2);
INSERT INTO property_reserve VALUES ('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'tswift@gmail.com', '2021-10-19', '2021-10-22', 10);
INSERT INTO property_reserve VALUES ('LA Lakers Property', 'lebron6@gmail.com', 'jseinfeld@gmail.com', '2021-10-19', '2021-10-24', 4);
INSERT INTO property_reserve VALUES ('Chicago Blackhawks House', 'hwmit@gmail.com', 'maddiesmith@gmail.com', '2021-10-19', '2021-10-23', 2);
INSERT INTO property_reserve VALUES ('Chicago Romantic Getaway', 'mj23@gmail.com', 'aray@tiktok.com', '2021-11-1', '2021-11-7', 2);
INSERT INTO property_reserve VALUES ('Beautiful Beach Property', 'msmith5@gmail.com', 'cbing10@gmail.com', '2021-10-18', '2021-10-25', 2);
INSERT INTO property_reserve VALUES ('Family Beach House', 'ellie2@gmail.com', 'hwmit@gmail.com', '2021-10-18', '2021-10-28', 5);

DROP TABLE IF EXISTS airline;
CREATE TABLE airline (
  airline_name char(100) NOT NULL,
  rating decimal(5) NOT NULL,
  PRIMARY KEY (airline_name)
);
INSERT INTO airline VALUES ('Delta Airlines', 4.7);
INSERT INTO airline VALUES ('Southwest Airlines', 4.4);
INSERT INTO airline VALUES ('American Airlines', 4.6);
INSERT INTO airline VALUES ('United Airlines', 4.2);
INSERT INTO airline VALUES ('JetBlue Airways', 3.6);
INSERT INTO airline VALUES ('Spirit Airlines', 3.3);
INSERT INTO airline VALUES ('WestJet', 3.9);
INSERT INTO airline VALUES ('Interjet', 3.7);

DROP TABLE IF EXISTS airport;
CREATE TABLE airport (
  id char(5) NOT NULL,
  airport_name char(100) NOT NULL,
  street char(100) NOT NULL,
  city char(100) NOT NULL,
  state_abbr char(5) NOT NULL,
  zip decimal(5) NOT NULL,
  time_zone char(3) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE (airport_name),
  UNIQUE KEY unique_airport_address (street, city, state_abbr, zip)
);
INSERT INTO airport VALUES ('ATL', 'Atlanta Hartsfield Jackson Airport', '6000 N Terminal Pkwy', 'Atlanta', 'GA', 30320, 'EST');
INSERT INTO airport VALUES ('JFK', 'John F Kennedy International Airport', '455 Airport Ave', 'Queens', 'NY', 11430, 'EST');
INSERT INTO airport VALUES ('LGA', 'Laguardia Airport', '790 Airport St', 'Queens', 'NY', 11371, 'EST');
INSERT INTO airport VALUES ('LAX', 'Lost Angeles International Airport', '1 World Way', 'Los Angeles', 'CA', 90045, 'PST');
INSERT INTO airport VALUES ('SJC', 'Norman Y. Mineta San Jose International Airport', '1702 Airport Blvd', 'San Jose', 'CA', 95110, 'PST');
INSERT INTO airport VALUES ('ORD', 'O\'Hare International Airport', '10000 W O\'Hare Ave', 'Chicago', 'IL', 60666, 'CST');
INSERT INTO airport VALUES ('MIA', 'Miami International Airport', '2100 NW 42nd Ave', 'Miami', 'FL', 33126, 'EST');
INSERT INTO airport VALUES ('DFW', 'Dallas International Airport', '2400 Aviation DR', 'Dallas', 'TX', 75261, 'CST');

DROP TABLE IF EXISTS airport_attractions;
CREATE TABLE airport_attractions (
  airport_id char(5) NOT NULL,
  attraction char(100) NOT NULL,
  PRIMARY KEY (airport_id, attraction),
  CONSTRAINT fk_airport_id FOREIGN KEY (airport_id) REFERENCES airport (id)
);
INSERT INTO airport_attractions VALUES ('ATL', 'The Coke Factory');
INSERT INTO airport_attractions VALUES ('ATL', 'The Georgia Aquarium');
INSERT INTO airport_attractions VALUES ('JFK', 'The Statue of Liberty');
INSERT INTO airport_attractions VALUES ('JFK', 'The Empire State Building');
INSERT INTO airport_attractions VALUES ('LGA', 'The Statue of Liberty');
INSERT INTO airport_attractions VALUES ('LGA', 'The Empire State Building');
INSERT INTO airport_attractions VALUES ('LAX', 'Lost Angeles Lakers Stadium');
INSERT INTO airport_attractions VALUES ('LAX', 'Los Angeles Kings Stadium');
INSERT INTO airport_attractions VALUES ('SJC', 'Winchester Mystery House');
INSERT INTO airport_attractions VALUES ('SJC', 'San Jose Earthquakes Soccer Team');
INSERT INTO airport_attractions VALUES ('ORD', 'Chicago Blackhawks Stadium');
INSERT INTO airport_attractions VALUES ('ORD', 'Chicago Bulls Stadium');
INSERT INTO airport_attractions VALUES ('MIA', 'Crandon Park Beach');
INSERT INTO airport_attractions VALUES ('MIA', 'Miami Heat Basketball Stadium');
INSERT INTO airport_attractions VALUES ('DFW', 'Texas Longhorns Stadium');
INSERT INTO airport_attractions VALUES ('DFW', 'The Original Texas Roadhouse');

DROP TABLE IF EXISTS flight;
CREATE TABLE flight (
  flight_num decimal(10) NOT NULL,
  airline_name char(30) NOT NULL,
  departing_airport char(5) NOT NULL,
  arriving_airport char(5) NOT NULL,
  departure_time time NOT NULL,
  arrival_time time NOT NULL,
  flight_date date NOT NULL,
  cost_per_seat decimal(5) NOT NULL,
  capacity decimal(5) NOT NULL,
  PRIMARY KEY (flight_num, airline_name),
  CONSTRAINT fk_airline_name FOREIGN KEY (airline_name) REFERENCES airline (airline_name),
  CONSTRAINT fk_departing_airport FOREIGN KEY (departing_airport) REFERENCES airport (id),
  CONSTRAINT fk_arriving_airport FOREIGN KEY (arriving_airport) REFERENCES airport (id)
);
INSERT INTO flight VALUES (1, 'Delta Airlines', 'ATL', 'JFK', '10:00:00', '12:00:00', '2021-10-18', 400, 150);
INSERT INTO flight VALUES (2, 'Southwest Airlines', 'ORD', 'MIA', '10:30:00', '02:30:00', '2021-10-18', 350, 125);
INSERT INTO flight VALUES (3, 'American Airlines', 'MIA', 'DFW', '01:00:00', '04:00:00', '2021-10-18', 350, 125);
INSERT INTO flight VALUES (4, 'United Airlines', 'ATL', 'LGA', '04:30:00', '06:30:00', '2021-10-18', 400, 100);
INSERT INTO flight VALUES (5, 'JetBlue Airways', 'LGA', 'ATL', '11:00:00', '13:00:00', '2021-10-19', 400, 130);
INSERT INTO flight VALUES (6, 'Spirit Airlines', 'SJC', 'ATL', '12:30:00', '09:00:00', '2021-10-19', 650, 140);
INSERT INTO flight VALUES (7, 'WestJet', 'LGA', 'SJC', '01:00:00', '04:00:00', '2021-10-19', 700, 100);
INSERT INTO flight VALUES (8, 'Interjet', 'MIA', 'ORD', '07:30:00', '09:30:00', '2021-10-19', 350, 125);
INSERT INTO flight VALUES (9, 'Delta Airlines', 'JFK', 'ATL', '08:00:00', '10:00:00', '2021-10-20', 375, 150);
INSERT INTO flight VALUES (10, 'Delta Airlines', 'LAX', 'ATL', '09:15:00', '06:15:00', '2021-10-20', 700, 110);
INSERT INTO flight VALUES (11, 'Southwest Airlines', 'LAX', 'ORD', '12:07:00', '07:07:00', '2021-10-20', 600, 95);
INSERT INTO flight VALUES (12, 'United Airlines', 'MIA', 'ATL', '03:35:00', '05:35:00', '2021-10-20', 275, 115);

DROP TABLE IF EXISTS book_flight;
CREATE TABLE book_flight (
  customer_email char(50) NOT NULL,
  airline_name char(100) NOT NULL,
  flight_num decimal(10) NOT NULL,
  number_of_seats decimal(5) NOT NULL,
  PRIMARY KEY (customer_email, airline_name, flight_num),
  CONSTRAINT fk_bf_customer_email FOREIGN KEY (customer_email) REFERENCES customer (email),
  CONSTRAINT fk_bf_airport_name FOREIGN KEY (airline_name) REFERENCES flight (airline_name),
  CONSTRAINT fk_bf_flight_num FOREIGN KEY (flight_num) REFERENCES flight (flight_num)
);
INSERT INTO book_flight VALUES ('swilson@gmail.com', 'JetBlue Airways', 5, 3);
INSERT INTO book_flight VALUES ('aray@tiktok.com', 'Delta Airlines', 1, 2);
INSERT INTO book_flight VALUES ('bshelton@gmail.com', 'United Airlines', 4, 4);
INSERT INTO book_flight VALUES ('lbryan@gmail.com', 'WestJet', 7, 2);
INSERT INTO book_flight VALUES ('tswift@gmail.com', 'WestJet', 7, 2);
INSERT INTO book_flight VALUES ('jseinfeld@gmail.com', 'WestJet', 7, 4);
INSERT INTO book_flight VALUES ('maddiesmith@gmail.com', 'Interjet', 8, 2);
INSERT INTO book_flight VALUES ('cbing10@gmail.com', 'Southwest Airlines', 2, 2);
INSERT INTO book_flight VALUES ('hwmit@gmail.com', 'Southwest Airlines', 2, 5);


DROP TABLE IF EXISTS property_near_airport;
CREATE TABLE property_near_airport (
  p_name char(50) NOT NULL,
  p_owner_email char(50) NOT NULL,
  airport_id char(5) NOT NULL,
  distance decimal(5) NOT NULL,
  PRIMARY KEY (p_name, p_owner_email, airport_id),
  CONSTRAINT fk_pna_property_name FOREIGN KEY (p_name) REFERENCES property (p_name),
  CONSTRAINT fk_pna_property_owner_email FOREIGN KEY (p_owner_email) REFERENCES property (owner_email),
  CONSTRAINT fk_pna_airport_id FOREIGN KEY (airport_id) REFERENCES airport (id)
);
INSERT INTO property_near_airport VALUES ('Atlanta Great Property', 'scooper3@gmail.com', 'ATL', 12);
INSERT INTO property_near_airport VALUES ('House near Georgia Tech', 'gburdell3@gmail.com', 'ATL', 7);
INSERT INTO property_near_airport VALUES ('New York City Property', 'cbing10@gmail.com', 'JFK', 10);
INSERT INTO property_near_airport VALUES ('Statue of Libery Property', 'mgeller5@gmail.com', 'JFK', 8);
INSERT INTO property_near_airport VALUES ('New York City Property', 'cbing10@gmail.com', 'LGA', 25);
INSERT INTO property_near_airport VALUES ('Statue of Libery Property', 'mgeller5@gmail.com', 'LGA', 19);
INSERT INTO property_near_airport VALUES ('Los Angeles Property', 'arthurread@gmail.com', 'LAX', 9);
INSERT INTO property_near_airport VALUES ('LA Kings House', 'arthurread@gmail.com', 'LAX', 12);
INSERT INTO property_near_airport VALUES ('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'SJC', 8);
INSERT INTO property_near_airport VALUES ('Beautiful San Jose Mansion', 'arthurread@gmail.com', 'LAX', 30);
INSERT INTO property_near_airport VALUES ('LA Lakers Property', 'lebron6@gmail.com', 'LAX', 6);
INSERT INTO property_near_airport VALUES ('Chicago Blackhawks House', 'hwmit@gmail.com', 'ORD', 11);
INSERT INTO property_near_airport VALUES ('Chicago Romantic Getaway', 'mj23@gmail.com', 'ORD', 13);
INSERT INTO property_near_airport VALUES ('Beautiful Beach Property', 'msmith5@gmail.com', 'MIA', 21);
INSERT INTO property_near_airport VALUES ('Family Beach House', 'ellie2@gmail.com', 'MIA', 19);
INSERT INTO property_near_airport VALUES ('Texas Roadhouse', 'mscott22@gmail.com', 'DFW', 8);
INSERT INTO property_near_airport VALUES ('Texas Longhorns House', 'mscott22@gmail.com', 'DFW', 17);