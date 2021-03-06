USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[idPromocion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numValorOriginal] [numeric](21, 3) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Promociones] PRIMARY KEY CLUSTERED 
(
	[idPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Promociones]  WITH CHECK ADD  CONSTRAINT [FK_Promociones_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Promociones] CHECK CONSTRAINT [FK_Promociones_Estados]
GO
ALTER TABLE [dbo].[Promociones]  WITH CHECK ADD  CONSTRAINT [FK_Promociones_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Promociones] CHECK CONSTRAINT [FK_Promociones_Productos]
GO
