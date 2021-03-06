USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Pedidos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedido] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNoPedido] [varchar](20) NULL,
	[idCliente] [numeric](18, 0) NULL,
	[numValor] [numeric](21, 3) NULL,
	[numIVA] [numeric](21, 3) NULL,
	[numEnvio] [numeric](21, 3) NULL,
	[idTipoPago] [smallint] NULL,
	[idEstado] [smallint] NULL,
	[dtmFecha] [datetime] NOT NULL,
	[dtmDespacho] [datetime] NULL,
	[varNombreEnvio] [varchar](250) NULL,
	[varApellidoEnvio] [varchar](250) NULL,
	[varEmailEnvio] [varchar](250) NULL,
	[idCiudadEnvio] [numeric](18, 0) NULL,
	[varDireccionEnvio] [varchar](250) NULL,
	[varTelefonoEnvio] [varchar](20) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Ciudades] FOREIGN KEY([idCiudadEnvio])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Ciudades]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Estados]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_TiposPagos] FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TiposPagos] ([idTipoPago])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_TiposPagos]
GO
