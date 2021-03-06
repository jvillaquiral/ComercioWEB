USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Configuraciones]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuraciones](
	[idEmpresa] [numeric](18, 0) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[idPlan] [smallint] NOT NULL,
	[varEmailPedidos] [varchar](250) NULL,
	[varEmailContactenos] [varchar](250) NULL,
	[varTelefonoContactenos] [varchar](250) NULL,
	[varDireccionContactenos] [varchar](500) NULL,
	[varCelularContactenos] [varchar](250) NULL,
	[varHistoria] [varchar](4000) NULL,
	[varMision] [varchar](4000) NULL,
	[varVision] [varchar](4000) NULL,
	[varPago] [varchar](4000) NULL,
	[varEnvio] [varchar](4000) NULL,
	[idCobroEnvio] [smallint] NULL,
	[varValorEnvioGeneral] [numeric](21, 3) NULL,
 CONSTRAINT [PK_Configuraciones] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Configuraciones]  WITH CHECK ADD  CONSTRAINT [FK_Configuraciones_CobrosEnvios] FOREIGN KEY([idCobroEnvio])
REFERENCES [dbo].[CobrosEnvios] ([idCobroEnvio])
GO
ALTER TABLE [dbo].[Configuraciones] CHECK CONSTRAINT [FK_Configuraciones_CobrosEnvios]
GO
ALTER TABLE [dbo].[Configuraciones]  WITH CHECK ADD  CONSTRAINT [FK_Configuraciones_Empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Configuraciones] CHECK CONSTRAINT [FK_Configuraciones_Empresas]
GO
ALTER TABLE [dbo].[Configuraciones]  WITH CHECK ADD  CONSTRAINT [FK_Configuraciones_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Configuraciones] CHECK CONSTRAINT [FK_Configuraciones_Estados]
GO
