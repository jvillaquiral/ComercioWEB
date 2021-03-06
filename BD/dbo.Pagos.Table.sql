USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pagos](
	[idPago] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varPago] [varchar](20) NULL,
	[idEstado] [smallint] NULL,
	[numValor] [numeric](21, 3) NULL,
	[numSubtotal] [numeric](21, 3) NULL,
	[numIVA] [numeric](21, 3) NULL,
	[dtmGeneracion] [datetime] NULL,
	[dtmVencimiento] [datetime] NULL,
	[varInstrucciones] [varchar](400) NULL,
 CONSTRAINT [PK_Pagos] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
