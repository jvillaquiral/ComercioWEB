USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[FINALIZARPEDIDO]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 28-09-2007
-- Description:	Proceso que se encarga transferir 
--	el pedido de las tablas temporales a las finales
-- =============================================
CREATE PROCEDURE [dbo].[FINALIZARPEDIDO]
	@ID_PEDIDO_TEMPORAL AS NUMERIC(18,0),
	@ID_TIPO_PAGO AS SMALLINT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@ID_PEDIDO AS NUMERIC(18,0),
	@SUBTOTAL AS NUMERIC(21,3),
	@IVA AS NUMERIC(21,3),
	@TOTAL AS NUMERIC(21,3),
	@NO_PEDIDO AS VARCHAR(6),
	@NUM_CARACTERES AS INT;

	--Obtener el subtotal e iva
	SELECT @SUBTOTAL=SUM(numCantidad * numValor),
	@IVA=SUM(IT.numCantidad * IT.numIVA)
	FROM ItemsTemporales IT
	WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL

	--Calcular el total parcial(sin costo de envio)
	SET @TOTAL = @SUBTOTAL + @IVA;
	
	--Registrar el pedido
	INSERT INTO dbo.Pedidos (idCliente,numValor,numIVA,
	    numEnvio,idTipoPago,idEstado,dtmFecha,
	    varNombreEnvio,varApellidoEnvio,varEmailEnvio,
	    idCiudadEnvio,varDireccionEnvio,varTelefonoEnvio)
    SELECT PT.idCliente, (@TOTAL + PT.numValorEnvio),@IVA,
		PT.numValorEnvio,@ID_TIPO_PAGO,6,getdate(),
		PT.varNombreEnvio,PT.varApellidoEnvio,PT.varEmailEnvio,
		PT.idCiudadEnvio,PT.varDireccionEnvio,PT.varTelefonoEnvio
	FROM dbo.PedidosTemporales PT
	WHERE PT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
	
	SET @ID_PEDIDO = CAST(scope_identity() AS numeric(18,0));

	SET @NO_PEDIDO = LTRIM(RTRIM(STR(@ID_PEDIDO)))
	SET @NUM_CARACTERES = LEN(@NO_PEDIDO)
	
	IF (@NUM_CARACTERES = 1)
		SET @NO_PEDIDO = '00000' + @NO_PEDIDO
	IF (@NUM_CARACTERES = 2)
		SET @NO_PEDIDO = '0000' + @NO_PEDIDO
	IF (@NUM_CARACTERES = 3)
		SET @NO_PEDIDO = '000' + @NO_PEDIDO
	IF (@NUM_CARACTERES = 4)
		SET @NO_PEDIDO = '00' + @NO_PEDIDO
	IF (@NUM_CARACTERES = 5)
		SET @NO_PEDIDO = '0' + @NO_PEDIDO

	--Actualiar el no de pedido
	UPDATE dbo.Pedidos SET varNoPedido = @NO_PEDIDO
	WHERE idPedido = @ID_PEDIDO

	--Registrar los items
	INSERT INTO dbo.Items (idPedido,idProducto,numCantidad,numValor,numIVA)
    SELECT @ID_PEDIDO,IT.idProducto,IT.numCantidad,IT.numValor,IT.numIVA
	FROM dbo.ItemsTemporales IT
	WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL

	--Registrar los cualificadores 
	INSERT INTO dbo.CualificadoresItems (idItem,idCualificador,varValor)
	SELECT I.idItem,CT.idCualificador,CT.varValor
	FROM dbo.Items I, dbo.CualificadoresItemsTemporales CT, dbo.ItemsTemporales IT
	WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
	AND IT.idItemTemporal = CT.idItemTemporal
	AND I.idPedido = @ID_PEDIDO
	AND I.idProducto = IT.idProducto

	--Eliminar pedido en tablas temporales
	
	--Cualificadores
	DELETE FROM dbo.CualificadoresItemsTemporales
	WHERE idItemTemporal IN (SELECT idItemTemporal FROM dbo.ItemsTemporales 
		WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL)

	--Items
	DELETE FROM dbo.ItemsTemporales
	WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL

	--Pedidos
	DELETE FROM dbo.PedidosTemporales 
	WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL	
	
	SELECT @ID_PEDIDO
END


GO
