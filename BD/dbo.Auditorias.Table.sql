USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Auditorias]    Script Date: 13/04/2016 11:22:54 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Auditorias](
	[idAuditoria] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varProceso] [varchar](50) NULL,
	[varUsuario] [varchar](20) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[varDetalle] [varchar](400) NULL,
 CONSTRAINT [PK_Auditorias] PRIMARY KEY CLUSTERED 
(
	[idAuditoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
