/****** Object:  StoredProcedure [dbo].[ServiciolListar]    Script Date: 11/21/2015 10:01:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioListar]    Script Date: 11/21/2015 10:01:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioCrear]    Script Date: 11/21/2015 10:01:23 ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioModificar]    Script Date: 11/07/2015 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ServicioModificar]
		@IdServicio int,
		@NombreServicio varchar(100),
		@PrecioServicio int
as
	begin
		UPDATE Servicio
		SET NombreServicio = @NombreServicio, PrecioServicio = @PrecioServicio
		WHERE IdServicio = @IdServicio;
	end

GO
/****** Object:  StoredProcedure [dbo].[ServicioEliminar]    Script Date: 11/07/2015 18:38:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[ServicioEliminar]


		@IdServicio int

as
	begin
		DELETE Servicio
		WHERE IdServicio = @IdServicio
	end

GO
/****** Object:  StoredProcedure [dbo].[HabitacionEliminar]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HabitacionEliminar]


		@IdHabitacion int

as
begin
	DELETE Habitacion
	WHERE IdHabitacion = @IdHabitacion;
end

GO
/****** Object:  StoredProcedure [dbo].[CiudadListar]    Script Date: 11/21/2015 10:01:23 ******/
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
/****** Object:  StoredProcedure [dbo].[HabitacionCrear]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HabitacionCrear]
	--SELECT * FROM Habitacion

		@NombreHotel varchar(100),
		@TipoHabitacion varchar(100),
		@Precio int,
		@Inspeccion varchar(100),
		@NumeroHabitacion int

AS
	BEGIN
		DECLARE @IdHotel int;
		SELECT @IdHotel = IdHotel FROM Hotel WHERE @NombreHotel = NombreHotel;

		DECLARE @IdTipoHabitacion int;
		SELECT @IdTipoHabitacion = IdTipoHabitacion FROM TipoHabitacion WHERE @TipoHabitacion = NombreTipoHabitacion;

		DECLARE @IdInspeccion int
		SELECT @IdInspeccion = IdInspeccion FROM InspeccionSanitaria WHERE @Inspeccion = ResolucionSanitaria;

		INSERT INTO Habitacion VALUES(@IdHotel, @IdTipoHabitacion, @Precio, @IdInspeccion, @NumeroHabitacion);

		IF(@IdTipoHabitacion = 1)
			BEGIN
				UPDATE Hotel SET HabitacionesVIP = HabitacionesVip + 1
				WHERE IdHotel = @IdHotel;
			END

		IF(@IdTipoHabitacion = 2)
			BEGIN
				UPDATE Hotel SET HabitacionesBusiness = HabitacionesBusiness + 1
				WHERE IdHotel = @IdHotel;
			END

		IF(@IdTipoHabitacion = 3)
			BEGIN
				UPDATE Hotel SET HabitacionesBasicas = HabitacionesBasicas + 1
				WHERE IdHotel = @IdHotel;
			END

	END
GO
/****** Object:  StoredProcedure [dbo].[InspeccionListar]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[InspeccionListar]
as
	begin
		SELECT i.IdInspeccion, hotel.NombreHotel, h.IdHabitacion , i.ResolucionSanitaria, i.FechaResolucion
		FROM InspeccionSanitaria i
			JOIN Habitacion h
				ON h.IdInspeccion = i.IdInspeccion
			JOIN Hotel hotel
				ON hotel.IdHotel = h.IdHotel
	end
GO
/****** Object:  StoredProcedure [dbo].[HotelModificar]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HotelModificar]


		@IdHotel int,
		@NombreHotel varchar(100),
		@NombreUbicacion varchar(100),
		@HabitacionesVIP int,
		@HabitacionesBusiness int,
		@HabitacionesBasicas int
as
	begin
		declare @IdUbicacion int
		select @IdUbicacion = IdUbicacion from Ubicacion where NombreUbicacion = @NombreUbicacion;
		UPDATE Hotel
		SET NombreHotel = @NombreHotel, IdUbicacion = @IdUbicacion, HabitacionesVIP = @HabitacionesVIP, HabitacionesBusiness = @HabitacionesBusiness,
			HabitacionesBasicas = @HabitacionesBasicas
		WHERE IdHotel = @IdHotel;
	end
GO
/****** Object:  StoredProcedure [dbo].[HotelListar]    Script Date: 11/21/2015 10:01:23 ******/
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
/****** Object:  StoredProcedure [dbo].[HotelEliminar]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HotelEliminar]


		@IdHotel int

as
	begin
		DELETE Hotel
		WHERE IdHotel = @IdHotel;

		DELETE Habitacion
		WHERE IdHotel = @IdHotel;
	end
	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HotelCrear]    Script Date: 11/29/2015 22:58:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[HotelCrear]

--@IdUbicacion int,
	@NombreCiudad varchar(100),
	@NombreUbicacion varchar(100),
	@NombreHotel varchar(100),
	@HabitacionesVIP int,
	@HabitacionesBusiness int,
	@HabitacionesBasicas int
AS
BEGIN
	DECLARE  @IdCiudad int;
	SELECT @IdCiudad = IdCiudad FROM Ciudad WHERE NombreCiudad = @NombreCiudad;


	INSERT INTO Ubicacion VALUES (@IdCiudad, @NombreUbicacion);
	DECLARE @IdUbicacion int;
	SELECT @IdUbicacion = IdUbicacion FROM Ubicacion WHERE NombreUbicacion = @NombreUbicacion;


	INSERT INTO Hotel VALUES(@NombreHotel, @IdUbicacion, @HabitacionesVIP,
													 @HabitacionesBusiness, @HabitacionesBasicas);

	DECLARE @IdHotel int;
	SELECT @IdHotel = IdHotel FROM Hotel WHERE NombreHotel = @NombreHotel;

	DECLARE @NumeroReal int = 1;
	-- Insert habitaciones vip
	IF(@HabitacionesVIP > 0)
		BEGIN
			WHILE(@HabitacionesVIP > 0)
				BEGIN
					INSERT INTO Habitacion VALUES(@IdHotel,1, 70000, 1, @NumeroReal);
					SET @HabitacionesVIP = @HabitacionesVIP - 1;
					SET @NumeroReal = @NumeroReal + 1;
				END
		END
	-- Insert habitaciones business
	IF(@HabitacionesBusiness > 0)
		BEGIN
			WHILE(@HabitacionesBusiness > 0)
				BEGIN
					INSERT INTO Habitacion VALUES(@IdHotel,2, 50000, 1, @NumeroReal);
					SET @HabitacionesBusiness = @HabitacionesBusiness - 1;
					SET @NumeroReal = @NumeroReal + 1;
				END
		END
	-- Insert habitaciones classic
	IF(@HabitacionesBasicas > 0)
		BEGIN
			WHILE(@HabitacionesBasicas > 0)
				BEGIN
					INSERT INTO Habitacion VALUES(@IdHotel,3, 30000, 1, @NumeroReal);
					SET @HabitacionesBasicas = @HabitacionesBasicas - 1;
					SET @NumeroReal = @NumeroReal + 1;
				END
		END

END

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionModificar]    Script Date: 12/04/2015 21:59:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[HabitacionModificar]
--SELECT * FROM Habitacion
	@IdHabitacion int,
	@NombreHotel varchar(100),
	@TipoHabitacion varchar(100),
	@Precio int,
	@Inspeccion varchar(100),
	@NumeroHabitacion int

AS
BEGIN
	DECLARE @IdHotel int;
	SELECT @IdHotel = IdHotel FROM Hotel WHERE @NombreHotel = NombreHotel;

	DECLARE @IdTipoHabitacion int;
	SELECT @IdTipoHabitacion = IdTipoHabitacion FROM TipoHabitacion WHERE @TipoHabitacion = NombreTipoHabitacion;

	DECLARE @IdInspeccion int
	SELECT @IdInspeccion = IdInspeccion FROM InspeccionSanitaria WHERE @Inspeccion = ResolucionSanitaria;

	--Declaramos el IdTipoHabActual para obtener el valor del tipo de hab para poder restar en uno desde la cantidad en hotel
	DECLARE @IdTipoHabActual int;
	SELECT @IdTipoHabActual = IdTipoHabitacion
	FROM Habitacion
	WHERE (IdHabitacion = @IdHabitacion);

	IF(@IdTipoHabActual = 1)
		BEGIN
			UPDATE Hotel SET HabitacionesVIP = HabitacionesVip - 1
			WHERE IdHotel = @IdHotel;
		END

	IF(@IdTipoHabActual = 2)
		BEGIN
			UPDATE Hotel SET HabitacionesBusiness = HabitacionesBusiness - 1
			WHERE IdHotel = @IdHotel;
		END

	IF(@IdTipoHabActual = 3)
		BEGIN
			UPDATE Hotel SET HabitacionesBasicas = HabitacionesBasicas - 1
			WHERE IdHotel = @IdHotel;
		END
	--MODIFICAMOS LA HABITACIÓN
	UPDATE Habitacion
	SET IdTipoHabitacion = @IdTipoHabitacion, Precio = @Precio, IdInspeccion = @IdInspeccion, NumeroReal = @NumeroHabitacion
	WHERE IdHabitacion =  @IdHabitacion;


	IF(@IdTipoHabitacion = 1)
		BEGIN
			UPDATE Hotel SET HabitacionesVIP = HabitacionesVip + 1
			WHERE IdHotel = @IdHotel;
		END

	IF(@IdTipoHabitacion = 2)
		BEGIN
			UPDATE Hotel SET HabitacionesBusiness = HabitacionesBusiness + 1
			WHERE IdHotel = @IdHotel;
		END

	IF(@IdTipoHabitacion = 3)
		BEGIN
			UPDATE Hotel SET HabitacionesBasicas = HabitacionesBasicas + 1
			WHERE IdHotel = @IdHotel;
		END

END

GO
/****** Object:  StoredProcedure [dbo].[HabitacionListar]    Script Date: 11/21/2015 10:01:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[HabitacionListar]
as
	begin
		SELECT hab.IdHabitacion, h.NombreHotel, th.NombreTipoHabitacion, hab.Precio, i.ResolucionSanitaria, hab.NumeroReal
		FROM Habitacion hab
			JOIN Hotel h
				ON (hab.IdHotel = h.IdHotel)
			JOIN TipoHabitacion th
				ON (hab.IdTipoHabitacion = th.IdTipoHabitacion)
			JOIN InspeccionSanitaria i
				ON (hab.IdInspeccion = i.IdInspeccion)
	end
GO

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionCrear]    Script Date: 11/22/2015 19:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[InspeccionCrear]

	@NombreHotel varchar(100),
	@NumeroHabitacion int,
	@Resolucion varchar(100),
	@Fecha DATE
AS
BEGIN
	DECLARE  @IdInspeccion int;
	DECLARE @IdHotel varchar(100);

	SELECT @IdHotel = IdHotel FROM Hotel
	WHERE NombreHotel = @NombreHotel;

	INSERT INTO InspeccionSanitaria VALUES(@Resolucion, @Fecha);

	SELECT  TOP 1 @IdInspeccion = IdInspeccion FROM InspeccionSanitaria ORDER BY IdInspeccion DESC;

	UPDATE Habitacion
	SET IdInspeccion = @IdInspeccion
	WHERE  IdHotel = @IdHotel
				 AND NumeroReal = @NumeroHabitacion;
END

	--LISTAR INSPECCIONES POR ESTADO (APROBADO, REPROBADO O NO INSPECCIONADO)
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionEstadoListar]    Script Date: 11/22/2015 19:26:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InspeccionEstadoListar]
-- Add the parameters for the stored procedure here

	@NombreHotel varchar(100),
	@Resolucion varchar(100)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT i.IdInspeccion, hotel.NombreHotel, h.NumeroReal, t.NombreTipoHabitacion, i.ResolucionSanitaria, i.FechaResolucion
	FROM InspeccionSanitaria i
		JOIN Habitacion h
			ON (i.IdInspeccion = h.IdInspeccion)
		JOIN TipoHabitacion t
			ON (h.IdTipoHabitacion = t.IdTipoHabitacion)
		JOIN Hotel hotel
			ON (h.IdHotel = hotel.IdHotel)
	WHERE (hotel.NombreHotel = @NombreHotel)
				AND (i.ResolucionSanitaria = @Resolucion)
	ORDER BY hotel.NombreHotel ASC,h.NumeroReal ASC, i.FechaResolucion DESC

END
	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionEstadoListar]    Script Date: 11/30/2015 00:44:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InspeccionEstadoTodasListar]
	-- Add the parameters for the stored procedure here

		@NombreHotel varchar(100),
		@Resolucion varchar(100)
AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
		SET NOCOUNT ON;

		SELECT i.IdInspeccion, hotel.NombreHotel, h.NumeroReal, t.NombreTipoHabitacion, i.ResolucionSanitaria, i.FechaResolucion
		FROM InspeccionSanitaria i
			JOIN Habitacion h
				ON (i.IdInspeccion = h.IdInspeccion)
			JOIN TipoHabitacion t
				ON (h.IdTipoHabitacion = t.IdTipoHabitacion)
			JOIN Hotel hotel
				ON (h.IdHotel = hotel.IdHotel)
		WHERE (hotel.NombreHotel = @NombreHotel)
		ORDER BY hotel.NombreHotel ASC,h.NumeroReal ASC, i.FechaResolucion DESC

	END

	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionListar]    Script Date: 11/22/2015 19:26:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[InspeccionListar]
-- Add the parameters for the stored procedure here

--@NombreHotel varchar(100),
--@NumeroReal int

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
  -- interfering with SELECT statements.
	SET NOCOUNT ON;

	SELECT i.IdInspeccion, hotel.NombreHotel, h.NumeroReal, t.NombreTipoHabitacion, i.ResolucionSanitaria, i.FechaResolucion
	FROM InspeccionSanitaria i
		JOIN Habitacion h
			ON (i.IdInspeccion = h.IdInspeccion)
		JOIN TipoHabitacion t
			ON (h.IdTipoHabitacion = t.IdTipoHabitacion)
		JOIN Hotel hotel
			ON (h.IdHotel = hotel.IdHotel)
	--WHERE (hotel.NombreHotel = @NombreHotel)
  --AND (h.NumeroReal = @NumeroReal)
	ORDER BY hotel.NombreHotel ASC,h.NumeroReal ASC, i.FechaResolucion DESC

END

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HotelListar]    Script Date: 11/29/2015 11:28:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsumolListar]
	-- Add the parameters for the stored procedure here

AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
		SET NOCOUNT ON;

		SELECT h.NombreHotel, s.IdInsumo, i.NombreInsumo, s.Cantidad, s.CantidadIdeaL, s.Fecha
		FROM StockCocina s
		JOIN Insumo i
		ON(s.IdInsumo = i.IdInsumo)
		JOIN Hotel h
		ON (h.IdHotel = s.IdHotel)

	END

	USE [Veranum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[MuebleListar]
	-- Add the parameters for the stored procedure here

AS
	BEGIN
		-- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
		SET NOCOUNT ON;

		SELECT m.IdMueble, hotel.NombreHotel, h.NumeroReal, m.NombreMueble, m.Estado, m.Precio, m.Tipo
		FROM Mueble m
			JOIN InventarioHabitacion i
				on(m.IdMueble = i.IdMueble)
			JOIN Habitacion h
				ON (h.IdHabitacion = i.IdHabitacion)
			JOIN Hotel hotel
				ON (h.IdHotel = hotel.IdHotel)

	END


	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionCrear]    Script Date: 11/30/2015 01:31:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[MuebleCrear]

		@NombreHotel varchar(100),
		@NumeroHabitacion int,
		@NombreMueble varchar(100),
		@TipoMueble varchar(100),
		@EstadoMueble varchar(100),
		@Cantidad int,
		@Precio int
AS
	BEGIN
		DECLARE  @IdMueble int;
		DECLARE @IdHotel varchar(100);
		DECLARE @IdHabitacion int;

		SELECT @IdHotel = IdHotel FROM Hotel
		WHERE NombreHotel = @NombreHotel;

		SELECT  @IdHabitacion = h.IdHabitacion FROM Habitacion h
			JOIN Hotel hotel
				ON (h.IdHotel = hotel.IdHotel)
		WHERE (h.IdHotel = @IdHotel)
					AND (h.NumeroReal = @NumeroHabitacion)

		IF(@Cantidad > 0)
			BEGIN
				WHILE(@Cantidad > 0)
					BEGIN
						INSERT INTO Mueble VALUES (@NombreMueble, @Precio, @EstadoMueble, @TipoMueble)
						--Obtenemos la última id mueble ingresada
						SELECT  TOP 1 @IdMueble = IdMueble FROM Mueble ORDER BY IdMueble DESC;

						INSERT INTO InventarioHabitacion VALUES(@IdHabitacion, @IdMueble)
						SET @Cantidad = @Cantidad - 1;
					END
			END

	END

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[MuebleEliminar]    Script Date: 12/06/2015 10:49:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[MuebleEliminar]


	@IdMueble int

as
begin

	DECLARE @IdInventarioHabitacion int

	SELECT @IdInventarioHabitacion = IdInventarioHabitacion
	FROM InventarioHabitacion
	WHERE IdMueble = @IdMueble

	DELETE InventarioHabitacion
	WHERE IdInventarioHabitacion = @IdInventarioHabitacion

	DELETE Mueble
	WHERE IdMueble = @IdMueble
end

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[MuebleModificar]    Script Date: 12/06/2015 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[MuebleModificar]
		@IdMueble int,
		@NombreMueble varchar(100),
		@Precio int,
		@Estado varchar(100),
		@Tipo varchar(100)
as
	begin
		UPDATE Mueble
		SET NombreMueble = @NombreMueble, Precio = @Precio, Estado = @Estado, Tipo = @Tipo
		WHERE IdMueble = @IdMueble;
	end

	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionEliminar]    Script Date: 12/06/2015 13:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[InspeccionEliminar]


	@IdInspeccion int

as
begin

	DELETE InspeccionSanitaria
	WHERE IdInspeccion = @IdInspeccion
end

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionEliminar]    Script Date: 12/06/2015 13:21:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[InsumoEliminar]


		@IdInsumo int

as
	begin

		Delete StockCocina
		WHERE IdInsumo = @IdInsumo

		DELETE Insumo
		WHERE IdInsumo = @IdInsumo
	end

	USE [Veranum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[HotelExisteListar]
-- Add the parameters for the stored procedure here
	@NombreHotel varchar(100)
AS
BEGIN
	SELECT COUNT(IdHotel)
	FROM HOTEL
	WHERE NombreHotel = @NombreHotel
END