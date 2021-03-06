USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[ItemsTemporales]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsTemporales](
	[idItemTemporal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPedidoTemporal] [numeric](18, 0) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[numValor] [numeric](21, 3) NULL,
	[numIVA] [numeric](21, 3) NULL,
	[blnAgotado] [bit] NULL,
 CONSTRAINT [PK_ItemsTemporales] PRIMARY KEY CLUSTERED 
(
	[idItemTemporal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[ItemsTemporales] ADD  CONSTRAINT [DF_ItemsTemporales_blnAgotado]  DEFAULT ((0)) FOR [blnAgotado]
GO
ALTER TABLE [dbo].[ItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_ItemsTemporales_PedidosTemporales] FOREIGN KEY([idPedidoTemporal])
REFERENCES [dbo].[PedidosTemporales] ([idPedidoTemporal])
GO
ALTER TABLE [dbo].[ItemsTemporales] CHECK CONSTRAINT [FK_ItemsTemporales_PedidosTemporales]
GO
ALTER TABLE [dbo].[ItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_ItemsTemporales_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[ItemsTemporales] CHECK CONSTRAINT [FK_ItemsTemporales_Productos]
GO
