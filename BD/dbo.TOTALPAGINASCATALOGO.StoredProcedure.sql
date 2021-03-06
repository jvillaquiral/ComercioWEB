USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[TOTALPAGINASCATALOGO]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 27-09-2007
-- Description:	Proceso que retorna el número total
-- de paginas según la consulta del catálogo
-- =============================================
CREATE PROCEDURE [dbo].[TOTALPAGINASCATALOGO]
	@FILTRO AS NVARCHAR(200),
	@REGISTROSXPAGINA AS INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@TOTALPAGINAS AS INT,
	@TOTALREGISTROS AS INT,
	@SENTENCIA AS NVARCHAR(600),
	@PARAMETROS AS NVARCHAR(100);

	--Validar filtro nulo
	IF (@FILTRO IS NULL)
		SET @FILTRO = ' '

	--Construir consulta
	SET @SENTENCIA = 'SELECT @TOTALREGISTROS=COUNT(idProducto) FROM Productos WHERE (idEstado = 3) ' + @FILTRO

	--Especificar el parámetro de salida
	SET @PARAMETROS = '@TOTALREGISTROS INT OUTPUT'

	--Ejecutar constula
	EXEC sp_executesql @SENTENCIA,@PARAMETROS,@TOTALREGISTROS OUTPUT
	
	--Calcular número total de páginas
	SET @TOTALPAGINAS = @TOTALREGISTROS % @REGISTROSXPAGINA
	IF (@TOTALPAGINAS=0)
		SET @TOTALPAGINAS = @TOTALREGISTROS / @REGISTROSXPAGINA
	ELSE
		SET @TOTALPAGINAS = (@TOTALREGISTROS / @REGISTROSXPAGINA) + 1

	--Retornar número de páginas
	SELECT @TOTALPAGINAS
END


GO
