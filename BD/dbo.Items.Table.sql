USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Items]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[idItem] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPedido] [numeric](18, 0) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[numValor] [numeric](21, 3) NOT NULL,
	[numIVA] [numeric](21, 3) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Pedidos] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Pedidos]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Productos]
GO
