
--All of these codes is to create tables for the DB


CREATE TABLE Users (
    userID INT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50),
    email VARCHAR(100)
);

CREATE TABLE Farms (
    farmID INT PRIMARY KEY,
    ownerID INT,
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6),
    size DECIMAL(10, 2),
    FOREIGN KEY (ownerID) REFERENCES Users(userID)
);

CREATE TABLE Crops (
    cropID INT PRIMARY KEY,
    farmID INT,
    cropType VARCHAR(50),
    plantingDate DATE,
    harvestingDate DATE,
    FOREIGN KEY (farmID) REFERENCES Farms(farmID)
);

CREATE TABLE Sensors (
    sensorID INT PRIMARY KEY,
    sensorType VARCHAR(255),
    latitude DECIMAL(10, 6),
    longitude DECIMAL(10, 6),
    measurementRange VARCHAR(50),
    accuracy DECIMAL(10, 2),
    resolution DECIMAL(10, 2),
    powerRequirements VARCHAR(255),
    lastMeasurement TIMESTAMP,
    status VARCHAR(50)
);

CREATE TABLE SensorReadings (
    readingID INT PRIMARY KEY,
    sensorID INT,
    readingValue DECIMAL(10, 2),
    readingTime TIMESTAMP,
    FOREIGN KEY (sensorID) REFERENCES Sensors(sensorID)
);

CREATE TABLE Fertilisers (
    fertiliserID INTEGER PRIMARY KEY,
    name VARCHAR(100),
    manufacturer VARCHAR(100),
    nutrientContent VARCHAR(100),
    applicationRate FLOAT,
    price FLOAT,
    expiryDate DATE,
    description TEXT
);

CREATE TABLE Farm_Fertilisers (
    farmID INTEGER,
    fertiliserID INTEGER,
    PRIMARY KEY (farmID, fertiliserID),
    FOREIGN KEY (farmID) REFERENCES Farms(farmID),
    FOREIGN KEY (fertiliserID) REFERENCES Fertilisers(fertiliserID)
);

CREATE TABLE Crop_Fertilisers (
    cropID INTEGER,
    fertiliserID INTEGER,
    PRIMARY KEY (cropID, fertiliserID),
    FOREIGN KEY (cropID) REFERENCES Crops(cropID),
    FOREIGN KEY (fertiliserID) REFERENCES Fertilisers(fertiliserID)
);
