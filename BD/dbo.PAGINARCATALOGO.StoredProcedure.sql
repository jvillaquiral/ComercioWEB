USE [DBSQLVILLATECNO2]
GO
/****** Object:  StoredProcedure [dbo].[PAGINARCATALOGO]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jairo Villaquiral
-- Create date: 27-09-2007
-- Description:	Proceso que retorna la consulta
-- paginada de productos según el número de página 
-- y el número de productos por página
-- =============================================
CREATE PROCEDURE [dbo].[PAGINARCATALOGO]
	@FILTRO AS NVARCHAR(200),
	@PAGINA AS INT,
	@REGISTROSXPAGINA AS INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE  
	@TOTALPAGINAS AS INT,
	@TOTALREGISTROS AS INT,
	@LIMITEINFERIOR AS INT,
	@LIMMITESUPERIOR AS INT,
	@SENTENCIA AS NVARCHAR(600);

	--Crear tabla temporal
	CREATE TABLE #CATALOGO_PAGINADO(
	idRegistro numeric(18, 0) IDENTITY(1,1) NOT NULL,
	idProducto numeric(18, 0),
	varNombre varchar(250),
	numValor numeric(21, 3),
	varImagen varchar(250))

	--Validar filtro nulo
	IF (@FILTRO IS NULL)
		SET @FILTRO = ' '

	--Construir consulta
	SET @SENTENCIA = 'INSERT INTO #CATALOGO_PAGINADO SELECT idProducto, ' +
		'varNombre, numValor, varImagen ' +
		'FROM Productos WHERE (idEstado = 3) ' + @FILTRO

	--Ejecutar constula
	EXEC sp_executesql @SENTENCIA
	
	--Obtener total de registros de consulta
	SELECT @TOTALREGISTROS = COUNT(idRegistro) FROM #CATALOGO_PAGINADO

	--Calcular número total de páginas
	SET @TOTALPAGINAS = @TOTALREGISTROS % @REGISTROSXPAGINA
	IF (@TOTALPAGINAS=0)
		SET @TOTALPAGINAS = @TOTALREGISTROS / @REGISTROSXPAGINA
	ELSE
		SET @TOTALPAGINAS = (@TOTALREGISTROS / @REGISTROSXPAGINA) + 1

	--Validar página
		

	--Calcular límite inferior y superior
	SET @LIMITEINFERIOR = ((@PAGINA -1) * @REGISTROSXPAGINA) +1
	SET @LIMMITESUPERIOR = @PAGINA * @REGISTROSXPAGINA

	--Generar consulta
	SELECT idProducto, varNombre, numValor, varImagen
	FROM #CATALOGO_PAGINADO WHERE idRegistro >= @LIMITEINFERIOR
	AND idRegistro <= @LIMMITESUPERIOR ORDER BY idRegistro

	--Borrar tabla temporal
	DROP TABLE #CATALOGO_PAGINADO
END


GO
