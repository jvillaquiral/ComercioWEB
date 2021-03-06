USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[ELIMINARAGOTADOS]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 08-10-2007
-- Description:	Proceso que se encarga de 
--	eliminar del pedido temporal, los productos agotados
-- =============================================
CREATE PROCEDURE [dbo].[ELIMINARAGOTADOS]
	@ID_PEDIDO_TEMPORAL AS NUMERIC(18,0)
AS
BEGIN
	SET NOCOUNT ON;
	--Cualificadores
	DELETE FROM dbo.CualificadoresItemsTemporales
	WHERE idItemTemporal IN (SELECT idItemTemporal FROM dbo.ItemsTemporales 
		WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL AND blnAgotado = 1)

	--Items
	DELETE FROM dbo.ItemsTemporales
	WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL
	AND blnAgotado = 1
END


GO
