USE [master]
GO
/****** Object:  Database [PreguntadOrt]    Script Date: 29/8/2023 11:26:21 ******/
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
/****** Object:  User [alumno]    Script Date: 29/8/2023 11:26:21 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 29/8/2023 11:26:21 ******/
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
/****** Object:  Table [dbo].[Dificultad]    Script Date: 29/8/2023 11:26:21 ******/
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
/****** Object:  Table [dbo].[Pregunta]    Script Date: 29/8/2023 11:26:21 ******/
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
/****** Object:  Table [dbo].[Respuesta]    Script Date: 29/8/2023 11:26:21 ******/
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
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (1, 1, 1, N'¿Quien pinto la famosa obra "La Mona Lisa"?', N'mona_lisa.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (2, 1, 2, N'¿Cual es la tecnica artistica que utiliza trozos de papel para crear imagenes?', N'collage.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (3, 1, 3, N'¿Quien es el autor de la opera "La Traviata"?', N'traviata.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (4, 2, 1, N'¿Cual es el simbolo quimico del agua?', N'agua.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (5, 2, 2, N'¿Cual es el organo responsable de bombear sangre en el cuerpo humano?', N'organos.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (6, 2, 3, N'¿Cual es la particula subatomica con carga electrica negativa?', N'atomo.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (7, 4, 1, N'¿En que saga cinematografica aparecen los personajes Luke Skywalker y Darth Vader?', N'darth_vader.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (8, 4, 2, N'¿Quien escribió la exitosa serie de libros "Harry Potter"?', N'hp.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (9, 4, 3, N'¿Que actor interpreto a James Bond en la pelicula "GoldenEye" de 1995?', N'golden_eye.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (10, 3, 1, N'¿En que deporte se usa una raqueta para golpear un volante sobre una red?', N'deporte.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (11, 3, 2, N'¿Cual es el pais de origen del famoso piloto de Formula 1, Ayrton Senna?', N'formula_uno.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (12, 3, 3, N'¿En que deporte se destaca la atleta estadounidense Simone Biles?', N'simone_biles.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (13, 6, 1, N'¿Quien fue el primer presidente de los Estados Unidos?', N'usa.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (14, 6, 2, N'¿En que año comenzo la Revolucion Francesa?', N'revolucion.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (15, 6, 3, N'¿Que lider politico fue el primer canciller de la Republica Federal de Alemania (1949)?', N'alemania.png')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (16, 5, 1, N'¿Cual es el rio mas largo del mundo?', N'rio.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (17, 5, 2, N'¿Cual es la capital de Australia?', N'australia.jpg')
INSERT [dbo].[Pregunta] ([idPregunta], [idCategoria], [idDificultad], [enunciado], [foto]) VALUES (18, 5, 3, N'¿Cual de estos paises no tiene una frontera con Rusia?', N'rusia.jpg')
GO
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (1, 1, 1, N'Vicent Van Gogh', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (2, 1, 2, N'Pablo Picasso', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (3, 1, 3, N'Leonardo da Vinci', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (4, 1, 4, N'Salvador Dali', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (5, 2, 1, N'Acuarela', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (6, 2, 2, N'Mosaico', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (7, 2, 3, N'Escultura', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (8, 2, 4, N'Fotografia', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (9, 3, 1, N'Wolfgang Amadeus Mozart', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (10, 3, 2, N'Ludwig van Beethoven', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (11, 3, 3, N'Giuseppe Verdi', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (12, 3, 4, N'Johann Sebastian Bach', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (13, 4, 1, N'O2', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (14, 4, 2, N'CO2', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (15, 4, 3, N'H2O', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (16, 4, 4, N'Na', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (17, 5, 1, N'Pulmon', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (18, 5, 2, N'Higado', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (19, 5, 3, N'Corazon', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (20, 5, 4, N'Riñon', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (21, 6, 1, N'Proton', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (22, 6, 2, N'Electron', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (23, 6, 3, N'Neutron', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (24, 6, 4, N'Foton', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (25, 7, 1, N'Harry Potter', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (26, 7, 2, N'Star Wars', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (27, 7, 3, N'El Señor de los Anillos', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (28, 7, 4, N'Los Vengadores', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (29, 8, 1, N'J.R.R. Tolkien', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (30, 8, 2, N'J.K. Rowling', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (31, 8, 3, N'George R.R. Martin', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (32, 8, 4, N'Stephen King', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (33, 9, 1, N'Roger Moore', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (34, 9, 2, N'Pierce Brosnan', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (35, 9, 3, N'Sean Connery', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (36, 9, 4, N'Timothy Dalton', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (37, 10, 1, N'Futbol', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (38, 10, 2, N'Tenis', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (39, 10, 3, N'Badminton', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (40, 10, 4, N'Golf', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (41, 11, 1, N'Brasil', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (42, 11, 2, N'Italia', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (43, 11, 3, N'Alemania', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (44, 11, 4, N'Francia', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (45, 12, 1, N'Natacion', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (46, 12, 2, N'Gimnasia', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (47, 12, 3, N'Tenis', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (48, 12, 4, N'Atletismo', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (49, 13, 1, N'Abraham Lincoln', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (50, 13, 2, N'Thomas Jefferson', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (51, 13, 3, N'George Washington', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (52, 13, 4, N'Benjamin Franklin', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (53, 14, 1, N'1776', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (54, 14, 2, N'1789', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (55, 14, 3, N'1804', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (56, 14, 4, N'1812', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (57, 15, 1, N'Winston Churchill', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (58, 15, 2, N'Charles de Gaulle', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (59, 15, 3, N'Konrad Adenauer', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (60, 15, 4, N'Josef Stalin', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (61, 16, 1, N'Nilo', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (62, 16, 2, N'Amazonas', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (63, 16, 3, N'Misisipi', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (64, 16, 4, N'Yangtse', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (65, 17, 1, N'Melbourne', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (66, 17, 2, N'Sidney', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (67, 17, 3, N'Canberra', 1, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (68, 17, 4, N'Brisbane', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (69, 18, 1, N'Ucrania', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (70, 18, 2, N'Finlandia', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (71, 18, 3, N'Mongolia', 0, NULL)
INSERT [dbo].[Respuesta] ([idRespuesta], [idPregunta], [opcion], [contenido], [correcta], [foto]) VALUES (72, 18, 4, N'Noruega', 1, NULL)
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
