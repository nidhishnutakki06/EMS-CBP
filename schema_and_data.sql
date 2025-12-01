-- Source: https://onecompiler.com/mysql/444cg2atq
-- Extracted: 2025-12-01

-- DROP if exists (safe to rerun)
DROP TABLE IF EXISTS QRScan;
DROP TABLE IF EXISTS FriendTracking;
DROP TABLE IF EXISTS RoleAssignment;
DROP TABLE IF EXISTS EventStatus;
DROP TABLE IF EXISTS Registration;
DROP TABLE IF EXISTS Attendee;
DROP TABLE IF EXISTS SubEvent;
DROP TABLE IF EXISTS Event;
DROP TABLE IF EXISTS Venue;
DROP TABLE IF EXISTS Manager;
DROP TABLE IF EXISTS Admin;
DROP TABLE IF EXISTS Organizer;

-- 1) Organizer
CREATE TABLE Organizer (
    OrganizerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    Email VARCHAR(100) UNIQUE,
    Role VARCHAR(50),
    DateJoined DATE
);
INSERT INTO Organizer (OrganizerID,FullName,Email,Role,DateJoined) VALUES
(1,'Rajesh Kumar','[email protected]','Admin','2024-01-15'),
(2,'Priya Sharma','[email protected]','Admin','2024-02-10'),
(3,'Amit Patel','[email protected]','Manager','2024-01-20'),
(4,'Sneha Reddy','[email protected]','Manager','2024-02-15'),
(5,'Vikram Singh','[email protected]','Manager','2024-03-01'),
(6,'Rohan Mehta','[email protected]','Technician','2024-03-05'),
(7,'Anita Das','[email protected]','Vendor','2024-03-07'),
(8,'Divya Iyer','[email protected]','Security','2024-04-15'),
(9,'Arjun Desai','[email protected]','Security','2024-04-10'),
(10,'Neha Gupta','[email protected]','Food Vendor','2024-04-20'),
(11,'Kavita Rao','[email protected]','Volunteer','2024-05-01'),
(12,'Sidharth Kumar','[email protected]','Logistics','2024-05-05'),
(13,'Maya Menon','[email protected]','Venue Manager','2024-05-10'),
(14,'Ritesh Goyal','[email protected]','Vendor','2024-05-12'),
(15,'Pooja Singh','[email protected]','Volunteer','2024-05-20'),
(16,'Kunal Verma','[email protected]','Security','2024-06-01'),
(17,'Priyanka Nair','[email protected]','Coordinator','2024-06-05'),
(18,'Suresh Iyer','[email protected]','Transport','2024-06-10'),
(19,'Latha Reddy','[email protected]','Catering','2024-06-15'),
(20,'Devansh Mehra','[email protected]','Technician','2024-06-20'),
(21,'Ragini Kapoor','[email protected]','Marketing','2024-07-01'),
(22,'Aakash Gupta','[email protected]','Volunteer','2024-07-05'),
(23,'Meera Joshi','[email protected]','Vendor','2024-07-10'),
(24,'Harish Patel','[email protected]','Security','2024-07-15'),
(25,'Tanvi Shah','[email protected]','Coordinator','2024-07-20'),
(26,'Anil Bhatt','[email protected]','Vendor','2024-08-01'),
(27,'Rupa Kaur','[email protected]','Logistics','2024-08-05'),
(28,'Nitin Sinha','[email protected]','Technician','2024-08-10'),
(29,'Geeta Bansal','[email protected]','Volunteer','2024-08-15'),
(30,'Kishore Rao','[email protected]','Venue Manager','2024-08-20'),
(31,'Sonal Deshpande','[email protected]','Marketing','2024-09-01'),
(32,'Manish Sharma','[email protected]','Logistics','2024-09-05'),
(33,'Rina Kapoor','[email protected]','Vendor','2024-09-10'),
(34,'Amitabh Sen','[email protected]','Admin','2024-09-15'),
(35,'Bhavana Iyer','[email protected]','Volunteer','2024-09-20');

-- 2) Admin
CREATE TABLE Admin (
    AdminID INT PRIMARY KEY,
    OrganizerID INT,
    Department VARCHAR(100),
    AccessLevel VARCHAR(20),
    LastLoginTime DATETIME,
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID)
);
INSERT INTO Admin (AdminID,OrganizerID,Department,AccessLevel,LastLoginTime) VALUES
(1,1,'Event Monitoring','Full','2025-11-11 08:00:00'),
(2,2,'Resource Control','Full','2025-11-11 08:10:00'),
(3,34,'Emergency Handling','Limited','2025-11-11 09:00:00'),
(4,11,'Audits','Limited','2025-11-10 12:00:00'),
(5,21,'Communications','Full','2025-11-09 10:15:00'),
(6,35,'Reports','Full','2025-11-10 11:20:00'),
(7,13,'Venue Ops','Full','2025-11-08 09:30:00'),
(8,17,'Coordination','Limited','2025-11-07 14:00:00'),
(9,3,'Manager Oversight','Full','2025-11-06 16:45:00'),
(10,4,'Manager Oversight','Full','2025-11-05 17:55:00'),
(11,5,'Manager Oversight','Full','2025-11-04 08:05:00'),
(12,6,'Tech Ops','Limited','2025-11-03 09:10:00'),
(13,7,'Vendor Relations','Limited','2025-11-02 10:00:00'),
(14,8,'Security','Full','2025-11-02 11:00:00'),
(15,9,'Security','Full','2025-11-01 07:30:00'),
(16,10,'Food & Catering','Full','2025-10-31 13:00:00'),
(17,12,'Logistics','Limited','2025-10-30 15:15:00'),
(18,14,'Vendor Contracts','Limited','2025-10-29 12:20:00'),
(19,15,'Volunteer Coordination','Limited','2025-10-28 11:45:00'),
(20,16,'Checkpoint Control','Full','2025-10-27 09:00:00'),
(21,18,'Transport','Limited','2025-10-26 10:10:00'),
(22,19,'Catering','Limited','2025-10-25 14:30:00'),
(23,20,'Technical Support','Limited','2025-10-24 16:00:00'),
(24,22,'Outreach','Limited','2025-10-23 17:10:00'),
(25,23,'Vendor Approval','Full','2025-10-22 08:20:00'),
(26,24,'Security Ops','Full','2025-10-21 09:40:00'),
(27,25,'Coordination','Limited','2025-10-20 10:50:00'),
(28,26,'Procurement','Limited','2025-10-19 11:55:00'),
(29,27,'Transport Ops','Limited','2025-10-18 12:05:00'),
(30,28,'AV Support','Limited','2025-10-17 13:15:00'),
(31,29,'Volunteer','Limited','2025-10-16 14:20:00'),
(32,30,'Venue Maintenance','Limited','2025-10-15 15:25:00'),
(33,31,'Marketing','Limited','2025-10-14 16:30:00'),
(34,32,'IT','Full','2025-10-13 17:35:00'),
(35,33,'Vendor Relations','Limited','2025-10-12 18:40:00');

-- 3) Manager
CREATE TABLE Manager (
    ManagerID INT PRIMARY KEY,
    OrganizerID INT,
    Specialization VARCHAR(100),
    EventsManaged INT DEFAULT 0,
    YearsExperience INT,
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID)
);
INSERT INTO Manager (ManagerID,OrganizerID,Specialization,EventsManaged,YearsExperience) VALUES
(1,3,'Logistics',15,5),
(2,4,'Venue',12,4),
(3,5,'Coordination',20,6),
(4,12,'Operations',10,3),
(5,17,'Vendor Management',8,4),
(6,13,'Technical',9,5),
(7,21,'Volunteer Ops',6,2),
(8,22,'Marketing',11,4),
(9,23,'Security Coordination',14,6),
(10,24,'Transport',7,3),
(11,25,'Food & Catering',10,4),
(12,26,'Procurement',5,2),
(13,27,'Logistics',13,6),
(14,28,'AV Support',8,4),
(15,29,'Stalls',9,3),
(16,30,'Venue Ops',12,5),
(17,31,'Sponsorship',10,4),
(18,32,'Transport',6,2),
(19,33,'Vendor Relations',14,5),
(20,34,'IT',7,3),
(21,35,'Community',4,2),
(22,1,'Event Planning',16,6),
(23,2,'Scheduling',11,4),
(24,6,'Technical Logistics',9,4),
(25,7,'Vendor Liaison',5,2),
(26,8,'Security Ops',12,6),
(27,9,'Checkpoint',8,3),
(28,10,'Food Ops',10,4),
(29,11,'Volunteer Training',3,1),
(30,14,'Contracts',9,5),
(31,15,'Crowd Control',7,3),
(32,16,'Transport Planning',6,2),
(33,18,'Catering Logistics',8,4),
(34,19,'Venue Setup',10,5),
(35,20,'AV & Lights',11,6);

-- 4) Venue
CREATE TABLE Venue (
    VenueID INT PRIMARY KEY,
    VenueName VARCHAR(100),
    Location VARCHAR(100),
    Capacity INT
);
INSERT INTO Venue (VenueID,VenueName,Location,Capacity) VALUES
(1,'City Convention Center','Hyderabad',500),
(2,'Green Park Grounds','Bangalore',800),
(3,'Marine Hall','Vizag',400),
(4,'Sunshine Arena','Delhi',1200),
(5,'Skyline Banquet','Mumbai',600),
(6,'Riverside Pavilion','Kolkata',700),
(7,'Mountain View Hall','Chennai',450),
(8,'Lotus Expo Center','Pune',900),
(9,'Harbor Conference Hall','Kochi',350),
(10,'Grand Exhibition Grounds','Ahmedabad',1500),
(11,'Palace Gardens','Udaipur',300),
(12,'Island Arena','Goa',1000),
(13,'Desert Pavilion','Jaisalmer',250),
(14,'Forest Edge Hall','Shimla',200),
(15,'Metro Convention','Noida',1100),
(16,'Lakeside Auditorium','Bhopal',550),
(17,'Civic Center','Surat',650),
(18,'Cultural Hub','Indore',480),
(19,'Seaside Auditorium','Mangalore',420),
(20,'Tech Park Hall','Bengaluru',800),
(21,'Heritage Banquet','Pune',320),
(22,'City Plaza','Patna',430),
(23,'Festival Grounds','Raipur',600),
(24,'Opera House','Kolkata',700),
(25,'Town Square','Agra',280),
(26,'Harbor Lawn','Visakhapatnam',900),
(27,'Sunset Pavilion','Kochi',360),
(28,'Crystal Hall','Guwahati',410),
(29,'Oceanic Center','Vishakhapatnam',880),
(30,'Vista Grounds','Nagpur',750),
(31,'Unity Hall','Lucknow',520),
(32,'Royal Arena','Kanpur',600),
(33,'Starlight Grounds','Thane',400),
(34,'Coral Convention','Ernakulam',550),
(35,'Aurora Dome','Patiala',440);

-- 5) Event
CREATE TABLE Event (
    EventID INT PRIMARY KEY,
    EventName VARCHAR(100),
    EventType VARCHAR(50),
    EventDate DATE,
    VenueID INT,
    ManagerID INT,
    TotalBudget DECIMAL(12,2),
    ExpectedAttendees INT,
    FOREIGN KEY (VenueID) REFERENCES Venue(VenueID),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);
INSERT INTO Event (EventID,EventName,EventType,EventDate,VenueID,ManagerID,TotalBudget,ExpectedAttendees) VALUES
(100,'Tech Summit 2025','Conference','2025-12-12',4,22,500000.00,450),
(101,'Music Fest','Concert','2025-12-20',10,16,1500000.00,1200),
(102,'Art Expo','Exhibition','2025-11-25',5,13,200000.00,300),
(103,'Startup Pitch Day','Competition','2025-12-05',1,22,100000.00,250),
(104,'Food Carnival','Festival','2025-12-18',2,11,350000.00,800),
(105,'Marathon 5K','Sports','2025-12-07',15,31,75000.00,2000),
(106,'Career Fair','Fair','2025-11-30',8,23,120000.00,600),
(107,'Science Symposium','Seminar','2025-12-02',12,6,90000.00,200),
(108,'Fashion Week','Show','2025-12-16',20,17,400000.00,500),
(109,'Book Fair','Fair','2025-11-28',21,3,60000.00,1000);

-- 6) SubEvent
CREATE TABLE SubEvent (
    SubEventID INT PRIMARY KEY,
    MainEventID INT,
    SubEventName VARCHAR(100),
    StartTime TIME,
    EndTime TIME,
    MaxParticipants INT,
    FOREIGN KEY (MainEventID) REFERENCES Event(EventID)
);
INSERT INTO SubEvent (SubEventID,MainEventID,SubEventName,StartTime,EndTime,MaxParticipants) VALUES
(1,100,'AI Workshop','10:00:00','13:00:00',50),
(2,100,'Cloud Panel','14:00:00','15:30:00',200),
(3,101,'Rock Night','18:00:00','22:00:00',300),
(4,104,'Street Food Tour','12:00:00','15:00:00',200),
(5,103,'Pitch Session A','09:00:00','11:00:00',50),
(6,103,'Pitch Session B','12:00:00','14:00:00',50);

-- 7) Attendee
CREATE TABLE Attendee (
    AttendeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    QRCode VARCHAR(50),
    RegistrationStatus VARCHAR(50),
    LocationSharingEnabled BOOLEAN DEFAULT FALSE,
    CurrentLocationX DECIMAL(9,6),
    CurrentLocationY DECIMAL(9,6)
);
INSERT INTO Attendee (AttendeeID, Name, Email, QRCode, RegistrationStatus, LocationSharingEnabled, CurrentLocationX, CurrentLocationY) VALUES
(200,'Anu Patel','[email protected]',NULL,'Registered',TRUE,17.3850,78.4867),
(201,'Vivek Rao','[email protected]',NULL,'Registered',FALSE,NULL,NULL),
(202,'Shreya Nair','[email protected]',NULL,'Registered',TRUE,12.9716,77.5946),
(203,'Karan Singh','[email protected]',NULL,'Registered',FALSE,NULL,NULL),
(204,'Megha Verma','[email protected]',NULL,'Registered',TRUE,19.0760,72.8777);

-- 8) Registration
CREATE TABLE Registration (
    RegID INT PRIMARY KEY,
    EventID INT,
    AttendeeID INT,
    Paid BOOLEAN DEFAULT FALSE,
    RegistrationDate DATE,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID)
);
INSERT INTO Registration (RegID, EventID, AttendeeID, Paid, RegistrationDate) VALUES
(30,100,200,TRUE,'2025-11-01'),
(31,100,201,FALSE,'2025-11-02'),
(32,103,202,TRUE,'2025-11-03'),
(33,104,203,TRUE,'2025-11-04'),
(34,105,204,TRUE,'2025-11-05');

-- 9) EventStatus
CREATE TABLE EventStatus (
    StatusID INT PRIMARY KEY,
    EventID INT,
    AdminID INT,
    StatusCheckTime DATETIME,
    ResourcesAchieved BOOLEAN,
    EmergencyCircumstances VARCHAR(100),
    OverallStatus VARCHAR(50),
    Remarks VARCHAR(255),
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AdminID) REFERENCES Admin(AdminID)
);
INSERT INTO EventStatus (StatusID, EventID, AdminID, StatusCheckTime, ResourcesAchieved, EmergencyCircumstances, OverallStatus, Remarks) VALUES
(500,100,1,'2025-12-01 09:00:00',TRUE,'None','On Track','All good'),
(501,104,1,'2025-11-30 09:00:00',FALSE,'Minor','At Risk','Need extra staff');

-- 10) RoleAssignment
CREATE TABLE RoleAssignment (
    AssignID INT PRIMARY KEY,
    OrganizerID INT,
    EventID INT,
    AssignedRole VARCHAR(100),
    ShiftTime VARCHAR(50),
    FOREIGN KEY (OrganizerID) REFERENCES Organizer(OrganizerID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
INSERT INTO RoleAssignment (AssignID,OrganizerID,EventID,AssignedRole,ShiftTime) VALUES
(1,8,100,'Security','08:00-16:00'),
(2,9,100,'Security','16:00-00:00'),
(3,11,104,'Volunteer','09:00-17:00'),
(4,13,103,'Venue Manager','08:00-20:00');

-- 11) FriendTracking
CREATE TABLE FriendTracking (
    TrackID INT PRIMARY KEY,
    AttendeeID INT,
    FriendAttendeeID INT,
    EventID INT,
    TrackingEnabled BOOLEAN,
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID),
    FOREIGN KEY (FriendAttendeeID) REFERENCES Attendee(AttendeeID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);
INSERT INTO FriendTracking (TrackID,AttendeeID,FriendAttendeeID,EventID,TrackingEnabled) VALUES
(1,200,201,100,TRUE),
(2,200,202,100,TRUE),
(3,202,200,103,TRUE);

-- 12) QRScan
CREATE TABLE QRScan (
    ScanID INT PRIMARY KEY,
    EventID INT,
    AttendeeID INT,
    SecurityID INT,
    ScanTime DATETIME,
    ScanResult VARCHAR(20),
    EntryGranted BOOLEAN,
    FOREIGN KEY (EventID) REFERENCES Event(EventID),
    FOREIGN KEY (AttendeeID) REFERENCES Attendee(AttendeeID),
    FOREIGN KEY (SecurityID) REFERENCES Organizer(OrganizerID)
);
INSERT INTO QRScan (ScanID,EventID,AttendeeID,SecurityID,ScanTime,ScanResult,EntryGranted) VALUES
(1,100,200,8,'2025-12-12 09:00:00','Valid',TRUE),
(2,100,201,9,'2025-12-12 09:05:00','Invalid',FALSE),
(3,104,203,13,'2025-12-18 11:30:00','Valid',TRUE);

-- End of schema & data (queries, triggers, cursors and views are kept in a separate file)
