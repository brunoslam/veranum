USE [Veranum]
GO

/****** Object:  StoredProcedure [dbo].[HabitacionDisponible]    Script Date: 06-11-15 6:21:55 p.m. ******/
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


