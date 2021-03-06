USE [DBSQLVILLATECNO2]
GO
/****** Object:  UserDefinedFunction [dbo].[recalcularPrecio]    Script Date: 13/04/2016 11:22:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[recalcularPrecio] 
(
	@idCotizacion numeric(18,0),
	@numUtilidad numeric(21,3)
)
RETURNS numeric(21,3)
AS
BEGIN
	-- Declarar campos de tabla
	DECLARE 
	@numCosto numeric(21,3), @numFleteInt numeric(21,3), @numPeso numeric(21,3),
	@numPrecio numeric(21,3), @numFlete numeric(21,3), @numTasaCambio numeric(21,3),
	@numSeguro numeric(21,3), @numImpuesto numeric(21,3), @numDomicilio numeric(21,3)
	 

	-- Obtener campos de la cotizacion
	SELECT @numCosto = numCosto, @numFleteInt = numFleteInt, @numPeso = numPeso
	FROM dbo.Cotizaciones WHERE idCotizacion = @idCotizacion

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
