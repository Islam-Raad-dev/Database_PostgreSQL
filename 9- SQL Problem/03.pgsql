-- Get the number of vehicles made between 1950 and 2000

SELECT count(*) AS NumberOfVehicle
FROM VEHICLEDETAILS V 
WHERE V."Year" BETWEEN 1950 AND 2000
