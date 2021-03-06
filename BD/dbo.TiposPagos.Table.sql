USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[TiposPagos]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposPagos](
	[idTipoPago] [smallint] IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varImagen] [varchar](250) NULL,
	[varDescripcion] [varchar](400) NULL,
	[varUrl] [varchar](250) NULL,
	[varPosPago] [varchar](400) NULL,
 CONSTRAINT [PK_TiposPagos] PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
