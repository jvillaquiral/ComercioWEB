USE [DBSQLVILLATECNO2]
GO
/****** Object:  UserDefinedFunction [dbo].[recalcularNuevoPrecio]    Script Date: 13/04/2016 11:22:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[recalcularNuevoPrecio] 
(
	@idCotizacion numeric(18,0),
	@numUtilidad numeric(21,3),
	@numCosto numeric(21,3), 
	@numFleteInt numeric(21,3), 
	@numPeso numeric(21,3)
)
RETURNS numeric(21,3)
AS
BEGIN
	-- Declarar campos de tabla
	DECLARE 
	@numPrecio numeric(21,3), @numFlete numeric(21,3), @numTasaCambio numeric(21,3),
	@numSeguro numeric(21,3), @numImpuesto numeric(21,3), @numDomicilio numeric(21,3)
	 

	-- Obtener tasa de cambio
	SELECT @numTasaCambio = numValor
	FROM dbo.Constantes WHERE idConstante = 1

	-- Obtener flete
	SELECT @numFlete = (numValor * @numPeso)
	FROM dbo.Constantes WHERE idConstante = 3

	-- Obtener seguro
	SELECT @numSeguro = (numValor * @numCosto)
	FROM dbo.Constantes WHERE idConstante = 2

	-- Obtener impuesto
	SELECT @numImpuesto = ((@numCosto + (@numPeso * 0.5) + @numSeguro) * numValor)
	FROM dbo.Constantes WHERE idConstante = 7

	-- Obtener costo domicilio
	SELECT @numDomicilio =  (@numFlete * numValor)
	FROM dbo.Constantes WHERE idConstante = 4

	-- Obtener costo
	SET @numPrecio = ((@numCosto + @numSeguro + @numFlete + @numImpuesto + @numDomicilio + @numFleteInt) * @numTasaCambio)
	
	-- Retornar precio
	RETURN (@numPrecio + @numUtilidad)

END


GO
