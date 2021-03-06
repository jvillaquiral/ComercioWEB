USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[PEDIDOSABANDONADOS]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 03-10-2007
-- Description:	Proceso que se encarga de recuperar
-- cantidades de pedidos abandonados
-- =============================================
CREATE PROCEDURE [dbo].[PEDIDOSABANDONADOS]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE
	@FECHA_LIMITE AS DATETIME;
	
	--Crear tabla temporal
	CREATE TABLE #ITEMS_ABANDONADOS(
		idProducto numeric(18, 0) NOT NULL,
		numCantidad numeric(18, 0) NOT NULL
	)
	
	--Se obtiene fecha y hora de hace 30 minutos
	SET @FECHA_LIMITE = DATEADD(mi,-30,GETDATE());

	--Se llena la tabla temporal con los productos a reponer
	INSERT INTO #ITEMS_ABANDONADOS
	SELECT IT.idProducto,SUM(IT.numCantidad)
	FROM dbo.ItemsTemporales IT INNER JOIN
		dbo.PedidosTemporales PT ON 
		IT.idPedidoTemporal = PT.idPedidoTemporal
	WHERE PT.dtmFecha < @FECHA_LIMITE
	AND PT.idEstado = 10
	GROUP BY IT.idProducto

	--Recupero cantidades abandonadas en el inventario de productos
	UPDATE P SET P.idEstado = 3,
	P.numCantidad = P.numCantidad + IA.numCantidad
	FROM dbo.Productos P, #ITEMS_ABANDONADOS IA
	WHERE P.blnAgotado = 1
	AND P.idProducto = IA.idProducto

	--Se procede a eliminar pedidos abandonados 

	--Elimino cualificadores
	DELETE FROM dbo.CualificadoresItemsTemporales
	WHERE idItemTemporal IN (SELECT IT.idItemTemporal
	FROM dbo.PedidosTemporales PT INNER JOIN 
	dbo.ItemsTemporales IT ON 
	PT.idPedidoTemporal = IT.idPedidoTemporal
	WHERE PT.dtmFecha < @FECHA_LIMITE)
	
	--Elimino items temporales
	DELETE FROM dbo.ItemsTemporales
	WHERE idItemTemporal IN (SELECT IT.idItemTemporal
	FROM dbo.PedidosTemporales PT INNER JOIN 
	dbo.ItemsTemporales IT ON 
	PT.idPedidoTemporal = IT.idPedidoTemporal
	WHERE PT.dtmFecha < @FECHA_LIMITE)

	--Elimino pedidos temporales
	DELETE FROM dbo.PedidosTemporales
	WHERE dtmFecha < @FECHA_LIMITE

	DROP TABLE #ITEMS_ABANDONADOS
END


GO
