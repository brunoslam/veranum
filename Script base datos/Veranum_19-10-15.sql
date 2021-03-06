USE [master]
GO
/****** Object:  Database [Veranum]    Script Date: 19-10-15 1:10:07 a.m. ******/
CREATE DATABASE [Veranum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Veranum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Veranum.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Veranum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Veranum_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Veranum] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Veranum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Veranum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Veranum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Veranum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Veranum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Veranum] SET ARITHABORT OFF 
GO
ALTER DATABASE [Veranum] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Veranum] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Veranum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Veranum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Veranum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Veranum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Veranum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Veranum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Veranum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Veranum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Veranum] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Veranum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Veranum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Veranum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Veranum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Veranum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Veranum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Veranum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Veranum] SET RECOVERY FULL 
GO
ALTER DATABASE [Veranum] SET  MULTI_USER 
GO
ALTER DATABASE [Veranum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Veranum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Veranum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Veranum] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Veranum]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 19-10-15 1:10:07 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ciudad](
	[IdCiudad] [int] IDENTITY(1,1) NOT NULL,
	[IdRegion] [int] NOT NULL,
	[NombreCiudad] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Ciudad] PRIMARY KEY CLUSTERED 
(
	[IdCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cliente](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[RutCliente] [varchar](12) NOT NULL,
	[NombreCliente] [varchar](50) NOT NULL,
	[ApellidoPaternoCliente] [varchar](50) NOT NULL,
	[ApellidoMaternoCliente] [varchar](50) NOT NULL,
	[EmailCliente] [varchar](100) NULL,
	[TelefonoCliente] [varchar](12) NOT NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Habitacion](
	[IdHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[IdHotel] [int] NOT NULL,
	[IdTipoHabitacion] [int] NOT NULL,
	[Precio] [int] NOT NULL,
	[IdInspeccion] [int] NOT NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HabitacionesDisponibles]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitacionesDisponibles](
	[IdHotel] [int] NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[Disponibles] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Hotel](
	[IdHotel] [int] IDENTITY(1,1) NOT NULL,
	[NombreHotel] [varchar](100) NOT NULL,
	[IdUbicacion] [int] NOT NULL,
	[HabitacionesTotales]  AS (([HabitacionesVIP]+[HabitacionesBusiness])+[HabitacionesBasicas]),
	[TieneVIP] [bit] NOT NULL,
	[HabitacionesVIP] [int] NOT NULL,
	[TieneBusiness] [bit] NOT NULL,
	[HabitacionesBusiness] [int] NOT NULL,
	[TieneBasica] [bit] NOT NULL,
	[HabitacionesBasicas] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InspeccionSanitaria]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InspeccionSanitaria](
	[IdInspeccion] [int] IDENTITY(1,1) NOT NULL,
	[ResolucionSanitaria] [varchar](255) NOT NULL,
	[FechaResolucion] [date] NOT NULL,
 CONSTRAINT [PK_InspeccionSanitaria] PRIMARY KEY CLUSTERED 
(
	[IdInspeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Insumo]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Insumo](
	[IdInsumo] [int] IDENTITY(1,1) NOT NULL,
	[NombreInsumo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Insumo] PRIMARY KEY CLUSTERED 
(
	[IdInsumo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InventarioHabitacion]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventarioHabitacion](
	[IdInventarioHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[IdMueble] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_InventarioHabitacion] PRIMARY KEY CLUSTERED 
(
	[IdInventarioHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LogCambioPrecios]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LogCambioPrecios](
	[IdLog] [int] IDENTITY(1,1) NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[FechaCambio] [date] NOT NULL,
	[PrecioAnterior] [int] NOT NULL,
 CONSTRAINT [PK_LogCambioPrecios] PRIMARY KEY CLUSTERED 
(
	[IdLog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu_Reserva]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Menu_Reserva](
	[IdReserva] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[IdMenuDiario] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MenuDiario]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MenuDiario](
	[IdMenuDiario] [int] IDENTITY(1,1) NOT NULL,
	[Fecha] [date] NOT NULL,
	[Desayuno] [varchar](255) NOT NULL,
	[Almuerzo] [varchar](255) NOT NULL,
	[MediaTarde] [varchar](255) NOT NULL,
	[Cena] [varchar](255) NOT NULL,
 CONSTRAINT [PK_MenuDiario] PRIMARY KEY CLUSTERED 
(
	[IdMenuDiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mueble]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mueble](
	[IdMueble] [int] IDENTITY(1,1) NOT NULL,
	[NombreMueble] [varchar](100) NOT NULL,
	[Precio] [int] NOT NULL,
 CONSTRAINT [PK_Mueble] PRIMARY KEY CLUSTERED 
(
	[IdMueble] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Region]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Region](
	[IdRegion] [int] NOT NULL,
	[NombreRegion] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Region] PRIMARY KEY CLUSTERED 
(
	[IdRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva](
	[IdReserva] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NOT NULL,
	[IdHotel] [int] NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[PrecioFinalDiario] [int] NOT NULL,
	[FechaCreacion] [date] NOT NULL,
	[FechaInicioReserva] [date] NOT NULL,
	[FechaFinReserva] [date] NOT NULL,
	[CantPersonas] [int] NOT NULL,
	[PrecioFinal] [int] NOT NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Reserva_Servicio]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Servicio](
	[IdReserva] [int] NOT NULL,
	[IdServicio] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Rol](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[DescripcionRol] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Servicio](
	[IdServicio] [int] IDENTITY(1,1) NOT NULL,
	[NombreServicio] [varchar](100) NOT NULL,
	[PrecioServicio] [int] NOT NULL,
 CONSTRAINT [PK_Servicio] PRIMARY KEY CLUSTERED 
(
	[IdServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StockCocina]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCocina](
	[IdStockCocina] [int] IDENTITY(1,1) NOT NULL,
	[IdHotel] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Platos] [int] NOT NULL,
	[Tenedores] [int] NOT NULL,
	[Cuchillos] [int] NOT NULL,
	[Arroz] [int] NOT NULL,
	[Carne] [int] NOT NULL,
	[Pan] [int] NOT NULL,
	[Jugo] [int] NOT NULL,
	[Sopa] [int] NOT NULL,
 CONSTRAINT [PK_StockCocina] PRIMARY KEY CLUSTERED 
(
	[IdStockCocina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[IdTipoHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoHabitacion] [varchar](50) NOT NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ubicacion](
	[IdUbicacion] [int] IDENTITY(1,1) NOT NULL,
	[IdCiudad] [int] NOT NULL,
	[NombreUbicacion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Ubicacion] PRIMARY KEY CLUSTERED 
(
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UsoStock]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UsoStock](
	[IdUsoStock] [int] IDENTITY(1,1) NOT NULL,
	[IdMenu] [int] NOT NULL,
	[IdInsumo] [int] NOT NULL,
	[Cantidad] [int] NOT NULL,
 CONSTRAINT [PK_UsoStock] PRIMARY KEY CLUSTERED 
(
	[IdUsoStock] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 19-10-15 1:10:08 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [varchar](50) NOT NULL,
	[IdCliente] [int] NULL,
	[IdRol] [int] NOT NULL,
	[Password] [varchar](256) NOT NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (1, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (2, N'Usuario')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (3, N'Cliente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [IdCliente], [IdRol], [Password]) VALUES (2, N'test', NULL, 1, N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Ciudad]  WITH CHECK ADD  CONSTRAINT [FK_Ciudad_Region] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[Region] ([IdRegion])
GO
ALTER TABLE [dbo].[Ciudad] CHECK CONSTRAINT [FK_Ciudad_Region]
GO
ALTER TABLE [dbo].[Habitacion]  WITH CHECK ADD  CONSTRAINT [FK_Habitacion_TipoHabitacion] FOREIGN KEY([IdTipoHabitacion])
REFERENCES [dbo].[TipoHabitacion] ([IdTipoHabitacion])
GO
ALTER TABLE [dbo].[Habitacion] CHECK CONSTRAINT [FK_Habitacion_TipoHabitacion]
GO
ALTER TABLE [dbo].[HabitacionesDisponibles]  WITH CHECK ADD  CONSTRAINT [FK_HabitacionesDisponibles_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([IdHotel])
GO
ALTER TABLE [dbo].[HabitacionesDisponibles] CHECK CONSTRAINT [FK_HabitacionesDisponibles_Hotel]
GO
ALTER TABLE [dbo].[HabitacionesDisponibles]  WITH CHECK ADD  CONSTRAINT [FK_HabitacionesDisponibles_TipoHabitacion] FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[TipoHabitacion] ([IdTipoHabitacion])
GO
ALTER TABLE [dbo].[HabitacionesDisponibles] CHECK CONSTRAINT [FK_HabitacionesDisponibles_TipoHabitacion]
GO
ALTER TABLE [dbo].[Hotel]  WITH CHECK ADD  CONSTRAINT [FK_Hotel_Ubicacion] FOREIGN KEY([IdUbicacion])
REFERENCES [dbo].[Ubicacion] ([IdUbicacion])
GO
ALTER TABLE [dbo].[Hotel] CHECK CONSTRAINT [FK_Hotel_Ubicacion]
GO
ALTER TABLE [dbo].[InventarioHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_InventarioHabitacion_Habitacion] FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitacion] ([IdHabitacion])
GO
ALTER TABLE [dbo].[InventarioHabitacion] CHECK CONSTRAINT [FK_InventarioHabitacion_Habitacion]
GO
ALTER TABLE [dbo].[InventarioHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_InventarioHabitacion_Mueble] FOREIGN KEY([IdMueble])
REFERENCES [dbo].[Mueble] ([IdMueble])
GO
ALTER TABLE [dbo].[InventarioHabitacion] CHECK CONSTRAINT [FK_InventarioHabitacion_Mueble]
GO
ALTER TABLE [dbo].[InventarioHabitacion]  WITH CHECK ADD  CONSTRAINT [FK_InventarioHabitacion_TipoHabitacion] FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[TipoHabitacion] ([IdTipoHabitacion])
GO
ALTER TABLE [dbo].[InventarioHabitacion] CHECK CONSTRAINT [FK_InventarioHabitacion_TipoHabitacion]
GO
ALTER TABLE [dbo].[Menu_Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Dias_Reserva_MenuDiario] FOREIGN KEY([IdMenuDiario])
REFERENCES [dbo].[MenuDiario] ([IdMenuDiario])
GO
ALTER TABLE [dbo].[Menu_Reserva] CHECK CONSTRAINT [FK_Dias_Reserva_MenuDiario]
GO
ALTER TABLE [dbo].[Menu_Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Dias_Reserva_Reserva] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[Menu_Reserva] CHECK CONSTRAINT [FK_Dias_Reserva_Reserva]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Habitacion] FOREIGN KEY([IdHabitacion])
REFERENCES [dbo].[Habitacion] ([IdHabitacion])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Reserva]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([IdHotel])
GO
ALTER TABLE [dbo].[Reserva] CHECK CONSTRAINT [FK_Reserva_Hotel]
GO
ALTER TABLE [dbo].[Reserva_Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Servicio_Reserva] FOREIGN KEY([IdReserva])
REFERENCES [dbo].[Reserva] ([IdReserva])
GO
ALTER TABLE [dbo].[Reserva_Servicio] CHECK CONSTRAINT [FK_Reserva_Servicio_Reserva]
GO
ALTER TABLE [dbo].[Reserva_Servicio]  WITH CHECK ADD  CONSTRAINT [FK_Reserva_Servicio_Servicio] FOREIGN KEY([IdServicio])
REFERENCES [dbo].[Servicio] ([IdServicio])
GO
ALTER TABLE [dbo].[Reserva_Servicio] CHECK CONSTRAINT [FK_Reserva_Servicio_Servicio]
GO
ALTER TABLE [dbo].[StockCocina]  WITH CHECK ADD  CONSTRAINT [FK_StockCocina_Hotel] FOREIGN KEY([IdHotel])
REFERENCES [dbo].[Hotel] ([IdHotel])
GO
ALTER TABLE [dbo].[StockCocina] CHECK CONSTRAINT [FK_StockCocina_Hotel]
GO
ALTER TABLE [dbo].[Ubicacion]  WITH CHECK ADD  CONSTRAINT [FK_Ubicacion_Ciudad] FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Ciudad] ([IdCiudad])
GO
ALTER TABLE [dbo].[Ubicacion] CHECK CONSTRAINT [FK_Ubicacion_Ciudad]
GO
ALTER TABLE [dbo].[UsoStock]  WITH CHECK ADD  CONSTRAINT [FK_UsoStock_Insumo] FOREIGN KEY([IdInsumo])
REFERENCES [dbo].[Insumo] ([IdInsumo])
GO
ALTER TABLE [dbo].[UsoStock] CHECK CONSTRAINT [FK_UsoStock_Insumo]
GO
ALTER TABLE [dbo].[UsoStock]  WITH CHECK ADD  CONSTRAINT [FK_UsoStock_MenuDiario] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[MenuDiario] ([IdMenuDiario])
GO
ALTER TABLE [dbo].[UsoStock] CHECK CONSTRAINT [FK_UsoStock_MenuDiario]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Cliente] FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Cliente] ([IdCliente])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Cliente]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Rol] FOREIGN KEY([IdRol])
REFERENCES [dbo].[Rol] ([IdRol])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Rol]
GO
USE [master]
GO
ALTER DATABASE [Veranum] SET  READ_WRITE 
GO
