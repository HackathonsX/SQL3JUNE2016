SELECT SQLSatRegistrations.UserGUID, SQLSatRegistrations.EventName, RIGHT(SQLSatRegistrations.EventName,4) AS year, SQLSatRegistrations.City AS EventCity, SQLSatRegistrations.Country AS EventCountry, PASSmemberswithgeolocation.UserGUID, PASSmemberswithgeolocation.City AS MemCity, PASSmemberswithgeolocation.Country AS MemCountry
INTO TravelData
FROM SQLSatRegistrations AS t1
LEFT JOIN PASSmemberswithgeolocation AS t2
ON t1.UserGUID=t2.UserGUID;

SELECT COUNT(*) FROM TravelData WHERE MemCity = EventCity;
SELECT COUNT(*) FROM TravelData WHERE MemCity != EventCity AND MemCountry = EventCountry;
SELECT COUNT(*) FROM TravelData WHERE MemCity != EventCity AND MemCountry != EventCountry;
