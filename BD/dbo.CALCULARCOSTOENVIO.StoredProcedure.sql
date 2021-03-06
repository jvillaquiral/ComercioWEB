USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[CALCULARCOSTOENVIO]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 27-09-2007
-- Description:	Proceso que se encarga de calcular 
--	el costo de envío para el pedido.
-- =============================================
CREATE PROCEDURE [dbo].[CALCULARCOSTOENVIO]
	@ID_PEDIDO_TEMPORAL AS NUMERIC(18,0)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@ID_COBRO_ENVIO AS SMALLINT,
	@VALOR_ENVIO_GENERAL AS NUMERIC(18,0),
	@TOTAL_ENVIO AS NUMERIC(18,0),
	@CANTIDAD_ITEMS AS NUMERIC(18,0);

	--Se inicializa el valor del envio
	SET @TOTAL_ENVIO = 0;

	--Se busca obtener el tipo de cobro de envío que tiene
	--configurado la empresa y el valor general del envío
	SELECT @ID_COBRO_ENVIO=idCobroEnvio, @VALOR_ENVIO_GENERAL=varValorEnvioGeneral
	FROM dbo.Configuraciones

	--Se valida si no se tiene configurado envío gratis
	IF (@ID_COBRO_ENVIO <> 3)
	BEGIN
		--Se consulta el costo de envio por ciudad
		SELECT @TOTAL_ENVIO = C.numValorEnvio
		FROM dbo.PedidosTemporales PT, dbo.Ciudades C
		WHERE PT.idPedidoTemporal = @ID_PEDIDO_TEMPORAL
		AND PT.idCiudadEnvio = C.idCiudad
		IF (@TOTAL_ENVIO IS NULL)
			SET @TOTAL_ENVIO=@VALOR_ENVIO_GENERAL;
		--Validar si el cobro del envio es por cantidad
		IF (@ID_COBRO_ENVIO = 1)
		BEGIN
			SELECT @CANTIDAD_ITEMS = SUM(numCantidad)
			FROM dbo.ItemsTemporales
			WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL
			--Multiplicar cantidad por el costo del envio
			SET @TOTAL_ENVIO = @TOTAL_ENVIO*@CANTIDAD_ITEMS
		END
	END
	--Actualizar el costo del envio en el pedido
	UPDATE dbo.PedidosTemporales
	SET numValorEnvio = @TOTAL_ENVIO
	WHERE idPedidoTemporal = @ID_PEDIDO_TEMPORAL
END


GO
