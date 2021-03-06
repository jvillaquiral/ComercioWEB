USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[PropiedadesProductos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropiedadesProductos](
	[idProducto] [numeric](18, 0) NOT NULL,
	[idPropiedad] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_PropiedadesProductos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idPropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PropiedadesProductos]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadesProductos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[PropiedadesProductos] CHECK CONSTRAINT [FK_PropiedadesProductos_Productos]
GO
ALTER TABLE [dbo].[PropiedadesProductos]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadesProductos_Propiedades] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedades] ([idPropiedad])
GO
ALTER TABLE [dbo].[PropiedadesProductos] CHECK CONSTRAINT [FK_PropiedadesProductos_Propiedades]
GO
