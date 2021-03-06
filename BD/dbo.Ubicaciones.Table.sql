USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[idUbicacion] [smallint] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [numeric](18, 0) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDireccion] [varchar](250) NULL,
	[idCiudad] [numeric](18, 0) NULL,
	[varTelefono] [varchar](250) NULL,
	[varImagen] [varchar](250) NULL,
	[varDescripcion] [varchar](4000) NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Ubicaciones] PRIMARY KEY CLUSTERED 
(
	[idUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Ciudades]
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Empresas]
GO
