USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensajes](
	[idMensaje] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varProceso] [varchar](50) NULL,
	[varUsuario] [varchar](20) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[varDetalle] [varchar](400) NULL,
	[varError] [nvarchar](400) NULL,
	[idTipoMensaje] [smallint] NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[idMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
