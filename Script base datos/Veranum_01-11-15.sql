USE [master]
GO
/****** Object:  Database [Veranum]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteClientePorNombreUsuario]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ClienteClientePorNombreUsuario]
@Nombre varchar(50)
as
begin
	select *
	from Cliente
	inner join Usuario on Usuario.IdCliente = Cliente.IdCliente
	where NombreUsuario = @Nombre
end

GO
/****** Object:  StoredProcedure [dbo].[ClienteCrear]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ClienteCrear]
@RutCliente varchar(12),
@NombreCliente varchar(50),
@ApellidoPaterno varchar(50),
@ApellidoMaterno varchar(50),
@EmailCliente varchar(100),
@TelefonoCliente varchar(12)
as
begin
	if exists (select 1 from Cliente where RutCliente = @RutCliente)
		begin
			update Cliente set NombreCliente = @NombreCliente, ApellidoPaternoCliente = @ApellidoPaterno,
			ApellidoMaternoCliente = @ApellidoMaterno, EmailCliente = @EmailCliente, TelefonoCliente = @TelefonoCliente
			where RutCliente = @RutCliente
		end
	else
		begin 
			insert into Cliente values(@RutCliente,@NombreCliente,@ApellidoPaterno,@ApellidoMaterno,
									   @EmailCliente,@TelefonoCliente)
		end
		
end

GO
/****** Object:  StoredProcedure [dbo].[ClientEliminar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ClientEliminar]
@IdCliente int
as
begin
	delete
	from Cliente
	where IdCliente = @IdCliente
end

GO
/****** Object:  StoredProcedure [dbo].[ClienteListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ClienteListar]
as
begin
	select *
	from Cliente
	order by NombreCliente
end

GO
/****** Object:  StoredProcedure [dbo].[ClienteModificar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ClienteModificar]
@IdCliente int,
@EmailCliente varchar(100),
@TelefonoCliente varchar(12)
as
begin
	update Cliente set EmailCliente = @EmailCliente,TelefonoCliente = @TelefonoCliente
	where IdCliente = @IdCliente
end

GO
/****** Object:  StoredProcedure [dbo].[ClienteObtener]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ClienteObtener]
@IdCliente int
as
begin
	select *
	from Cliente
	where IdCliente = @IdCliente
end

GO
/****** Object:  StoredProcedure [dbo].[ClienteObtenerPorRut]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[ClienteObtenerPorRut]
@RutCliente varchar(12)
as
begin
	select *
	from Cliente
	where RutCliente = @RutCliente
end


GO
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[HabitacionesDisponiblesListar]
@IdHotel int,
@IdTipoHabitacion int = null
as
begin
	set @IdTipoHabitacion= nullif(@IdTipoHabitacion,-1)
	select *
	from habitacion
	where IdHotel = @IdHotel
	and IdTipoHabitacion = isnull(@IdTipoHabitacion,IdTipoHabitacion)
end

GO
/****** Object:  StoredProcedure [dbo].[HotelListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[HotelListar]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	select * from Hotel order by 1;

END

GO
/****** Object:  StoredProcedure [dbo].[Reserva_Servicio_Crear]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Reserva_Servicio_Crear]
@IdReserva int,
@IdServicio int
as
begin
	insert into Reserva_Servicio values(@IdReserva,@IdServicio)
end

GO
/****** Object:  StoredProcedure [dbo].[ReservaCrear]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ReservaCrear]
@IdCliente int,
@IdHotel int,
@IdHabitacion int,
@FechaInicioReserva Date,
@FechaFinReserva Date,
@CantPersonas int
as
begin
	
	declare @PrecioFinalDiario int
	set @PrecioFinalDiario = (select Precio from Habitacion
							   where IdHabitacion = @IdHabitacion) * @CantPersonas
	
	declare @CantDias int
	set @CantDias = (select DATEDIFF(dd,@FechaInicioReserva,@FechaFinReserva))

	declare @PrecioFinal int
	set @PrecioFinal = @PrecioFinalDiario * @CantDias

	insert into Reserva values(@IdCliente,@IdHotel,@IdHabitacion,@PrecioFinalDiario,getdate(),@FechaInicioReserva,
							   @FechaFinReserva,@CantPersonas,@PrecioFinal)
end

GO
/****** Object:  StoredProcedure [dbo].[ReservaEliminar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ReservaEliminar]
@IdReserva int,
@IdHabitacion int
as
begin
	Delete from Reserva
	where IdReserva = @IdReserva
	Delete from Reserva_Servicio
	where IdReserva = @IdReserva
	Update HabitacionesDisponibles set Disponible = 1
	where IdHabitacion = @IdHabitacion
end

GO
/****** Object:  StoredProcedure [dbo].[ReservaListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ReservaListar]
as
begin
	Select *
	from Reserva
end

GO
/****** Object:  StoredProcedure [dbo].[ReservaObtener]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ReservaObtener]
@IdReserva int
as
begin
	Select *
	from Reserva
	where IdReserva = @IdReserva
end

GO
/****** Object:  StoredProcedure [dbo].[ReservasPorClienteObtener]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ReservasPorClienteObtener]
@IdCliente int
as
begin
	select *
	from Reserva
	where IdCliente = @IdCliente
end

GO
/****** Object:  StoredProcedure [dbo].[ReservasPorHabitacion]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ReservasPorHabitacion]
@IdHabitacion int
as
begin
	Select *
	from Reserva
	where IdHabitacion = @IdHabitacion
end

GO
/****** Object:  StoredProcedure [dbo].[ServicioListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[ServicioListar]
as
begin
	Select *
	from Servicio
end

GO
/****** Object:  StoredProcedure [dbo].[TipoHabitacionListar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[TipoHabitacionListar]
as
begin
	select *
	from TipoHabitacion
end

GO
/****** Object:  StoredProcedure [dbo].[UserAdmObtener]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UserAdmObtener]
@usuario varchar(50),
@password varchar(256)
as
begin
	select * from Usuario where NombreUsuario=@usuario and Password=@password
end

GO
/****** Object:  StoredProcedure [dbo].[UsuarioCrear]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UsuarioCrear]
@NombreUsuario varchar(50),
@IdCliente int,
@IdRol int,
@Password varchar(25)
as
begin
	insert into Usuario values(@NombreUsuario,@IdCliente,@IdRol,[dbo].[fnEncriptaContraseña](@Password))
end

GO
/****** Object:  StoredProcedure [dbo].[UsuarioModificar]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UsuarioModificar]
@NombreAntiguo varchar(50),
@NombreNuevo varchar(50),
@PasswordNuevo varchar(50)
as
begin
	update Usuario set NombreUsuario = @NombreNuevo, Password = [dbo].[fnEncriptaContraseña](@PasswordNuevo)
	where NombreUsuario = @NombreAntiguo
end

GO
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerPorNombre]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UsuarioObtenerPorNombre]
@Nombre varchar(50)
as
begin
	select *
	from Usuario
	where NombreUsuario = @Nombre
end

GO
/****** Object:  UserDefinedFunction [dbo].[fnDesencriptaContraseña]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnDesencriptaContraseña]
(
	@CONTRASEÑA VARBINARY(8000)
)
RETURNS VARCHAR(25)
AS
BEGIN
	DECLARE @PASS AS VARCHAR(25)

	SET @PASS = DECRYPTBYPASSPHRASE('Veranum',@CONTRASEÑA)

	RETURN @PASS
END

GO
/****** Object:  UserDefinedFunction [dbo].[fnEncriptaContraseña]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[fnEncriptaContraseña]
(
	@CONTRASEÑA VARCHAR(25)
)
RETURNS VARBINARY(8000)
AS
BEGIN
	DECLARE @PASS AS VARBINARY(8000)

	SET @PASS = ENCRYPTBYPASSPHRASE('Veranum',@CONTRASEÑA)

	RETURN @PASS
END

GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Habitacion]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[HabitacionesDisponibles]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HabitacionesDisponibles](
	[IdHotel] [int] NOT NULL,
	[IdHabitacion] [int] NOT NULL,
	[Disponible] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[InspeccionSanitaria]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Insumo]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[InventarioHabitacion]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[LogCambioPrecios]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Menu_Reserva]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[MenuDiario]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Mueble]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Region]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Reserva]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Reserva_Servicio]    Script Date: 01-11-15 11:06:06 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Servicio](
	[IdReserva] [int] NOT NULL,
	[IdServicio] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[StockCocina]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[UsoStock]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 01-11-15 11:06:06 p.m. ******/
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
SET IDENTITY_INSERT [dbo].[Ciudad] ON 

INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (3, 13, N'Santiago')
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (6, N'555555-5', N'Prueba5', N'Paterno', N'Materno', N'12323@sads.cl', N'123123')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (7, N'666666-6', N'Prueba6', N'Paterno', N'Materno', N'12323@sads.cl', N'123123')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (8, N'777777-7', N'Prueba7', N'Paterno', N'Materno', N'12323@sads.cl', N'123123')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (10, N'88888-8', N'Nom8', N'ApP8', N'ApM8', N'8@8.cl', N'88888')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (13, N'11111111-2', N'Nom8', N'ApP8', N'ApM8', N'8@8.cl', N'88888')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (15, N'3333333-3', N'Prueba3', N'Paterno', N'Materno', N'12323@sads.cl', N'123123')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (16, N'4444444-4', N'Usuario4', N'Apellido4', N'mat4', N'user4@user.cl', N'4444444444')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [TieneVIP], [HabitacionesVIP], [TieneBusiness], [HabitacionesBusiness], [TieneBasica], [HabitacionesBasicas]) VALUES (5, N'Holtel1', 4, 1, 10, 1, 10, 1, 20)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (13, N'RM')
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (1, N'Cliente')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (2, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (3, N'Gerente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 

INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (4, 3, N'Santiago')
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [IdCliente], [IdRol], [Password]) VALUES (2, N'test', NULL, 3, N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [IdCliente], [IdRol], [Password]) VALUES (3, N'admin', NULL, 2, N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918')
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
