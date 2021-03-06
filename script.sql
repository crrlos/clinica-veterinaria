USE [master]
GO
/****** Object:  Database [clinica]    Script Date: 21/11/2015 7:27:36 ******/
CREATE DATABASE [clinica]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'clinica', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\clinica.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'clinica_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\clinica_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [clinica] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [clinica].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [clinica] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [clinica] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [clinica] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [clinica] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [clinica] SET ARITHABORT OFF 
GO
ALTER DATABASE [clinica] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [clinica] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [clinica] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [clinica] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [clinica] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [clinica] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [clinica] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [clinica] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [clinica] SET  ENABLE_BROKER 
GO
ALTER DATABASE [clinica] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [clinica] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [clinica] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [clinica] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [clinica] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [clinica] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [clinica] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [clinica] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [clinica] SET  MULTI_USER 
GO
ALTER DATABASE [clinica] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [clinica] SET DB_CHAINING OFF 
GO
ALTER DATABASE [clinica] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [clinica] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [clinica] SET DELAYED_DURABILITY = DISABLED 
GO
USE [clinica]
GO
/****** Object:  User [admin3]    Script Date: 21/11/2015 7:27:36 ******/
CREATE USER [admin3] FOR LOGIN [admin3] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin1]    Script Date: 21/11/2015 7:27:36 ******/
CREATE USER [admin1] FOR LOGIN [admin1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin3]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin3]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin3]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin3]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin3]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin3]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin3]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin3]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin3]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin1]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin1]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [admin1]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [admin1]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [admin1]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin1]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin1]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [admin1]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [admin1]
GO
/****** Object:  Table [dbo].[animales]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[animales](
	[idanimal] [int] IDENTITY(1,1) NOT NULL,
	[nombreanimal] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idanimal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[expediente]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[expediente](
	[idexpediente] [int] IDENTITY(1,1) NOT NULL,
	[idpaciente] [int] NULL,
	[peso] [float] NULL,
	[tamaño] [float] NULL,
	[diagnostico] [varchar](600) NULL,
	[alimentacion] [varchar](600) NULL,
	[tratamiento] [varchar](600) NULL,
	[dosis] [varchar](600) NULL,
	[fecha] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[idexpediente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[historialvacunas]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[historialvacunas](
	[idhistoria] [int] IDENTITY(1,1) NOT NULL,
	[idexpediente] [int] NULL,
	[idvacuna] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idhistoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pacientes]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pacientes](
	[idpaciente] [int] IDENTITY(1,1) NOT NULL,
	[idpropietario] [int] NULL,
	[nombre] [varchar](200) NULL,
	[fechadenacimiento] [date] NULL,
	[idraza] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idpaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[procedimientos]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[procedimientos](
	[idprocedimiento] [int] IDENTITY(1,1) NOT NULL,
	[tipoprocedimiento] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idprocedimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[procedimientosaplicados]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[procedimientosaplicados](
	[idprocedimientoaplicado] [int] IDENTITY(1,1) NOT NULL,
	[idprocedimiento] [int] NULL,
	[idexpediente] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idprocedimientoaplicado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[propietarios]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[propietarios](
	[idpropietario] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](200) NULL,
	[telefono] [varchar](9) NULL,
	[direccion] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idpropietario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[razas]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[razas](
	[idraza] [int] IDENTITY(1,1) NOT NULL,
	[idanimal] [int] NULL,
	[raza] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idraza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[vacunas]    Script Date: 21/11/2015 7:27:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[vacunas](
	[idvacuna] [int] IDENTITY(1,1) NOT NULL,
	[tipodevacuna] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[idvacuna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[historialvacunas]  WITH CHECK ADD FOREIGN KEY([idexpediente])
REFERENCES [dbo].[expediente] ([idexpediente])
GO
ALTER TABLE [dbo].[historialvacunas]  WITH CHECK ADD FOREIGN KEY([idvacuna])
REFERENCES [dbo].[vacunas] ([idvacuna])
GO
ALTER TABLE [dbo].[pacientes]  WITH CHECK ADD FOREIGN KEY([idpropietario])
REFERENCES [dbo].[propietarios] ([idpropietario])
GO
ALTER TABLE [dbo].[pacientes]  WITH CHECK ADD FOREIGN KEY([idraza])
REFERENCES [dbo].[razas] ([idraza])
GO
ALTER TABLE [dbo].[procedimientosaplicados]  WITH CHECK ADD FOREIGN KEY([idexpediente])
REFERENCES [dbo].[expediente] ([idexpediente])
GO
ALTER TABLE [dbo].[procedimientosaplicados]  WITH CHECK ADD FOREIGN KEY([idprocedimiento])
REFERENCES [dbo].[procedimientos] ([idprocedimiento])
GO
ALTER TABLE [dbo].[razas]  WITH CHECK ADD FOREIGN KEY([idanimal])
REFERENCES [dbo].[animales] ([idanimal])
GO
USE [master]
GO
ALTER DATABASE [clinica] SET  READ_WRITE 
GO
