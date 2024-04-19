----consulta de compras de productos vendidos por mes y año

SELECT YEAR(p.PurchaseDate) AS Year,
       MONTH(p.PurchaseDate) AS Month,
       pr.ProductName,
       SUM(pe.Quantity) AS TotalQuantity,
       SUM(pe.Quantity * pr.Price) AS TotalAmount
FROM Purchases p
JOIN ProductsXFactura pxf ON p.PurchaseID = pxf.ProductId
JOIN Products pr ON pxf.ProductID = pr.ProductID
JOIN ProductEntries pe ON pr.ProductID = pe.ProductID
GROUP BY YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), pr.ProductName
ORDER BY Year, Month;


------consulta de productos vendidos por sector
SELECT 
    YEAR(p.PurchaseDate) AS Year,
    MONTH(p.PurchaseDate) AS Month,
    c.CategoryId,
    SUM(p.TotalPurchase) AS TotalSales
FROM 
    Purchases p
JOIN 
    Costumers cu ON p.UserId = cu.ID
JOIN 
    Ids i ON cu.ID = i.Identification
JOIN 
    Categories c ON cu.ID = c.CategoryID
GROUP BY 
    YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), c.CategoryId
ORDER BY 
    Year, Month;


	-------