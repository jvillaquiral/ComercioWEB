USE [DBSQLVILLATECNO2]
GO
/****** Object:  UserDefinedFunction [dbo].[generarHTML]    Script Date: 13/04/2016 11:22:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [dbo].[generarHTML] 
(
	@varReferencia varchar(50),
	@varNombre varchar(250),
	@varNivel1 varchar(250),
	@varNivel2 varchar(250)
)
RETURNS varchar(3000)
AS
BEGIN
	DECLARE @varRespuesta varchar(3000)

	SET @varRespuesta = '<html dir="ltr"><head><title></title></head><body><div style="text-align: center; background-color: #000000;"><u><font color="#0000ff"><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/Enc1.jpg" /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/Enc2.jpg" /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/Enc3.jpg" /><br /><br /></u><strong><span id="btAsinTitle" style="font-family: Verdana; font-size: 26px; color: #ffffff; display: inline">nombredelproducto</span></strong><br /><u><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/referencia.jpg" /><br /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/PANTALLAS/referencia-1.jpg" /><br /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/PANTALLAS/referencia-2.jpg" /><br /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/PANTALLAS/referencia-3.jpg" /><br /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/PANTALLAS/referencia-4.jpg" /><br /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Texto.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/General/TitOProd.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Juegos1.gif" /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Juegos2.gif" /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Juegos3.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Contenido.gif" /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/TextoOtros.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/General/Comoypago.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/General/GarantiaEnvio.gif" /><br /><img alt="" www.mercadolibre.com.co="" jm="" src="http://www.villatecno.com/Imagenes/ML/nivel1/nivel2/Promocion.jpg" /></font></u></div></body></html>'

	--Reemplazar nivel 1
	SET @varRespuesta = REPLACE(@varRespuesta,'nivel1',@varNivel1)

	--Reemplazar nivel 2
	SET @varRespuesta = REPLACE(@varRespuesta,'nivel2',@varNivel2)

	--Reemplazar referencia
	SET @varRespuesta = REPLACE(@varRespuesta,'referencia',@varReferencia)

	--Reemplazar nombre
	SET @varRespuesta = REPLACE(@varRespuesta,'nombredelproducto',@varNombre)

	-- Return the result of the function
	RETURN @varRespuesta

END






GO
