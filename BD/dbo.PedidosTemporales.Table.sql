USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[PedidosTemporales]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidosTemporales](
	[idPedidoTemporal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
	[idCliente] [numeric](18, 0) NULL,
	[varNombreEnvio] [varchar](250) NULL,
	[varApellidoEnvio] [varchar](250) NULL,
	[varEmailEnvio] [varchar](250) NULL,
	[idCiudadEnvio] [numeric](18, 0) NULL,
	[varDireccionEnvio] [varchar](250) NULL,
	[varTelefonoEnvio] [varchar](20) NULL,
	[numValorEnvio] [numeric](21, 3) NULL,
	[idEstado] [smallint] NULL,
 CONSTRAINT [PK_PedidosTemporales] PRIMARY KEY CLUSTERED 
(
	[idPedidoTemporal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PedidosTemporales] ADD  CONSTRAINT [DF_PedidosTemporales_idEstado]  DEFAULT ((9)) FOR [idEstado]
GO
ALTER TABLE [dbo].[PedidosTemporales]  WITH CHECK ADD  CONSTRAINT [FK_PedidosTemporales_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[PedidosTemporales] CHECK CONSTRAINT [FK_PedidosTemporales_Clientes]
GO
ALTER TABLE [dbo].[PedidosTemporales]  WITH CHECK ADD  CONSTRAINT [FK_PedidosTemporales_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[PedidosTemporales] CHECK CONSTRAINT [FK_PedidosTemporales_Estados]
GO
