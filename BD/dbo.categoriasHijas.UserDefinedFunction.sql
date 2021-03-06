USE [DBSQLVILLATECNO2]
GO
/****** Object:  UserDefinedFunction [dbo].[categoriasHijas]    Script Date: 13/04/2016 11:22:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[categoriasHijas]
(
	-- Add the parameters for the function here
	@idCateogoria numeric(18,0)
)
RETURNS varchar(200)
AS
BEGIN
	-- Declare the return variable here
	DECLARE 
	@strResultado varchar(200),
	@idCateogiraHija numeric(18,0)

	set @strResultado = RTRIM(LTRIM(STR(@idCateogoria)))

	--Crear un cursor con categorias hijas
	DECLARE CategoriasHijas_CURSOR CURSOR FOR
	select idCategoria
	from dbo.Categorias where idPadre = @idCateogoria

	open CategoriasHijas_CURSOR
	FETCH NEXT FROM CategoriasHijas_CURSOR INTO @idCateogiraHija
	
	--Borrar datos de las tablas de cada etiqueta
	WHILE @@FETCH_STATUS = 0
	BEGIN
		set @strResultado = @strResultado + ',' + dbo.categoriasHijas(@idCateogiraHija)
		FETCH NEXT FROM CategoriasHijas_CURSOR INTO @idCateogiraHija
	END

	close CategoriasHijas_CURSOR
	deallocate CategoriasHijas_CURSOR	

	-- Return the result of the function
	RETURN @strResultado

END


GO
