USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[idEmpresa] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varIdentificacion] [varchar](20) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varRepLegal] [varchar](250) NULL,
	[varDireccion] [varchar](250) NOT NULL,
	[varTelefono1] [varchar](20) NOT NULL,
	[varTelefono2] [varchar](20) NULL,
	[varCelular] [varchar](20) NULL,
	[varFax] [varchar](20) NULL,
	[idCiudad] [numeric](18, 0) NOT NULL,
	[varEmailComercial] [varchar](250) NOT NULL,
	[varTipoEmpresa] [varchar](250) NULL,
	[dtmFecha] [datetime] NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Ciudades]
GO
