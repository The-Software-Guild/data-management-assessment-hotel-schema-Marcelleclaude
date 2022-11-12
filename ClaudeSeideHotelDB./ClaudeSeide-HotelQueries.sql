USE HotelSchema;


-- first query

select 
Reservation.reservationID,
Reservation.guestID,
Reservation.roomID,
Reservation.startdate,
Reservation.enddate,
Guest.fName,
Guest.lName,
Room.roomID
From Reservation
Inner join Guest On Reservation.guestID = Guest.guestID
Inner Join Room ON Reservation.roomID = Room.roomID
Where Reservation.endDate BETWEEN '2023-07-01' AND '2023-07-31';

-- SELECT*from Reservation
-- Where Reservation.endDate BETWEEN '2023-07-01' AND '2023-07-31';


-- 2nd Query
Select
Reservation.reservationID,
Guest.fName,
Guest.lName,
Reservation.startdate,
Reservation.enddate
From Guest
Inner Join Guest ON Guest.guestID
Inner Join Reservation ON Reservation.reservationID
Inner Join Room ON Room.roomID
Inner Join RoomAmenities ON RoomAmenities.roomID= Room.roomID
Inner Join amenities ON amenities.amenitiesID= RoomAmenities.amenitiesID
Where amenities.name='Jacuzzi';


-- 3rd query
-- doesnt work
select
Room.roomID,
Guest.fName,
Guest.lName,
Room.roomID,
Reservation.adult,
Reservation.children,
Reservation.startdate,
Guest.quantityAdults + Guest.quantityChildren AS quantitypeople
From Reservation
Inner Join Guest ON Reservation.guestID= Guest.guestID
Inner Join Room ON Reservation.roomID=Room.roomID
Where Guest.fName='Wilfred' AND Guest.lName='Vise';

/* 3. ANS
# roomId, firstName, lastName, startDate, endDate, quantity_people
'207', 'Wilfred', 'Vise', '2023-04-23', '2023-04-24', '2'
'401', 'Wilfred', 'Vise', '2023-07-18', '2023-07-21', '6'
*/

-- 4th Query
Select
Room.roomID,
Reservation.reservationID,
Reservation.price
From Room
Left Join Reservation On Room.RoomID = Reservation.roomID;

-- 5th Query
-- doesnt work
select
Room.roomID,
RoomType.maxocc,
Reservation.reservationID,
Reservation.startdate,
Reservation.enddate
From Room rm
Inner Join Room ON Room.roomID = Room.roomID
Inner Join Reservation  ON Room.roomID = Reservation.roomID
Inner join RoomType  ON RoomType.roomTypeID = Room.roomTypeID
Where RoomType.maxocc >= 3 And Reservation.startdate BETWEEN '2023-04-01' AND '2023-04-30';

-- 6th Query
-- not it
Select
gt.fName,
gt.lName,
count(gs.guestID) ReservationCount
From Guest gt
inner Join Guest gs ON gs.guestID = gt.guestID
Inner Join Reservation rn ON rn.reservationID = rn.reservationID
group by gt.guestID
order by Reservationcount desc,gt.lName;

/* So answer should technically be 
# firstName, lastName, reservationCount
'Mark', 'Simmer', '4'
'Bettyann ', 'Seery', '3'
'Duane ', 'Cullison', '2'
'Claude', 'Seide', '2'
'Walter', 'Holaway', '2'
'Aurore', 'Luechtefeld', '2'
'Maritza', 'Tilton', '2'
'Joleen', 'Tison', '2'
'Wilfred', 'Vise', '2'
'Karie ', 'Yang', '2'
'Zachery', 'Seery', '1'
*/
-- 7th Query
select * From  Guest 
Where phoneNumber= '(772) 985-2538';
/* 7. ANS
# firstName, lastName, address, city, stateAbbr, zip, phone
'Claude' 'seide' etc...
*/




