-- CS4400: Introduction to Database Systems (Fall 2021)
-- Phase III: Stored Procedures & Views [v1] Monday, November 29, 2021 @ 6:00PM EDT
-- Team 19
-- Kurt Hu (khu72).
-- Won Yang (wyang342)
-- Vedant Amin (vamin9)
-- Maharshi Patel (mpatel602)
-- Directions:
-- Please follow all instructions for Phase III as listed on Canvas.
-- Fill in the team number and names and GT usernames for all members above.


-- ID: 1a
-- Name: register_customer
drop procedure if exists register_customer;
delimiter //
create procedure register_customer (
    in i_email varchar(50),
    in i_first_name varchar(100),
    in i_last_name varchar(100),
    in i_password varchar(50),
    in i_phone_number char(12),
    in i_cc_number varchar(19),
    in i_cvv char(3),
    in i_exp_date date,
    in i_location varchar(50)
) 
sp_main: begin

DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from clients where clients.Email = i_email) = 1 then
insert into Customer values (i_email, i_cc_number, i_cvv, i_exp_date, i_location);

else
insert into Accounts values (i_email, i_first_name, i_last_name, i_password);
insert into Clients values (i_email, i_phone_number);
insert into Customer values (i_email, i_cc_number, i_cvv, i_exp_date, i_location);
end if;


COMMIT;
end //
delimiter ;


-- ID: 1b
-- Name: register_owner
drop procedure if exists register_owner;
delimiter //
create procedure register_owner (
    in i_email varchar(50),
    in i_first_name varchar(100),
    in i_last_name varchar(100),
    in i_password varchar(50),
    in i_phone_number char(12)
) 
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from clients where clients.Email = i_email) = 1 then
insert into Owners values (i_email);

else
insert into Accounts values (i_email, i_first_name, i_last_name, i_password);
insert into Clients values (i_email, i_phone_number);
insert into Owners values (i_email);
end if;

COMMIT;
end //
delimiter ;


-- ID: 1c
-- Name: remove_owner
drop procedure if exists remove_owner;
delimiter //
create procedure remove_owner ( 
    in i_owner_email varchar(50)
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from Property where Owner_Email = i_owner_email) > 0
then leave sp_main; end if;

if (select count(*) from Customer where Email = i_owner_email) > 0
then
delete from Owners where Email = i_owner_email;

else
delete from Owners where Email = i_owner_email;
delete from Clients where Email = i_owner_email;
delete from Accounts where Email = i_owner_email;
end if;

COMMIT;
end //
delimiter ;


-- ID: 2a
-- Name: schedule_flight
drop procedure if exists schedule_flight;
delimiter //
create procedure schedule_flight (
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_from_airport char(3),
    in i_to_airport char(3),
    in i_departure_time time,
    in i_arrival_time time,
    in i_flight_date date,
    in i_cost decimal(6, 2),
    in i_capacity int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (i_flight_date <= i_current_date or i_to_airport = i_from_airport) then leave sp_main; end if;

insert into Flight values (i_flight_num, i_airline_name, i_from_airport, i_to_airport, i_departure_time, i_arrival_time, i_flight_date, i_cost, i_capacity);

COMMIT;
end //
delimiter ;


-- ID: 2b
-- Name: remove_flight
drop procedure if exists remove_flight;
delimiter //
create procedure remove_flight ( 
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_current_date date
) 
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if ((select Flight_Date from Flight where Flight_Num = i_flight_num and Airline_Name = i_airline_name) <= i_current_date) then leave sp_main; end if;

delete from Book where Flight_Num = i_flight_num and Airline_Name = i_airline_name;
delete from Flight where Flight_Num = i_flight_num and Airline_Name = i_airline_name;

COMMIT;
end //
delimiter ;


-- ID: 3a
-- Name: book_flight
drop procedure if exists book_flight;
delimiter //
create procedure book_flight (
    in i_customer_email varchar(50),
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_num_seats int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select sum(num_seats) from Book
where Flight_Num = i_flight_num and Airline_Name = i_airline_name) + i_num_seats >
(select Capacity from Flight where Flight_Num = i_flight_num and Airline_Name = i_airline_name)
then leave sp_main; end if;
    
if ((select Flight_Date from Flight where Flight_Num = i_flight_num and Airline_Name = i_airline_name) < i_current_date) then leave sp_main; end if;

if ((select count(*) from Book
where Customer = i_customer_email and Flight_Num = i_flight_num and Airline_Name = i_airline_name
and Was_Cancelled = False) > 0) then leave sp_main; end if;

insert into Book values (i_customer_email, i_flight_num, i_airline_name, i_num_seats, FALSE);

COMMIT;
end //
delimiter ;

-- ID: 3b
-- Name: cancel_flight_booking
drop procedure if exists cancel_flight_booking;
delimiter //
create procedure cancel_flight_booking ( 
    in i_customer_email varchar(50),
    in i_flight_num char(5),
    in i_airline_name varchar(50),
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if ((select Flight_Date from Flight where Flight_Num = i_flight_num and Airline_Name = i_airline_name) <= i_current_date) then leave sp_main; end if;

update Book
set Was_Cancelled = TRUE
where Customer = i_customer_email and Flight_Num = i_flight_num and Airline_Name = i_airline_name;

COMMIT;
end //
delimiter ;


-- ID: 3c
-- Name: view_flight
create or replace view view_flight (
    flight_id,
    flight_date,
    airline,
    destination,
    seat_cost,
    num_empty_seats,
    total_spent
) as

select Flight_Num, Flight_Date, Airline_Name, To_Airport, Cost,
Capacity - (select count(*) from Book where Flight_Num = flight.Flight_Num and Airline_Name = flight.Airline_Name and Was_Cancelled = FALSE),
Cost * (select count(*) from Book where Flight_Num = flight.Flight_Num and Airline_Name = flight.Airline_Name and Was_Cancelled = FALSE) + 
(select count(*) from Book where Flight_Num = flight.Flight_Num and Airline_Name = flight.Airline_Name and Was_Cancelled = TRUE) * 
0.2 * Cost
from flight;


-- ID: 4a
-- Name: add_property
drop procedure if exists add_property;
delimiter //
create procedure add_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_description varchar(500),
    in i_capacity int,
    in i_cost decimal(6, 2),
    in i_street varchar(50),
    in i_city varchar(50),
    in i_state char(2),
    in i_zip char(5),
    in i_nearest_airport_id char(3),
    in i_dist_to_airport int
) 
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if ((select count(*) from Airport where i_nearest_airport_id != Airport_Id) = 0)
then
insert into Property values(i_property_name, i_owner_email, i_description, i_capacity, i_cost, i_street, i_city, i_state, i_zip);
else 
insert into Property values (i_property_name, i_owner_email, i_description, i_capacity, i_cost, i_street, i_city, i_state, i_zip);
insert into Is_Close_To values (i_property_name, i_owner_email, i_nearest_airport_id, i_dist_to_airport);
end if;

COMMIT; 
end //
delimiter ;


-- ID: 4b
-- Name: remove_property
drop procedure if exists remove_property;
delimiter //
create procedure remove_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from Reserve where
Property_Name = i_property_name and Owner_Email = i_owner_email
and Was_Cancelled = False
and Start_Date <= i_current_date and End_Date >= i_current_date) then leave sp_main; end if;

delete from Reserve where Property_Name = i_property_name and Owner_Email = i_owner_email;
delete from Property where Property_Name = i_property_name and Owner_Email = i_owner_email;

COMMIT;   
end //
delimiter ;


-- ID: 5a
-- Name: reserve_property
drop procedure if exists reserve_property;
delimiter //
create procedure reserve_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_start_date date,
    in i_end_date date,
    in i_num_guests int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (i_start_date <= i_current_date) then leave sp_main; end if;

if (select count(*) from Reserve where 
Property_Name = i_property_name and Owner_Email = i_owner_email and Customer = i_customer_email
and Was_Cancelled = False and not (i_start_date > End_Date or i_end_date < Start_Date))
> 0
then leave sp_main; end if;

if ((select sum(Num_Guests) from Reserve where Was_Cancelled = False and not (i_start_date > End_Date or i_end_date < Start_Date)) + i_num_guests) >
(select Capacity from Property where Property_Name = i_property_name and Owner_Email = i_owner_email)
then leave sp_main; end if;

insert into Reserve values (i_property_name, i_owner_email, i_customer_email, i_start_date, i_end_date, i_num_guests, FALSE);

COMMIT;
end //
delimiter ;


-- ID: 5b
-- Name: cancel_property_reservation
drop procedure if exists cancel_property_reservation;
delimiter //
create procedure cancel_property_reservation (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

-- if (Was_Cancelled = False) then continue
-- if (Was_Cancelled = True) then do nothing
-- i_current_date < Start_Date 

if (select count(*) from Reserve
where Property_Name = i_property_name and Owner_Email = i_owner_email and Customer = i_customer_email
and Start_Date > i_current_date) = 0
then leave sp_main; end if;

update Reserve
set Was_Cancelled = TRUE
where Property_Name = i_property_name and Owner_Email = i_owner_email and Customer = i_customer_email;

COMMIT;
end //
delimiter ;


-- ID: 5c
-- Name: customer_review_property
drop procedure if exists customer_review_property;
delimiter //
create procedure customer_review_property (
    in i_property_name varchar(50),
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_content varchar(500),
    in i_score int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from Reserve where Owner_Email = i_owner_email and Was_Cancelled = False and Start_Date <= i_current_date) = 0
then leave sp_main; end if;

insert into Review values (i_property_name, i_owner_email, i_customer_email, i_content, i_score);

COMMIT;    
end //
delimiter ;


-- ID: 5d
-- Name: view_properties
create or replace view view_properties (
    property_name, 
    average_rating_score, 
    description, 
    address, 
    capacity, 
    cost_per_night
) as
select Property_Name,
(select avg(Score) from Review where Property.Property_Name = Review.Property_Name group by Review.Property_Name),
Descr,
Concat(Street, ', ', City, ', ', State, ', ', Zip),
Capacity,
Cost
from Property;


-- ID: 5e
-- Name: view_individual_property_reservations
drop procedure if exists view_individual_property_reservations;
delimiter //
create procedure view_individual_property_reservations (
    in i_property_name varchar(50),
    in i_owner_email varchar(50)
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;
    if (select count(*) from Property where property_name = i_property_name and Owner_Email = i_owner_email) = 0
    then
    drop table if exists view_individual_property_reservations;
    create table view_individual_property_reservations (
        property_name varchar(50),
        start_date date,
        end_date date,
        customer_email varchar(50),
        customer_phone_num char(12),
        total_booking_cost decimal(6,2),
        rating_score int,
        review varchar(500)
    );
    
    else

    drop table if exists view_individual_property_reservations;
    create table view_individual_property_reservations (
        property_name varchar(50),
        start_date date,
        end_date date,
        customer_email varchar(50),
        customer_phone_num char(12),
        total_booking_cost decimal(6,2),
        rating_score int,
        review varchar(500)
    ) as
    
    select Property_Name, Start_Date, End_Date, Customer as customer_email,
    (select Clients.Phone_Number from Clients where Clients.Email = Reserve.Customer) as customer_phone_num,

    if(Reserve.Was_Cancelled,
    (DATEDIFF(Reserve.End_Date, Reserve.Start_Date) + 1) * ((select Cost from Property where Reserve.Property_Name = Property.Property_Name and Reserve.Owner_email = Property.Owner_Email) * 0.2),
    (DATEDIFF(Reserve.End_Date, Reserve.Start_Date) + 1) * (select Cost from Property where Reserve.Property_Name = Property.Property_Name and Reserve.Owner_Email = Property.Owner_Email))
    as total_booking_cost,
    (select Score from Review where Review.Property_Name = Reserve.Property_Name and Review.Owner_Email = Reserve.Owner_Email and Review.Customer = Reserve.Customer) as rating_score,
    (select Content from Review where Review.Property_Name = Reserve.Property_Name and Review.Owner_Email = Reserve.Owner_Email and Review.Customer = Reserve.Customer) as review
    from Reserve
    where Property_Name = i_property_name and Owner_Email = i_owner_email;
    
    end if;
COMMIT;
end //
delimiter ;


-- ID: 6a
-- Name: customer_rates_owner
drop procedure if exists customer_rates_owner;
delimiter //
create procedure customer_rates_owner (
    in i_customer_email varchar(50),
    in i_owner_email varchar(50),
    in i_score int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from Reserve
where Owner_Email = i_owner_email and Was_Cancelled = False and Start_Date <= i_current_date) = 0 
then leave sp_main; end if;

insert into Customers_Rate_Owners values (i_customer_email, i_owner_email, i_score);

COMMIT;
end //
delimiter ;


-- ID: 6b
-- Name: owner_rates_customer
drop procedure if exists owner_rates_customer;
delimiter //
create procedure owner_rates_customer (
    in i_owner_email varchar(50),
    in i_customer_email varchar(50),
    in i_score int,
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

if (select count(*) from Reserve
where Owner_Email = i_owner_email and Was_Cancelled = False and Start_Date <= i_current_date) = 0 
then leave sp_main; end if;

insert into Owners_Rate_Customers values (i_owner_email, i_customer_email, i_score);

COMMIT;
end //
delimiter ;


-- ID: 7a
-- Name: view_airports
create or replace view view_airports (
    airport_id, 
    airport_name, 
    time_zone, 
    total_arriving_flights, 
    total_departing_flights, 
    avg_departing_flight_cost
) as
    
select Airport_Id, Airport_Name, Time_Zone, 
(select count(*) from Flight where To_Airport = Airport_Id),
(select count(*) from Flight where From_Airport = Airport_Id),
(select avg(Cost) from Flight where From_Airport = Airport_Id)
from airport;

-- ID: 7b
-- Name: view_airlines
create or replace view view_airlines (
    airline_name, 
    rating, 
    total_flights, 
    min_flight_cost
) as

select Airline_Name, Rating,
(select count(*) from Flight where Airline.Airline_Name = Flight.Airline_Name),
(select min(Cost) from Flight where Airline.Airline_Name = Flight.Airline_Name)
from airline;


-- ID: 8a
-- Name: view_customers
create or replace view view_customers (
    customer_name, 
    avg_rating, 
    location, 
    is_owner, 
    total_seats_purchased
) as

-- view customers
select
concat(Accounts.First_Name, ' ', Accounts.Last_Name),
(select avg(Score) from Owners_Rate_Customers where Owners_Rate_Customers.Customer = Customer.Email),
Customer.Location,
(select count(*) from Owners where Owners.Email = Customer.Email) > 0,
if((select count(*) from Book where Book.Customer = Customer.Email) > 0
, (select sum(Num_Seats) from Book where Book.Customer = Customer.Email), 0)
from Customer natural join Clients natural join Accounts;


-- ID: 8b
-- Name: view_owners
create or replace view view_owners (
    owner_name, 
    avg_rating, 
    num_properties_owned, 
    avg_property_rating
) as

select
concat(Accounts.First_Name, ' ', Accounts.Last_Name),
(select avg(Customers_Rate_Owners.Score) from Customers_Rate_Owners where Customers_Rate_Owners.Owner_Email = Owners.Email),
(select count(*) from Property where Property.Owner_Email = Owners.Email),
(select avg(Review.Score) from Review where Review.Owner_Email = Owners.Email)
from Owners natural join Clients natural join Accounts;


-- ID: 9a
-- Name: process_date
drop procedure if exists process_date;
delimiter //
create procedure process_date ( 
    in i_current_date date
)
sp_main: begin
DECLARE exit handler for sqlexception
    BEGIN
    GET DIAGNOSTICS CONDITION 1
    @p1 = RETURNED_SQLSTATE, @p2 = MESSAGE_TEXT;
    SELECT @p1 as RETURNED_SQLSTATE, @p2 as MESSAGE_TEXT;
    ROLLBACK;
END;
START TRANSACTION;

-- if (select count(*) from Customer
-- join Book on Customer.Email = Book.Customer
-- join Flight on Book.Flight_Num = Flight.Flight_Num
-- where Book.Was_Cancelled = FALSE and Flight.Flight_Date = i_current_date
-- group by Customer.Email) > 1
-- then leave sp_main; end if;

update Customer
join Book on Customer.Email = Book.Customer
join Flight on Book.Flight_Num = Flight.Flight_Num
join Airport on Flight.To_Airport = Airport.Airport_Id
set Customer.Location = Airport.State
where Book.Was_Cancelled = FALSE and Flight.Flight_Date = i_current_date;

COMMIT; 
end //
delimiter ;