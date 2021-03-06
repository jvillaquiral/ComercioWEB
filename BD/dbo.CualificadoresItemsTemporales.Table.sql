USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[CualificadoresItemsTemporales]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CualificadoresItemsTemporales](
	[idItemTemporal] [numeric](18, 0) NOT NULL,
	[idCualificador] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CualificadoresItemsTemporales] PRIMARY KEY CLUSTERED 
(
	[idItemTemporal] ASC,
	[idCualificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItemsTemporales_Cualificadores] FOREIGN KEY([idCualificador])
REFERENCES [dbo].[Cualificadores] ([idCualificador])
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales] CHECK CONSTRAINT [FK_CualificadoresItemsTemporales_Cualificadores]
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItemsTemporales_ItemsTemporales] FOREIGN KEY([idItemTemporal])
REFERENCES [dbo].[ItemsTemporales] ([idItemTemporal])
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales] CHECK CONSTRAINT [FK_CualificadoresItemsTemporales_ItemsTemporales]
GO
