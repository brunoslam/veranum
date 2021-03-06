USE [Veranum]
GO
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Rol]
GO
ALTER TABLE [dbo].[Usuario] DROP CONSTRAINT [FK_Usuario_Cliente]
GO
ALTER TABLE [dbo].[UsoStock] DROP CONSTRAINT [FK_UsoStock_MenuDiario]
GO
ALTER TABLE [dbo].[UsoStock] DROP CONSTRAINT [FK_UsoStock_Insumo]
GO
ALTER TABLE [dbo].[Ubicacion] DROP CONSTRAINT [FK_Ubicacion_Ciudad]
GO
ALTER TABLE [dbo].[StockCocina] DROP CONSTRAINT [FK_StockCocina_Insumo]
GO
ALTER TABLE [dbo].[StockCocina] DROP CONSTRAINT [FK_StockCocina_Hotel]
GO
ALTER TABLE [dbo].[Reserva_Servicio] DROP CONSTRAINT [FK_Reserva_Servicio_Servicio]
GO
ALTER TABLE [dbo].[Reserva_Servicio] DROP CONSTRAINT [FK_Reserva_Servicio_Reserva]
GO
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_Hotel]
GO
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_Habitacion]
GO
ALTER TABLE [dbo].[Reserva] DROP CONSTRAINT [FK_Reserva_Cliente]
GO
ALTER TABLE [dbo].[Menu_Reserva] DROP CONSTRAINT [FK_Dias_Reserva_Reserva]
GO
ALTER TABLE [dbo].[Menu_Reserva] DROP CONSTRAINT [FK_Dias_Reserva_MenuDiario]
GO
ALTER TABLE [dbo].[InventarioHabitacion] DROP CONSTRAINT [FK_InventarioHabitacion_Mueble]
GO
ALTER TABLE [dbo].[InventarioHabitacion] DROP CONSTRAINT [FK_InventarioHabitacion_Habitacion]
GO
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [FK_Hotel_Ubicacion]
GO
ALTER TABLE [dbo].[Habitacion] DROP CONSTRAINT [FK_Habitacion_TipoHabitacion]
GO
ALTER TABLE [dbo].[Ciudad] DROP CONSTRAINT [FK_Ciudad_Region]
GO
/****** Object:  Index [NomHotelUnique]    Script Date: 18-11-15 11:35:40 p.m. ******/
ALTER TABLE [dbo].[Hotel] DROP CONSTRAINT [NomHotelUnique]
GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Usuario]
GO
/****** Object:  Table [dbo].[UsoStock]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[UsoStock]
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Ubicacion]
GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[TipoHabitacion]
GO
/****** Object:  Table [dbo].[StockCocina]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[StockCocina]
GO
/****** Object:  Table [dbo].[Servicio]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Servicio]
GO
/****** Object:  Table [dbo].[Rol]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Rol]
GO
/****** Object:  Table [dbo].[Reserva_Servicio]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Reserva_Servicio]
GO
/****** Object:  Table [dbo].[Reserva]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Reserva]
GO
/****** Object:  Table [dbo].[Region]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Region]
GO
/****** Object:  Table [dbo].[Mueble]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Mueble]
GO
/****** Object:  Table [dbo].[MenuDiario]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[MenuDiario]
GO
/****** Object:  Table [dbo].[Menu_Reserva]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Menu_Reserva]
GO
/****** Object:  Table [dbo].[LogCambioPrecios]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[LogCambioPrecios]
GO
/****** Object:  Table [dbo].[InventarioHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[InventarioHabitacion]
GO
/****** Object:  Table [dbo].[Insumo]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Insumo]
GO
/****** Object:  Table [dbo].[InspeccionSanitaria]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[InspeccionSanitaria]
GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Hotel]
GO
/****** Object:  Table [dbo].[Habitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Habitacion]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Cliente]
GO
/****** Object:  Table [dbo].[Ciudad]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP TABLE [dbo].[Ciudad]
GO
/****** Object:  UserDefinedFunction [dbo].[fnEncriptaContraseña]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP FUNCTION [dbo].[fnEncriptaContraseña]
GO
/****** Object:  UserDefinedFunction [dbo].[fnDesencriptaContraseña]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP FUNCTION [dbo].[fnDesencriptaContraseña]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerTodos]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioObtenerTodos]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerPorNombre]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioObtenerPorNombre]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioModificar2]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioModificar2]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioModificar]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioCrear2]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioCrear2]
GO
/****** Object:  StoredProcedure [dbo].[UsuarioCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UsuarioCrear]
GO
/****** Object:  StoredProcedure [dbo].[UserAdmObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[UserAdmObtener]
GO
/****** Object:  StoredProcedure [dbo].[TipoHabitacionListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[TipoHabitacionListar]
GO
/****** Object:  StoredProcedure [dbo].[TipoHabitacionCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[TipoHabitacionCrear]
GO
/****** Object:  StoredProcedure [dbo].[ServiciolListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ServiciolListar]
GO
/****** Object:  StoredProcedure [dbo].[ServicioListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ServicioListar]
GO
/****** Object:  StoredProcedure [dbo].[ServicioCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ServicioCrear]
GO
/****** Object:  StoredProcedure [dbo].[RptUsoServicioAdicionales]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[RptUsoServicioAdicionales]
GO
/****** Object:  StoredProcedure [dbo].[RptUsoSalon]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[RptUsoSalon]
GO
/****** Object:  StoredProcedure [dbo].[RptUsoHabitaciones]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[RptUsoHabitaciones]
GO
/****** Object:  StoredProcedure [dbo].[RptStockInsumoCocina]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[RptStockInsumoCocina]
GO
/****** Object:  StoredProcedure [dbo].[ReservasPorHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservasPorHabitacion]
GO
/****** Object:  StoredProcedure [dbo].[ReservasPorClienteObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservasPorClienteObtener]
GO
/****** Object:  StoredProcedure [dbo].[ReservaObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservaObtener]
GO
/****** Object:  StoredProcedure [dbo].[ReservaListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservaListar]
GO
/****** Object:  StoredProcedure [dbo].[ReservaEliminar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservaEliminar]
GO
/****** Object:  StoredProcedure [dbo].[ReservaCrear2]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservaCrear2]
GO
/****** Object:  StoredProcedure [dbo].[ReservaCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ReservaCrear]
GO
/****** Object:  StoredProcedure [dbo].[Reserva_Servicio_Crear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[Reserva_Servicio_Crear]
GO
/****** Object:  StoredProcedure [dbo].[RegionListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[RegionListar]
GO
/****** Object:  StoredProcedure [dbo].[HotelModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HotelModificar]
GO
/****** Object:  StoredProcedure [dbo].[HotelListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HotelListar]
GO
/****** Object:  StoredProcedure [dbo].[HotelCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HotelCrear]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar2]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HabitacionesDisponiblesListar2]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HabitacionesDisponiblesListar]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionDisponible]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[HabitacionDisponible]
GO
/****** Object:  StoredProcedure [dbo].[ClienteObtenerPorRut]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteObtenerPorRut]
GO
/****** Object:  StoredProcedure [dbo].[ClienteObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteObtener]
GO
/****** Object:  StoredProcedure [dbo].[ClienteModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteModificar]
GO
/****** Object:  StoredProcedure [dbo].[ClienteListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteListar]
GO
/****** Object:  StoredProcedure [dbo].[ClientEliminar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClientEliminar]
GO
/****** Object:  StoredProcedure [dbo].[ClienteCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteCrear]
GO
/****** Object:  StoredProcedure [dbo].[ClienteClientePorNombreUsuario]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[ClienteClientePorNombreUsuario]
GO
/****** Object:  StoredProcedure [dbo].[CiudadListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP PROCEDURE [dbo].[CiudadListar]
GO
USE [master]
GO
/****** Object:  Database [Veranum]    Script Date: 18-11-15 11:35:40 p.m. ******/
DROP DATABASE [Veranum]
GO
/****** Object:  Database [Veranum]    Script Date: 18-11-15 11:35:40 p.m. ******/
CREATE DATABASE [Veranum] ON  PRIMARY 
( NAME = N'Veranum', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Veranum.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Veranum_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL2012\MSSQL\DATA\Veranum_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[CiudadListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[CiudadListar]
@nombreRegion varchar(50)
as
begin
	select c.nombreciudad
	from ciudad c
	JOIN region r
	ON (c.idregion = r.idregion)
	where r.nombreregion = @nombreRegion
	ORDER  BY c.nombreciudad ASC; 

end

GO
/****** Object:  StoredProcedure [dbo].[ClienteClientePorNombreUsuario]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClientEliminar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClienteObtenerPorRut]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[HabitacionDisponible]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[HabitacionDisponible]
@IdHotel int,
@IdHabitacion int,
@FechaInicioReserva date,
@FechaFinReserva date
as
begin
select * from Habitacion 
where IdHabitacion not in (select IdHabitacion from Reserva where FechaFinReserva >= @FechaInicioReserva and FechaInicioReserva<=@FechaFinReserva  )
and IdHotel=@IdHotel and IdHabitacion=@IdHabitacion

end
GO
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar2]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[HabitacionesDisponiblesListar2]
@IdHotel int,
@FechaInicioReserva date,
@FechaFinReserva date
as
begin
select * from Habitacion 
where IdHabitacion not in (select IdHabitacion from Reserva where FechaFinReserva >= @FechaInicioReserva and FechaInicioReserva<=@FechaFinReserva )
and IdHotel=@IdHotel

end
GO
/****** Object:  StoredProcedure [dbo].[HotelCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HotelCrear]

@IdUbicacion int,
@NombreCiudad varchar(100),
@NombreUbicacion varchar(100),
@NombreHotel varchar(100),
@TieneVIP bit,
@HabitacionesVIP int,
@TieneBusiness bit,
@HabitacionesBusiness int,
@TieneBasica bit,
@HabitacionesBasicas int
as
begin

	declare @IdCiudad int
	SET @IdCiudad = (SELECT c.IdCiudad 
                  FROM Ciudad c
                 WHERE c.NombreCiudad = @NombreCiudad);
	insert into Ubicacion values (@IdCiudad, @NombreUbicacion);

	select @IdUbicacion = IdUbicacion from Ubicacion where NombreUbicacion = @NombreUbicacion;
	insert into Hotel values(@NombreHotel, @IdUbicacion, @TieneVIP, @HabitacionesVIP, @TieneBusiness, 
							   @HabitacionesBusiness, @TieneBasica, @HabitacionesBasicas);
end
GO
/****** Object:  StoredProcedure [dbo].[HotelListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HotelListar]
-- Add the parameters for the stored procedure here

AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

   -- Insert statements for procedure here
SELECT h.IdHotel, r.NombreRegion, c.NombreCiudad, u.NombreUbicacion, h.NombreHotel, h.HabitacionesVip, h.HabitacionesBusiness, h.HabitacionesBasicas
FROM Hotel h
JOIN Ubicacion u
ON (u.IdUbicacion = h.IdUbicacion)
JOIN Ciudad c
ON (c.IdCiudad = u.IdCiudad)
JOIN Region r
ON (r.IdRegion = c.IdRegion)
END
GO
/****** Object:  StoredProcedure [dbo].[HotelModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HotelModificar]

@NombreHotel varchar(100),
@IdUbicacion int,
@TieneVIP bit,
@HabitacionesVIP int,
@TieneBusiness bit,
@HabitacionesBusiness int,
@TieneBasica bit,
@HabitacionesBasicas int
as
begin
	insert into Hotel values(@NombreHotel, @IdUbicacion, @TieneVIP, @HabitacionesVIP, @TieneBusiness, 
							   @HabitacionesBusiness, @TieneBasica, @HabitacionesBasicas)
	UPDATE Hotel
	SET NombreHotel = @NombreHotel, IdUbicacion = @IdUbicacion, TieneVIP = @TieneVIP, HabitacionesVIP = @HabitacionesVIP, TieneBusiness = @TieneBusiness, HabitacionesBusiness = @HabitacionesBusiness, 
		TieneBasica = @TieneBasica, HabitacionesBasicas = @HabitacionesBasicas
	WHERE IdHotel = 2;
end




GO
/****** Object:  StoredProcedure [dbo].[RegionListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[RegionListar]
as
begin
	SELECT  *
	FROM Region
end

GO
/****** Object:  StoredProcedure [dbo].[Reserva_Servicio_Crear]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservaCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservaCrear2]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ReservaCrear2]
@IdCliente int,
@IdHotel int,
@IdHabitacion int,
@FechaInicioReserva Date,
@FechaFinReserva Date,
@CantPersonas int,
@Cant_adultos int,
@Cant_menores int,
@estadoReserva varchar(50),
@Moneda varchar(50),
@TotalCancelado int
as
begin
	
	declare @PrecioFinalAdultos int
	set @PrecioFinalAdultos = (select Precio from Habitacion
							   where IdHabitacion = @IdHabitacion) * @Cant_adultos

	declare @PrecioFinalmenores int
	set @PrecioFinalmenores = (((select Precio from Habitacion
							   where IdHabitacion = @IdHabitacion) * @Cant_menores) + 1.25)
	
	declare @PrecioFianlDiario int
	set @PrecioFianlDiario=@PrecioFinalAdultos+@PrecioFinalmenores

	declare @CantDias int
	set @CantDias = (select DATEDIFF(dd,@FechaInicioReserva,@FechaFinReserva))

	declare @PrecioFinal int
	set @PrecioFinal = (@PrecioFianlDiario) * @CantDias

	insert into Reserva values(@IdCliente,@IdHotel,@IdHabitacion,@PrecioFianlDiario,getdate(),@FechaInicioReserva,
							   @FechaFinReserva,@CantPersonas,@PrecioFinal,@Cant_adultos,@Cant_menores,@estadoReserva,@Moneda,@TotalCancelado)
end



GO
/****** Object:  StoredProcedure [dbo].[ReservaEliminar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservaListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservaObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservasPorClienteObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ReservasPorHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[RptStockInsumoCocina]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RptStockInsumoCocina]
@IdHotel int
as
begin
	select StockCocina.*,
	Insumo.NombreInsumo,
	hotel.NombreHotel
	from StockCocina
	inner join Insumo on insumo.IdInsumo = StockCocina.IdInsumo
	inner join Hotel on StockCocina.IdHotel = Hotel.IdHotel
	where stockcocina.IdHotel = @IdHotel
	--and fecha = getdate()
end

GO
/****** Object:  StoredProcedure [dbo].[RptUsoHabitaciones]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RptUsoHabitaciones]
@IdHotel int,
@FechaInicio Date,
@FechaFin Date
as
begin
	Select HabitacionesDisponibles.IdHabitacion
		   ,Habitacion.NumeroReal
		   ,Hotel.NombreHotel
		   ,(select count(hb.Fecha) from HabitacionesDisponibles hb where Fecha between @FechaInicio and @FechaFin
		     and hb.IdHabitacion = HabitacionesDisponibles.IdHabitacion) as DiasReservados
	from HabitacionesDisponibles
	inner join Habitacion on habitacion.IdHabitacion = habitacionesdisponibles.IdHabitacion
	inner join Hotel on Hotel.IdHotel = Habitacion.IdHotel
	where habitacion.IdHotel = @IdHotel
	AND Habitacion.IdTipoHabitacion != 4
	group by HabitacionesDisponibles.IdHabitacion,Habitacion.NumeroReal,hotel.NombreHotel
end

--[RptUsoHabitaciones] 2,'2015-11-11','2015-11-30'


GO
/****** Object:  StoredProcedure [dbo].[RptUsoSalon]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RptUsoSalon]
@FechaInicio Date,
@FechaFin Date
as
begin
	Select HabitacionesDisponibles.IdHabitacion
		   ,Habitacion.NumeroReal
		   ,Hotel.NombreHotel
		   ,(select count(hb.Fecha) from HabitacionesDisponibles hb where Fecha between @FechaInicio and @FechaFin
		     and hb.IdHabitacion = HabitacionesDisponibles.IdHabitacion) as DiasReservados
	from HabitacionesDisponibles
	inner join Habitacion on habitacion.IdHabitacion = habitacionesdisponibles.IdHabitacion
	inner join Hotel on Hotel.IdHotel = Habitacion.IdHotel
	where Habitacion.IdTipoHabitacion = 4
	group by HabitacionesDisponibles.IdHabitacion,Habitacion.NumeroReal,hotel.NombreHotel
end

--[RptUsoSalon] 1,'2015-11-11','2015-11-30'


GO
/****** Object:  StoredProcedure [dbo].[RptUsoServicioAdicionales]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RptUsoServicioAdicionales]
@IdHotel int
as
begin
	select	Reserva_Servicio.IdServicio,
		    Servicio.NombreServicio, 
			count(Reserva_Servicio.idservicio) as VecesSolicitado
	from Reserva_Servicio
	inner join Servicio on Servicio.IdServicio = Reserva_Servicio.IdServicio
	inner join Reserva on Reserva.IdReserva = Reserva_Servicio.IdReserva
	inner join Hotel on Hotel.IdHotel = Reserva.IdHotel
	where Reserva.IdHotel = @IdHotel
	group by Reserva_Servicio.IdServicio,Servicio.NombreServicio
	order by count(Reserva_Servicio.idservicio) desc
end

GO
/****** Object:  StoredProcedure [dbo].[ServicioCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ServicioCrear]

@NombreServicio varchar(100),
@Precio int
as
begin
	insert into Servicio values(@NombreServicio, @Precio)
end

GO
/****** Object:  StoredProcedure [dbo].[ServicioListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ServiciolListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ServiciolListar]
as
begin
	SELECT  *
	FROM Servicio
end


GO
/****** Object:  StoredProcedure [dbo].[TipoHabitacionCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[TipoHabitacionCrear]
@IdTipoHabitacion int,
@NombreTipoHabitacion varchar(50),
@CapacidadPersonas int

as

begin
	if exists (select 1 from TipoHabitacion where IdTipoHabitacion = @IdTipoHabitacion)
		begin
			update TipoHabitacion set NombreTipoHabitacion = @NombreTipoHabitacion, CapacidadPersonas = @CapacidadPersonas
			where  IdTipoHabitacion = @IdTipoHabitacion
		end
	else
		begin 
			insert into TipoHabitacion values(@NombreTipoHabitacion,@CapacidadPersonas)
		end
		
end



GO
/****** Object:  StoredProcedure [dbo].[TipoHabitacionListar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UserAdmObtener]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioCrear]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioCrear2]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UsuarioCrear2]
@NombreUsuario varchar(50),
@IdCliente int,
@IdRol int,
@Password varchar(64)
as
begin
	insert into Usuario values(@NombreUsuario,@IdCliente,@IdRol,@Password)
end



GO
/****** Object:  StoredProcedure [dbo].[UsuarioModificar]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioModificar2]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UsuarioModificar2]
@IdUsuario int,
@NombreUsuario varchar(50),
@IdRol int,
@Password varchar(64)
as
begin
	update Usuario set NombreUsuario = @NombreUsuario, IdRol=@IdRol, Password=@Password
	where IdUsuario = @IdUsuario
end



GO
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerPorNombre]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerTodos]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[UsuarioObtenerTodos]

as
begin
	select * from Usuario
end



GO
/****** Object:  UserDefinedFunction [dbo].[fnDesencriptaContraseña]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  UserDefinedFunction [dbo].[fnEncriptaContraseña]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Ciudad]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Cliente]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Habitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
	[NumeroReal] [int] NULL,
 CONSTRAINT [PK_Habitacion] PRIMARY KEY CLUSTERED 
(
	[IdHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hotel]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
	[HabitacionesVIP] [int] NOT NULL,
	[HabitacionesBusiness] [int] NOT NULL,
	[HabitacionesBasicas] [int] NOT NULL,
 CONSTRAINT [PK_Hotel] PRIMARY KEY CLUSTERED 
(
	[IdHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InspeccionSanitaria]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Insumo]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[InventarioHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[LogCambioPrecios]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Menu_Reserva]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[MenuDiario]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Mueble]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Region]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Reserva]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
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
	[Cant_adultos] [int] NULL,
	[Cant_menores] [int] NULL,
	[EstadoReserva] [varchar](50) NULL,
	[Moneda] [varchar](50) NULL,
	[TotalCancelado] [int] NULL,
 CONSTRAINT [PK_Reserva] PRIMARY KEY CLUSTERED 
(
	[IdReserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Reserva_Servicio]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reserva_Servicio](
	[IdReserva] [int] NOT NULL,
	[IdServicio] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rol]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Servicio]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[StockCocina]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StockCocina](
	[IdInsumo] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Cantidad] [int] NULL,
	[CantidadIdeal] [int] NOT NULL,
	[IdHotel] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TipoHabitacion](
	[IdTipoHabitacion] [int] IDENTITY(1,1) NOT NULL,
	[NombreTipoHabitacion] [varchar](50) NOT NULL,
	[CapacidadPersonas] [int] NULL,
 CONSTRAINT [PK_TipoHabitacion] PRIMARY KEY CLUSTERED 
(
	[IdTipoHabitacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ubicacion]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[UsoStock]    Script Date: 18-11-15 11:35:40 p.m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 18-11-15 11:35:40 p.m. ******/
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

INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (1, 1, N'ALTO HOSPICIO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (2, 1, N'CAMINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (3, 1, N'COLCHANE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (4, 1, N'HUARA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (5, 1, N'IQUIQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (6, 1, N'PICA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (7, 1, N'POZO ALMONTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (8, 2, N'ANTOFAGASTA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (9, 2, N'CALAMA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (10, 2, N'MARIA ELENA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (11, 2, N'MEJILLONES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (12, 2, N'OLLAGUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (13, 2, N'SAN PEDRO DE ATACAMA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (14, 2, N'SIERRA GORDA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (15, 2, N'TALTAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (16, 2, N'TOCOPILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (17, 3, N'ALTO DEL CARMEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (18, 3, N'CALDERA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (19, 3, N'CHAÑARAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (20, 3, N'COPIAPO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (21, 3, N'DIEGO DE ALMAGRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (22, 3, N'FREIRINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (23, 3, N'HUASCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (24, 3, N'TIERRA AMARILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (25, 3, N'VALLENAR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (26, 4, N'ANDACOLLO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (27, 4, N'CANELA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (28, 4, N'COMBARBALA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (29, 4, N'COQUIMBO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (30, 4, N'ILLAPEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (31, 4, N'LA HIGUERA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (32, 4, N'LA SERENA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (33, 4, N'LOS VILOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (34, 4, N'MONTE PATRIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (35, 4, N'OVALLE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (36, 4, N'PAIHUANO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (37, 4, N'PUNITAQUI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (38, 4, N'RIO HURTADO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (39, 4, N'SALAMANCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (40, 4, N'VICUÑA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (41, 5, N'ALGARROBO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (42, 5, N'CABILDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (43, 5, N'CALLE LARGA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (44, 5, N'CARTAGENA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (45, 5, N'CASABLANCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (46, 5, N'CATEMU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (47, 5, N'CONCON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (48, 5, N'EL QUISCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (49, 5, N'EL TABO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (50, 5, N'HIJUELAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (51, 5, N'ISLA DE PASCUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (52, 5, N'JUAN FERNANDEZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (53, 5, N'LA CALERA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (54, 5, N'LA CRUZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (55, 5, N'LA LIGUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (56, 5, N'LIMACHE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (57, 5, N'LLAY LLAY')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (58, 5, N'LOS ANDES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (59, 5, N'NOGALES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (60, 5, N'OLMUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (61, 5, N'PANQUEHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (62, 5, N'PAPUDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (63, 5, N'PETORCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (64, 5, N'PUCHUNCAVI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (65, 5, N'PUTAENDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (66, 5, N'QUILLOTA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (67, 5, N'QUILPUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (68, 5, N'QUINTERO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (69, 5, N'RINCONADA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (70, 5, N'SAN ANTONIO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (71, 5, N'SAN ESTEBAN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (72, 5, N'SAN FELIPE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (73, 5, N'SANTA MARIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (74, 5, N'SANTO DOMINGO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (75, 5, N'VALPARAISO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (76, 5, N'VILLA ALEMANA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (77, 5, N'VIÑA DEL MAR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (78, 5, N'ZAPALLAR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (79, 6, N'CHEPICA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (80, 6, N'CHIMBARONGO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (81, 6, N'CODEGUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (82, 6, N'COINCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (83, 6, N'COLTAUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (84, 6, N'DOÑIHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (85, 6, N'GRANEROS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (86, 6, N'LA ESTRELLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (87, 6, N'LAS CABRAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (88, 6, N'LITUECHE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (89, 6, N'LOLOL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (90, 6, N'MACHALI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (91, 6, N'MALLOA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (92, 6, N'MARCHIGUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (93, 6, N'NANCAGUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (94, 6, N'NAVIDAD')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (95, 6, N'OLIVAR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (96, 6, N'PALMILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (97, 6, N'PAREDONES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (98, 6, N'PERALILLO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (99, 6, N'PEUMO')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (100, 6, N'PICHIDEGUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (101, 6, N'PICHILEMU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (102, 6, N'PLACILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (103, 6, N'PUMANQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (104, 6, N'QUINTA DE TILCOCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (105, 6, N'RANCAGUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (106, 6, N'RENGO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (107, 6, N'REQUINOA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (108, 6, N'SAN FERNANDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (109, 6, N'SAN FRANCISCO DE MOSTAZAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (110, 6, N'SAN VICENTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (111, 6, N'SANTA CRUZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (112, 7, N'CAUQUENES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (113, 7, N'CHANCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (114, 7, N'COLBUN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (115, 7, N'CONSTITUCION')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (116, 7, N'CUREPTO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (117, 7, N'CURICO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (118, 7, N'EMPEDRADO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (119, 7, N'HUALAÑE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (120, 7, N'LICANTEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (121, 7, N'LINARES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (122, 7, N'LONGAVI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (123, 7, N'MAULE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (124, 7, N'MOLINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (125, 7, N'PARRAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (126, 7, N'PELARCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (127, 7, N'PELLUHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (128, 7, N'PENCAHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (129, 7, N'RAUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (130, 7, N'RETIRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (131, 7, N'RIO CLARO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (132, 7, N'ROMERAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (133, 7, N'SAGRADA FAMILIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (134, 7, N'SAN CLEMENTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (135, 7, N'SAN JAVIER')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (136, 7, N'SAN RAFAEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (137, 7, N'TALCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (138, 7, N'TENO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (139, 7, N'VICHUQUEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (140, 7, N'VILLA ALEGRE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (141, 7, N'YERBAS BUENAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (142, 8, N'ANTUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (143, 8, N'ARAUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (144, 8, N'BULNES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (145, 8, N'CABRERO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (146, 8, N'CAÑETE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (147, 8, N'CHIGUAYANTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (148, 8, N'CHILLAN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (149, 8, N'CHILLAN VIEJO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (150, 8, N'COBQUECURA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (151, 8, N'COELEMU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (152, 8, N'COIHUECO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (153, 8, N'CONCEPCION')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (154, 8, N'CONTULMO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (155, 8, N'CORONEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (156, 8, N'CURANILAHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (157, 8, N'EL CARMEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (158, 8, N'FLORIDA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (159, 8, N'HUALQUI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (160, 8, N'LAJA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (161, 8, N'LEBU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (162, 8, N'LOS ALAMOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (163, 8, N'LOS ANGELES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (164, 8, N'LOTA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (165, 8, N'MULCHEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (166, 8, N'NACIMIENTO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (167, 8, N'NEGRETE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (168, 8, N'NINHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (169, 8, N'PEMUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (170, 8, N'PENCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (171, 8, N'PINTO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (172, 8, N'PORTEZUELO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (173, 8, N'QUILACO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (174, 8, N'QUILLECO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (175, 8, N'QUILLON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (176, 8, N'QUIRIHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (177, 8, N'RANQUIL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (178, 8, N'SAN CARLOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (179, 8, N'SAN FABIAN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (180, 8, N'SAN GREGORIO DE ÑIQUEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (181, 8, N'SAN IGNACIO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (182, 8, N'SAN NICOLAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (183, 8, N'SAN PEDRO DE LA PAZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (184, 8, N'SAN ROSENDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (185, 8, N'SANTA BARBARA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (186, 8, N'SANTA JUANA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (187, 8, N'TALCAHUANO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (188, 8, N'TIRUA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (189, 8, N'TOME')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (190, 8, N'TREHUACO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (191, 8, N'TUCAPEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (192, 8, N'YUMBEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (193, 8, N'YUNGAY')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (194, 9, N'ANGOL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (195, 9, N'CARAHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (196, 9, N'COLLIPULLI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (197, 9, N'CUNCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (198, 9, N'CURACAUTIN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (199, 9, N'CURARREHUE')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (200, 9, N'ERCILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (201, 9, N'FREIRE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (202, 9, N'GALVARINO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (203, 9, N'GORBEA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (204, 9, N'LAUTARO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (205, 9, N'LONCOCHE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (206, 9, N'LONQUIMAY')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (207, 9, N'LOS SAUCES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (208, 9, N'LUMACO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (209, 9, N'MELIPEUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (210, 9, N'NUEVA IMPERIAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (211, 9, N'PADRE LAS CASAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (212, 9, N'PERQUENCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (213, 9, N'PITRUFQUEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (214, 9, N'PUCON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (215, 9, N'PUERTO SAAVEDRA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (216, 9, N'PUREN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (217, 9, N'RENAICO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (218, 9, N'TEMUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (219, 9, N'TEODORO SCHMIDT')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (220, 9, N'TOLTEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (221, 9, N'TRAIGUEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (222, 9, N'VICTORIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (223, 9, N'VILCUN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (224, 9, N'VILLARRICA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (225, 10, N'ANCUD')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (226, 10, N'CALBUCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (227, 10, N'CASTRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (228, 10, N'CHAITEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (229, 10, N'CHONCHI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (230, 10, N'COCHAMO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (231, 10, N'CURACO DE VELEZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (232, 10, N'DALCAHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (233, 10, N'FRESIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (234, 10, N'FRUTILLAR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (235, 10, N'FUTALEUFU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (236, 10, N'HUALAIHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (237, 10, N'LLANQUIHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (238, 10, N'LOS MUERMOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (239, 10, N'MAULLIN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (240, 10, N'OSORNO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (241, 10, N'PALENA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (242, 10, N'PUERTO MONTT')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (243, 10, N'PUERTO OCTAY')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (244, 10, N'PUERTO VARAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (245, 10, N'PUQUELDON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (246, 10, N'PURRANQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (247, 10, N'PUYEHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (248, 10, N'QUEILEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (249, 10, N'QUELLON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (250, 10, N'QUEMCHI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (251, 10, N'QUINCHAO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (252, 10, N'RIO NEGRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (253, 10, N'SAN JUAN DE LA COSTA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (254, 10, N'SAN PABLO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (255, 11, N'AYSEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (256, 11, N'CHILE CHICO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (257, 11, N'CISNES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (258, 11, N'COCHRANE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (259, 11, N'COYHAIQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (260, 11, N'GUAITECAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (261, 11, N'LAGO VERDE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (262, 11, N'OHIGGINS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (263, 11, N'RIO IBAÑEZ')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (264, 11, N'TORTEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (265, 12, N'LAGUNA BLANCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (266, 12, N'NAVARINO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (267, 12, N'PORVENIR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (268, 12, N'PRIMAVERA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (269, 12, N'PUERTO NATALES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (270, 12, N'PUNTA ARENAS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (271, 12, N'RIO VERDE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (272, 12, N'SAN GREGORIO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (273, 12, N'TIMAUKEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (274, 12, N'TORRES DEL PAINE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (275, 13, N'ALHUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (276, 13, N'BUIN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (277, 13, N'CALERA DE TANGO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (278, 13, N'CERRILLOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (279, 13, N'CERRO NAVIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (280, 13, N'COLINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (281, 13, N'CONCHALI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (282, 13, N'CURACAVI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (283, 13, N'EL BOSQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (284, 13, N'EL MONTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (285, 13, N'ESTACION CENTRAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (286, 13, N'HUECHURABA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (287, 13, N'INDEPENDENCIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (288, 13, N'ISLA DE MAIPO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (289, 13, N'LA CISTERNA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (290, 13, N'LA FLORIDA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (291, 13, N'LA GRANJA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (292, 13, N'LA PINTANA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (293, 13, N'LA REINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (294, 13, N'LAMPA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (295, 13, N'LAS CONDES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (296, 13, N'LO BARNECHEA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (297, 13, N'LO ESPEJO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (298, 13, N'LO PRADO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (299, 13, N'MACUL')
GO
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (300, 13, N'MAIPU')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (301, 13, N'MARIA PINTO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (302, 13, N'MELIPILLA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (303, 13, N'ÑUÑOA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (304, 13, N'PADRE HURTADO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (305, 13, N'PAINE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (306, 13, N'PEDRO AGUIRRE CERDA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (307, 13, N'PEÑAFLOR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (308, 13, N'PEÑALOLEN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (309, 13, N'PIRQUE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (310, 13, N'PROVIDENCIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (311, 13, N'PUDAHUEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (312, 13, N'PUENTE ALTO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (313, 13, N'QUILICURA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (314, 13, N'QUINTA NORMAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (315, 13, N'RECOLETA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (316, 13, N'RENCA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (317, 13, N'SAN BERNARDO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (318, 13, N'SAN JOAQUIN')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (319, 13, N'SAN JOSE DE MAIPO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (320, 13, N'SAN MIGUEL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (321, 13, N'SAN PEDRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (322, 13, N'SAN RAMON')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (323, 13, N'SANTIAGO CENTRO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (324, 13, N'SANTIAGO OESTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (325, 13, N'SANTIAGO SUR')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (326, 13, N'TALAGANTE')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (327, 13, N'TIL-TIL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (328, 13, N'VITACURA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (329, 14, N'CORRAL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (330, 14, N'FUTRONO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (331, 14, N'LA UNION')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (332, 14, N'LAGO RANCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (333, 14, N'LANCO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (334, 14, N'LOS LAGOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (335, 14, N'MAFIL')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (336, 14, N'MARIQUINA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (337, 14, N'VALDIVIA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (338, 14, N'PANGUIPULLI')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (339, 14, N'PAILLACO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (340, 14, N'RIO BUENO')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (341, 15, N'ARICA')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (342, 15, N'CAMARONES')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (343, 15, N'GENERAL LAGOS')
INSERT [dbo].[Ciudad] ([IdCiudad], [IdRegion], [NombreCiudad]) VALUES (344, 15, N'PUTRE')
SET IDENTITY_INSERT [dbo].[Ciudad] OFF
SET IDENTITY_INSERT [dbo].[Cliente] ON 

INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (1, N'1111111-1', N'User1', N'Pat1', N'Mat1', N'corre1@1.cl', N'1111111111')
INSERT [dbo].[Cliente] ([IdCliente], [RutCliente], [NombreCliente], [ApellidoPaternoCliente], [ApellidoMaternoCliente], [EmailCliente], [TelefonoCliente]) VALUES (2, N'11111111-1', N'asdasdas', N'asdasdas', N'asdas', N'adas@sdasd.cl', N'312123')
SET IDENTITY_INSERT [dbo].[Cliente] OFF
SET IDENTITY_INSERT [dbo].[Habitacion] ON 

INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (2, 9, 1, 30000, 1, 3)
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (3, 9, 2, 20000, 1, 2)
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (4, 9, 3, 10000, 1, 1)
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
SET IDENTITY_INSERT [dbo].[Hotel] ON 

INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (1, N'Providencia', 1, 5, 10, 30)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (2, N'Puerto Montt', 2, 1, 5, 25)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (3, N'Villa Rica', 3, 4, 0, 40)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (4, N'Viña del Mar', 4, 10, 20, 50)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (5, N'Antofagasta', 5, 10, 15, 30)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (8, N'Isla de Pascua', 6, 5, 5, 20)
INSERT [dbo].[Hotel] ([IdHotel], [NombreHotel], [IdUbicacion], [HabitacionesVIP], [HabitacionesBusiness], [HabitacionesBasicas]) VALUES (9, N'prueba', 7, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[Hotel] OFF
SET IDENTITY_INSERT [dbo].[InspeccionSanitaria] ON 

INSERT [dbo].[InspeccionSanitaria] ([IdInspeccion], [ResolucionSanitaria], [FechaResolucion]) VALUES (1, N'No inspeccionada', CAST(0xA33A0B00 AS Date))
SET IDENTITY_INSERT [dbo].[InspeccionSanitaria] OFF
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (1, N'Region de Tarapaca')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (2, N'Region de Antofagasta')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (3, N'Region de Atacama')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (4, N'Region de Coquimbo')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (5, N'Region de Valparaiso')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (6, N'Region del Libertador General Bernardo O Higgins')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (7, N'Region del Maule')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (8, N'Region del Bio-Bio')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (9, N'Region de la Araucania')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (10, N'Region de Los Lagos')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (11, N'Region de Aysen del General Carlos Ibañez del Campo')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (12, N'Region de Magallanes y la Antartica Chilena')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (13, N'Region Metropolitana')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (14, N'Region de Los Rios')
INSERT [dbo].[Region] ([IdRegion], [NombreRegion]) VALUES (15, N'Region de Arica y Parinacota')
SET IDENTITY_INSERT [dbo].[Reserva] ON 

INSERT [dbo].[Reserva] ([IdReserva], [IdCliente], [IdHotel], [IdHabitacion], [PrecioFinalDiario], [FechaCreacion], [FechaInicioReserva], [FechaFinReserva], [CantPersonas], [PrecioFinal], [Cant_adultos], [Cant_menores], [EstadoReserva], [Moneda], [TotalCancelado]) VALUES (24, 2, 9, 3, 60001, CAST(0xAF3A0B00 AS Date), CAST(0xAF3A0B00 AS Date), CAST(0xAF3A0B00 AS Date), 3, 0, 2, 1, N'Reservado', NULL, NULL)
INSERT [dbo].[Reserva] ([IdReserva], [IdCliente], [IdHotel], [IdHabitacion], [PrecioFinalDiario], [FechaCreacion], [FechaInicioReserva], [FechaFinReserva], [CantPersonas], [PrecioFinal], [Cant_adultos], [Cant_menores], [EstadoReserva], [Moneda], [TotalCancelado]) VALUES (25, 1, 9, 2, 60001, CAST(0xAF3A0B00 AS Date), CAST(0xAF3A0B00 AS Date), CAST(0xB63A0B00 AS Date), 2, 420007, 2, 0, N'Reservado', NULL, 0)
SET IDENTITY_INSERT [dbo].[Reserva] OFF
SET IDENTITY_INSERT [dbo].[Rol] ON 

INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (1, N'Cliente')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (2, N'Administrador')
INSERT [dbo].[Rol] ([IdRol], [DescripcionRol]) VALUES (3, N'Gerente')
SET IDENTITY_INSERT [dbo].[Rol] OFF
SET IDENTITY_INSERT [dbo].[TipoHabitacion] ON 

INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (1, N'Vip', 2)
INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (2, N'Bussiness', 3)
INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (3, N'Basica', 4)
INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (4, N'Salon de Eventos', NULL)
SET IDENTITY_INSERT [dbo].[TipoHabitacion] OFF
SET IDENTITY_INSERT [dbo].[Ubicacion] ON 

INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (1, 310, N'Marin 014')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (2, 242, N'Wallaby 42')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (3, 224, N'Pedro de Valdivia 445')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (4, 77, N'Av España 80')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (5, 8, N'Costanera 22')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (6, 51, N'Holu Matua 10')
INSERT [dbo].[Ubicacion] ([IdUbicacion], [IdCiudad], [NombreUbicacion]) VALUES (7, 1, N'Prueba (alto hospicio)')
SET IDENTITY_INSERT [dbo].[Ubicacion] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [IdCliente], [IdRol], [Password]) VALUES (2, N'test', NULL, 3, N'9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08')
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [IdCliente], [IdRol], [Password]) VALUES (3, N'admin', NULL, 2, N'8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918')
SET IDENTITY_INSERT [dbo].[Usuario] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [NomHotelUnique]    Script Date: 18-11-15 11:35:40 p.m. ******/
ALTER TABLE [dbo].[Hotel] ADD  CONSTRAINT [NomHotelUnique] UNIQUE NONCLUSTERED 
(
	[NombreHotel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
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
ALTER TABLE [dbo].[StockCocina]  WITH CHECK ADD  CONSTRAINT [FK_StockCocina_Insumo] FOREIGN KEY([IdInsumo])
REFERENCES [dbo].[Insumo] ([IdInsumo])
GO
ALTER TABLE [dbo].[StockCocina] CHECK CONSTRAINT [FK_StockCocina_Insumo]
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
