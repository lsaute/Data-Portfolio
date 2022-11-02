--In the following queries, I am cleaning up a dataset that contains service request data from the 311 call center in Kansas City, MO from 2007 - March 2021.
--Original data can be found here: https://data.kcmo.org/311/311-Call-Center-Service-Requests-2007-March-2021/7at3-sxhp
--Next step is to use the clean data to prepare data visualizations in Tableau.

SELECT *
FROM dbo.KC_311_Requests_2007_2021
ORDER BY creation_date desc;

--data cleanup
ALTER TABLE dbo.KC_311_Requests_2007_2021
DROP COLUMN address_with_geocode, 
	closed_month, 
	closed_year, 
	creation_month, 
	creation_year,
	case_url,
	_30_60_90_Days_Open_Window,
	parcel_id_no;

--deleting the one record from 2006
DELETE FROM dbo.KC_311_Requests_2007_2021
WHERE case_id = '2006000002';

--deleting records created after March 2021
DELETE FROM dbo.KC_311_Requests_2007_2021
WHERE creation_date > '2021-03-31';

--checking for duplicate departments
SELECT DISTINCT department
FROM dbo.KC_311_Requests_2007_2021
ORDER BY department asc;

--combining duplicate departments
UPDATE dbo.KC_311_Requests_2007_2021
SET department = 'Parks & Rec'
WHERE department = 'Parks & Recreation'
	OR department = 'Parks and Rec';

--checking for duplicate categories
SELECT DISTINCT category
FROM dbo.KC_311_Requests_2007_2021
ORDER BY category asc;

--combining duplicate categories
UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Animal'
WHERE category = 'Animals / Pets';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Parks & Rec'
WHERE category = 'Park' 
	OR category = 'Park Maintenance' 
	OR category = 'Boulevard Parks and Rec'
	OR category = 'Parks & Recreation';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Property & Nuisance Violations'
WHERE category = 'Nuisance Violations' 
	OR category = 'Property Violations'
	OR category = 'Mowing / Weeds'
	OR category = 'Noise Control'
	OR category = 'Weeds'
	OR category = 'Graffiti'
	OR category = 'Markings';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Sidewalks / Curbs / Ditch'
WHERE category = 'Sidewalk' 
	OR category = 'Ditch';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Trash / Recycling'
WHERE category = 'Trash'
	OR category = 'Bulky Appointment';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Streets / Roadways / Alleys'
WHERE category = 'Street'
	OR category = 'Street Sign'
	OR category = 'Street Light'
	OR category = 'Traffic Sign'
	OR category = 'Traffic Study'
	OR category = 'Right of Way'
	OR category = 'Lights / Signals'
	OR category = 'Bridge'
	OR category = 'Guard Rail'
	OR category = 'Signal'
	OR category = 'Snow & Ice'
	OR category = 'Sealing'
	OR category = 'Sweeping'
	OR category = 'Steel Plate'
	OR category = 'Pothole'
	OR category = 'Signs';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Parking'
WHERE category = 'Parking Meter'
	OR category = 'Downtown Parking';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Water & Sewer'
WHERE category = 'Sewer'
	OR category = 'Storm Water'
	OR category = 'Storm Water / Sewer'
	OR category = 'Wastewater'
	OR category = 'Water Leak'
	OR category = 'Water Quality'
	OR category = 'Water Main Break'
	OR category = 'Water Services'
	OR category = 'Water';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Public Health'
WHERE category = 'Health'
	OR category = 'Food Protection';

UPDATE dbo.KC_311_Requests_2007_2021
SET category = 'Vehicles / Parking'
WHERE category = 'Vehicle'
	OR category = 'Parking';

--Find types of requests in the Parks & Rec category
SELECT DISTINCT type
FROM dbo.KC_311_Requests_2007_2021
WHERE category = 'Parks & Rec'
ORDER BY type asc;
