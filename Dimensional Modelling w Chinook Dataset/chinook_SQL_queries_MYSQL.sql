use chinook;
-- 1
select sum(il.UnitPrice * il.Quantity) as "total sales"
from invoiceline as il;

-- 2
select i.BillingCountry, sum(il.UnitPrice * il.Quantity) as "Sales per country"
from invoice as i, invoiceline as il
where i.InvoiceId=il.InvoiceId
group by i.BillingCountry
order by sum(il.UnitPrice * il.Quantity) desc;

-- 3.1
select i.BillingState, sum(il.UnitPrice * il.Quantity) as "Sales per State"
from invoice as i, invoiceline as il
where i.InvoiceId=il.InvoiceId
group by i.BillingState
order by sum(il.UnitPrice * il.Quantity) desc;

-- 3.2
select i.BillingCity, sum(il.UnitPrice * il.Quantity) as "Sales per city"
from invoice as i, invoiceline as il
where i.InvoiceId=il.InvoiceId
group by i.BillingCity
order by sum(il.UnitPrice * il.Quantity) desc;

-- 4
select c.FirstName, c.LastName, sum(i.Total) as 'Total Sales'
from customer as c, invoice as i
where c.CustomerId = i.CustomerId
group by c.FirstName, c.LastName
order by  sum(i.Total) desc; 

-- 5
SELECT a.Name AS ArtistName, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Artist AS a
JOIN Album AS al ON a.ArtistId = al.ArtistId
JOIN Track AS t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine AS il ON t.TrackId = il.TrackId
GROUP BY a.Name
order by TotalSales desc ;

-- 6
SELECT al.Title AS AlbumTitle, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Album AS al
JOIN Track AS t ON al.AlbumId = t.AlbumId
JOIN InvoiceLine AS il ON t.TrackId = il.TrackId
GROUP BY al.Title
order by TotalSales desc;

-- 7
SELECT e.FirstName, e.LastName, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Employee AS e
JOIN Customer AS c ON e.EmployeeId = c.SupportRepId
JOIN Invoice AS i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine AS il ON i.InvoiceId = il.InvoiceId
GROUP BY e.EmployeeId, e.FirstName, e.LastName;

-- 8
SELECT mt.Name AS MediaType, COUNT(il.TrackId) AS TotalTracksBought, SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM MediaType AS mt
JOIN Track AS t ON mt.MediaTypeId = t.MediaTypeId
JOIN InvoiceLine AS il ON t.TrackId = il.TrackId
GROUP BY mt.MediaTypeId, mt.Name
order by TotalRevenue desc;

-- 9
select g.Name, sum(il.UnitPrice * il.Quantity) AS 'Total Sales'
from track as t, genre as g, invoiceline as il
where t.GenreId = g.GenreId and t.TrackId = il.TrackId
group by g.Name
order by sum(il.UnitPrice * il.Quantity) desc;

-- 10
SELECT c.Company, SUM(il.UnitPrice * il.Quantity) AS TotalSales
FROM Customer AS c
JOIN Invoice AS i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine AS il ON i.InvoiceId = il.InvoiceId
GROUP BY c.Company
order by TotalSales desc;


