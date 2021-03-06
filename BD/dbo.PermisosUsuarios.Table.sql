USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[PermisosUsuarios]    Script Date: 13/04/2016 11:22:55 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermisosUsuarios](
	[idUsuario] [numeric](18, 0) NOT NULL,
	[idPermiso] [numeric](18, 0) NOT NULL,
	[blnConsultar] [bit] NOT NULL,
	[blnModificar] [bit] NOT NULL,
	[blnCrear] [bit] NOT NULL,
 CONSTRAINT [PK_PermisosUsuarios] PRIMARY KEY CLUSTERED 
(
	[idUsuario] ASC,
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[PermisosUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_PermisosUsuarios_Permisos] FOREIGN KEY([idPermiso])
REFERENCES [dbo].[Permisos] ([idPermiso])
GO
ALTER TABLE [dbo].[PermisosUsuarios] CHECK CONSTRAINT [FK_PermisosUsuarios_Permisos]
GO
ALTER TABLE [dbo].[PermisosUsuarios]  WITH CHECK ADD  CONSTRAINT [FK_PermisosUsuarios_Usuarios] FOREIGN KEY([idUsuario])
REFERENCES [dbo].[Usuarios] ([idUsuario])
GO
ALTER TABLE [dbo].[PermisosUsuarios] CHECK CONSTRAINT [FK_PermisosUsuarios_Usuarios]
GO
