USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[CualificadoresProductos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CualificadoresProductos](
	[idProducto] [numeric](18, 0) NOT NULL,
	[idCualificador] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CualificadoresProductos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idCualificador] ASC,
	[varValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CualificadoresProductos]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresProductos_Cualificadores] FOREIGN KEY([idCualificador])
REFERENCES [dbo].[Cualificadores] ([idCualificador])
GO
ALTER TABLE [dbo].[CualificadoresProductos] CHECK CONSTRAINT [FK_CualificadoresProductos_Cualificadores]
GO
ALTER TABLE [dbo].[CualificadoresProductos]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresProductos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[CualificadoresProductos] CHECK CONSTRAINT [FK_CualificadoresProductos_Productos]
GO
