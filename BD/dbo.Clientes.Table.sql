USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varUsuario] [varchar](20) NULL,
	[varClave] [varchar](20) NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varIdentificacion] [varchar](20) NOT NULL,
	[idTipoIdentificacion] [smallint] NOT NULL,
	[varRepLegal] [varchar](250) NULL,
	[idCiudad] [numeric](18, 0) NOT NULL,
	[varDireccion] [varchar](250) NOT NULL,
	[varTelefono] [varchar](20) NULL,
	[varCelular] [varchar](20) NULL,
	[varEMail] [varchar](250) NULL,
	[idSexo] [smallint] NULL,
	[idEstado] [smallint] NOT NULL,
	[blnPublicidad] [bit] NOT NULL,
	[dtmFechaNacimiento] [datetime] NULL,
	[dtmFecha] [datetime] NOT NULL,
	[varApellido] [varchar](250) NOT NULL,
	[varPais] [varchar](250) NULL,
	[varCiudad] [varchar](250) NULL,
	[varDepartamento] [varchar](250) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Ciudades]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Estados]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_TiposIdentificaciones] FOREIGN KEY([idTipoIdentificacion])
REFERENCES [dbo].[TiposIdentificaciones] ([idTipoIdentificacion])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_TiposIdentificaciones]
GO
