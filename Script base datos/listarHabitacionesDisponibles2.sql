USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar2]    Script Date: 06-11-15 6:19:22 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Procedure [dbo].[HabitacionesDisponiblesListar2]
@IdHotel int,
@FechaInicioReserva date,
@FechaFinReserva date
as
begin
select * from Habitacion 
where IdHabitacion not in (select IdHabitacion from Reserva where FechaFinReserva >= @FechaInicioReserva and FechaInicioReserva<=@FechaFinReserva )
and IdHotel=@IdHotel

end