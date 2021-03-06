USE [master]
GO
/****** Object:  Database [MDM]    Script Date: 18/11/2017 14:41:21 ******/
CREATE DATABASE [MDM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MDM', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MDM.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MDM_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\MDM_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MDM] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MDM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MDM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MDM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MDM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MDM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MDM] SET ARITHABORT OFF 
GO
ALTER DATABASE [MDM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MDM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MDM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MDM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MDM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MDM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MDM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MDM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MDM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MDM] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MDM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MDM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MDM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MDM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MDM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MDM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MDM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MDM] SET RECOVERY FULL 
GO
ALTER DATABASE [MDM] SET  MULTI_USER 
GO
ALTER DATABASE [MDM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MDM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MDM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MDM] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [MDM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MDM', N'ON'
GO
USE [MDM]
GO
/****** Object:  Table [dbo].[Componente]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Componente](
	[IdComponente] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[Peso] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED 
(
	[IdComponente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Criterio]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Criterio](
	[IdCriterio] [int] IDENTITY(1,1) NOT NULL,
	[NombreCriterio] [varchar](255) NULL,
	[Descripcion] [text] NULL,
	[IdDimension] [int] NULL,
 CONSTRAINT [PK_Criterio] PRIMARY KEY CLUSTERED 
(
	[IdCriterio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dimension]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Dimension](
	[IdDimension] [int] IDENTITY(1,1) NOT NULL,
	[NombreDimension] [varchar](255) NULL,
	[Descripcion] [varchar](max) NULL,
	[ValorEsperado] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Dimension] PRIMARY KEY CLUSTERED 
(
	[IdDimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Nivel]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Nivel](
	[IdNivel] [int] IDENTITY(1,1) NOT NULL,
	[NombreNivel] [varchar](50) NULL,
	[Descripcion] [varchar](255) NULL,
 CONSTRAINT [PK_Nivel_1] PRIMARY KEY CLUSTERED 
(
	[IdNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Opcion]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Opcion](
	[IdOpcion] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdPregunta] [int] NULL,
	[IdNivel] [int] NULL,
 CONSTRAINT [PK_Nivel] PRIMARY KEY CLUSTERED 
(
	[IdOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Pregunta](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](255) NULL,
	[IdCriterio] [int] NULL,
	[IdComponente] [int] NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[IdRespuesta] [int] IDENTITY(1,1) NOT NULL,
	[IdOpcion] [int] NULL,
	[IdUsuario] [int] NULL,
	[ContVez] [int] NULL,
 CONSTRAINT [PK_Respuesta] PRIMARY KEY CLUSTERED 
(
	[IdRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Usuario]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuario](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[NombreUsuario] [nvarchar](255) NULL,
	[TipoUsuario] [nvarchar](255) NULL,
	[UsuarioIngreso] [nvarchar](255) NULL,
	[Clave] [nvarchar](255) NULL,
	[Entidad] [nvarchar](255) NULL,
	[Cargo] [nvarchar](255) NULL,
	[EncuestaTerminada] [bit] NULL,
	[NroEcuestasTerminadas] [int] NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  UserDefinedFunction [dbo].[ResultadoCriterio]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE FUNCTION [dbo].[ResultadoCriterio]
(
    @IdUsuario int,
	@NumVez int
)
RETURNS TABLE AS RETURN
(
select cri.NombreCriterio as 'Criterio', round(sum(op.IdNivel*co.Peso),2,0) as 'Valor' from Respuesta re inner join Opcion op 
on re.IdOpcion=op.IdOpcion inner join Pregunta pre on op.IdPregunta=pre.IdPregunta inner join Componente co on 
pre.IdComponente=co.IdComponente inner join Criterio cri on pre.IdCriterio=cri.IdCriterio inner join Dimension di on 
	cri.IdDimension=di.IdDimension where re.IdUsuario=@IdUsuario and re.ContVez = @NumVez group by cri.NombreCriterio
	)

GO
/****** Object:  UserDefinedFunction [dbo].[ResultadoEvaluacion]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ResultadoEvaluacion]
(
    @IdUsuario int,
	@NumVez int
)
RETURNS TABLE AS RETURN
(
  select di.NombreDimension as 'Dimension', round(sum(op.IdNivel*co.Peso)/(count(distinct(cri.IdCriterio))),2,0) as 'Valor' from Respuesta re inner join Opcion op 
on re.IdOpcion=op.IdOpcion inner join Pregunta pre on op.IdPregunta=pre.IdPregunta inner join Componente co on 
pre.IdComponente=co.IdComponente inner join Criterio cri on pre.IdCriterio=cri.IdCriterio inner join Dimension di on 
	cri.IdDimension=di.IdDimension where re.IdUsuario=@IdUsuario and re.ContVez=@NumVez group by di.NombreDimension
	)

GO
/****** Object:  UserDefinedFunction [dbo].[ResultadosHistoricos]    Script Date: 18/11/2017 14:41:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ResultadosHistoricos]
(
    @idUsuaruio int
   
)
RETURNS TABLE AS RETURN
(
     select di.NombreDimension as 'Dimension', 
 round(sum(op.IdNivel*co.Peso)/(count(distinct(cri.IdCriterio))),2,0) as 'Valor',
 re.ContVez as 'Numero Vez'
 from Respuesta re inner join Opcion op 
on re.IdOpcion=op.IdOpcion inner join Pregunta pre
 on op.IdPregunta=pre.IdPregunta inner join Componente co on 
pre.IdComponente=co.IdComponente inner join Criterio cri on pre.IdCriterio=cri.IdCriterio inner join Dimension di on 
	cri.IdDimension=di.IdDimension where re.IdUsuario=@idUsuaruio group by di.NombreDimension, re.ContVez
	
)
GO
SET IDENTITY_INSERT [dbo].[Componente] ON 

INSERT [dbo].[Componente] ([IdComponente], [Descripcion], [Peso]) VALUES (1, N'Personas
', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[Componente] ([IdComponente], [Descripcion], [Peso]) VALUES (2, N'Políticas
', CAST(0.30 AS Decimal(18, 2)))
INSERT [dbo].[Componente] ([IdComponente], [Descripcion], [Peso]) VALUES (3, N'Capacidades
', CAST(0.40 AS Decimal(18, 2)))
INSERT [dbo].[Componente] ([IdComponente], [Descripcion], [Peso]) VALUES (4, N'Nulo', CAST(1.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Componente] OFF
SET IDENTITY_INSERT [dbo].[Criterio] ON 

INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (1, N'Políticas, Procedimientos y Metodologías', N'Identificar en que medida se definen, formalizan e implementan las políticas en cuanto a la gestión de datos en las entidades microfinancieras', 1)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (2, N'Roles y Responsabildiades', N'Identificar las definiciones de roles y responsabilidades en la organización', 2)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (3, N'Uso y Propiedad', N'Identificar en que medida los stakeholders identifican el uso y propiedad de los datos en la organización', 2)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (4, N'Identificación de Datos Maestros', N'Evaluar en que medida se han identificado los datos maestros detallando caracteristicas, atributos y estándares', 3)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (5, N'Modelo de Datos Maestros', N'Identificar en que medida se ha diseñado un modelo de datos maestros que sirva como descripción general de los objetos de datos maestros para la organización', 3)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (6, N'Data Landscape', N'Identificar en que medida la organización cuenta con una vision general de los datos maestros a causa de las diferentes fuentes de información', 3)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (7, N'Integración de Datos Maestros', N'Identificar en que medida se aplican controles para el procesamiento de datos (Conbinación de datos provenientes de diferentes fuentes para gestionar mecanismos de extracción, transformación y carga), considerando las reglas del negocio y requisitos reglamentarios y legales.', 4)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (8, N'Alineación de Datos', N'Identificar la elaboración , colaboración, comprensión y sincronización de TI con el alcance del negocio', 4)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (9, N'Arquitectura de Integración de Datos', N'Identificar una visión holistica de la infraestructura y las implemetaciones contruidas', 4)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (10, N'Ciclo de Vida de los Datos Maestros', N'Identificar las etapas que abarca el flujo de los datos, desde su creación hasta su deshuso o transformación', 5)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (11, N'Reconocimiento de las barreras de calidad', N'Identificar los problemas que normalmente afectan a una buena calidad de datos.', 5)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (12, N'Evalucación de la Calidad', N'Identificar métodos de evaluación y evaluar la calidad de los datos tomando en cuenta los problemas y preocupaciones que han sido identificados previamente', 5)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (13, N'Mejora de la calidad', N'Identificar y proponer planes de acción respecto a los problemas más criticos que se han definido y evaluado', 5)
INSERT [dbo].[Criterio] ([IdCriterio], [NombreCriterio], [Descripcion], [IdDimension]) VALUES (14, N'Monitoreo y Reporte', N'Identificar en que medida se supervisa el performance de forma transversal en la organización con el proposito de identificar potenciales problemas de datos.', 6)
SET IDENTITY_INSERT [dbo].[Criterio] OFF
SET IDENTITY_INSERT [dbo].[Dimension] ON 

INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (1, N'Políticas', N'null', CAST(4.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (2, N'Gobierno de Datos', N'null', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (3, N'Modelo de Datos', N'null', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (4, N'Integración de Datos', N'null', CAST(2.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (5, N'Calidad de Datos', N'null', CAST(3.00 AS Decimal(18, 2)))
INSERT [dbo].[Dimension] ([IdDimension], [NombreDimension], [Descripcion], [ValorEsperado]) VALUES (6, N'Monitoreo', N'null', CAST(4.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Dimension] OFF
SET IDENTITY_INSERT [dbo].[Nivel] ON 

INSERT [dbo].[Nivel] ([IdNivel], [NombreNivel], [Descripcion]) VALUES (1, N'Inicial', N'Procesos AD-HOC o caóticos. Sensibilización sobre MDM. Carencia de datos consistentes.')
INSERT [dbo].[Nivel] ([IdNivel], [NombreNivel], [Descripcion]) VALUES (2, N'Gestionado', N'Enfoque reactivo. Capacidades limitadas de administración de datos. Se resuelven los problemas de manera individual.')
INSERT [dbo].[Nivel] ([IdNivel], [NombreNivel], [Descripcion]) VALUES (3, N'Definido', N'Enfoque Proactivo. Existe una conciencia sobre el significado de MDM. Se promueven iniciativas.')
INSERT [dbo].[Nivel] ([IdNivel], [NombreNivel], [Descripcion]) VALUES (4, N'Gestionado Cuantitativamente', N'Proceso Medido y Controlado. Mejores prácticas en el manejo de MDM. Procesos gestionados a nivel tácticos.')
INSERT [dbo].[Nivel] ([IdNivel], [NombreNivel], [Descripcion]) VALUES (5, N'Optimizado', N'Enficiencia en MDM. Enfoque táctico. Análitica predictiva.')
SET IDENTITY_INSERT [dbo].[Nivel] OFF
SET IDENTITY_INSERT [dbo].[Opcion] ON 

INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (1, N'No existen Políticas, procedimientos y metodologías en la organización', 1, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (2, N'Existen las políticas, procedimientos y metodologías pero no se encuentran formalizadas en la organización', 1, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (3, N'Existen Políticas, procedimientos y metodologías formalizadas en la organización, pero no se han implementado aún en la organización', 1, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (4, N'Las políticas, procedimientos y metodologías, ya existentes, se encuentran formalizadas e implementadas en la organización.', 1, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (5, N'Las políticas, procedimientos y metodologías implementadas son supervisados periódicamente por entidades regulatorias.', 1, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (6, N'La organización no es consciente de los roles y responsabilidades que existen', 2, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (7, N'La organización cuenta con alguna noción de los roles y responsabilidades establecidos', 2, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (8, N'Se ha infundido conciencia sobre la importancia de la clara identificación de los roles y responsabilidades en la organización', 2, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (9, N'La organización respeta los roles y responsabilidades en la organización', 2, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (10, N'Existe un gran nivel de cultura organizacional en cuanto a la clara definición de los roles y responsabilidades y se ejercen adecuadamente en la organización', 2, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (11, N'No existe un documento que contenga políticas y definiciones relacionadas con la definición de roles y responsabilidades', 3, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (12, N'La organización se encuentra en procesos de elaboración de políticas sobre los roles y responsabilidades', 3, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (13, N'Existen políticas y procedimientos formalizados para la gestión de roles y responsabilidades en la organización', 3, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (14, N'La organización ha implementado políticas y procedimientos para la gestión de roles y responsabilidades', 3, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (15, N'La organización cuenta con políticas y procedimientos sobre la gestión de roles y responsabilidades supervisadas periódicamente por entidades regulatorias', 3, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (16, N'La organización cuenta con responsabilidades  establecidas pero no se vinculan a un rol en particular', 4, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (17, N'Se han identificado todos los stakeholders  y las responsabilidades que deben de ejercerse', 4, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (18, N'Se realizan las labores diarias en base a los roles y responsabilidades establecidos', 4, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (19, N'Se está desarrollando un equipo de gobierno de datos o de datos maestros especializado en ciertas funciones', 4, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (20, N'Existe un equipo de gobierno de datos o datos maestro con roles y responsabilidades que cumplen funciones del negocio y  funciones de TI', 4, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (21, N'Entendimiento limitado del correcto uso de los datos. No se tiene en claro quiénes son los propietarios de los datos', 5, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (22, N'El dueño de los datos es consciente del contenido de los datos', 5, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (23, N'La organización promueve y conoce a los responsables de los datos dependiendo de la unidad', 5, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (24, N'Se distingue claramente la necesidad de un data steward (Administrador de los datos) y un data owner (Dueño de los datos)', 5, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (25, N'El  Data Steward o Administrador del dato promueve y se considera como un rol clave para la gestión de datos', 5, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (26, N'La organización no cuenta con documentación sobre el estado de las relaciones entre los datos y sus propietarios', 6, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (27, N'La organización se encuentra elaborando documentación sobre el estado de las relaciones entre los datos y sus propietarios', 6, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (28, N'La organización ha definido la documentación correspondiente al tratamiento y propiedad de los datos', 6, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (29, N'La documentación incluye las responsabilidades de los Data Stewards', 6, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (30, N'Se incluye en la documentación las normas de calidad de los datos', 6, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (31, N'No se han definido propietarios para los datos de toda la organización', 7, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (32, N'Todos los datos están asociados a una unidad o persona en particular considerada como propietario del dato', 7, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (33, N'El propietario de los datos tiene tareas definidas para el tratamiento de los datos en su poder', 7, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (34, N'Se han delegado  data stewards en las unidades correspondientes', 7, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (35, N'Los propietarios de los datos han definido estándares de calidad que deberán de cumplirse', 7, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (36, N'Existe una comprensión básica sobre los datos maestros en algunas unidades de la organización', 8, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (37, N'Existe noción de los datos maestros pero no son considerados en los procesos de gestión de información', 8, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (38, N'Se han identificado los datos maestros de manera aislada en la organización', 8, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (39, N'La organización hace uso de un diccionario de datos para la correcta gestión de los dominios y atributos de los datos', 8, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (40, N'La organización promueve la identificación de los datos maestros alrededor de toda la organización', 8, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (41, N'No existe documentación acerca de los datos maestros', 9, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (42, N'La organización cuenta con una breve descripción de los datos maestros de la organización', 9, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (43, N'La organización ha definido documentación para registrar los dominios de datos', 9, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (44, N'La organización se encuentra en proceso de elaboración de políticas sobre el correcto uso del diccionario de datos', 9, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (45, N'La organización ha establecido políticas para el uso de los diccionarios de los datos', 9, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (46, N'No se han identificado datos maestros en ninguna unidad de la organización', 10, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (47, N'Se ha identificado algunos datos maestros y se han declarado características de estos', 10, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (48, N'Se han definido requerimientos y reglas de negocio dirigidas a las restricciones de los dominios de datos', 10, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (49, N'La organización cuenta con una colección de dominios y atributos de datos llamada diccionario de datos', 10, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (50, N'La organización cuenta con un diccionario de datos  cuyo contenido es constantemente actualizado', 10, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (51, N'Existe una comprensión básica de relaciones entre los datos', 11, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (52, N'Existe algunas unidades que brindan descripciones generales sobre datos maestros y como se relacionan entre ellos', 11, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (53, N'Se ha infundido un nivel de concientización sobre el uso e importancia de los modelos de datos', 11, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (54, N'La organización es constantemente auditada los modelos de datos maestros establecidos', 11, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (55, N'La organización conoce procedimientos establecidos para el desarrollo del modelo', 11, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (56, N'No se lleva un control de las relaciones entre los datos', 12, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (57, N'Existen iniciativas para llevar un control de descripciones generales de los datos', 12, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (58, N'Se han establecido procedimientos para el desarrollo de modelos de datos maestros', 12, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (59, N'Se han formalizado e implementado los procedimientos para la elaboración de modelos de datos maestros', 12, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (60, N'La organización es auditada sobre los procedimientos establecidos a causa de los diferentes modelos de datos maestros', 12, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (61, N'Existen modelos de datos alineados a algunos tópicos de datos', 13, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (62, N'Se ha iniciado la construcción de modelos de datos maestros en algunas entidades de la organización', 13, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (63, N'Se han definido modelos de datos maestros en algunas entidades de la organización', 13, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (64, N'Se ha diseñado modelos de datos maestros para toda la empresa a lo largo de las diferentes unidades que se ocupan de los datos maestros', 13, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (65, N'La organización cuenta con robustos procedimientos automatizados de conciliación a causa de los diferentes modelos de datos existentes', 13, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (66, N'Los stakeholders conocen pobremente que sistemas usan para obtener los datos de su uso diario', 14, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (67, N'Los stakeholders comienzan a identificar a un alto nivel las redundancias de los datos', 14, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (68, N'Los stakeholders poseen un conocimiento completo de todos los sistemas que utilizan y de su relación con los datos', 14, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (69, N'Todas las áreas tienen conocimiento y hacen uso de la existencia de un inventario de fuentes para los datos que utilizan', 14, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (70, N'Se han delegado funciones a los data stewards relacionadas con el mantenimiento del inventario desarrollado', 14, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (71, NULL, 15, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (72, NULL, 15, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (73, NULL, 15, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (74, NULL, 15, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (75, NULL, 15, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (76, N'Existe alguna descripción general  sobre que sistemas usan o acceden a datos maestros', 16, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (77, N'Se cuenta con una descripción detallada de los sistemas que tienen acceso de lectura o escritura a los datos', 16, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (78, N'Se reconocen aquellas fuentes de datos que causan redundancias', 16, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (79, N'Existe un inventario consistente sobre todas las fuentes de datos y sobre que sistemas usan qué datos', 16, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (80, N'Existe un repositorio de todas las fuentes de datos y que sistemas se utilizan', 16, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (81, N'La organización entiende la importancia de la integración de datos maestros', 17, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (82, N'Se han establecido algunos roles y responsabilidades para la integración de los datos maestros', 17, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (83, N'Se han definido roles y responsabilidades para soluciones de gestión de datos maestros en la organización', 17, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (84, N'Los roles y responsabilidades se ejercen de manera correcta apoyando la implementación de nuevas fuentes de datos', 17, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (85, N'Se lleva un adecuado control de cambios y referencias de los datos maestros bajo procedimientos establecidos y formalizados', 17, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (86, N'No se aplican ningún proceso de integración de datos', 18, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (87, N'Se ha dado inicio a procesos de integración de datos maestros', 18, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (88, N'Se han definido procesos de integración de datos maestros y establecido reglas de negocio', 18, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (89, N'Los procesos se encuentran definidos bajo las mejores prácticas de integración entre distintas fuentes de datos', 18, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (90, N'La organización formula claramente metadatos (datos acerca de los datos) basado en las mejores prácticas', 18, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (91, N'Se han identificado datos maestros sin ningún tipo de referencia de fuentes de datos', 19, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (92, N'Se han identificado datos maestros y referencias de fuentes de datos así como características de estos o contribuyentes', 19, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (93, N'Se ha implementado una solución de gestión de datos maestros considerando las reglas de negocio correspondientes logrando establecer los  "Golden Records" o Registros de Oro', 19, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (94, N'Se define y mantiene jerarquías y afiliaciones logrando la implementación de integración de nuevas fuentes de datos', 19, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (95, N'Se define y mantiene jerarquías y afiliaciones y la integración de datos se basa en la gestión de los metadatos en curso', 19, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (96, N'La organización no es consciente sobre las relaciones entre TI y el negocio', 20, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (97, N'La organización precisa la diferencia entre los factores principales del negocio y TI', 20, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (98, N'Se han establecido roles y responsabilidades para la gestión de la información', 20, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (99, N'La organización trabaja conjuntamente mediante los roles establecidos para reducir la brecha entre TI y el negocio', 20, 4)
GO
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (100, N'La organización tiene la capacidad de desarrollar nuevas estrategias y metadatos entre TI y el negocio', 20, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (101, N'No existe procedimientos para la alineación de los datos', 21, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (102, N'La organización se encuentra en proceso de elaboración de procedimientos para la alineación de datos', 21, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (103, N'La organización cuenta con procedimientos establecidos para la alineación de los datos', 21, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (104, N'Los procedimientos establecidos se basan en las mejores prácticas de alineación de datos', 21, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (105, N'Los procedimientos establecidos se basan en mejores prácticas y son auditados por entidades regulatorias', 21, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (106, N'Existes discrepancias entre la tecnología y los procesos centrales del negocio', 22, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (107, N'Los principales factores del negocio están alineados a las estrategias de TI en la organización', 22, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (108, N'Tanto TI como el negocio entiende sus funciones de gestión de la información y sus estrategias respectivas', 22, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (109, N'Tanto las estrategias de TI como las del negocio trabajan conjuntamente para lograr una adecuada integración de los datos maestros', 22, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (110, N'El desarrollo de las estrategias entre TI y el negocio se hace de manera colaborativa y concurrente con revisiones frecuentes usando métricas apropiadas', 22, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (111, N'La organización no cuenta con roles definidos para la elaboración de arquitecturas de datos', 23, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (112, N'La organización con cuenta con roles definidos para la elaboración de arquitecturas de datos', 23, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (113, N'Existen roles y responsabilidades encargadas de mantener una arquitectura de integración de datos', 23, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (114, N'Los roles y responsabilidades son ejercidas correctamente para el diseño de arquitecturas de integración de datos', 23, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (115, N'La organización tiene la capacidad de elaborar taxonomías de datos', 23, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (116, N'No se han diseñado modelos de datos en la organización', 24, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (117, N'Se desarrolla y mantiene un modelo de datos alineado a las necesidades de la organización', 24, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (118, N'Se han definido procedimientos de para la elaboración de arquitectura de integración de datos', 24, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (119, N'Se ha documentado los procedimientos implementados para arquitecturas de integración de datos', 24, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (120, N'Los procedimientos establecidos se basan en las mejores prácticas basándose en los modelos de datos y la alineación entre TI y el negocio', 24, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (121, N'No existe una arquitectura de tecnología de datos en la organización', 25, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (122, N'Se ha definido y se mantiene una arquitectura de tecnología de datos en la organización', 25, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (123, N'Se ha definido y se mantiene una arquitectura de integración de datos en la organización', 25, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (124, N'Se ha definido y se mantiene una arquitectura de Datawarehouse / Business Intelligence en la organización', 25, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (125, N'Se ha definido y se mantiene taxonomías de datos y arquitectura de Meta-data', 25, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (126, N'Unidades de negocios solo se preocupan en usar los datos para sus propias funciones', 26, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (127, N'Se comunican y conocen de las etapas que se han establecido', 26, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (128, N'Se cuenta con unidades involucradas en la creación de tareas del ciclo de vida de los datos maestros', 26, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (129, N'Se cuenta con unidades y procesos del negocio que actúan en conjunto para ejecutar las tareas del ciclo de vida de los datos', 26, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (130, N'Las unidades, procesos de negocio y los sistemas de TI se colaboran para la ejecución de tareas del ciclo de vida de los datos maestros', 26, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (131, N'No se lleva un control sobre el flujo que siguen los de datos después de su creación', 27, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (132, N'Los requisitos de los datos se alinean con la etapa del ciclo de vida que corresponda', 27, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (133, N'Existen instrucciones documentadas de cómo tratar los datos en cada etapa', 27, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (134, N'Se elaboran controles para cada etapa que aseguren el cumplimiento de los requisitos de datos (evitar duplicados o alteraciones)', 27, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (135, N'Los controles se realizan con cierta periodicidad y se da un mantenimiento a estos', 27, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (136, N'No se han identificado las etapas por las cuales los datos transitan', 28, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (137, N'Se identifican las etapas que deberán de tener los datos maestros (captura, proceso, tratamiento, publicación y eliminación)', 28, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (138, N'Se identifican tareas bases que debe de emprender la organización para asegurar la calidad del dato en cada etapa identificada', 28, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (139, N'Se maneja un sola fuente de verdad para cada dato de la empresa, así se asegura la calidad de este', 28, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (140, N'Cada acción (inserción, eliminación y actualización) queda registrada en un sistema de log para mejorar el control y disminuir el tiempo operativo', 28, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (141, N'Se conoce la dependencia entre la productividad y el performance del negocio con la Calidad de los datos', 29, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (142, N'Se conoce como la mala calidad de datos afecta al negocio en un aspecto monetario', 29, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (143, N'La organización conoce como la mala calidad puede afectar no solo aspectos monetarios sino también en otros aspectos ( relación con el cliente, proveedor, reputación, etc)', 29, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (144, N'La organización es consciente de que pueden surgir nuevas causas y no basta tratar solo a las ya identificadas', 29, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (145, N'La organización puede clasificar los impactos de una mala calidad de los datos en aspectos monetarios  y no monetarios en argumentos financieros', 29, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (146, N'No existe algún registro de las causas de la mala calidad y su impacto', 30, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (147, N'Se proponen medidas para cada causa identificada', 30, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (148, N'Se ponen en ejecución las medidas para identificar más eficientemente las causas', 30, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (149, N'Se recurre a diferentes tipos de análisis para identificar causas que afectan a la mala calidad de los datos', 30, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (150, N'Existen controles que mitiguen o reduzcan la aparición de nuevas causas', 30, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (151, N'No hay ningún proceso para la identificación de causas y de futuros impactos', 31, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (152, N'Hay una temprana identificación de las causas', 31, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (153, N'La mayoría de las causas ya se han identificado', 31, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (154, N'Se reconocen las causas más impactantes y relevantes para el negocio', 31, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (155, N'Existe una búsqueda continua de causas que pueden nacer', 31, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (156, N'No existen iniciativas para evaluar la calidad de los datos', 32, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (157, N'La organización es consciente de que existen datos  de buena calidad y  de mala calidad', 32, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (158, N'Nace una preocupación para cada unidad de negocio  por la calidad de los datos que utiliza', 32, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (159, N'Los stakeholders están constantemente evaluando de la medición de calidad los datos maestros', 32, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (160, N'Los stakeholders conocen claramente la calidad de los datos que manejan y distinguen el nivel de calidad que tienen', 32, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (161, N'No existe ningún método para medir la calidad', 33, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (162, N'Se comienza a desarrollar métricas de calidad tomando en cuenta las dimensiones de la calidad de datos', 33, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (163, N'Existen métricas para cada conjunto de datos maestros', 33, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (164, N'Se establecen métodos de evaluación que contemplen las metricas desarrolladas', 33, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (165, N'Los métodos de evaluación están en constante cambio adaptándose a nuevas circunstancias', 33, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (166, N'Cuando se hayan inconsistencias en los datos, recién se evalúa la calidad de estos', 34, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (167, N'Se comienza a identificar qué aspectos son parte de la calidad y que deben de ser medidos', 34, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (168, N'Se desarrollan requerimientos mínimos que deben cumplir los datos al momento de la evaluación', 34, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (169, N'La calidad de datos se mide de manera objetiva, ya se conoce la calidad de cada dato maestro', 34, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (170, N'Se diseña un proceso para revalidar los datos periódicamente y así minimizar el riesgo de que la calidad de los datos se vea afectado', 34, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (171, N'Los stakeholders reconocen que algunos de los problemas que afectan la efectividad de los procesos están relacionados a la mala gestión de datos maestros', 35, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (172, N'La organización propone iniciativas para elaborar un programa de formación y sensibilización respecto a la gestión de datos maestros', 35, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (173, N'Existen capacitaciones regularmente respecto a la gestión de datos maestros para aquellos roles que poseen responsabilidades relacionadas a la calidad de datos', 35, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (174, N'Se ha establecido un programa de formación y sensibilización a los usuarios para cumplir sus responsabilidades en el mantenimiento de la calidad de los datos', 35, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (175, N'Para el personal que no cuenta con actividades estrechamente relacionadas a la calidad de datos, se ofrecen capacitaciones más generales', 35, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (176, N'No existen planes de acción en la empresa', 36, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (177, N'Se está en proceso de elaboración de los planes de acción', 36, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (178, N'Se han definido los planes de acción y se han documentado', 36, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (179, N'La organización comienza a trabajar bajo los planes de acción elaborados cuando se necesiten', 36, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (180, N'Se mejoran los planes de acción para que no haya una modificación constante de ellos', 36, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (181, N'Se ha determinado las áreas en las que la calidad de los datos no es suficiente', 37, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (182, N'Comienzan a proponerse iniciativas aisladas para mejorar la calidad de datos', 37, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (183, N'La organización establece un sistema para validar si la calidad de los datos es suficiente o no.', 37, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (184, N'Se ejecutan medidas de mejora para mejorar la calidad de los datos', 37, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (185, N'Existe un programa de mejora de calidad, en donde se considere las métricas deseadas, los plazos y los planes de acción a ejecutar', 37, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (186, N'No se han asignado roles para el desarrollo y gestión de indicadores', 38, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (187, N'Se ha establecido algunos roles para la gestión de indicadores', 38, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (188, N'Se han establecido claramente responsabilidades para el monitoreo regular de los datos mediante indicadores', 38, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (189, N'Las estrategias y políticas de los datos son definidas, comunicadas y monitoreadas', 38, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (190, N'La organización cuenta con roles y responsabilidades asociadas con entidades regulatorias para la gestión de indicadores', 38, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (191, N'No se realiza monitoreo de los datos', 39, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (192, N'Existen iniciativas para llevar acabo la ejecución de herramientas para la gestión de los datos', 39, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (193, N'Se ha definido procesos para la gestión de los datos mediante indicadores', 39, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (194, N'Se están establecido procesos y herramientas apropiados para el manejo del volumen de monitoreo requerido para reducir el riesgo de detectar problemas de datos', 39, 4)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (195, N'Los procesos establecidos son gestionados por una entidad reguladora para evaluar todas las etapas de los problemas de los datos', 39, 5)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (196, N'No existen indicadores implementados que supervisen el performance de la gestión de la datos', 40, 1)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (197, N'Los indicadores en cuanto a la gestión de la datos se encuentran en proceso de implementación', 40, 2)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (198, N'Se han definido indicadores para medir el performance de la gestión de los datos', 40, 3)
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (199, N'Se ha establecido monitoreo de los datos mediante indicadores, gestión de las herramientas y reportes en la organización', 40, 4)
GO
INSERT [dbo].[Opcion] ([IdOpcion], [Descripcion], [IdPregunta], [IdNivel]) VALUES (200, N'Continuamente se realiza seguimiento de los procesos de monitoreo hacia la fijación de objetivos y la identificación de tendencias', 40, 5)
SET IDENTITY_INSERT [dbo].[Opcion] OFF
SET IDENTITY_INSERT [dbo].[Pregunta] ON 

INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (1, N'¿Cuál es el estado actual de las politicias a nivel general en la organización?', 1, 4)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (2, N'¿Cuál es el nivel de concientización de la organización en cuanto a la clara definición de los roles y responsabilidades?', 2, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (3, N'¿Cuál es el estado actual de las políticas relacionadas a los roles y responsabilidades de la organización?', 2, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (4, N'¿En que medida la organización cuenta con capacidades para la clara definición de roles y responsabilidades en la organización?', 2, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (5, N'¿Cuál es el nivel de concientización de la organización en cuanto al correcto uso y propiedad de los datos?', 3, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (6, N'¿Cuál es el estado actual de la documentación relacionadas al uso y propiedad de los datos?', 3, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (7, N'¿En que medida la organización cuenta gestiona el uso y propiedad de los datos?', 3, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (8, N'¿En que medida los stakeholders conocen los datos maestros de la organización?', 4, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (9, N'¿Cuál es el estado actual de las políticas en cuanto al proceso de identificación de los datos maestros en la organización?', 4, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (10, N'¿Hasta que punto la organización ha logrado identificar los datos maestros de la organización?', 4, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (11, N'En general, ¿Cómo la organización comprende la importancia de los modelos de datos?', 5, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (12, N'¿En que medida se han definido procedimientos para asegurar la correcta elaboración de los modelos de datos?', 5, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (13, N'¿Hasta que punto se han definido los modelos de datos maestros en la organización?', 5, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (14, N'¿De que forma los stakeholders hacen uso un landscape de datos o descripción general de los datos?', 6, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (15, N'¿En que medida se han establecido procedimientos para realizar una descripción general de los datos?', 6, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (16, N'¿Hasta que punto la organización cuenta con las capacidades de describir las fuentes de datos para obtener una descrión general de los datos?', 6, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (17, N'¿En que medida se han asignado roles y responsabilidades para la integración de los datos?', 7, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (18, N'¿Hasta que punto se ha logrado establecer mejores prácticas para la integración de los datos?', 7, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (19, N'¿Cuál es el estado actual de las capacidades de la organización para llevar a cabo una adecuada integración de datos maestros?', 7, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (20, N'¿En que medida la organización establece controles y roles sobre la relación entre TI y el negocio?', 8, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (21, N'¿En que medida se han establecido procedimientos que colaboren con la alineación de los datos de la organización?', 8, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (22, N'¿Cuál es el estado actual de las capacidades de la organización para hacer frente a la correcta alineación de los datos?', 8, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (23, N'¿Hasta que punto la organización ha establecido roles y responsabilidades para la elaboración de arquitecturas de datos?', 9, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (24, N'¿En que medida se han establecido procedimientos que aseguren una arquitectura consistente de integración de los datos a partir de modelos y alineación de los datos?', 9, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (25, N'¿Cuáles son las capacidades de la organización para una correcta gestión y elaboración de una arquitectura de integración de datos?', 9, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (26, N'¿En que medida los stakeholders involucrados en gestión de datos conoce el ciclo de vida de los datos maestros?', 10, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (27, N'¿De que forma se han establecido procedimientos para el ciclo de vida de los datos?', 10, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (28, N'¿La org cuenta con la capacidad de gestionar el ciclo de vida de lso datos maestros?', 10, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (29, N'¿En que magnitud las personas conocen las deficiencias de la calidad?', 11, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (30, N'¿Qué se está haciendo para el reconocimiento de las barreras de la calidad?', 11, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (31, N'¿Cómo se está identificando las causas de la mala calidad?', 11, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (32, N'¿Qué tanto los stakeholders se preocupan por la calidad de los datos que manejan o necesitan?', 12, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (33, N'¿Cómo se esta midiendo la calidad a nivel organizacional?', 12, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (34, N'A que nivel se han desarrollado las capacidades para evaluar la calidad?', 12, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (35, N'¿Cómo se orienta a la organización a mejorar la caldiad de los datos?', 13, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (36, N'¿Se cuenta con planes de acción?', 13, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (37, N'¿Cuál es la capacidad que posee la organización para poner en marcha un plan de mejora de la calidad?', 13, 3)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (38, N'¿En que medida se han establecido roles y responsabilidades para gestión de indicadores?', 14, 1)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (39, N'¿Hasta que punto se han establecido procedimientos para el adecuado monitoreo de los datos?', 14, 2)
INSERT [dbo].[Pregunta] ([IdPregunta], [Descripcion], [IdCriterio], [IdComponente]) VALUES (40, N'¿Cuál es el estado actual del mointoreo de los datos y reporte?', 14, 3)
SET IDENTITY_INSERT [dbo].[Pregunta] OFF
SET IDENTITY_INSERT [dbo].[Respuesta] ON 

INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (7, 2, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (8, 14, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (9, 20, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (10, 21, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (11, 29, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (12, 31, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (13, 39, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (14, 44, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (15, 48, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (16, 54, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (17, 59, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (18, 62, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (19, 69, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (20, 73, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (21, 79, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (22, 102, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (23, 109, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (24, 114, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (25, 117, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (26, 123, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (27, 127, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (28, 134, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (29, 140, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (30, 143, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (31, 148, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (32, 154, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (33, 158, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (34, 163, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (35, 169, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (36, 174, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (37, 179, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (38, 184, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (39, 187, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (40, 194, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (41, 198, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (42, 83, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (43, 88, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (44, 94, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (45, 99, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (46, 9, 4, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (47, 2, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (48, 7, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (49, 11, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (50, 17, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (51, 21, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (52, 28, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (53, 34, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (54, 38, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (55, 43, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (56, 48, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (57, 54, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (58, 57, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (59, 62, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (60, 68, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (61, 71, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (62, 77, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (63, 84, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (64, 90, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (65, 92, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (66, 97, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (67, 102, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (68, 107, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (69, 113, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (70, 118, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (71, 122, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (72, 126, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (73, 134, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (74, 137, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (75, 145, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (76, 146, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (77, 152, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (78, 156, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (79, 163, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (80, 167, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (81, 173, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (82, 176, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (83, 184, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (84, 189, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (85, 194, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (86, 196, 5, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (127, 2, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (128, 6, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (129, 12, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (130, 18, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (131, 21, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (132, 27, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (133, 33, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (134, 36, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (135, 43, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (136, 46, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (137, 53, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (138, 58, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (139, 62, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (140, 68, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (141, 72, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (142, 76, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (143, 84, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (144, 86, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (145, 91, 2, NULL)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (146, 97, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (147, 103, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (148, 108, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (149, 113, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (150, 117, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (151, 121, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (152, 126, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (153, 131, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (154, 136, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (155, 144, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (156, 149, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (157, 153, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (158, 156, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (159, 165, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (160, 170, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (161, 173, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (162, 177, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (163, 185, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (164, 186, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (165, 191, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (166, 198, 2, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (207, 3, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (208, 7, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (209, 12, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (210, 17, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (211, 21, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (212, 27, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (213, 32, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (214, 39, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (215, 41, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (216, 51, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (217, 50, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (218, 58, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (219, 62, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (220, 68, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (221, 78, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (222, 74, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (223, 82, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (224, 98, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (225, 87, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (226, 94, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (227, 102, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (228, 117, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (229, 108, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (230, 111, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (231, 121, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (232, 132, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (233, 126, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (234, 136, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (235, 141, 3, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (236, 157, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (237, 151, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (238, 146, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (239, 172, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (240, 161, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (241, 194, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (242, 186, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (243, 198, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (244, 182, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (245, 169, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (246, 177, 3, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (247, 1, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (248, 6, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (249, 11, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (250, 16, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (251, 21, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (252, 27, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (253, 33, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (254, 37, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (255, 41, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (256, 48, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (257, 52, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (258, 58, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (259, 61, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (260, 66, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (261, 73, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (262, 76, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (263, 83, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (264, 89, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (265, 95, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (266, 96, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (267, 101, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (268, 107, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (269, 111, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (270, 119, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (271, 121, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (272, 129, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (273, 134, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (274, 137, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (275, 141, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (276, 150, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (277, 155, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (278, 158, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (279, 163, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (280, 167, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (281, 171, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (282, 177, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (283, 183, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (284, 186, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (285, 193, 6, NULL)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (286, 198, 6, NULL)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (287, 1, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (288, 7, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (289, 13, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (290, 16, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (291, 21, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (292, 26, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (293, 35, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (294, 40, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (295, 44, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (296, 48, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (297, 52, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (298, 59, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (299, 63, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (300, 66, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (301, 72, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (302, 79, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (303, 81, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (304, 89, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (305, 93, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (306, 96, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (307, 102, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (308, 108, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (309, 111, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (310, 117, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (311, 121, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (312, 127, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (313, 135, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (314, 140, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (315, 142, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (316, 151, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (317, 150, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (318, 158, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (319, 162, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (320, 170, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (321, 172, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (322, 176, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (323, 181, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (324, 188, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (325, 193, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (326, 199, 7, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (371, 2, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (372, 7, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (373, 14, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (374, 20, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (375, 21, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (376, 26, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (377, 35, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (378, 37, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (379, 44, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (380, 49, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (381, 52, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (382, 57, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (383, 63, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (384, 67, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (385, 72, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (386, 78, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (387, 81, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (388, 87, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (389, 91, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (390, 96, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (391, 101, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (392, 109, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (393, 112, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (394, 118, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (395, 123, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (396, 129, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (397, 134, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (398, 138, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (399, 142, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (400, 148, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (401, 155, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (402, 159, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (403, 162, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (404, 169, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (405, 173, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (406, 177, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (407, 182, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (408, 186, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (409, 195, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (410, 198, 8, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (411, 1, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (412, 6, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (413, 11, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (414, 16, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (415, 24, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (416, 26, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (417, 31, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (418, 37, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (419, 41, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (420, 47, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (421, 51, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (422, 59, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (423, 61, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (424, 67, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (425, 72, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (426, 79, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (427, 82, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (428, 87, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (429, 93, 9, 1)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (430, 98, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (431, 102, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (432, 107, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (433, 112, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (434, 117, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (435, 121, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (436, 130, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (437, 134, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (438, 138, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (439, 141, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (440, 148, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (441, 151, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (442, 156, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (443, 163, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (444, 171, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (445, 169, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (446, 176, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (447, 183, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (448, 186, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (449, 192, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (450, 198, 9, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (451, 1, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (452, 6, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (453, 12, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (454, 20, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (455, 23, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (456, 27, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (457, 32, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (458, 36, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (459, 41, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (460, 46, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (461, 52, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (462, 58, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (463, 63, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (464, 70, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (465, 75, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (466, 76, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (467, 83, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (468, 90, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (469, 95, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (470, 98, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (471, 101, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (472, 109, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (473, 113, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (474, 117, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (475, 124, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (476, 126, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (477, 135, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (478, 140, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (479, 142, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (480, 150, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (481, 155, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (482, 157, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (483, 165, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (484, 167, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (485, 175, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (486, 177, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (487, 184, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (488, 189, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (489, 197, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (490, 192, 10, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (491, 1, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (492, 11, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (493, 17, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (494, 7, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (495, 24, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (496, 29, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (497, 34, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (498, 36, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (499, 43, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (500, 49, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (501, 55, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (502, 59, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (503, 61, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (504, 67, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (505, 71, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (506, 80, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (507, 83, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (508, 87, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (509, 94, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (510, 98, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (511, 102, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (512, 106, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (513, 112, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (514, 116, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (515, 125, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (516, 126, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (517, 134, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (518, 140, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (519, 141, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (520, 149, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (521, 153, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (522, 156, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (523, 163, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (524, 166, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (525, 172, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (526, 176, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (527, 183, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (528, 188, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (529, 195, 11, 1)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (530, 196, 11, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (531, 1, 12, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (532, 6, 12, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (533, 12, 12, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (534, 19, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (535, 21, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (536, 26, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (537, 31, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (538, 36, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (539, 41, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (540, 47, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (541, 52, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (542, 57, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (543, 61, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (544, 68, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (545, 72, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (546, 77, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (547, 81, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (548, 86, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (549, 91, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (550, 96, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (551, 101, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (552, 107, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (553, 113, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (554, 118, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (555, 122, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (556, 129, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (557, 133, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (558, 139, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (559, 142, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (560, 147, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (561, 153, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (562, 159, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (563, 163, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (564, 169, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (565, 172, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (566, 177, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (567, 181, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (568, 188, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (569, 194, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (570, 196, 12, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (571, 1, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (572, 6, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (573, 11, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (574, 16, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (575, 21, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (576, 27, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (577, 31, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (578, 37, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (579, 42, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (580, 46, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (581, 51, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (582, 57, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (583, 61, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (584, 72, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (585, 78, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (586, 85, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (587, 88, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (588, 91, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (589, 96, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (590, 101, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (591, 107, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (592, 113, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (593, 118, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (594, 121, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (595, 127, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (596, 132, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (597, 136, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (598, 141, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (599, 150, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (600, 151, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (601, 157, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (602, 161, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (603, 167, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (604, 173, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (605, 176, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (606, 182, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (607, 186, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (608, 193, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (609, 198, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (610, 67, 13, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (611, 1, 2, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (612, 7, 2, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (657, 1, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (658, 8, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (659, 12, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (660, 16, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (661, 24, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (662, 27, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (663, 31, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (664, 36, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (665, 44, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (666, 46, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (667, 52, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (668, 56, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (669, 64, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (670, 68, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (671, 75, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (672, 80, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (673, 83, 14, 1)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (674, 89, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (675, 95, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (676, 98, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (677, 102, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (678, 107, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (679, 113, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (680, 117, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (681, 125, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (682, 126, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (683, 131, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (684, 137, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (685, 143, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (686, 150, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (687, 153, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (688, 157, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (689, 162, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (690, 169, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (691, 174, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (692, 179, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (693, 181, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (694, 186, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (695, 193, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (696, 196, 14, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (697, 197, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (698, 194, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (699, 189, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (700, 185, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (836, 1, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (837, 6, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (838, 11, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (839, 19, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (840, 24, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (841, 27, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (842, 33, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (843, 36, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (844, 44, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (845, 48, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (846, 55, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (847, 59, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (848, 61, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (849, 69, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (850, 74, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (851, 77, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (852, 83, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (853, 90, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (854, 93, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (855, 98, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (856, 103, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (857, 108, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (858, 112, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (859, 117, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (860, 122, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (861, 127, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (862, 134, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (863, 138, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (864, 143, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (865, 148, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (866, 154, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (867, 160, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (868, 161, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (869, 170, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (870, 172, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (871, 176, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (872, 181, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (873, 187, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (874, 192, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (875, 198, 15, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (883, 161, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (884, 168, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (885, 173, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (886, 176, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (887, 145, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (888, 156, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (889, 153, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (890, 150, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (891, 103, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (892, 106, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (893, 111, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (894, 116, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (895, 84, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (896, 88, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (897, 95, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (898, 99, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (899, 64, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (900, 69, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (901, 71, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (902, 76, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (903, 43, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (904, 46, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (905, 53, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (906, 58, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (907, 24, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (908, 27, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (909, 32, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (910, 37, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (911, 3, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (912, 10, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (913, 12, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (914, 17, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (915, 124, 14, 2)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (916, 126, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (917, 132, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (918, 137, 14, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (919, 3, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (920, 7, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (921, 14, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (922, 20, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (923, 23, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (924, 26, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (925, 32, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (926, 36, 16, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (930, 1, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (931, 6, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (932, 11, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (933, 17, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (934, 21, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (935, 26, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (936, 31, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (937, 38, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (938, 41, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (939, 46, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (940, 51, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (941, 56, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (942, 61, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (943, 66, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (944, 71, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (945, 76, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (946, 82, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (947, 87, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (948, 91, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (949, 98, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (950, 101, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (951, 108, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (952, 111, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (953, 116, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (954, 121, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (955, 126, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (956, 131, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (957, 136, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (958, 143, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (959, 146, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (960, 153, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (961, 157, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (962, 162, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (963, 166, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (964, 171, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (965, 176, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (966, 181, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (967, 186, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (968, 191, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (969, 197, 15, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1010, 1, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1011, 6, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1012, 12, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1013, 17, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1014, 23, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1015, 29, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1016, 33, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1017, 36, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1018, 42, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1019, 50, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1020, 55, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1021, 57, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1022, 63, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1023, 66, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1024, 72, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1025, 79, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1026, 84, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1027, 88, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1028, 93, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1029, 97, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1030, 101, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1031, 107, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1032, 112, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1033, 120, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1034, 123, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1035, 127, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1036, 134, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1037, 139, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1038, 144, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1039, 150, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1040, 153, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1041, 156, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1042, 165, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1043, 172, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1044, 168, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1045, 177, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1046, 185, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1047, 187, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1048, 193, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1049, 199, 18, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1050, 1, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1051, 7, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1052, 12, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1053, 17, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1054, 25, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1055, 30, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1056, 33, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1057, 38, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1058, 43, 18, 2)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1059, 48, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1060, 53, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1061, 57, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1062, 64, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1063, 67, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1064, 73, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1065, 79, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1066, 87, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1067, 85, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1068, 93, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1069, 99, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1070, 102, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1071, 110, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1072, 116, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1073, 115, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1074, 125, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1075, 127, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1076, 133, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1077, 138, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1078, 145, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1079, 148, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1080, 152, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1081, 156, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1082, 164, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1083, 170, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1084, 172, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1085, 177, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1086, 184, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1087, 186, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1088, 193, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1089, 196, 18, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1090, 1, 18, 3)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1091, 7, 18, 3)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1092, 12, 18, 3)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1093, 19, 18, 3)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1094, 2, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1095, 12, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1096, 10, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1097, 19, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1098, 24, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1099, 28, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1100, 31, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1101, 38, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1102, 43, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1103, 48, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1104, 51, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1105, 57, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1106, 64, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1107, 68, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1108, 73, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1109, 80, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1110, 82, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1111, 88, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1112, 92, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1113, 97, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1114, 103, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1115, 107, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1116, 118, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1117, 114, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1118, 121, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1119, 129, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1120, 137, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1121, 133, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1122, 142, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1123, 150, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1124, 155, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1125, 158, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1126, 164, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1127, 173, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1128, 170, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1129, 177, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1130, 185, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1131, 187, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1132, 194, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1133, 198, 19, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1134, 1, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1135, 8, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1136, 12, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1137, 17, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1138, 22, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1139, 27, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1140, 35, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1141, 36, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1142, 45, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1143, 50, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1144, 52, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1145, 58, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1146, 64, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1147, 68, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1148, 73, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1149, 76, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1150, 84, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1151, 88, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1152, 93, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1153, 97, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1154, 103, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1155, 107, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1156, 111, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1157, 118, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1158, 125, 20, 1)
GO
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1159, 128, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1160, 133, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1161, 138, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1162, 145, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1163, 149, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1164, 152, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1165, 159, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1166, 163, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1167, 166, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1168, 172, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1169, 176, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1170, 183, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1171, 188, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1172, 194, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1173, 197, 20, 1)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1174, 2, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1175, 6, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1176, 13, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1177, 16, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1178, 25, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1179, 27, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1180, 32, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1181, 37, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1182, 45, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1183, 47, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1184, 53, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1185, 58, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1186, 65, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1187, 67, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1188, 73, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1189, 79, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1190, 84, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1191, 87, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1192, 92, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1193, 97, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1194, 104, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1195, 108, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1196, 114, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1197, 119, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1198, 124, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1199, 130, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1200, 133, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1201, 139, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1202, 144, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1203, 146, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1204, 155, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1205, 157, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1206, 165, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1207, 169, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1208, 172, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1209, 176, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1210, 185, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1211, 187, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1212, 192, 20, 2)
INSERT [dbo].[Respuesta] ([IdRespuesta], [IdOpcion], [IdUsuario], [ContVez]) VALUES (1213, 199, 20, 2)
SET IDENTITY_INSERT [dbo].[Respuesta] OFF
SET IDENTITY_INSERT [dbo].[Usuario] ON 

INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (1, N'Administrador Proyecto MDM', N'Administrador', N'Admin', N'Admin12', N'UPC', N'Admin', 0, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (2, N'Lucero Valderrama', N'Usuario', N'Lucerov', N'Lucerov', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (3, N'Victor Lujan', N'Usuario', N'Victorv', N'Victorv', N'Financiera Confianza', N'Gerente', 0, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (4, N'Jose Vásquez', N'Usuario', N'Josev', N'Josev', N'Caja Trujillo', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (5, N'UsuarioPrueba 2', N'Usuario', N'user02', N'user02', N'Mi banco', N'Gerente', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (6, N'UsuarioPrueba 3', N'Usuario', N'user03', N'user03', N'Mi banco', N'Gerente', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (7, N'UsuarioPrueba 4', N'Usuario', N'user04', N'user04', N'Mi banco', N'Gerente', 0, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (8, N'UsuarioPrueba 5', N'Usuario', N'user05', N'user05', N'Mi banco', N'Gerente', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (9, N'UsuarioPrueba 5', N'Usuario', N'user06', N'user06', N'Mi banco', N'Gerente', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (10, N'Lucero Valderrama', N'Usuario', N'Lucerov2', N'Lucerov2', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (11, N'Lucero Valderrama', N'Usuario', N'Lucerov3', N'Lucerov3', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (12, N'Lucero Valderrama', N'Usuario', N'Lucerov4', N'Lucerov4', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (13, N'Lucero Valderrama', N'Usuario', N'Lucerov5', N'Lucerov5', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (14, N'Lucero Valderrama', N'Usuario', N'Lucerov6', N'Lucerov6', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (15, N'Lucero Valderrama', N'Usuario', N'Lucerov7', N'Lucerov7', N'Superitendencia Banca y Seguros', N'Especialista', 1, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (16, N'Lucero Valderrama', N'Usuario', N'Lucerov8', N'Lucerov8', N'Superitendencia Banca y Seguros', N'Especialista', 0, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (17, N'Lucero Valderrama', N'Usuario', N'Lucerov8', N'Lucerov8', N'Superitendencia Banca y Seguros', N'Especialista', 0, NULL)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (18, N'Lucero Valderrama', N'Usuario', N'LULU', N'LULU', N'Superitendencia Banca y Seguros', N'Especialista', 1, 0)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (19, N'Lucero Valderrama', N'Usuario', N'Prueba1', N'Prueba1', N'Superitendencia Banca y Seguros', N'Especialista', 1, 0)
INSERT [dbo].[Usuario] ([IdUsuario], [NombreUsuario], [TipoUsuario], [UsuarioIngreso], [Clave], [Entidad], [Cargo], [EncuestaTerminada], [NroEcuestasTerminadas]) VALUES (20, N'Lucero Valderrama', N'Usuario', N'Prueba2', N'Prueba2', N'Superitendencia Banca y Seguros', N'Especialista', 1, 2)
SET IDENTITY_INSERT [dbo].[Usuario] OFF
ALTER TABLE [dbo].[Criterio]  WITH CHECK ADD  CONSTRAINT [FK_Criterio_Dimension] FOREIGN KEY([IdDimension])
REFERENCES [dbo].[Dimension] ([IdDimension])
GO
ALTER TABLE [dbo].[Criterio] CHECK CONSTRAINT [FK_Criterio_Dimension]
GO
ALTER TABLE [dbo].[Opcion]  WITH CHECK ADD  CONSTRAINT [FK_Opcion_Nivel] FOREIGN KEY([IdNivel])
REFERENCES [dbo].[Nivel] ([IdNivel])
GO
ALTER TABLE [dbo].[Opcion] CHECK CONSTRAINT [FK_Opcion_Nivel]
GO
ALTER TABLE [dbo].[Opcion]  WITH CHECK ADD  CONSTRAINT [FK_Opcion_Pregunta] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Pregunta] ([IdPregunta])
GO
ALTER TABLE [dbo].[Opcion] CHECK CONSTRAINT [FK_Opcion_Pregunta]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Componente] FOREIGN KEY([IdComponente])
REFERENCES [dbo].[Componente] ([IdComponente])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Componente]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Criterio] FOREIGN KEY([IdCriterio])
REFERENCES [dbo].[Criterio] ([IdCriterio])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Criterio]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Opcion] FOREIGN KEY([IdOpcion])
REFERENCES [dbo].[Opcion] ([IdOpcion])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Opcion]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Usuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[Usuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Usuario]
GO
USE [master]
GO
ALTER DATABASE [MDM] SET  READ_WRITE 
GO
