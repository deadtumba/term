USE [master]
GO
/****** Object:  Database [pogruzki_zagruzki]    Script Date: 08.11.2024 10:11:00 ******/
CREATE DATABASE [pogruzki_zagruzki]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'pogruzki_zagruzki', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER122\MSSQL\DATA\pogruzki_zagruzki.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'pogruzki_zagruzki_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER122\MSSQL\DATA\pogruzki_zagruzki_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [pogruzki_zagruzki] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [pogruzki_zagruzki].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [pogruzki_zagruzki] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ARITHABORT OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [pogruzki_zagruzki] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [pogruzki_zagruzki] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET  DISABLE_BROKER 
GO
ALTER DATABASE [pogruzki_zagruzki] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [pogruzki_zagruzki] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [pogruzki_zagruzki] SET  MULTI_USER 
GO
ALTER DATABASE [pogruzki_zagruzki] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [pogruzki_zagruzki] SET DB_CHAINING OFF 
GO
ALTER DATABASE [pogruzki_zagruzki] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [pogruzki_zagruzki] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [pogruzki_zagruzki] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [pogruzki_zagruzki] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [pogruzki_zagruzki] SET QUERY_STORE = ON
GO
ALTER DATABASE [pogruzki_zagruzki] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [pogruzki_zagruzki]
GO
/****** Object:  Table [dbo].[Kladovshiki]    Script Date: 08.11.2024 10:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kladovshiki](
	[ID_Kladovshika] [int] IDENTITY(1,1) NOT NULL,
	[Imya] [nvarchar](15) NOT NULL,
	[Familiya] [nvarchar](30) NOT NULL,
	[Otchestvo] [nvarchar](30) NULL,
	[Login] [nvarchar](10) NOT NULL,
	[Password] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Kladovshiki] PRIMARY KEY CLUSTERED 
(
	[ID_Kladovshika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pogrzka_ILI_razgruzka]    Script Date: 08.11.2024 10:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pogrzka_ILI_razgruzka](
	[ID_Pogrzka_ILI_razgruzka] [int] IDENTITY(1,1) NOT NULL,
	[Nazvanie] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_Pogrzka_ILI_razgruzka] PRIMARY KEY CLUSTERED 
(
	[ID_Pogrzka_ILI_razgruzka] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[zagruzki_pogruzki]    Script Date: 08.11.2024 10:11:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zagruzki_pogruzki](
	[ID_Pogruzki_razgruzki] [int] IDENTITY(1,1) NOT NULL,
	[ID_Pogrzka_ILI_razgruzka] [int] NOT NULL,
	[Imya_voditelya] [nvarchar](25) NOT NULL,
	[Familiya_voditelya] [nvarchar](30) NOT NULL,
	[Otchestvo_voditelya] [nvarchar](30) NULL,
	[Nazvabie_organizacii] [nvarchar](100) NOT NULL,
	[Nomer_telephona] [nvarchar](12) NOT NULL,
	[Data] [date] NOT NULL,
	[ID_Kladovshika] [int] NOT NULL,
	[Nomer_Avto] [nvarchar](9) NOT NULL,
 CONSTRAINT [PK_zagruzki_pogruzki] PRIMARY KEY CLUSTERED 
(
	[ID_Pogruzki_razgruzki] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[zagruzki_pogruzki]  WITH CHECK ADD  CONSTRAINT [FK_zagruzki_pogruzki_Kladovshiki] FOREIGN KEY([ID_Kladovshika])
REFERENCES [dbo].[Kladovshiki] ([ID_Kladovshika])
GO
ALTER TABLE [dbo].[zagruzki_pogruzki] CHECK CONSTRAINT [FK_zagruzki_pogruzki_Kladovshiki]
GO
ALTER TABLE [dbo].[zagruzki_pogruzki]  WITH CHECK ADD  CONSTRAINT [FK_zagruzki_pogruzki_Pogrzka_ILI_razgruzka] FOREIGN KEY([ID_Pogrzka_ILI_razgruzka])
REFERENCES [dbo].[Pogrzka_ILI_razgruzka] ([ID_Pogrzka_ILI_razgruzka])
GO
ALTER TABLE [dbo].[zagruzki_pogruzki] CHECK CONSTRAINT [FK_zagruzki_pogruzki_Pogrzka_ILI_razgruzka]
GO
USE [master]
GO
ALTER DATABASE [pogruzki_zagruzki] SET  READ_WRITE 
GO
