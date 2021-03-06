USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[DatosPersonalesClientes]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatosPersonalesClientes](
	[idCliente] [numeric](18, 0) NOT NULL,
	[idDatoPersonal] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DatosPersonalesClientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC,
	[idDatoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DatosPersonalesClientes]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonalesClientes_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[DatosPersonalesClientes] CHECK CONSTRAINT [FK_DatosPersonalesClientes_Clientes]
GO
ALTER TABLE [dbo].[DatosPersonalesClientes]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonalesClientes_DatosPersonales] FOREIGN KEY([idDatoPersonal])
REFERENCES [dbo].[DatosPersonales] ([idDatoPersonal])
GO
ALTER TABLE [dbo].[DatosPersonalesClientes] CHECK CONSTRAINT [FK_DatosPersonalesClientes_DatosPersonales]
GO
