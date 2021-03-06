USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[DatosPersonales]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatosPersonales](
	[idDatoPersonal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Datos] PRIMARY KEY CLUSTERED 
(
	[idDatoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DatosPersonales]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonales_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[DatosPersonales] CHECK CONSTRAINT [FK_DatosPersonales_Estados]
GO
