USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Fotos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fotos](
	[idFoto] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[varImagen] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](800) NOT NULL,
	[idOrden] [smallint] NOT NULL,
 CONSTRAINT [PK_Fotos] PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Fotos]  WITH CHECK ADD  CONSTRAINT [FK_Fotos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Fotos] CHECK CONSTRAINT [FK_Fotos_Productos]
GO
