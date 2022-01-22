-- DROP DATABASE gans;

-- CREATE DATABASE gans;
USE gans;
-- DROP TABLE population;
-- DROP TABLE flights;
-- DROP TABLE cities;
-- DROP TABLE weather;
-- DROP TABLE airports;
CREATE TABLE IF NOT EXISTS cities (
	id INT,
    City VARCHAR(200),
    Country VARCHAR(200),
    Country_code VARCHAR(3),
    CityCountry VARCHAR(204),
    PRIMARY KEY(CityCountry)
);


CREATE TABLE IF NOT EXISTS population (
	id INT,
    City VARCHAR(200),
    Country VARCHAR(200),
    Population_2021 INT,
    Population_2020 INT,
    difference_of VARCHAR(204),
    Country_code VARCHAR(3),
    CityCountry VARCHAR(204),
    PRIMARY KEY(id),
    FOREIGN KEY (CityCountry) REFERENCES cities(CityCountry)
);


CREATE TABLE IF NOT EXISTS weather (
	weather_id INT NOT NULL AUTO_INCREMENT,
    Date_Time DATETIME,
	Temperature FLOAT,       
	Feels_like FLOAT,      
	Humidity INT,         
	Weather VARCHAR(200),       
	Clouds INT,         
	Wind_speed FLOAT,
	Rain VARCHAR(100),
	Snow VARCHAR(100),
    City_id INT,
	City_Country VARCHAR(200),
    PRIMARY KEY(weather_id),
    FOREIGN KEY (City_Country) REFERENCES cities(CityCountry)
);

CREATE TABLE IF NOT EXISTS flights (
	flight_id INT NOT NULL AUTO_INCREMENT,
    From_location VARCHAR(200),
    Arrival_at DATETIME,
    Terminal VARCHAR(200),
    Airline VARCHAR (200),
    Flight_number VARCHAR(20),
   --  Aircraft_model VARCHAR(200),
   Airport_code VARCHAR(100),
	CityCountry VARCHAR(200),
    icao VARCHAR(5),
    PRIMARY KEY(flight_id),
    FOREIGN KEY (CityCountry) REFERENCES cities(CityCountry)
);

CREATE TABLE IF NOT EXISTS airports (
airport_id INT NOT NULL AUTO_INCREMENT,
airport_type VARCHAR(255),
airport_name VARCHAR(255),
latitude_deg FLOAT(8),
longitude_deg FLOAT(8),
iso_country VARCHAR(3),
elevation_ft FLOAT(8),
municipality VARCHAR(255),
scheduled_service VARCHAR(200),
gps_code VARCHAR(200),
CityCountry VARCHAR(200),
PRIMARY KEY(airport_id),
FOREIGN KEY (CityCountry) REFERENCES cities(CityCountry)
);
