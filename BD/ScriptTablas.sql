USE [DBSQLVILLATECNO2]
GO
/****** Object:  Table [dbo].[Auditorias]    Script Date: 13/04/2016 11:26:52 p.m. ******/
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
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Ciudades]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ciudades](
	[idCiudad] [numeric](18, 0) NOT NULL,
	[varDescripcion] [varchar](250) NOT NULL,
	[idDepartamento] [numeric](18, 0) NOT NULL,
	[numValorEnvio] [numeric](21, 3) NULL,
 CONSTRAINT [PK_Ciudades] PRIMARY KEY CLUSTERED 
(
	[idCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[idCliente] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varUsuario] [varchar](20) NULL,
	[varClave] [varchar](20) NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varIdentificacion] [varchar](20) NOT NULL,
	[idTipoIdentificacion] [smallint] NOT NULL,
	[varRepLegal] [varchar](250) NULL,
	[idCiudad] [numeric](18, 0) NOT NULL,
	[varDireccion] [varchar](250) NOT NULL,
	[varTelefono] [varchar](20) NULL,
	[varCelular] [varchar](20) NULL,
	[varEMail] [varchar](250) NULL,
	[idSexo] [smallint] NULL,
	[idEstado] [smallint] NOT NULL,
	[blnPublicidad] [bit] NOT NULL,
	[dtmFechaNacimiento] [datetime] NULL,
	[dtmFecha] [datetime] NOT NULL,
	[varApellido] [varchar](250) NOT NULL,
	[varPais] [varchar](250) NULL,
	[varCiudad] [varchar](250) NULL,
	[varDepartamento] [varchar](250) NULL,
 CONSTRAINT [PK_Clientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CobrosEnvios]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CobrosEnvios](
	[idCobroEnvio] [smallint] NOT NULL,
	[varDescripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CobrosEnvios] PRIMARY KEY CLUSTERED 
(
	[idCobroEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuraciones]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Constantes]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Cotizaciones]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Cualificadores]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cualificadores](
	[idCualificador] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Cualificadores] PRIMARY KEY CLUSTERED 
(
	[idCualificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CualificadoresItems]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CualificadoresItems](
	[idItem] [numeric](18, 0) NOT NULL,
	[idCualificador] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CualificadoresItems] PRIMARY KEY CLUSTERED 
(
	[idItem] ASC,
	[idCualificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CualificadoresItemsTemporales]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CualificadoresItemsTemporales](
	[idItemTemporal] [numeric](18, 0) NOT NULL,
	[idCualificador] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CualificadoresItemsTemporales] PRIMARY KEY CLUSTERED 
(
	[idItemTemporal] ASC,
	[idCualificador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CualificadoresProductos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CualificadoresProductos](
	[idProducto] [numeric](18, 0) NOT NULL,
	[idCualificador] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_CualificadoresProductos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idCualificador] ASC,
	[varValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DatosPersonales]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[DatosPersonalesClientes]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DatosPersonalesClientes](
	[idCliente] [numeric](18, 0) NOT NULL,
	[idDatoPersonal] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_DatosPersonalesClientes] PRIMARY KEY CLUSTERED 
(
	[idCliente] ASC,
	[idDatoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Departamentos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departamentos](
	[idDepartamento] [numeric](18, 0) NOT NULL,
	[varDescripcion] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Departamentos] PRIMARY KEY CLUSTERED 
(
	[idDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DetallesPagos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DetallesPagos](
	[idDetallePago] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPago] [numeric](18, 0) NOT NULL,
	[varDescripcion] [varchar](50) NOT NULL,
	[numCantidad] [smallint] NOT NULL,
	[numValorU] [numeric](18, 0) NOT NULL,
	[numValorT] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_DetallesPagos] PRIMARY KEY CLUSTERED 
(
	[idDetallePago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresas]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empresas](
	[idEmpresa] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varIdentificacion] [varchar](20) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varRepLegal] [varchar](250) NULL,
	[varDireccion] [varchar](250) NOT NULL,
	[varTelefono1] [varchar](20) NOT NULL,
	[varTelefono2] [varchar](20) NULL,
	[varCelular] [varchar](20) NULL,
	[varFax] [varchar](20) NULL,
	[idCiudad] [numeric](18, 0) NOT NULL,
	[varEmailComercial] [varchar](250) NOT NULL,
	[varTipoEmpresa] [varchar](250) NULL,
	[dtmFecha] [datetime] NULL,
 CONSTRAINT [PK_Empresas] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estados]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Estados](
	[idEstado] [smallint] NOT NULL,
	[varDescripcion] [varchar](20) NOT NULL,
	[idTipo] [smallint] NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED 
(
	[idEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Fotos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Fotos](
	[idFoto] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[varImagen] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](800) NOT NULL,
	[idOrden] [smallint] NOT NULL,
 CONSTRAINT [PK_Fotos] PRIMARY KEY CLUSTERED 
(
	[idFoto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Generos](
	[idGenero] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Generos] PRIMARY KEY CLUSTERED 
(
	[idGenero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Items](
	[idItem] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPedido] [numeric](18, 0) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[numValor] [numeric](21, 3) NOT NULL,
	[numIVA] [numeric](21, 3) NOT NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[idItem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ItemsTemporales]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ItemsTemporales](
	[idItemTemporal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idPedidoTemporal] [numeric](18, 0) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[numValor] [numeric](21, 3) NULL,
	[numIVA] [numeric](21, 3) NULL,
	[blnAgotado] [bit] NULL,
 CONSTRAINT [PK_ItemsTemporales] PRIMARY KEY CLUSTERED 
(
	[idItemTemporal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mensajes]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mensajes](
	[idMensaje] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varProceso] [varchar](50) NULL,
	[varUsuario] [varchar](20) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[varDetalle] [varchar](400) NULL,
	[varError] [nvarchar](400) NULL,
	[idTipoMensaje] [smallint] NULL,
 CONSTRAINT [PK_Mensajes] PRIMARY KEY CLUSTERED 
(
	[idMensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Pedidos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pedidos](
	[idPedido] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNoPedido] [varchar](20) NULL,
	[idCliente] [numeric](18, 0) NULL,
	[numValor] [numeric](21, 3) NULL,
	[numIVA] [numeric](21, 3) NULL,
	[numEnvio] [numeric](21, 3) NULL,
	[idTipoPago] [smallint] NULL,
	[idEstado] [smallint] NULL,
	[dtmFecha] [datetime] NOT NULL,
	[dtmDespacho] [datetime] NULL,
	[varNombreEnvio] [varchar](250) NULL,
	[varApellidoEnvio] [varchar](250) NULL,
	[varEmailEnvio] [varchar](250) NULL,
	[idCiudadEnvio] [numeric](18, 0) NULL,
	[varDireccionEnvio] [varchar](250) NULL,
	[varTelefonoEnvio] [varchar](20) NULL,
 CONSTRAINT [PK_Pedidos] PRIMARY KEY CLUSTERED 
(
	[idPedido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PedidosTemporales]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PedidosTemporales](
	[idPedidoTemporal] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
	[idCliente] [numeric](18, 0) NULL,
	[varNombreEnvio] [varchar](250) NULL,
	[varApellidoEnvio] [varchar](250) NULL,
	[varEmailEnvio] [varchar](250) NULL,
	[idCiudadEnvio] [numeric](18, 0) NULL,
	[varDireccionEnvio] [varchar](250) NULL,
	[varTelefonoEnvio] [varchar](20) NULL,
	[numValorEnvio] [numeric](21, 3) NULL,
	[idEstado] [smallint] NULL,
 CONSTRAINT [PK_PedidosTemporales] PRIMARY KEY CLUSTERED 
(
	[idPedidoTemporal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Permisos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Permisos](
	[idPermiso] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Permisos] PRIMARY KEY CLUSTERED 
(
	[idPermiso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PermisosUsuarios]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Preventas]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Preventas](
	[idPreventa] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](4000) NULL,
	[varImagen] [varchar](250) NULL,
	[varVideo] [varchar](250) NULL,
	[varPlataforma] [varchar](250) NULL,
	[varPrecio] [varchar](250) NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Preventas] PRIMARY KEY CLUSTERED 
(
	[idPreventa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[idProducto] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varReferencia] [varchar](50) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDescripcion] [varchar](4000) NULL,
	[idCategoria] [numeric](18, 0) NULL,
	[numValor] [numeric](21, 3) NOT NULL,
	[numIVA] [numeric](21, 3) NOT NULL,
	[numCantidad] [numeric](18, 0) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[varImagen] [varchar](250) NULL,
	[dtmFecha] [datetime] NOT NULL,
	[blnAgotado] [bit] NOT NULL,
	[varArchivoAdjunto] [varchar](250) NULL,
	[idGenero] [numeric](18, 0) NULL,
	[dtmLanzamiento] [datetime] NULL,
 CONSTRAINT [PK_Productos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[idPromocion] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[idProducto] [numeric](18, 0) NOT NULL,
	[numValorOriginal] [numeric](21, 3) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Promociones] PRIMARY KEY CLUSTERED 
(
	[idPromocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Propiedades]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Propiedades](
	[idPropiedad] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idEstado] [smallint] NOT NULL,
	[varPredeterminado] [varchar](250) NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Propiedades] PRIMARY KEY CLUSTERED 
(
	[idPropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PropiedadesProductos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PropiedadesProductos](
	[idProducto] [numeric](18, 0) NOT NULL,
	[idPropiedad] [numeric](18, 0) NOT NULL,
	[varValor] [varchar](250) NOT NULL,
 CONSTRAINT [PK_PropiedadesProductos] PRIMARY KEY CLUSTERED 
(
	[idProducto] ASC,
	[idPropiedad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sitios]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sitios](
	[idEmpresa] [numeric](18, 0) NOT NULL,
	[varLogo] [varchar](250) NOT NULL,
	[idTipoPlantilla] [smallint] NOT NULL,
	[varURL] [varchar](250) NOT NULL,
	[varIPHosting] [varchar](20) NOT NULL,
	[varUsuarioHosting] [varchar](20) NOT NULL,
	[varClaveHosting] [varchar](20) NOT NULL,
	[varIPFTP] [varchar](20) NOT NULL,
	[varIPBD] [varchar](20) NOT NULL,
	[dtmFechaHosting] [datetime] NOT NULL,
	[dtmVencimientoHosting] [datetime] NOT NULL,
 CONSTRAINT [PK_Sitios] PRIMARY KEY CLUSTERED 
(
	[idEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sugerencias]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sugerencias](
	[idSugerencia] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[idCiudad] [numeric](18, 0) NULL,
	[varDireccion] [varchar](250) NULL,
	[varTelefono] [varchar](20) NULL,
	[varEmail] [varchar](250) NOT NULL,
	[varProducto] [varchar](250) NULL,
	[varSugerencia] [varchar](800) NOT NULL,
	[idEstado] [smallint] NOT NULL CONSTRAINT [DF_Sugerencias_idEstado]  DEFAULT ((11)),
	[dtmFecha] [datetime] NULL,
 CONSTRAINT [PK_Sugerencias] PRIMARY KEY CLUSTERED 
(
	[idSugerencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposIdentificaciones]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiposIdentificaciones](
	[idTipoIdentificacion] [smallint] NOT NULL,
	[varDescripcion] [varchar](50) NULL,
 CONSTRAINT [PK_TiposIdentificaciones] PRIMARY KEY CLUSTERED 
(
	[idTipoIdentificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiposPagos]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
/****** Object:  Table [dbo].[Ubicaciones]    Script Date: 13/04/2016 11:26:53 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicaciones](
	[idUbicacion] [smallint] IDENTITY(1,1) NOT NULL,
	[idEmpresa] [numeric](18, 0) NOT NULL,
	[varNombre] [varchar](250) NOT NULL,
	[varDireccion] [varchar](250) NULL,
	[idCiudad] [numeric](18, 0) NULL,
	[varTelefono] [varchar](250) NULL,
	[varImagen] [varchar](250) NULL,
	[varDescripcion] [varchar](4000) NULL,
	[dtmFecha] [datetime] NOT NULL,
 CONSTRAINT [PK_Ubicaciones] PRIMARY KEY CLUSTERED 
(
	[idUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 13/04/2016 11:26:53 p.m. ******/
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
ALTER TABLE [dbo].[ItemsTemporales] ADD  CONSTRAINT [DF_ItemsTemporales_blnAgotado]  DEFAULT ((0)) FOR [blnAgotado]
GO
ALTER TABLE [dbo].[PedidosTemporales] ADD  CONSTRAINT [DF_PedidosTemporales_idEstado]  DEFAULT ((9)) FOR [idEstado]
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
ALTER TABLE [dbo].[Ciudades]  WITH CHECK ADD  CONSTRAINT [FK_Ciudades_Departamentos] FOREIGN KEY([idDepartamento])
REFERENCES [dbo].[Departamentos] ([idDepartamento])
GO
ALTER TABLE [dbo].[Ciudades] CHECK CONSTRAINT [FK_Ciudades_Departamentos]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Ciudades]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_Estados]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [FK_Clientes_TiposIdentificaciones] FOREIGN KEY([idTipoIdentificacion])
REFERENCES [dbo].[TiposIdentificaciones] ([idTipoIdentificacion])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [FK_Clientes_TiposIdentificaciones]
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
ALTER TABLE [dbo].[Cualificadores]  WITH CHECK ADD  CONSTRAINT [FK_Cualificadores_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Cualificadores] CHECK CONSTRAINT [FK_Cualificadores_Estados]
GO
ALTER TABLE [dbo].[CualificadoresItems]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItems_Cualificadores] FOREIGN KEY([idCualificador])
REFERENCES [dbo].[Cualificadores] ([idCualificador])
GO
ALTER TABLE [dbo].[CualificadoresItems] CHECK CONSTRAINT [FK_CualificadoresItems_Cualificadores]
GO
ALTER TABLE [dbo].[CualificadoresItems]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItems_Items] FOREIGN KEY([idItem])
REFERENCES [dbo].[Items] ([idItem])
GO
ALTER TABLE [dbo].[CualificadoresItems] CHECK CONSTRAINT [FK_CualificadoresItems_Items]
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItemsTemporales_Cualificadores] FOREIGN KEY([idCualificador])
REFERENCES [dbo].[Cualificadores] ([idCualificador])
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales] CHECK CONSTRAINT [FK_CualificadoresItemsTemporales_Cualificadores]
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresItemsTemporales_ItemsTemporales] FOREIGN KEY([idItemTemporal])
REFERENCES [dbo].[ItemsTemporales] ([idItemTemporal])
GO
ALTER TABLE [dbo].[CualificadoresItemsTemporales] CHECK CONSTRAINT [FK_CualificadoresItemsTemporales_ItemsTemporales]
GO
ALTER TABLE [dbo].[CualificadoresProductos]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresProductos_Cualificadores] FOREIGN KEY([idCualificador])
REFERENCES [dbo].[Cualificadores] ([idCualificador])
GO
ALTER TABLE [dbo].[CualificadoresProductos] CHECK CONSTRAINT [FK_CualificadoresProductos_Cualificadores]
GO
ALTER TABLE [dbo].[CualificadoresProductos]  WITH CHECK ADD  CONSTRAINT [FK_CualificadoresProductos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[CualificadoresProductos] CHECK CONSTRAINT [FK_CualificadoresProductos_Productos]
GO
ALTER TABLE [dbo].[DatosPersonales]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonales_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[DatosPersonales] CHECK CONSTRAINT [FK_DatosPersonales_Estados]
GO
ALTER TABLE [dbo].[DatosPersonalesClientes]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonalesClientes_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[DatosPersonalesClientes] CHECK CONSTRAINT [FK_DatosPersonalesClientes_Clientes]
GO
ALTER TABLE [dbo].[DatosPersonalesClientes]  WITH CHECK ADD  CONSTRAINT [FK_DatosPersonalesClientes_DatosPersonales] FOREIGN KEY([idDatoPersonal])
REFERENCES [dbo].[DatosPersonales] ([idDatoPersonal])
GO
ALTER TABLE [dbo].[DatosPersonalesClientes] CHECK CONSTRAINT [FK_DatosPersonalesClientes_DatosPersonales]
GO
ALTER TABLE [dbo].[DetallesPagos]  WITH CHECK ADD  CONSTRAINT [FK_DetallesPagos_Pagos] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pagos] ([idPago])
GO
ALTER TABLE [dbo].[DetallesPagos] CHECK CONSTRAINT [FK_DetallesPagos_Pagos]
GO
ALTER TABLE [dbo].[Empresas]  WITH CHECK ADD  CONSTRAINT [FK_Empresas_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Empresas] CHECK CONSTRAINT [FK_Empresas_Ciudades]
GO
ALTER TABLE [dbo].[Fotos]  WITH CHECK ADD  CONSTRAINT [FK_Fotos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Fotos] CHECK CONSTRAINT [FK_Fotos_Productos]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Pedidos] FOREIGN KEY([idPedido])
REFERENCES [dbo].[Pedidos] ([idPedido])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Pedidos]
GO
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Productos]
GO
ALTER TABLE [dbo].[ItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_ItemsTemporales_PedidosTemporales] FOREIGN KEY([idPedidoTemporal])
REFERENCES [dbo].[PedidosTemporales] ([idPedidoTemporal])
GO
ALTER TABLE [dbo].[ItemsTemporales] CHECK CONSTRAINT [FK_ItemsTemporales_PedidosTemporales]
GO
ALTER TABLE [dbo].[ItemsTemporales]  WITH CHECK ADD  CONSTRAINT [FK_ItemsTemporales_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[ItemsTemporales] CHECK CONSTRAINT [FK_ItemsTemporales_Productos]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Ciudades] FOREIGN KEY([idCiudadEnvio])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Ciudades]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Clientes]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_Estados]
GO
ALTER TABLE [dbo].[Pedidos]  WITH CHECK ADD  CONSTRAINT [FK_Pedidos_TiposPagos] FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TiposPagos] ([idTipoPago])
GO
ALTER TABLE [dbo].[Pedidos] CHECK CONSTRAINT [FK_Pedidos_TiposPagos]
GO
ALTER TABLE [dbo].[PedidosTemporales]  WITH CHECK ADD  CONSTRAINT [FK_PedidosTemporales_Clientes] FOREIGN KEY([idCliente])
REFERENCES [dbo].[Clientes] ([idCliente])
GO
ALTER TABLE [dbo].[PedidosTemporales] CHECK CONSTRAINT [FK_PedidosTemporales_Clientes]
GO
ALTER TABLE [dbo].[PedidosTemporales]  WITH CHECK ADD  CONSTRAINT [FK_PedidosTemporales_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[PedidosTemporales] CHECK CONSTRAINT [FK_PedidosTemporales_Estados]
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
ALTER TABLE [dbo].[Preventas]  WITH CHECK ADD  CONSTRAINT [FK_Preventas_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Preventas] CHECK CONSTRAINT [FK_Preventas_Estados]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Categorias] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categorias] ([idCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Categorias]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK_Productos_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Estados]
GO
ALTER TABLE [dbo].[Productos]  WITH NOCHECK ADD  CONSTRAINT [FK_Productos_Generos] FOREIGN KEY([idGenero])
REFERENCES [dbo].[Generos] ([idGenero])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK_Productos_Generos]
GO
ALTER TABLE [dbo].[Promociones]  WITH CHECK ADD  CONSTRAINT [FK_Promociones_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Promociones] CHECK CONSTRAINT [FK_Promociones_Estados]
GO
ALTER TABLE [dbo].[Promociones]  WITH CHECK ADD  CONSTRAINT [FK_Promociones_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[Promociones] CHECK CONSTRAINT [FK_Promociones_Productos]
GO
ALTER TABLE [dbo].[Propiedades]  WITH CHECK ADD  CONSTRAINT [FK_Propiedades_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Propiedades] CHECK CONSTRAINT [FK_Propiedades_Estados]
GO
ALTER TABLE [dbo].[PropiedadesProductos]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadesProductos_Productos] FOREIGN KEY([idProducto])
REFERENCES [dbo].[Productos] ([idProducto])
GO
ALTER TABLE [dbo].[PropiedadesProductos] CHECK CONSTRAINT [FK_PropiedadesProductos_Productos]
GO
ALTER TABLE [dbo].[PropiedadesProductos]  WITH CHECK ADD  CONSTRAINT [FK_PropiedadesProductos_Propiedades] FOREIGN KEY([idPropiedad])
REFERENCES [dbo].[Propiedades] ([idPropiedad])
GO
ALTER TABLE [dbo].[PropiedadesProductos] CHECK CONSTRAINT [FK_PropiedadesProductos_Propiedades]
GO
ALTER TABLE [dbo].[Sitios]  WITH CHECK ADD  CONSTRAINT [FK_Sitios_Empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Sitios] CHECK CONSTRAINT [FK_Sitios_Empresas]
GO
ALTER TABLE [dbo].[Sugerencias]  WITH CHECK ADD  CONSTRAINT [FK_Sugerencias_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Sugerencias] CHECK CONSTRAINT [FK_Sugerencias_Ciudades]
GO
ALTER TABLE [dbo].[Sugerencias]  WITH CHECK ADD  CONSTRAINT [FK_Sugerencias_Estados] FOREIGN KEY([idEstado])
REFERENCES [dbo].[Estados] ([idEstado])
GO
ALTER TABLE [dbo].[Sugerencias] CHECK CONSTRAINT [FK_Sugerencias_Estados]
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Ciudades] FOREIGN KEY([idCiudad])
REFERENCES [dbo].[Ciudades] ([idCiudad])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Ciudades]
GO
ALTER TABLE [dbo].[Ubicaciones]  WITH CHECK ADD  CONSTRAINT [FK_Ubicaciones_Empresas] FOREIGN KEY([idEmpresa])
REFERENCES [dbo].[Empresas] ([idEmpresa])
GO
ALTER TABLE [dbo].[Ubicaciones] CHECK CONSTRAINT [FK_Ubicaciones_Empresas]
GO
