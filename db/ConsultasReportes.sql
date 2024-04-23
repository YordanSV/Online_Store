----consulta de compras de productos vendidos por mes y año

CREATE VIEW VWPurchaseSummaryByYearMonth AS
SELECT YEAR(p.PurchaseDate) AS Year,
       MONTH(p.PurchaseDate) AS Month,
       pr.ProductName,
       SUM(pe.Quantity) AS TotalQuantity,
       SUM(pe.Quantity * pr.Price) AS TotalAmount
FROM Purchases p
JOIN ProductsXFactura pxf ON p.PurchaseID = pxf.ProductId
JOIN Products pr ON pxf.ProductID = pr.ProductID
JOIN ProductEntries pe ON pr.ProductID = pe.ProductID
GROUP BY YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), pr.ProductName;
GO

------consulta de compras por sector
CREATE VIEW VWProductSalesBySector AS
SELECT 
    YEAR(p.PurchaseDate) AS Year,
    MONTH(p.PurchaseDate) AS Month,
    c.CategoryId,
    cu.Canton,
    cu.District,
    SUM(p.TotalPurchase) AS TotalSales
FROM 
    Purchases p
JOIN 
    Costumers cu ON p.UserId = cu.ID
JOIN 
    Ids i ON cu.ID = i.Identification
JOIN 
    Categories c ON p.PurchaseID = c.CategoryID
GROUP BY 
    YEAR(p.PurchaseDate), MONTH(p.PurchaseDate), c.CategoryId, cu.Canton, cu.District;
GO
	-------
	-------- consulta de actividad del comprador para evaluar satisfaccion del cliente
Create view VWCOSTUMERACTIVITY AS
SELECT
P.UserId,
COUNT(*) AS TotalCompras,
AVG(P.Totalpurchase) AS PromedioCompra,
SUM(P.Totalpurchase) AS GastoTotal,
MIN(P.Purchasedate) AS PrimeraCompra,
MAX(P.Purchasedate) AS UltimaCompra
FROM
    Purchases P
GROUP BY
    P.UserId;
GO
