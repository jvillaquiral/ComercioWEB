USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Preventas]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Preventas](
	[idPreventa] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](4000) NULL,
	[varImagen] [varchar](250) NULL,
	[varVideo] [varchar](250) NULL,
	[varPlataforma] [varchar](250) NULL,
	[varPrecio] [varchar](250) NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Preventas] PRIMARY KEY CLUSTERED 
(
	[idPreventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Preventas]  WITH CHECK ADD  CONSTRAINT [FK_Preventas_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Preventas] CHECK CONSTRAINT [FK_Preventas_Estados]
GO
