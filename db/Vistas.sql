CREATE VIEW Vista_Productos_Factura AS
SELECT PF.FacturaID, P.ProductId, P.ProductName, P.Presentation, P.Size, P.Pr_weight, P.Price, P.MinInventoryQuantity, P.ActualInventoryInt, P.MaxWareHouseQuantity
FROM ProductsXFactura PF
INNER JOIN Products P ON PF.ProductId = P.ProductId;


