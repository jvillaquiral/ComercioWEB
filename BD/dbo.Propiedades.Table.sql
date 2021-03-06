USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Propiedades]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propiedades](
	[idPropiedad] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[varPredeterminado] [varchar](250) NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Propiedades] PRIMARY KEY CLUSTERED 
(
	[idPropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Propiedades]  WITH CHECK ADD  CONSTRAINT [FK_Propiedades_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Propiedades] CHECK CONSTRAINT [FK_Propiedades_Estados]
GO
