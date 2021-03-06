USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Constantes]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Constantes](
	[idConstante] [smallint] NOT NULL,
	[varNombre] [varchar](50) NOT NULL,
	[numValor] [numeric](21, 3) NOT NULL,
	[varDescripcion] [varchar](250) NULL,
 CONSTRAINT [PK_Constantes] PRIMARY KEY CLUSTERED 
(
	[idConstante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
