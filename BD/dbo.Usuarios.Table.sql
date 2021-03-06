USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuarios](
	[idUsuario] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varUsuario] [varchar](20) NOT NULL,
	[varClave] [varchar](20) NOT NULL,
	[varEMail] [varchar](250) NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
	[dtmCaducidad] [datetime] NULL,
	[blnAdministrador] [bit] NOT NULL CONSTRAINT [DF_Usuarios_blnAdministrador]  DEFAULT ((0)),
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
