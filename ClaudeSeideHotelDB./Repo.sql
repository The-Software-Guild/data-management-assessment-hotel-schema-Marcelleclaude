-- My Hotel schema SQL script 
DROP DATABASE IF EXISTS HotelSchema;
Create database HotelSchema;
Use HotelSchema;

Create Table Guest(
guestID int primary key,
fName varchar(50),
lName varchar(50),
address varchar(50),
city varchar(30),
state varchar(30),
zipcode int,
phoneNumber varchar(30)
);

Create table RoomType(

RoomTypeID int not null primary key,
roomTypeDesc varchar(30),
price float,
standardocc int,
maxocc int,
extraperson int
);

Create table amenities(
amenitiesID int not null primary key,
amenitiesdesc varchar(30)

);
Create table Room(
roomID int not null primary key,
roomTypeID int,
adaAccess boolean,
Foreign Key (roomTypeID) References RoomType(roomTypeID)
);
Create Table Reservation(
reservationID int primary key,
guestID int,
roomID int,
adult int,
children int,
startdate date,
enddate date,
price float,
FOREIGN KEY (roomID) REFERENCES Room (roomID),
Foreign Key (guestID) References Guest(guestID)
);

Create table RoomAmenities(
roomID int,
amenitiesID int,
FOREIGN KEY (roomID) REFERENCES Room (roomID),
Foreign Key (amenitiesID) References amenities(amenitiesID)
);



