USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 1/8/2023 12:07:11 ******/
CREATE DATABASE [PreguntadOrt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadOrt', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadOrt_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadOrt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadOrt] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadOrt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadOrt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadOrt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadOrt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadOrt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadOrt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadOrt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadOrt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadOrt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadOrt] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadOrt] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadOrt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadOrt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadOrt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadOrt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadOrt] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadOrt', N'ON'
GO
ALTER DATABASE [PreguntadOrt] SET QUERY_STORE = OFF
GO
USE [PreguntadOrt]
GO
/****** Object:  User [alumno]    Script Date: 1/8/2023 12:07:11 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 1/8/2023 12:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[idCategoria] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[foto] [varchar](250) NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[idCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultad]    Script Date: 1/8/2023 12:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultad](
	[idDificultad] [int] NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultad] PRIMARY KEY CLUSTERED 
(
	[idDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pregunta]    Script Date: 1/8/2023 12:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pregunta](
	[idPregunta] [int] NOT NULL,
	[idCategoria] [int] NOT NULL,
	[idDificultad] [int] NOT NULL,
	[enunciado] [varchar](200) NOT NULL,
	[foto] [varchar](500) NULL,
 CONSTRAINT [PK_Pregunta] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuesta]    Script Date: 1/8/2023 12:07:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuesta](
	[idRespuesta] [int] NOT NULL,
	[idPregunta] [int] NOT NULL,
	[opcion] [int] NOT NULL,
	[contenido] [varchar](100) NOT NULL,
	[correcta] [bit] NOT NULL,
	[foto] [varchar](300) NULL,
 CONSTRAINT [PK_respuesta] PRIMARY KEY CLUSTERED 
(
	[idRespuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (1, N'Artes', NULL)
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (2, N'Ciencia', NULL)
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (3, N'Deportes', NULL)
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (4, N'Entretenimiento', NULL)
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (5, N'Geografia', NULL)
INSERT [dbo].[Categoria] ([idCategoria], [nombre], [foto]) VALUES (6, N'Historia', NULL)
GO
INSERT [dbo].[Dificultad] ([idDificultad], [nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultad] ([idDificultad], [nombre]) VALUES (2, N'Medio')
INSERT [dbo].[Dificultad] ([idDificultad], [nombre]) VALUES (3, N'Dificil')
GO
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (1, 1, 1, N'¿Quien pinto la famosa obra "La Mona Lisa"?', NULL)
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (2, 1, 2, N'¿Cual es la tecnica artistica que utiliza trozos de papel para crear imagenes?', NULL)
GO
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (1, 1, 1, N'Vicent Van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (2, 1, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (3, 1, 3, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (4, 1, 4, N'Salvador Dali', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (5, 2, 1, N'Acuarela', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (6, 2, 2, N'Mosaico', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (7, 2, 3, N'Escultura', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (8, 2, 4, N'Fotografia', 0, NULL)
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Categoria] FOREIGN KEY([idCategoria])
REFERENCES [dbo].[Categoria] ([idCategoria])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Categoria]
GO
ALTER TABLE [dbo].[Pregunta]  WITH CHECK ADD  CONSTRAINT [FK_Pregunta_Dificultad] FOREIGN KEY([idDificultad])
REFERENCES [dbo].[Dificultad] ([idDificultad])
GO
ALTER TABLE [dbo].[Pregunta] CHECK CONSTRAINT [FK_Pregunta_Dificultad]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta]
GO
ALTER TABLE [dbo].[Respuesta]  WITH CHECK ADD  CONSTRAINT [FK_Respuesta_Pregunta1] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Pregunta] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuesta] CHECK CONSTRAINT [FK_Respuesta_Pregunta1]
GO
USE [master]
GO
ALTER DATABASE [PreguntadOrt] SET  READ_WRITE 
GO
