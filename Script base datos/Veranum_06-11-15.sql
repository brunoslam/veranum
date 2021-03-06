USE [Veranum]
GO
/****** Object:  StoredProcedure [dbo].[HabitacionDisponible]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[HabitacionesDisponiblesListar2]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[HotelCrear]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[RegionListar]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ServicioCrear]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[ServiciolListar]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UserAdmObtener]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioCrear2]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioModificar2]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  StoredProcedure [dbo].[UsuarioObtenerTodos]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  Table [dbo].[Ciudad]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  Table [dbo].[Habitacion]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  Table [dbo].[Region]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  Table [dbo].[TipoHabitacion]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
/****** Object:  Table [dbo].[Usuario]    Script Date: 06-11-15 8:32:16 p.m. ******/
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
SET IDENTITY_INSERT [dbo].[Habitacion] ON 

INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (2, 9, 1, 30000, 1, NULL)
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (3, 9, 2, 20000, 1, NULL)
INSERT [dbo].[Habitacion] ([IdHabitacion], [IdHotel], [IdTipoHabitacion], [Precio], [IdInspeccion], [NumeroReal]) VALUES (4, 9, 3, 10000, 1, NULL)
SET IDENTITY_INSERT [dbo].[Habitacion] OFF
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
SET IDENTITY_INSERT [dbo].[TipoHabitacion] ON 

INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (1, N'Vip', NULL)
INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (2, N'Bussiness', NULL)
INSERT [dbo].[TipoHabitacion] ([IdTipoHabitacion], [NombreTipoHabitacion], [CapacidadPersonas]) VALUES (3, N'Basica', NULL)
SET IDENTITY_INSERT [dbo].[TipoHabitacion] OFF
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
