USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Sitios]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sitios](
	[idEmpresa] [numeric](18, 0) NOT NULL,
	[varLogo] [varchar](250) NOT NULL,
	[idTipoPlantilla] [smallint] NOT NULL,
	[varURL] [varchar](250) NOT NULL,
	[varIPHosting] [varchar](20) NOT NULL,
	[varUsuarioHosting] [varchar](20) NOT NULL,
	[varClaveHosting] [varchar](20) NOT NULL,
	[varIPFTP] [varchar](20) NOT NULL,
	[varIPBD] [varchar](20) NOT NULL,
	[dtmFechaHosting] [datetime] NOT NULL,
	[dtmVencimientoHosting] [datetime] NOT NULL,
 CONSTRAINT [PK_Sitios] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Sitios]  WITH CHECK ADD  CONSTRAINT [FK_Sitios_Empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Sitios] CHECK CONSTRAINT [FK_Sitios_Empresas]
GO
