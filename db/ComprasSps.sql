Create Procedure AgregarCompra
@IdProducto Int,
@IdFactura Int,
@Quantity Int
As 
Begin
insert into  ProductsXFactura(ProductId, FacturaID, Quantity) values
(@IdProducto, @IdFactura, @Quantity)

End;






