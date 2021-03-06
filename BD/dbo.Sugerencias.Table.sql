USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Sugerencias]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sugerencias](
	[idSugerencia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idCiudad] [numeric](18, 0) NULL,
	[varDireccion] [varchar](250) NULL,
	[varTelefono] [varchar](20) NULL,
	[varEmail] [varchar](250) NOT NULL,
	[varProducto] [varchar](250) NULL,
	[varSugerencia] [varchar](800) NOT NULL,
	[idEstado] [smallint] NOT NULL CONSTRAINT [DF_Sugerencias_idEstado]  DEFAULT ((11)),
	[dtmFecha] [datetime] NULL,
 CONSTRAINT [PK_Sugerencias] PRIMARY KEY CLUSTERED 
(
	[idSugerencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Sugerencias]  WITH CHECK ADD  CONSTRAINT [FK_Sugerencias_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Sugerencias] CHECK CONSTRAINT [FK_Sugerencias_Ciudades]
GO
ALTER TABLE [dbo].[Sugerencias]  WITH CHECK ADD  CONSTRAINT [FK_Sugerencias_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Sugerencias] CHECK CONSTRAINT [FK_Sugerencias_Estados]
GO
