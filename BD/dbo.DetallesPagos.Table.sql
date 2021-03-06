USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[DetallesPagos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallesPagos](
	[idDetallePago] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPago] [numeric](18, 0) NOT NULL,
	[varDescripcion] [varchar](50) NOT NULL,
	[numCantidad] [smallint] NOT NULL,
	[numValorU] [numeric](18, 0) NOT NULL,
	[numValorT] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_DetallesPagos] PRIMARY KEY CLUSTERED 
(
	[idDetallePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DetallesPagos]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPagos_Pagos] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pagos] ([idPago])
GO
ALTER TABLE [dbo].[DetallesPagos] CHECK CONSTRAINT [FK_DetallesPagos_Pagos]
GO
