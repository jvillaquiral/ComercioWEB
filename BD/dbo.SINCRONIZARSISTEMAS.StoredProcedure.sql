USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[SINCRONIZARSISTEMAS]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO












-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 17-01-2011
-- Description:	Proceso que se encarga de sincrinizar 
--	el sitio WEB con el sistema de cotizaciones.
-- =============================================
CREATE PROCEDURE [dbo].[SINCRONIZARSISTEMAS]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@MAX_ID_PRODUCTO AS NUMERIC(18,0),
	@PROCENTAJE_PLATA AS NUMERIC(21,3),
	@DESCRIPCION_GENERAL AS VARCHAR(4000);

	--Se inicializa el valor del porcentaje de comisión plata
	--SET @PROCENTAJE_PLATA = 0.055;
	SET @PROCENTAJE_PLATA = 0.0;
	
	--Fijar descripción general
	SET @DESCRIPCION_GENERAL = 'Este es un muy buen producto para tu consola, nuevo, sellado y ' +
	'original en el que encontrarás diversión total, además de una muy buena calidad de producto.' +
	'<br /><br />Es la oportunidad para que tengas los últimos estrenos y los clásicos en videojuegos ' +
	'y accesorios para que te diviertas y compartas con tu familia y amigos. <br /><br />Este producto te ' +
	'lo trae Villatecno a un muy buen precio y con la calidad de siempre que han resaltado nuestros clientes, ' +
	'siempre buscando la satisfacción, la responsabilidad y el cumplimiento que buscaban. <br /><br />Recuerda ' +
	'comprar siempre original, no te dejes llevar por imitaciones, productos usados o de mala calidad.';

	--Se sincronizan precios y cantidades de los productos ya existentes
	UPDATE P SET P.numValor = ROUND(C.numPrecioD / (1 - @PROCENTAJE_PLATA),-3), 
	P.numCantidad = C.numCantidad
	FROM dbo.Productos P, dbo.Cotizaciones C
	WHERE P.varReferencia = C.varReferencia

	--Encontrar el máximo consecutivo de la tabla productos
	SELECT @MAX_ID_PRODUCTO = MAX(P.idProducto)
	FROM dbo.Productos P
	
	--Crear los nuevos productos
	INSERT INTO dbo.Productos
	SELECT C.varReferencia, C.varNombre, @DESCRIPCION_GENERAL, C.idCategoria, ROUND(C.numPrecioD / (1 - @PROCENTAJE_PLATA),-3), 0, 
	C.numCantidad,	3, C.varReferencia+'.jpg', getdate(), 0, null, null, null
	FROM dbo.Cotizaciones C
	WHERE C.varReferencia NOT IN (SELECT P.varReferencia FROM dbo.Productos P)
	AND (C.idCategoria < 18 OR C.idCategoria > 27)	
	
                     --Crear las fotos
	INSERT INTO dbo.Fotos SELECT P.idProducto, P.varReferencia + '-1.jpg', '', 1 FROM dbo.Productos P WHERE P.idProducto > @MAX_ID_PRODUCTO
	INSERT INTO dbo.Fotos SELECT P.idProducto, P.varReferencia + '-2.jpg', '', 2 FROM dbo.Productos P WHERE P.idProducto > @MAX_ID_PRODUCTO
	INSERT INTO dbo.Fotos SELECT P.idProducto, P.varReferencia + '-3.jpg', '', 3 FROM dbo.Productos P WHERE P.idProducto > @MAX_ID_PRODUCTO
	INSERT INTO dbo.Fotos SELECT P.idProducto, P.varReferencia + '-4.jpg', '', 4 FROM dbo.Productos P WHERE P.idProducto > @MAX_ID_PRODUCTO
	
	--Actualizar agotados
	UPDATE P SET P.idEstado = 5 FROM dbo.Productos P WHERE P.idEstado <> 4 AND P.numCantidad = 0
	
	--Actualizar activos
	UPDATE P SET P.idEstado = 3 FROM dbo.Productos P WHERE P.idEstado <> 4 AND P.numCantidad > 0


END
















GO
