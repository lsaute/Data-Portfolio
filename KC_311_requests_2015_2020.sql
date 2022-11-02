--In the following queries, I am cleaning a dataset that contains service request data from the 311 call center in Kansas City, MO from 2015 - 2020.
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

--Updating neighborhoods
UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = '18th And Vine And Downtown East'
WHERE neighborhood = '18th And Vine And Downtown Eas';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Blenheim Square Research Hospital'
WHERE neighborhood = 'Blenheim Square Research Hospi';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Central Blue Valley And Park Tower Gardens'
WHERE neighborhood = 'Central Blue Valley And Park T';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Country Club Estates And Big Shoal'
WHERE neighborhood = 'Country Club Estates And Big S';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Country Club District'
WHERE neighborhood = 'Country Club';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Linden Hills And Indian Heights'
WHERE neighborhood = 'Linden Hills And Indian Height';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Line Creek And Northern Heights'
WHERE neighborhood = 'Line Creek And Northern Height';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Marlborough Heights/Marlborough Pride'
WHERE neighborhood = 'Marlborough Heights/Marlboroug';

UPDATE dbo.KC_311_Requests_2007_2021
SET neighborhood = 'Palestine West And Oak Park Northeast'
WHERE neighborhood = 'Palestine West And Oak Park No';

--Updating county names and zip codes
SELECT *
FROM dbo.KC_311_Requests_2007_2021
WHERE zip_code = 64101

UPDATE dbo.KC_311_Requests_2007_2021
SET county = 'Jackson'
WHERE zip_code = 64101
	OR zip_code = 64102
	OR zip_code = 64105
	OR zip_code = 64106
	OR zip_code = 64108
	OR zip_code = 64109
	OR zip_code = 64110
	OR zip_code = 64111
	OR zip_code = 64112
	OR zip_code = 64113
	OR zip_code = 64114
	OR zip_code = 64120
	OR zip_code = 64123
	OR zip_code = 64124
	OR zip_code = 64125
	OR zip_code = 64126
	OR zip_code = 64127
	OR zip_code = 64128
	OR zip_code = 64129
	OR zip_code = 64130
	OR zip_code = 64131
	OR zip_code = 64132
	OR zip_code = 64133
	OR zip_code = 64134
	OR zip_code = 64136
	OR zip_code = 64137
	OR zip_code = 64138
	OR zip_code = 64139
	OR zip_code = 64145
	OR zip_code = 64146
	OR zip_code = 64149;

UPDATE dbo.KC_311_Requests_2007_2021
SET county = 'Platte'
WHERE zip_code = 64151
	OR zip_code = 64152
	OR zip_code = 64153
	OR zip_code = 64154;

UPDATE dbo.KC_311_Requests_2007_2021
SET county = 'Jackson'
WHERE zip_code = 'ackson';

--deleting records created before 2015
DELETE FROM dbo.KC_311_Requests_2007_2021
WHERE creation_date < '2015-01-01';

--deleting records created after 2020
DELETE FROM dbo.KC_311_Requests_2007_2021
WHERE creation_date > '2020-12-31';

--checking for duplicate departments
SELECT DISTINCT department
FROM dbo.KC_311_Requests_2007_2021
ORDER BY department asc;

--combining duplicate departments
UPDATE dbo.KC_311_Requests_2007_2021
SET department = 'Parks & Rec'
WHERE department = 'Parks & Recreation'
	OR department = 'Parks and Rec';

--checking for and combining duplicate categories
SELECT DISTINCT category
FROM dbo.KC_311_Requests_2007_2021
ORDER BY category asc;

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