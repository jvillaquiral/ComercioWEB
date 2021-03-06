USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categorias](
	[idCategoria] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idPadre] [numeric](18, 0) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[idEstado] [smallint] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Categorias] FOREIGN KEY([idPadre])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_Categorias]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [FK_Categorias_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [FK_Categorias_Estados]
GO
