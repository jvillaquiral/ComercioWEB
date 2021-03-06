USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varReferencia] [varchar](50) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](4000) NULL,
	[idCategoria] [numeric](18, 0) NULL,
	[numValor] [numeric](21, 3) NOT NULL,
	[numIVA] [numeric](21, 3) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[varImagen] [varchar](250) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[blnAgotado] [bit] NOT NULL,
	[varArchivoAdjunto] [varchar](250) NULL,
	[idGenero] [numeric](18, 0) NULL,
	[dtmLanzamiento] [datetime] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados]
GO
ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Generos] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Generos]
GO
