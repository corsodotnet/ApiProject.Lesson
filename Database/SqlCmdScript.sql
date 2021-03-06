USE [master]
GO
/****** Object:  Database [UniversityDb]    Script Date: 27/05/2022 12.24.10 ******/
CREATE DATABASE [UniversityDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UniversityDb', FILENAME = N'/var/opt/mssql/data/UniversityDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UniversityDb_log', FILENAME = N'/var/opt/mssql/data/UniversityDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UniversityDb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UniversityDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UniversityDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UniversityDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UniversityDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UniversityDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UniversityDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UniversityDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UniversityDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UniversityDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UniversityDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UniversityDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UniversityDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UniversityDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UniversityDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UniversityDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UniversityDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UniversityDb] SET RECOVERY FULL 
GO
ALTER DATABASE [UniversityDb] SET  MULTI_USER 
GO
ALTER DATABASE [UniversityDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UniversityDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UniversityDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UniversityDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UniversityDb] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'UniversityDb', N'ON'
GO
ALTER DATABASE [UniversityDb] SET QUERY_STORE = OFF
GO
USE [UniversityDb]
GO
/****** Object:  Table [dbo].[Corso]    Script Date: 27/05/2022 12.24.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Corso](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DatePublished] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Corso] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Studente]    Script Date: 27/05/2022 12.24.10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[DatePublished] [datetime2](7) NOT NULL,
	[CorsoId] [int] NULL,
 CONSTRAINT [PK_Studente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Studente]  WITH CHECK ADD  CONSTRAINT [FK_Studente_Corso_CorsoId] FOREIGN KEY([CorsoId])
REFERENCES [dbo].[Corso] ([Id])
GO
ALTER TABLE [dbo].[Studente] CHECK CONSTRAINT [FK_Studente_Corso_CorsoId]
GO
USE [master]
GO
ALTER DATABASE [UniversityDb] SET  READ_WRITE 
GO
