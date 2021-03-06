USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Cotizaciones]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cotizaciones](
	[idCotizacion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varReferencia] [varchar](50) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[numCosto] [numeric](21, 3) NOT NULL,
	[numFleteInt] [numeric](21, 3) NOT NULL,
	[numPeso] [numeric](21, 3) NOT NULL,
	[numUtilidad] [numeric](21, 3) NOT NULL,
	[numPrecioD] [numeric](21, 3) NOT NULL,
	[idCategoria] [numeric](18, 0) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
	[numCantidad] [numeric](18, 0) NULL,
 CONSTRAINT [PK_Cotizaciones] PRIMARY KEY CLUSTERED 
(
	[idCotizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
