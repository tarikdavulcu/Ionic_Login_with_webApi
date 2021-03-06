USE [master]
GO
/****** Object:  Database [tdbilisim]    Script Date: 03/10/2021 00:21:18 ******/
CREATE DATABASE [tdbilisim] ON  PRIMARY 
( NAME = N'tdbilisim', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\tdbilisim.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'tdbilisim_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\tdbilisim_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [tdbilisim] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [tdbilisim].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [tdbilisim] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [tdbilisim] SET ANSI_NULLS OFF
GO
ALTER DATABASE [tdbilisim] SET ANSI_PADDING OFF
GO
ALTER DATABASE [tdbilisim] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [tdbilisim] SET ARITHABORT OFF
GO
ALTER DATABASE [tdbilisim] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [tdbilisim] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [tdbilisim] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [tdbilisim] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [tdbilisim] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [tdbilisim] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [tdbilisim] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [tdbilisim] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [tdbilisim] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [tdbilisim] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [tdbilisim] SET  DISABLE_BROKER
GO
ALTER DATABASE [tdbilisim] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [tdbilisim] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [tdbilisim] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [tdbilisim] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [tdbilisim] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [tdbilisim] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [tdbilisim] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [tdbilisim] SET  READ_WRITE
GO
ALTER DATABASE [tdbilisim] SET RECOVERY FULL
GO
ALTER DATABASE [tdbilisim] SET  MULTI_USER
GO
ALTER DATABASE [tdbilisim] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [tdbilisim] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'tdbilisim', N'ON'
GO
USE [tdbilisim]
GO
/****** Object:  Table [dbo].[Kullanicilar]    Script Date: 03/10/2021 00:21:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kullanicilar](
	[KullaniciID] [int] IDENTITY(1,1) NOT NULL,
	[KullaniciAdi] [nvarchar](50) NULL,
	[Sifre] [nvarchar](50) NULL,
 CONSTRAINT [PK_Kullanicilar] PRIMARY KEY CLUSTERED 
(
	[KullaniciID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Kullanicilar] ON
INSERT [dbo].[Kullanicilar] ([KullaniciID], [KullaniciAdi], [Sifre]) VALUES (1, N'admin', N'12345')
SET IDENTITY_INSERT [dbo].[Kullanicilar] OFF
