USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[TiposIdentificaciones]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposIdentificaciones](
	[idTipoIdentificacion] [smallint] NOT NULL,
	[varDescripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TiposIdentificaciones] PRIMARY KEY CLUSTERED 
(
	[idTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
