USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[VALIDAREXISTENCIAS]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 27-09-2007
-- Description:	Proceso que se encarga de validar 
--	existencias segun items del pedido.  Si son
--	validas, se reservan los items, sino, se
--	marcan items los agotados
-- =============================================
CREATE PROCEDURE [dbo].[VALIDAREXISTENCIAS]
	@ID_PEDIDO_TEMPORAL AS NUMERIC(18,0)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@ESTADO_PEDIDO AS SMALLINT,
	@AGOTADOS AS NUMERIC(18,0);

	--Averiguar por el estado del pedido para verificar que
	--no haya sido ya procesado
	SELECT @ESTADO_PEDIDO=idEstado
	FROM dbo.PedidosTemporales WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL

	--Obtener el número de productos agotados
	SELECT @AGOTADOS = COUNT(IT.idItemTemporal)
	FROM dbo.Productos P, dbo.ItemsTemporales IT
	WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
	AND IT.numValor IS NULL
	AND IT.idProducto = P.idProducto
	AND P.blnAgotado = 1
	AND IT.numCantidad > P.numCantidad
	--Validar agotados
	IF (@AGOTADOS > 0)
	BEGIN
		--Marcar Items agotados
		UPDATE IT SET IT.blnAgotado = 1
		FROM dbo.Productos P, dbo.ItemsTemporales IT
		WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		AND IT.numValor IS NULL
		AND IT.idProducto = P.idProducto
		AND P.blnAgotado = 1
		AND IT.numCantidad > P.numCantidad
		--Responder que hay agotados
		SELECT 0
		RETURN
	END
	ELSE
	BEGIN
		--Separar cantidades
		UPDATE P SET P.numCantidad = P.numCantidad - IT.numCantidad
		FROM dbo.ItemsTemporales IT, dbo.Productos P
		WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		AND IT.numValor IS NULL
		AND IT.idProducto = P.idProducto
		AND P.blnAgotado = 1
		--Marcar pedido como procesado
		UPDATE dbo.PedidosTemporales SET idEstado = 10
		WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		--Actualizar precios e iva en los items
		UPDATE IT SET IT.numValor = P.numValor,
		IT.numIVA = P.numIVA
		FROM dbo.ItemsTemporales IT, dbo.Productos P
		WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		AND IT.numValor IS NULL
		AND IT.idProducto = P.idProducto
		--Marcar productos agotados
		UPDATE P SET P.idEstado = 5
		FROM dbo.ItemsTemporales IT, dbo.Productos P
		WHERE IT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		AND IT.numValor IS NULL
		AND IT.idProducto = P.idProducto
		AND P.blnAgotado = 1
		AND P.numCantidad = 0
	END
	
    -- Insert statements for procedure here
	SELECT 1
END


GO
