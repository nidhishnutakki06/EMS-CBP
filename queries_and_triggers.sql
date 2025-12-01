-- Source: https://onecompiler.com/mysql/444cg2atq
-- Extracted: 2025-12-01
-- File: queries_and_triggers.sql
-- Contains: commented queries, cursors, triggers, procedures, views (kept as in OneCompiler)

------------------------------------------------------------
-- 1. Useful SELECT / reporting queries (commented)
------------------------------------------------------------

/*
-- List events with venue name and manager name
SELECT e.EventID, e.EventName, v.VenueName, o.FullName AS ManagerName, e.EventDate, e.ExpectedAttendees
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID
JOIN Manager m ON e.ManagerID = m.ManagerID
JOIN Organizer o ON m.OrganizerID = o.OrganizerID
ORDER BY e.EventDate;

-- Attendees registered but not paid
SELECT r.RegID, a.AttendeeID, a.Name, a.Email, r.Paid
FROM Registration r
JOIN Attendee a ON r.AttendeeID = a.AttendeeID
WHERE r.Paid = FALSE;

-- Count attendees per event
SELECT e.EventID, e.EventName, COUNT(r.RegID) AS NumRegistrations
FROM Event e
LEFT JOIN Registration r ON e.EventID = r.EventID
GROUP BY e.EventID, e.EventName
ORDER BY NumRegistrations DESC;
*/

------------------------------------------------------------
-- 2. Cursor example (commented) — loop through events and update status
------------------------------------------------------------

/*
DELIMITER $$
CREATE PROCEDURE UpdateEventStatusCursor()
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE v_event INT;
    DECLARE cur1 CURSOR FOR SELECT EventID FROM Event WHERE EventDate >= CURDATE();
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;

    OPEN cur1;
    read_loop: LOOP
        FETCH cur1 INTO v_event;
        IF done THEN
            LEAVE read_loop;
        END IF;
        -- example action: insert a status check record
        INSERT INTO EventStatus (StatusID, EventID, AdminID, StatusCheckTime, ResourcesAchieved, EmergencyCircumstances, OverallStatus, Remarks)
        VALUES (NULL, v_event, 1, NOW(), TRUE, 'None', 'Checked', 'Auto-check by procedure');
    END LOOP;
    CLOSE cur1;
END$$
DELIMITER ;
-- CALL UpdateEventStatusCursor();
*/

------------------------------------------------------------
-- 3. Triggers (examples)
------------------------------------------------------------

/*
-- Trigger: after inserting a QRScan, mark entry granted or not in Registration (example action)
DELIMITER $$
CREATE TRIGGER trg_after_qrscan_insert
AFTER INSERT ON QRScan
FOR EACH ROW
BEGIN
    -- If scan is valid and entry granted, update attendee registration status to 'Checked-In'
    IF NEW.ScanResult = 'Valid' AND NEW.EntryGranted = TRUE THEN
        UPDATE Attendee a
        JOIN Registration r ON a.AttendeeID = r.AttendeeID AND r.EventID = NEW.EventID
        SET a.RegistrationStatus = 'Checked-In', r.Paid = r.Paid
        WHERE a.AttendeeID = NEW.AttendeeID;
    END IF;
END$$
DELIMITER ;
*/

------------------------------------------------------------
-- 4. Stored procedures / functions (examples)
------------------------------------------------------------

/*
-- Procedure to register an attendee for an event (inserts in Registration; checks capacity)
DELIMITER $$
CREATE PROCEDURE RegisterAttendee(IN p_event INT, IN p_attendee INT, OUT p_result VARCHAR(100))
BEGIN
    DECLARE v_count INT DEFAULT 0;
    SELECT COUNT(*) INTO v_count FROM Registration WHERE EventID = p_event;
    DECLARE v_capacity INT;
    SELECT Capacity INTO v_capacity FROM Venue v JOIN Event e ON v.VenueID = e.VenueID WHERE e.EventID = p_event;

    IF v_count < v_capacity THEN
        INSERT INTO Registration (RegID, EventID, AttendeeID, Paid, RegistrationDate)
        VALUES (NULL, p_event, p_attendee, FALSE, CURDATE());
        SET p_result = 'Registered';
    ELSE
        SET p_result = 'Event Full';
    END IF;
END$$
DELIMITER ;
-- CALL RegisterAttendee(100, 205, @res); SELECT @res;
*/

------------------------------------------------------------
-- 5. Views (examples)
------------------------------------------------------------

/*
-- View: event summary with number of registrations and remaining capacity
CREATE VIEW vw_event_summary AS
SELECT e.EventID, e.EventName, e.EventDate, v.VenueName, e.ExpectedAttendees,
       (SELECT COUNT(*) FROM Registration r WHERE r.EventID = e.EventID) AS Registrations,
       (v.Capacity - (SELECT COUNT(*) FROM Registration r WHERE r.EventID = e.EventID)) AS RemainingCapacity
FROM Event e
JOIN Venue v ON e.VenueID = v.VenueID;

-- SELECT * FROM vw_event_summary;
*/

------------------------------------------------------------
-- 6. Misc commented queries and helpers 
------------------------------------------------------------

/*
-- Find volunteers assigned per event
SELECT e.EventID, e.EventName, COUNT(ra.AssignID) AS Volunteers
FROM Event e
LEFT JOIN RoleAssignment ra ON e.EventID = ra.EventID AND ra.AssignedRole LIKE '%Volunteer%'
GROUP BY e.EventID, e.EventName;

-- Update: enable location sharing for an attendee
UPDATE Attendee SET LocationSharingEnabled = TRUE WHERE AttendeeID = 201;

-- Delete test data (commented)
DELETE FROM QRScan WHERE ScanID > 1000;
*/

-- End of queries_and_triggers.sql
