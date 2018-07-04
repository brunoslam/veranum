USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionEliminar]    Script Date: 12/08/2015 00:29:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[HabitacionEliminarNuevo]


	@IdHabitacion int

as
begin
	DECLARE @TipoHabitacion varchar(100)
	DECLARE @IdHotel int

	SELECT @IdHotel = h.IdHotel, @TipoHabitacion = t.NombreTipoHabitacion
	FROM Habitacion h
		JOIN TipoHabitacion t
			ON (h.IdTipoHabitacion = t.IdTipoHabitacion)
	WHERE h.IdHabitacion = @IdHabitacion

	DELETE Habitacion
	WHERE IdHabitacion = @IdHabitacion;

	DELETE InventarioHabitacion
	WHERE IdHabitacion = @IdHabitacion;

	IF(@TipoHabitacion = 'Vip')
		BEGIN
			UPDATE Hotel
			SET HabitacionesVIP = HabitacionesVIP - 1
			WHERE IdHotel = @IdHotel
		END

	IF(@TipoHabitacion = 'Business')
		BEGIN
			UPDATE Hotel
			SET HabitacionesBusiness = HabitacionesBusiness - 1
			WHERE IdHotel = @IdHotel
		END

	IF(@TipoHabitacion = 'Classic')
		BEGIN
			UPDATE Hotel
			SET HabitacionesBasicas = HabitacionesBasicas - 1
			WHERE IdHotel = @IdHotel
		END
end


-- Inspeccion Listar --
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionListar]    Script Date: 12/08/2015 01:34:30 ******/
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

-- --

USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InspeccionModificar]    Script Date: 12/08/2015 16:50:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[InspeccionModificar]

	@IdInspeccion int,
	@NombreHotel varchar(100),
	@Resolucion varchar(100),
	@Fecha DATE
AS
BEGIN

	DECLARE @IdHotel varchar(100);

	SELECT @IdHotel = IdHotel FROM Hotel
	WHERE NombreHotel = @NombreHotel;

	UPDATE InspeccionSanitaria
	SET ResolucionSanitaria = @Resolucion,
		FechaResolucion = @Fecha
	WHERE (IdInspeccion = @IdInspeccion)

END


--
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InsumoCrear]    Script Date: 12/08/2015 17:00:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[InsumoCrear]

	@NombreHotel varchar(100),
	@NombreInsumo varchar(100),
	@Fecha DATE,
	@Cantidad int,
	@CantidadIdeal int
AS
BEGIN
	DECLARE @IdHotel varchar(100);
	DECLARE  @IdInsumo int;

	SELECT @IdHotel = IdHotel FROM Hotel
	WHERE NombreHotel = @NombreHotel;


	INSERT INTO Insumo VALUES ( @NombreInsumo );
	SELECT  TOP 1 @IdInsumo = IdInsumo FROM Insumo ORDER BY IdInsumo DESC;
	INSERT INTO StockCocina VALUES(@IdInsumo, @Fecha, @Cantidad, @CantidadIdeal, @IdHotel );

END


---
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[InsumoModificar]    Script Date: 12/08/2015 17:03:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[InsumoModificar]

	@IdInsumo int,
	@NombreInsumo varchar(100),
	@CantidadExistente int,
	@CantidadIdeal int,
	@Fecha DATE
AS
BEGIN
	UPDATE Insumo
	SET NombreInsumo = @NombreInsumo
	WHERE (IdInsumo = @IdInsumo)


	UPDATE StockCocina
	SET Fecha = @Fecha, Cantidad = @CantidadExistente, CantidadIdeal = @CantidadIdeal
	WHERE (IdInsumo = @IdInsumo)

END



---
USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[MenuCrear]    Script Date: 12/08/2015 17:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[UsoStockCrear]


		@IdInsumo int,
		@Cantidad int
AS
	BEGIN


		DECLARE @IdMenu int;

		SELECT TOP 1 @IdMenu = IdMenuDiario FROM MenuDiario ORDER BY IdMenuDiario DESC

		INSERT INTO UsoStock VALUES (@IdMenu, @IdInsumo, @Cantidad)


	END



--

	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[MenuCrear]    Script Date: 12/08/2015 17:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[MenuCrear]

	@NombreMenu varchar(100),
	@TipoMenu varchar(100),
	@Fecha DATE

AS
BEGIN

	INSERT INTO MenuDiario VALUES (@NombreMenu, @TipoMenu, @Fecha)

END


	USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HotelExisteListar]    Script Date: 12/08/2015 19:19:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReservaEnHotelExisteContar]
	-- Add the parameters for the stored procedure here
		@IdHotel int
AS
	BEGIN

		SELECT COUNT(h.NombreHotel) AS ReservasDeHotel
		FROM HOTEL h
			JOIN Reserva r
				ON h.IdHotel = r.IdHotel
		WHERE r.IdHotel = @IdHotel
	END


---
	USE [Veranum]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[HabitacionReservadaContar]
	-- Add the parameters for the stored procedure here
		@IdHabitacion int

AS
	BEGIN

		SELECT COUNT(h.IdHabitacion)
		FROM Habitacion h
			JOIN Reserva r
				ON h.IdHabitacion = r.IdHabitacion
		WHERE r.IdHabitacion = @IdHabitacion
	END


---

	ALTER Proc [dbo].[InsumoEliminar]


		@IdInsumo int

	as
	begin

		Delete StockCocina
		WHERE IdInsumo = @IdInsumo

		DELETE UsoStock
		WHERE IdInsumo = @IdInsumo

		DELETE Insumo
		WHERE IdInsumo = @IdInsumo

	end