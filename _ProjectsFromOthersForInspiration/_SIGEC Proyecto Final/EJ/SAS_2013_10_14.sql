USE [master]
GO
/****** Object:  Database [SAS]    Script Date: 14/10/13 8:44:56 a. m. ******/
CREATE DATABASE [SAS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SAS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SAS.mdf' , SIZE = 6208KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SAS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\SAS_log.ldf' , SIZE = 1344KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SAS] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SAS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SAS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SAS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SAS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SAS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SAS] SET ARITHABORT OFF 
GO
ALTER DATABASE [SAS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SAS] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SAS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SAS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SAS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SAS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SAS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SAS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SAS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SAS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SAS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SAS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SAS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SAS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SAS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SAS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SAS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SAS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SAS] SET RECOVERY FULL 
GO
ALTER DATABASE [SAS] SET  MULTI_USER 
GO
ALTER DATABASE [SAS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SAS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SAS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SAS] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [SAS]
GO
/****** Object:  Table [dbo].[Action]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Action](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NULL,
	[controllerID] [int] NOT NULL,
	[isView] [bit] NOT NULL,
	[displayName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Advertisement]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Advertisement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Advertisement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Audit]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Audit](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditTypeID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[planningResponsible] [int] NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NOT NULL,
	[objetive] [varchar](max) NOT NULL,
	[scope] [varchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[comments] [varchar](max) NULL,
	[companyID] [int] NOT NULL,
	[stageID] [int] NOT NULL,
 CONSTRAINT [PK_Audit] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditAuditorRole]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditAuditorRole](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuditAuditorType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditAuditors]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditAuditors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditID] [int] NOT NULL,
	[auditor] [int] NULL,
	[auditAuditorRoleID] [int] NOT NULL,
 CONSTRAINT [PK_AuditAuditors_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[auditID] ASC,
	[auditAuditorRoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditDocuments]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditDocuments](
	[auditID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_AuditDocuments] PRIMARY KEY CLUSTERED 
(
	[auditID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditMeeting]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditMeeting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditID] [int] NOT NULL,
	[isOpening] [bit] NULL,
 CONSTRAINT [PK_AuditMeeting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditMeetingParticipants]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditMeetingParticipants](
	[ID] [int] NOT NULL,
	[auditMeetingID] [int] NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_AuditMeetingParticipants] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditPlanAuditors]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditPlanAuditors](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditor] [int] NOT NULL,
	[auditPlansID] [int] NOT NULL,
 CONSTRAINT [PK_AuditPlanAuditors] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditPlanResponsibles]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditPlanResponsibles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[responsible] [int] NOT NULL,
	[auditPlanID] [int] NOT NULL,
 CONSTRAINT [PK_AuditPlanResponsibles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditPlans]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditPlans](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[responsible] [int] NOT NULL,
	[place] [varchar](100) NOT NULL,
	[fromDate] [datetime] NOT NULL,
	[toDate] [datetime] NOT NULL,
	[isProcess] [bit] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[departmentID] [int] NOT NULL,
	[companyID] [int] NOT NULL,
	[processID] [int] NOT NULL,
 CONSTRAINT [PK_AuditPlans] PRIMARY KEY CLUSTERED 
(
	[ruleID] ASC,
	[processTypeID] ASC,
	[ID] ASC,
	[processID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditProcesses]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AuditProcesses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[auditID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
	[date] [datetime] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
 CONSTRAINT [PK_AuditProcesses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[auditID] ASC,
	[processID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AuditStage]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditStage](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AuditStage] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AuditType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AuditType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_AuditType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Category]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[status] [bit] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Company]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[companyText] [varchar](max) NOT NULL,
	[description] [varchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[email] [nvarchar](100) NOT NULL,
	[logo] [nvarchar](200) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CompanyRules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyRules](
	[companyID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
 CONSTRAINT [PK_CompanyRules] PRIMARY KEY CLUSTERED 
(
	[companyID] ASC,
	[ruleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Controller]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Controller](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [nvarchar](50) NULL,
	[displayName] [varchar](50) NULL,
 CONSTRAINT [PK_Controller] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Dashboard]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dashboard](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
 CONSTRAINT [PK_Dashboard] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DashboardItems]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DashboardItems](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dashboardID] [int] NOT NULL,
	[expanded] [bit] NULL,
	[numOrder] [int] NULL,
 CONSTRAINT [PK_DashboardItems_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DeashboardItem]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeashboardItem](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varbinary](50) NOT NULL,
	[actionID] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_DeashboardItem] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[status] [bit] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Document]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Document](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[documentParentID] [int] NULL,
	[documentTypeID] [int] NOT NULL,
	[EDT] [float] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[documentText] [varchar](max) NOT NULL,
	[url] [nvarchar](150) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[version] [int] NOT NULL,
	[companyID] [int] NOT NULL,
	[statusID] [int] NULL,
	[responsible] [int] NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DocumentRules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentRules](
	[documentID] [int] NOT NULL,
	[ruleID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocumentStatus]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[responsible] [int] NOT NULL,
	[documentID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
	[createDate] [datetime] NOT NULL,
 CONSTRAINT [PK_DocumentStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DocumentType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[DocumentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_DocumentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Entity]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Entity](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[address] [varchar](60) NOT NULL,
	[phone] [varchar](30) NOT NULL,
	[entityTypeID] [int] NOT NULL,
	[status] [bit] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Entity] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[EntityType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EntityType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_EntityType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[FieldType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FieldType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dataType] [varchar](50) NOT NULL,
	[htmlTag] [varchar](50) NOT NULL,
	[minLength] [int] NULL,
	[maxLength] [int] NULL,
	[multiOptions] [bit] NULL,
 CONSTRAINT [PK_FieldType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Form]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Form](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[version] [int] NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK_Form_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormField]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormField](
	[formID] [int] NOT NULL,
	[question] [varchar](200) NOT NULL,
	[variableShortcut] [varchar](50) NULL,
	[tooltip] [varchar](50) NULL,
	[noOrder] [int] NOT NULL,
	[fieldTypeID] [int] NOT NULL,
	[required] [bit] NULL,
	[requiredText] [varchar](100) NULL,
	[rangeFrom] [varchar](50) NULL,
	[rangeTo] [varchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[panel] [varchar](50) NULL,
	[validationMessage] [varchar](100) NULL,
 CONSTRAINT [PK_FormField] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormFieldOption]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormFieldOption](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[formFieldID] [int] NOT NULL,
	[value] [varchar](200) NOT NULL,
	[label] [varchar](50) NOT NULL,
	[defaultValue] [bit] NULL,
	[isOtherOption] [bit] NULL,
 CONSTRAINT [PK_FormFieldOption] PRIMARY KEY CLUSTERED 
(
	[formFieldID] ASC,
	[value] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FormRecords]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FormRecords](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[formFieldID] [int] NOT NULL,
	[value] [varchar](max) NOT NULL,
 CONSTRAINT [PK_FormRecords] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Glossary]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Glossary](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[term] [nvarchar](100) NOT NULL,
	[definition] [nvarchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Glossary] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GlossaryRules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GlossaryRules](
	[glossaryID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
 CONSTRAINT [PK_GlossaryRules] PRIMARY KEY CLUSTERED 
(
	[glossaryID] ASC,
	[ruleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HistDocument]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistDocument](
	[documentID] [int] NOT NULL,
	[documentParentID] [int] NULL,
	[documentTypeID] [int] NOT NULL,
	[EDT] [float] NOT NULL,
	[title] [varchar](50) NOT NULL,
	[description] [nvarchar](max) NULL,
	[documentText] [nvarchar](max) NOT NULL,
	[url] [nvarchar](150) NOT NULL,
	[dateAdded] [datetime] NULL,
	[createUser] [int] NULL,
	[version] [int] NOT NULL,
	[companyID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[changeReason] [nvarchar](100) NOT NULL,
	[responsible] [int] NOT NULL,
 CONSTRAINT [PK_HistDocument_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistForm]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistForm](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FormID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dateAdded] [datetime] NULL,
	[version] [int] NOT NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[changeReason] [varchar](max) NOT NULL,
	[statusID] [int] NOT NULL,
 CONSTRAINT [PK_HIstForm] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistInstructionWorks]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistInstructionWorks](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[instructionWorkID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[workID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[responsible] [int] NULL,
	[statusID] [int] NOT NULL,
	[departmentID] [int] NOT NULL,
	[dateAdded] [datetime] NULL,
	[changeReason] [varchar](max) NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_HistInstructionWorks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[instructionWorkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistPlan]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistPlan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[planID] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[responsible] [int] NOT NULL,
	[dateAdded] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
	[processID] [int] NOT NULL,
	[version] [int] NOT NULL,
	[changeReason] [varchar](max) NOT NULL,
 CONSTRAINT [PK_HistPlan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistPoll]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistPoll](
	[pollID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[dateAdded] [datetime] NULL,
	[createUser] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[companyID] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_HistPoll] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistProcedure]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistProcedure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[procedureID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
	[target] [varchar](max) NOT NULL,
	[procedureScope] [varchar](max) NOT NULL,
	[dateAdd] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[statusID] [int] NOT NULL,
	[changeReason] [varchar](max) NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_HistProcedure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistProcess]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistProcess](
	[processID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [varchar](max) NULL,
	[statusID] [int] NOT NULL,
	[target] [varchar](max) NOT NULL,
	[entries] [varchar](max) NOT NULL,
	[activities] [varchar](max) NOT NULL,
	[outputs] [varchar](max) NOT NULL,
	[customerRequirements] [varchar](max) NOT NULL,
	[controlMeasures] [varchar](max) NOT NULL,
	[outputRequirements] [varchar](max) NULL,
	[dateAdded] [datetime] NULL,
	[createUser] [int] NULL,
	[changeReason] [varchar](max) NULL,
	[companyID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_HistProcess] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistRules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HistRules](
	[ruleID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
	[version] [int] NOT NULL,
	[description] [varchar](max) NOT NULL,
	[userAdd] [varchar](max) NOT NULL,
	[dateAdded] [date] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL,
 CONSTRAINT [PK_SgcHistNormas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Indicator]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Indicator](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[status] [varchar](20) NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[target] [varchar](max) NULL,
	[dataSourceMeasure] [varchar](max) NULL,
	[measureUnit] [varchar](50) NULL,
	[periodID] [int] NULL,
	[responsibleOfGenerate] [int] NULL,
	[responsableMonitor] [int] NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[processTypeID] [int] NOT NULL,
	[formula] [varchar](max) NULL,
	[lowerLimit] [decimal](15, 2) NULL,
	[companyID] [int] NOT NULL,
	[goal] [decimal](15, 2) NULL,
	[upperLimit] [decimal](15, 2) NULL,
	[frequency] [int] NULL,
	[version] [int] NULL,
 CONSTRAINT [PK_Indicator_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IndicatorVariables]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndicatorVariables](
	[indicatorID] [int] NOT NULL,
	[formFieldID] [int] NOT NULL,
 CONSTRAINT [PK_IndicatorVariables] PRIMARY KEY CLUSTERED 
(
	[indicatorID] ASC,
	[formFieldID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Infrastructure]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Infrastructure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[status] [varchar](20) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Infrastructure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InstructionWorks]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InstructionWorks](
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[responsible] [int] NOT NULL,
	[statusID] [int] NOT NULL,
	[departmentID] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_InstructionWorks] PRIMARY KEY CLUSTERED 
(
	[ruleID] ASC,
	[processID] ASC,
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Menu]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[noOrder] [int] NOT NULL,
	[createUser] [int] NOT NULL,
	[companyID] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ObjectiveResources]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ObjectiveResources](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[infrastructure] [varchar](max) NOT NULL,
	[humans] [varchar](max) NOT NULL,
	[objectiveID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_ObjectiveResources] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Option]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Option](
	[ID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[noOrder] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Option] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Period]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Period](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[interval] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Periodo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Plan]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Plan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[responsible] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
	[processID] [int] NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_Plan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PlanObjectives]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PlanObjectives](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[endDate] [datetime] NOT NULL,
	[responsible] [int] NOT NULL,
	[planID] [int] NOT NULL,
	[actions] [varchar](max) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_PlanObjectives] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Poll]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Poll](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ruleID] [int] NOT NULL,
	[code] [varchar](50) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NOT NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Poll] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Position]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Position](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[companyID] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_Position] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Procedure]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Procedure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
	[target] [varchar](max) NOT NULL,
	[procedureScope] [varchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[name] [nvarchar](50) NOT NULL,
	[companyID] [int] NOT NULL,
	[statusID] [int] NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_Procedure] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProcedureActivities]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProcedureActivities](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[procedureID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
	[activity] [varchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_ProcedureActivities] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProcedureAnnexes]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureAnnexes](
	[procedureID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_ProcedureDocuments] PRIMARY KEY CLUSTERED 
(
	[procedureID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcedureGlossaries]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureGlossaries](
	[procedureID] [int] NOT NULL,
	[glossaryID] [int] NOT NULL,
 CONSTRAINT [PK_ProcedureGlossaries] PRIMARY KEY CLUSTERED 
(
	[procedureID] ASC,
	[glossaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcedureNormatives]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureNormatives](
	[procedureID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_ProcedureNormatives] PRIMARY KEY CLUSTERED 
(
	[procedureID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcedureReferences]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcedureReferences](
	[procedureID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_ProcedureReferences] PRIMARY KEY CLUSTERED 
(
	[procedureID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Process]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Process](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ruleID] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [varchar](max) NULL,
	[statusID] [int] NOT NULL,
	[target] [varchar](max) NOT NULL,
	[entries] [varchar](max) NOT NULL,
	[activities] [varchar](max) NOT NULL,
	[outputs] [varchar](max) NOT NULL,
	[customerRequirements] [varchar](max) NOT NULL,
	[controlMeasures] [varchar](max) NOT NULL,
	[outputRequirements] [varchar](max) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[companyID] [int] NOT NULL,
	[version] [int] NOT NULL,
 CONSTRAINT [PK_Proceso] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProcessDocuments]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessDocuments](
	[processID] [int] NOT NULL,
	[documentID] [int] NULL,
	[text] [nvarchar](50) NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ISORequirement] [bit] NULL,
 CONSTRAINT [PK_ProcessDocuments_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcessEntities]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessEntities](
	[processID] [int] NOT NULL,
	[entityID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessEntities] PRIMARY KEY CLUSTERED 
(
	[processID] ASC,
	[entityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcessRequirements]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessRequirements](
	[processID] [int] NOT NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessRequirements] PRIMARY KEY CLUSTERED 
(
	[processID] ASC,
	[documentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcessResources]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessResources](
	[subcategoryID] [int] NOT NULL,
	[processID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessResources_1] PRIMARY KEY CLUSTERED 
(
	[subcategoryID] ASC,
	[processID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcessRules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessRules](
	[processID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
 CONSTRAINT [PK_ProcessRules] PRIMARY KEY CLUSTERED 
(
	[processID] ASC,
	[ruleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProcessType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProcessType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[companyID] [int] NOT NULL,
	[description] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProcessType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Question]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Question](
	[ID] [int] NOT NULL,
	[pollID] [int] NOT NULL,
	[noOrder] [int] NOT NULL,
	[name] [varchar](100) NOT NULL,
	[description] [varchar](max) NULL,
	[questionTypeID] [int] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Question] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[QuestionType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[QuestionType](
	[ID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_QuestionType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RolesActions]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesActions](
	[RoleID] [int] NOT NULL,
	[ActionID] [int] NOT NULL,
 CONSTRAINT [PK_RolesActions] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[ActionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesDepartments]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesDepartments](
	[roleID] [int] NOT NULL,
	[departmentID] [int] NOT NULL,
 CONSTRAINT [PK_RolesDepartments] PRIMARY KEY CLUSTERED 
(
	[roleID] ASC,
	[departmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RolesStatus]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesStatus](
	[statusID] [int] NOT NULL,
	[roleID] [int] NOT NULL,
 CONSTRAINT [PK_RolesStatus] PRIMARY KEY CLUSTERED 
(
	[statusID] ASC,
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rules]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Rules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[status] [bit] NOT NULL,
	[code] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[documentID] [int] NOT NULL,
 CONSTRAINT [PK_Rules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RuleTypeDocuments]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RuleTypeDocuments](
	[ruleID] [int] NOT NULL,
	[documentTypeID] [int] NOT NULL,
 CONSTRAINT [PK_RuleTypeDocuments] PRIMARY KEY CLUSTERED 
(
	[ruleID] ASC,
	[documentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Status]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[companyID] [int] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_SStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subcategory]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Subcategory](
	[categoryID] [int] NOT NULL,
	[ID] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[status] [bit] NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
 CONSTRAINT [PK_Subcategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SubMenu]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SubMenu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[menuID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[viewID] [int] NOT NULL,
	[noOrder] [int] NULL,
 CONSTRAINT [PK_SubMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Task]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Task](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[howTo] [varchar](max) NOT NULL,
	[whyDo] [varchar](max) NOT NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[workID] [int] NOT NULL,
	[ruleID] [int] NOT NULL,
	[processID] [int] NOT NULL,
 CONSTRAINT [PK_Task] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Template]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Template](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[actionID] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[companyID] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemplateFields]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TemplateFields](
	[templateID] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[displayName] [varchar](50) NOT NULL,
	[isDefault] [bit] NOT NULL,
	[createUser] [int] NOT NULL,
	[helpText] [varchar](50) NOT NULL,
	[templateFieldTypeID] [int] NOT NULL,
	[noOrder] [int] NULL,
 CONSTRAINT [PK_TemplateFields] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TemplateFieldType]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TemplateFieldType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_TemplateFieldType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](30) NOT NULL,
	[status] [int] NOT NULL,
	[username] [varchar](50) NOT NULL,
	[password] [varchar](64) NOT NULL,
	[activeKey] [varchar](64) NOT NULL,
	[lastVisitAt] [datetime] NULL,
	[superUser] [bit] NOT NULL,
	[departmentID] [int] NULL,
	[companyID] [int] NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[positionID] [int] NULL,
	[imageUrl] [varchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserIndexColums]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserIndexColums](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[config] [varchar](max) NOT NULL,
	[userID] [int] NULL,
 CONSTRAINT [PK_UserIndexColums] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTask]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserTask](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[parentTaskID] [int] NULL,
	[name] [varchar](50) NOT NULL,
	[description] [varchar](max) NULL,
	[ruleID] [int] NOT NULL,
	[fromDate] [datetime] NULL,
	[toDate] [datetime] NULL,
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[createUser] [int] NULL,
	[statusID] [int] NOT NULL,
	[companyID] [int] NOT NULL,
	[responsible] [int] NOT NULL,
 CONSTRAINT [PK_UserTask] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[View]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[View](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[actionID] [int] NOT NULL,
	[description] [varchar](max) NULL,
 CONSTRAINT [PK_View] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Webpages_Membership]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webpages_Membership](
	[UserID] [int] NOT NULL,
	[CreateDate] [datetime] NULL,
	[ConfirmationToken] [nvarchar](128) NULL,
	[IsConfirmed] [bit] NULL,
	[LastPasswordFailureDate] [datetime] NULL,
	[PasswordFailuresSinceLastSuccess] [int] NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordChangedDate] [datetime] NULL,
	[PasswordSalt] [nvarchar](128) NOT NULL,
	[PasswordVerificationToken] [nvarchar](128) NULL,
	[PasswordVerificationTokenExpirationDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Webpages_OAuthMembership]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webpages_OAuthMembership](
	[Provider] [nvarchar](30) NOT NULL,
	[ProviderUserID] [nvarchar](100) NOT NULL,
	[UserID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Provider] ASC,
	[ProviderUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Webpages_Roles]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[Webpages_Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](256) NOT NULL,
	[RoleDescription] [varchar](max) NULL,
 CONSTRAINT [PK_Webpages__8AFACE1AD39DFB30] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Webpages_UsersInRoles]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Webpages_UsersInRoles](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [dbo].[vs_glossary]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vs_glossary]
AS
SELECT        ID, term, definition, companyID, STUFF
                             ((SELECT        ',' + r.code
                                 FROM            GlossaryRules gr INNER JOIN
                                                          Rules r ON gr.ruleID = r.ID
                                 WHERE        gr.glossaryID = GG.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS Normas
FROM            Glossary GG

GO
/****** Object:  View [dbo].[vw_BaseLegal]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_BaseLegal]
AS
SELECT        title, description, CASE WHEN url != '' THEN concat('<a href=\"/SAS/Uploads/', url, '?Length=0\" download=\"', url, '\">', replace(url, concat(ID, '$$'), ''), '</a>') 
                         ELSE '' END AS [document], url, ID
FROM            dbo.[Document]
WHERE        (documentTypeID = 1)

GO
/****** Object:  View [dbo].[vw_Indcicator]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_Indcicator]
as
select 
	I.ID,
	I.name,
	isnull(D.name,'N/A') as department,
	concat('V ',version,'.0') as version,
	R.name as [rule],
	I.updateDate
from 
	Indicator I
left join [User] U on I.createUser = U.id
left join Department D on u.departmentID = D.id
inner join Rules R on I.ruleID = R.ID
GO
/****** Object:  View [dbo].[vw_InstructionWorks]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vw_InstructionWorks]
as
select  
	concat(R.code,' - ',R.name) as [Rule],
	P.name as process,
	U.name as username,
	d.name as department,
	IW.name,
	IW.ID
from
	[dbo].[InstructionWorks] IW
INNER JOIN RULES R ON IW.RULEID=R.ID
INNER JOIN [User] U ON IW.responsible=U.ID
INNER JOIN Department D ON IW.departmentID=D.ID
INNER JOIN Process P ON IW.processID=P.ID
GO
/****** Object:  View [dbo].[vw_manual]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_manual]
as
SELECT        ID, title, CONCAT('V.', version, '.0') AS Version, companyID, STUFF
                             ((SELECT        ',' + r.code
                                 FROM            DocumentRules gr INNER JOIN
                                                          Rules r ON gr.ruleID = r.ID
                                 WHERE        gr.documentID = GG.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS Normas
FROM            Document GG
WHERE        GG.documentTypeID = 8 and GG.documentParentID is null
GO
/****** Object:  View [dbo].[vw_objetives]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [dbo].[vw_objetives]
as
SELECT        GG.ID, title, CONCAT('V.', version, '.0') AS Version, GG.companyID, STUFF
                             ((SELECT        ',' + r.code
                                 FROM            DocumentRules gr INNER JOIN
                                                          Rules r ON gr.ruleID = r.ID
                                 WHERE        gr.documentID = GG.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS Normas, S.name as Status
FROM            Document GG INNER JOIN
                         Status s ON gg.statusID = s.ID
WHERE        GG.documentTypeID = 9
GO
/****** Object:  View [dbo].[vw_Plan]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Plan]
AS
SELECT        P.ID, P.code, P.name AS planName, PT.name AS responsible, P.updateDate
FROM            dbo.[Plan] AS P INNER JOIN
                         dbo.Position AS PT ON P.responsible = PT.ID

GO
/****** Object:  View [dbo].[vw_policies]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_policies]
AS
SELECT        ID, title, CONCAT('V.', version, '.0') AS Version, companyID, STUFF
                             ((SELECT        ',' + r.code
                                 FROM            DocumentRules gr INNER JOIN
                                                          Rules r ON gr.ruleID = r.ID
                                 WHERE        gr.documentID = GG.ID FOR XML PATH(''), TYPE ).value('.', 'NVARCHAR(MAX)'), 1, 1, '') AS Normas
FROM            Document GG
WHERE        GG.documentTypeID = 6 and GG.documentParentID is null
GO
/****** Object:  View [dbo].[vw_Procedure]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_Procedure]
AS
SELECT        P.name, U.name AS username, P.ID
FROM            dbo.[Procedure] AS P INNER JOIN
                         dbo.[User] AS U ON P.createUser = U.ID

GO
/****** Object:  View [dbo].[vw_process]    Script Date: 14/10/13 8:44:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vw_process]
AS
SELECT        P.ID, P.name, U.name AS createBy, ISNULL(D.name, 'N/A') AS department
FROM            dbo.Process AS P LEFT OUTER JOIN
                         dbo.[User] AS U ON P.createUser = U.ID LEFT OUTER JOIN
                         dbo.Department AS D ON U.departmentID = D.ID

GO
SET IDENTITY_INSERT [dbo].[Action] ON 

INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (98, N'Register', NULL, 18, 0, N'Registrar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (99, N'Details', NULL, 18, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (100, N'Disassociate', NULL, 18, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (101, N'Manage', NULL, 18, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (102, N'Index', NULL, 19, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (103, N'Create', NULL, 19, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (104, N'Edit', NULL, 19, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (105, N'Delete', NULL, 19, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (106, N'Index', NULL, 20, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (107, N'Details', NULL, 20, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (108, N'Create', NULL, 20, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (109, N'Edit', NULL, 20, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (110, N'Delete', NULL, 20, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (111, N'Index', NULL, 21, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (112, N'Details', NULL, 21, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (113, N'Create', NULL, 21, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (114, N'Edit', NULL, 21, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (115, N'Delete', NULL, 21, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (116, N'Index', NULL, 22, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (117, N'Details', NULL, 22, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (118, N'Create', NULL, 22, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (119, N'Edit', NULL, 22, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (120, N'Delete', NULL, 22, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (121, N'Index', NULL, 23, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (122, N'Details', NULL, 23, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (123, N'Create', NULL, 23, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (124, N'Edit', NULL, 23, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (125, N'Delete', NULL, 23, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (126, N'Index', NULL, 24, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (127, N'Details', NULL, 24, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (128, N'Create', NULL, 24, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (129, N'Edit', NULL, 24, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (130, N'Delete', NULL, 24, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (131, N'Index', NULL, 25, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (132, N'About', NULL, 25, 0, N'Acerca De')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (133, N'Contact', NULL, 25, 0, N'Contactar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (134, N'Index', NULL, 26, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (135, N'Create', NULL, 26, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (136, N'Edit', NULL, 26, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (137, N'CreateChild', NULL, 26, 0, N'Crear Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (138, N'EditChild', NULL, 26, 0, N'Editar Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (139, N'DeleteChild', NULL, 26, 0, N'Eliminar Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (140, N'Index', NULL, 27, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (141, N'Create', NULL, 27, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (142, N'Edit', NULL, 28, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (143, N'Index', NULL, 29, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (144, N'Create', NULL, 29, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (145, N'Edit', NULL, 29, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (146, N'CreateChild', NULL, 29, 0, N'Crear Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (147, N'EditChild', NULL, 29, 0, N'Editar Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (148, N'DeleteChild', NULL, 29, 0, N'Eliminar Sub Documento')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (149, N'Index', NULL, 30, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (150, N'Edit', NULL, 30, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (151, N'Index', NULL, 31, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (152, N'Details', NULL, 31, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (153, N'Create', NULL, 31, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (154, N'Edit', NULL, 31, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (155, N'Delete', NULL, 31, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (156, N'Index', NULL, 32, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (157, N'Details', NULL, 32, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (158, N'Create', NULL, 32, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (159, N'Edit', NULL, 32, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (160, N'Delete', NULL, 32, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (161, N'Index', NULL, 33, 0, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (162, N'Details', NULL, 33, 0, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (163, N'Create', NULL, 33, 0, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (164, N'Edit', NULL, 33, 0, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (165, N'Delete', NULL, 33, 0, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (166, N'Index', NULL, 34, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (167, N'Create', NULL, 34, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (168, N'Edit', NULL, 34, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (169, N'Delete', NULL, 34, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (170, N'Index', NULL, 35, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (171, N'Details', NULL, 35, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (172, N'Create', NULL, 35, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (173, N'CreateChildTask', NULL, 35, 1, N'Crear Tarea')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (174, N'Edit', NULL, 35, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (175, N'Delete', NULL, 35, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (176, N'CreateChild', NULL, 34, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (177, N'EditChild', NULL, 34, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (178, N'DeleteChild', NULL, 34, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (179, N'admin', NULL, 34, 1, N'Administrar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (180, N'Edit', NULL, 27, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (181, N'Index', NULL, 36, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (182, N'Details', NULL, 36, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (183, N'Create', NULL, 36, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (184, N'Edit', NULL, 36, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (185, N'Delete', NULL, 36, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (186, N'Index', NULL, 37, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (187, N'Details', NULL, 37, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (188, N'Create', NULL, 37, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (189, N'Edit', NULL, 37, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (190, N'Delete', NULL, 37, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (191, N'Create', NULL, 38, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (192, N'Edit', NULL, 38, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (193, N'Delete', NULL, 38, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (194, N'Index', NULL, 39, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (195, N'Details', NULL, 39, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (196, N'Create', NULL, 39, 1, N'Crear')
GO
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (197, N'Edit', NULL, 39, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (198, N'Delete', NULL, 39, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (199, N'Index', NULL, 40, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (200, N'Details', NULL, 40, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (201, N'Create', NULL, 40, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (202, N'Edit', NULL, 40, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (203, N'Delete', NULL, 40, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (204, N'AssociatedDocuments', NULL, 37, 1, N'Agregar Documentos Asociados')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (205, N'DeleteAssociatedDocuments', NULL, 37, 1, N'Eliminar Documentos Asociados')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (206, N'Delete', NULL, 26, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (207, N'Details', NULL, 26, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (208, N'Delete', NULL, 27, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (209, N'Delete', NULL, 29, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (210, N'Index', NULL, 41, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (211, N'Details', NULL, 41, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (212, N'Create', NULL, 41, 1, N'Crear')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (213, N'Edit', NULL, 41, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (214, N'Delete', NULL, 41, 1, N'Eliminar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (215, N'EditAccount', NULL, 18, 1, N'Editar Cuenta')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (1215, N'Details', NULL, 27, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (1216, N'Index', NULL, 42, 1, N'Pagina Principal')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (1217, N'Details', NULL, 42, 1, N'Ver Detalles')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (1218, N'Edit', NULL, 42, 1, N'Editar')
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (1219, N'EditAssociatedDocument', NULL, 37, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2219, N'Index', NULL, 43, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2220, N'Details', NULL, 43, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2221, N'Create', NULL, 43, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2222, N'Edit', NULL, 43, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2223, N'Delete', NULL, 43, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2224, N'Index', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2225, N'Details', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2226, N'Create', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2227, N'Edit', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2228, N'Delete', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2229, N'AddField', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2230, N'EditField', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2231, N'DeleteField', NULL, 44, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2232, N'Index', NULL, 45, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2233, N'Details', NULL, 45, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2234, N'Create', NULL, 45, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2235, N'Edit', NULL, 45, 1, NULL)
INSERT [dbo].[Action] ([ID], [name], [description], [controllerID], [isView], [displayName]) VALUES (2236, N'Delete', NULL, 45, 1, NULL)
SET IDENTITY_INSERT [dbo].[Action] OFF
SET IDENTITY_INSERT [dbo].[Advertisement] ON 

INSERT [dbo].[Advertisement] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (1, N'Reunión (Hotel Lina)', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor est diam, sit amet suscipit massa condimentum ac. Nunc et elementum eros, at viverra est.', CAST(0x0000A21500C64BDD AS DateTime), CAST(0x0000A21500C64BDD AS DateTime), 1, 2)
INSERT [dbo].[Advertisement] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (2, N'Auditoria (Cemento Titán)', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor est diam, sit amet suscipit massa condimentum ac. Nunc et elementum eros, at viverra est.', CAST(0x0000A21500C65217 AS DateTime), CAST(0x0000A21500C65217 AS DateTime), 1, 2)
INSERT [dbo].[Advertisement] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (3, N'Reunión (Interna)', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed tempor est diam, sit amet suscipit massa condimentum ac. Nunc et elementum eros, at viverra est.', CAST(0x0000A21500C65393 AS DateTime), CAST(0x0000A21500C65393 AS DateTime), 1, 2)
SET IDENTITY_INSERT [dbo].[Advertisement] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [name], [description], [status], [createDate], [updateDate], [createUser], [companyID]) VALUES (1, N'Humanos', N'Humanos', 1, CAST(0x0000A2230116D459 AS DateTime), CAST(0x0000A2230116D459 AS DateTime), NULL, 1)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([ID], [name], [companyText], [description], [status], [email], [logo]) VALUES (1, N'EIS', N':D', N'Excellent Integrity Solutions', 0, N'mail@eisdr.com', N'928b4a63-3fcf-4af8-b419-89e8e1119cad.png')
INSERT [dbo].[Company] ([ID], [name], [companyText], [description], [status], [email], [logo]) VALUES (4, N'Nombre Compañía', N'Slogan Compañía', N'Descripción Compañía', 0, N'emailcompania@comp.com', N'')
SET IDENTITY_INSERT [dbo].[Company] OFF
INSERT [dbo].[CompanyRules] ([companyID], [ruleID]) VALUES (1, 1)
INSERT [dbo].[CompanyRules] ([companyID], [ruleID]) VALUES (1, 2)
INSERT [dbo].[CompanyRules] ([companyID], [ruleID]) VALUES (4, 3)
SET IDENTITY_INSERT [dbo].[Controller] ON 

INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (18, N'AccountController', NULL, N'Cuentas de Usuario')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (19, N'BaseLegalController', NULL, N'Base Legal')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (20, N'CompanyController', NULL, N'Compañia')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (21, N'DepartmentController', NULL, N'Departamentos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (22, N'DocTypeController', NULL, N'Tipos de documentos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (23, N'DocumentController', NULL, N'Documentos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (24, N'GlossaryController', NULL, N'Glosario')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (25, N'HomeController', NULL, N'Pagina Principal')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (26, N'ManualController', NULL, N'Manuales')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (27, N'ObjectivesController', NULL, N'Objetivos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (28, N'PermissionsController', NULL, N'Permisos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (29, N'PoliciesController', NULL, N'Politicas')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (30, N'PurposeController', NULL, N'Proposito')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (31, N'RolesController', NULL, N'Roles')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (32, N'RulesController', NULL, N'Normas')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (33, N'StatusController', NULL, N'Estatus')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (34, N'MenuController', NULL, N'Menu')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (35, N'TaskController', NULL, N'Tareas')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (36, N'ClientsController', NULL, N'Clientes')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (37, N'ProcessController', NULL, N'Procesos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (38, N'InstructionTasksController', NULL, N'Tareas de Instrucciones')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (39, N'InstructionWorksController', NULL, N'Instrucciones de Trabajo')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (40, N'ProceduresController', NULL, N'Procedimientos')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (41, N'SubMenuController', NULL, N'Sub Menus')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (42, N'UsersController', NULL, N'Usuarios')
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (43, N'PlanController', NULL, NULL)
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (44, N'FormsController', NULL, NULL)
INSERT [dbo].[Controller] ([ID], [name], [description], [displayName]) VALUES (45, N'IndicatorController', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Controller] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([ID], [name], [description], [status], [createDate], [updateDate], [createUser], [companyID]) VALUES (1, N'Administración', N'Administración', 1, CAST(0x0000A21400EAF06C AS DateTime), CAST(0x0000A23F012037A1 AS DateTime), 10, 1)
INSERT [dbo].[Department] ([ID], [name], [description], [status], [createDate], [updateDate], [createUser], [companyID]) VALUES (2, N'Angel & Carlos QA', N'Angel & Carlos QA', 1, CAST(0x0000A23400F386B1 AS DateTime), CAST(0x0000A234010B5A2E AS DateTime), 10, 1)
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Document] ON 

INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3, NULL, 8, 1, N'Manual QA1-1', N'', N'', N'', CAST(0x0000A2140108ECEB AS DateTime), CAST(0x0000A252011093B1 AS DateTime), 2, 1, 1, NULL, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (4, NULL, 8, 2, N'Manual QA1-2', N'', N'', N'', CAST(0x0000A2140108F98C AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (5, NULL, 8, 3, N'Manual QA1-3', N'', N'', N'', CAST(0x0000A21401090127 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (6, NULL, 9, 0, N'ObjetivoQA1', NULL, N'ObjetivoQA1', N'', CAST(0x0000A214010A84E3 AS DateTime), CAST(0x0000A2460117B2DB AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (8, NULL, 6, 0, N'Politica Qa1', NULL, N'', N'', CAST(0x0000A214010B29B3 AS DateTime), CAST(0x0000A23F0121213C AS DateTime), 2, 2, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (9, 8, 6, 0, N'Politica Qa1-1', N'', N'', N'', CAST(0x0000A214010B6552 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (10, 8, 6, 0, N'Politica Qa1-2', N'', N'', N'', CAST(0x0000A214010B6B32 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (11, NULL, 2, 0, N'Mision QA', N'Mision QA', N'Brindar servicios de consultoría, asesoría y desarrollo de aplicaciones utilizando tecnología de punta, con asistencia empresarial personalizada, garantizando soluciones tecnológicas, a cargo de nuestro equipo de profesionales calificados y certificados, de la más alta calidad para satisfacer a nuestros clientes y accionistas.', N'', CAST(0x0000A214010D2788 AS DateTime), CAST(0x0000A24201233976 AS DateTime), 2, 6, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (12, NULL, 3, 0, N'Vision QA', N'Vision QA', N'Ser líderes en el mercado ofreciendo soluciones informáticas, sostenidos en una moderna tecnología, una constante innovación y en la solución de las necesidades de nuestros clientes. Ser líderes en el mercado ofreciendo soluciones informáticas, sostenidos en una moderna tecnología, una constante innovación y en la solución de las necesidades de nuestros clientes.', N'', CAST(0x0000A214010D3E23 AS DateTime), CAST(0x0000A242012349D1 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (13, NULL, 5, 0, N'Valores QA', N'Valores QA', N'Fiabilidad: Generamos confianza y certeza en todo momento, garantizando nuestros productos durante la vida útil de los mismos.

Disponibilidad: Estamos a disposición de nuestros clientes de manera continua e ininterrumpida.

Innovación: Búsqueda permanente de nuevas tecnologías para responder adecuadamente a las expectativas de nuestros clientes.

Efectividad: Damos solución definitiva a las necesidades de nuestros clientes, haciendo uso racional y responsable de su tiempo y dinero.

Calidad: Comprometidos con la excelencia', N'', CAST(0x0000A214010D572E AS DateTime), CAST(0x0000A242012391E0 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (14, NULL, 7, 0, N'Politicas QA1', N'Politicas QA1', N'Politicas QA1', N'', CAST(0x0000A214010D782E AS DateTime), CAST(0x0000A22E0107394C AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (15, NULL, 8, 0, N'Angel', N'', N'fdfdfdf', N'', CAST(0x0000A2180109A763 AS DateTime), CAST(0x0000A251008D517E AS DateTime), 2, 2, 1, NULL, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (17, 15, 8, 1, N'Cap 1', N'', N'', N'', CAST(0x0000A21A011D6F47 AS DateTime), CAST(0x0000A23500C2E68E AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (18, 15, 8, 2, N'Cap 2', N'', N'', N'', CAST(0x0000A21A011D7BD6 AS DateTime), CAST(0x0000A250012A25DE AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (20, 17, 8, 1, N'Cap 3', N'', N'', N'', CAST(0x0000A22D0116881D AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (21, 17, 8, 2, N'Cap 4', N'', N'', N'', CAST(0x0000A22D0116CF17 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (25, NULL, 9, 0, N'Angel QA1', N'', N'Angel QA', N'', CAST(0x0000A22E012824D9 AS DateTime), CAST(0x0000A25100A29152 AS DateTime), 2, 2, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1035, NULL, 6, 1, N'prueba', N'', N'', N'', CAST(0x0000A23000C06AFC AS DateTime), CAST(0x0000A23500C0CA5A AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1037, NULL, 6, 2, N'abcd', N'', N'sdfgf eg<br>', N'', CAST(0x0000A23000C3D2F0 AS DateTime), CAST(0x0000A23F00AFF5DA AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1041, NULL, 8, 0, N'Primer doc', N'', N'', N'', CAST(0x0000A23000C769EA AS DateTime), CAST(0x0000A23F012C07D6 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1045, 1035, 6, 1, N'A', N'', N'', N'', CAST(0x0000A23500C0C63F AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1046, 17, 8, 3, N'Cap 5', N'', N'', N'', CAST(0x0000A23500C2FFC4 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (1048, NULL, 8, 0, N'Ultima prueba', N'', N'Hola', N'', CAST(0x0000A2360098A6C4 AS DateTime), CAST(0x0000A23E00EE5929 AS DateTime), 10, 3, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2051, 1037, 6, 1, N'JAJAJA', N'', N'i will not die, lied too <span style="color:rgb(194,123,160);"><u style="color: rgb(194, 123, 160);"><i style="color: rgb(194, 123, 160);"><b style="color: rgb(194, 123, 160);">much</b></i></u></span><br>', N'', CAST(0x0000A23800954D14 AS DateTime), CAST(0x0000A23F012E5D7D AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2056, NULL, 1, 0, N'Primera Base legal', N'Primera Base legal', N'', N'2056$$campos req.txt', CAST(0x0000A23800EEEF6F AS DateTime), NULL, 10, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2065, 6, 2, 1, N'Vision QA', N'blablabla', N'', N'', CAST(0x0000A23B0104DC77 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2076, NULL, 6, 0, N'Beta', N'', N'Hola', N'', CAST(0x0000A23B013F0FDF AS DateTime), CAST(0x0000A23B013F4D5B AS DateTime), 2, 2, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2077, NULL, 6, 1, N'B', N'', N'lol', N'', CAST(0x0000A23B013F328D AS DateTime), CAST(0x0000A23F011A7C4C AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2078, NULL, 6, 2, N'C', N'', N'', N'', CAST(0x0000A23B013F3B90 AS DateTime), CAST(0x0000A23F012E3030 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2086, NULL, 9, 0, N'Do re mi fa sol la si do re', N'', N're do si la sol fa mi re do<br>', N'', CAST(0x0000A23E00FF09BD AS DateTime), CAST(0x0000A23E010AF0F8 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2095, 2077, 6, 1, N'Primer Doc', N'', N'', N'', CAST(0x0000A23F0111097B AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2096, NULL, 3, 1, N'dhdhghd', NULL, N'', N'', CAST(0x0000A23F01226813 AS DateTime), CAST(0x0000A23F01276D39 AS DateTime), 2, 0, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2106, NULL, 6, 0, N'Política Ambiental', N'', N'', N'', CAST(0x0000A24200C36870 AS DateTime), CAST(0x0000A24200C46B3C AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2107, 2106, 6, 1, N'Capítulo 1', N'', N'', N'', CAST(0x0000A24200C479CB AS DateTime), CAST(0x0000A24200C9CAC7 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2108, 2107, 6, 1, N'M1- Capitulo 1', N'', N'', N'', CAST(0x0000A24200C9B691 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2109, 2107, 6, 2, N'M1- Capitulo 2', N'', N'', N'', CAST(0x0000A24200C9DEB7 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2110, NULL, 4, 0, N'ISO 70000 Doc', N'', N'', N'', CAST(0x0000A24400A70145 AS DateTime), CAST(0x0000A24400A9B23D AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2111, 2110, 4, 1, N'Capitulo 1 - A', N'', N'', N'', CAST(0x0000A24400A7215D AS DateTime), CAST(0x0000A24400A8032B AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2112, 2110, 4, 2, N'Capitulo 2 - B', N'', N'', N'', CAST(0x0000A24400A732FC AS DateTime), CAST(0x0000A24400A93A14 AS DateTime), 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2113, 2110, 4, 3, N'Capitulo 3 - C', N'', N'', N'', CAST(0x0000A24400A743E5 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2114, 2110, 4, 4, N'Capitulo 4  - D', N'', N'', N'', CAST(0x0000A24400A7557F AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2115, 2110, 4, 5, N'Capitulo 5 - E', N'', N'', N'', CAST(0x0000A24400A7661C AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2116, 2110, 4, 6, N'Capitulo 6 - F', N'', N'', N'', CAST(0x0000A24400A78C0A AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2117, 2111, 4, 1, N'Punto 1 - A', N'', N'', N'', CAST(0x0000A24400A7B4B5 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2118, 2111, 4, 2, N'Punto 2 - B', N'', N'', N'', CAST(0x0000A24400A80000 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2119, 2111, 4, 3, N'Punto 3 - C', N'', N'', N'', CAST(0x0000A24400A80B49 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2120, 2112, 4, 1, N'Punto 1c - A', N'', N'', N'', CAST(0x0000A24400A8530E AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2121, 2112, 4, 2, N'Punto 2c - B', N'', N'', N'', CAST(0x0000A24400A869D5 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2122, 2112, 4, 3, N'Punto 3c - C', N'', N'', N'', CAST(0x0000A24400A8EFB0 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (2123, 2112, 4, 4, N'Punto 4c - D', N'', N'', N'', CAST(0x0000A24400A945E0 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3129, NULL, 1, 0, N'Manuel de Mantenimiento preventivo', N'Planta Caterpillar de 700 Kw.', N'', N'2124$$notes2.txt', CAST(0x0000A24D00CD8CB6 AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3130, 18, 8, 1, N'Sub Cap 1', N'', N'', N'', CAST(0x0000A250012A2ECA AS DateTime), NULL, 2, 1, 1, 1, 1)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3131, NULL, 8, 1, N'Pokedex', N'', N'<b>Lorem Ipsum</b> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus  PageMaker, el cual incluye versiones de Lorem Ipsum.', N'', CAST(0x0000A251011A7F3C AS DateTime), CAST(0x0000A251011D9610 AS DateTime), 2, 1, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3132, NULL, 8, 1, N'Ditto', N'', N'<b>Lorem Ipsum</b> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus  PageMaker, el cual incluye versiones de Lorem Ipsum.', N'', CAST(0x0000A251011C9865 AS DateTime), CAST(0x0000A251011E244A AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3133, 3132, 8, 1, N'Raichu', N'', N'<b>Lorem Ipsum</b> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus  PageMaker, el cual incluye versiones de Lorem Ipsum.', N'', CAST(0x0000A251011CD0C3 AS DateTime), CAST(0x0000A251011D032C AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3134, 3132, 8, 2, N'Evee', N'', N'', N'', CAST(0x0000A251011DEA9E AS DateTime), CAST(0x0000A251011E17A3 AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3135, 3134, 8, 1, N'Flareon', N'', N'<b>Lorem Ipsum</b> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus  PageMaker, el cual incluye versiones de Lorem Ipsum.', N'', CAST(0x0000A251011DF55C AS DateTime), CAST(0x0000A251011DFE7A AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3136, 3134, 8, 2, N'Jolteo', N'', N'<b>Lorem Ipsum</b> es simplemente el texto de relleno de las imprentas y archivos de texto. Lorem Ipsum ha sido el texto de relleno estándar de las industrias desde el año 1500, cuando un impresor (N. del T. persona que se dedica a la imprenta) desconocido usó una galería de textos y los mezcló de tal manera que logró hacer un libro de textos especimen. No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus  PageMaker, el cual incluye versiones de Lorem Ipsum.', N'', CAST(0x0000A251011E0D0E AS DateTime), CAST(0x0000A251011E1425 AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3137, NULL, 8, 1, N'Manual 1', N'', N'', N'', CAST(0x0000A25200B9DEF4 AS DateTime), CAST(0x0000A25200BCA863 AS DateTime), 2, 1, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3138, 3137, 8, 1, N'cqa 1.1', N'', N'', N'', CAST(0x0000A25200B9F27B AS DateTime), CAST(0x0000A25200BA2204 AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3139, 3138, 8, 1, N'cap 1.2', N'', N'', N'', CAST(0x0000A25200BA12F2 AS DateTime), CAST(0x0000A25200BA1F19 AS DateTime), NULL, 0, 1, NULL, NULL)
INSERT [dbo].[Document] ([ID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [createDate], [updateDate], [createUser], [version], [companyID], [statusID], [responsible]) VALUES (3140, 3, 8, 1, N'mmo', N'', N'', N'', CAST(0x0000A25200F3C52F AS DateTime), NULL, NULL, 0, 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Document] OFF
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (1037, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (2086, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (2077, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (3131, 1)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (8, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (3132, 1)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (1041, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (2078, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (2110, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (6, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (3137, 1)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (3, 1)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (1048, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (2106, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (15, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (25, 2)
INSERT [dbo].[DocumentRules] ([documentID], [ruleID]) VALUES (3, 2)
SET IDENTITY_INSERT [dbo].[DocumentType] ON 

INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (1, N'Base Legal', N'Base Legal', CAST(0x0000A2140100EB64 AS DateTime), CAST(0x0000A23F01206A3B AS DateTime), NULL)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (2, N'Mision', N'Mision', CAST(0x0000A2140100F936 AS DateTime), CAST(0x0000A2140119E4A1 AS DateTime), NULL)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (3, N'Vision', N'Vision', CAST(0x0000A21401010148 AS DateTime), CAST(0x0000A2140119E1BC AS DateTime), NULL)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (4, N'Norma', N'Norma', CAST(0x0000A21401011435 AS DateTime), NULL, 2)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (5, N'Valores', N'Valores', CAST(0x0000A21401011B24 AS DateTime), NULL, 2)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (6, N'Politica', N'Politica', CAST(0x0000A21401012723 AS DateTime), NULL, 2)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (7, N'Politicas', N'Politicas', CAST(0x0000A21401012CB0 AS DateTime), CAST(0x0000A2140119E84A AS DateTime), NULL)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (8, N'Manual', N'Manual', CAST(0x0000A2140107374B AS DateTime), CAST(0x0000A23F0120651B AS DateTime), NULL)
INSERT [dbo].[DocumentType] ([ID], [name], [description], [createDate], [updateDate], [createUser]) VALUES (9, N'Objetivo', N'Objetivo', CAST(0x0000A214010A7979 AS DateTime), CAST(0x0000A2140119DE96 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[DocumentType] OFF
SET IDENTITY_INSERT [dbo].[Entity] ON 

INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (1, N'Andrés Frías', N'en una casa', N'8099010011', 1, 0, CAST(0x0000A22000A47B27 AS DateTime), CAST(0x0000A2200100245B AS DateTime), 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (2, N'Jonmer Carpio', N'Tampoco se', N'8097876655', 2, 0, CAST(0x0000A22000A91ABC AS DateTime), CAST(0x0000A22000FF9C33 AS DateTime), 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (4, N'Angel QA', N'Angel QA', N'8098098099', 1, 0, CAST(0x0000A22E00B5B82B AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (5, N'Cliente Prueba', N'Direccion Prueba', N'8094554343', 1, 0, CAST(0x0000A22F01013493 AS DateTime), CAST(0x0000A23B00F694F1 AS DateTime), 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (9, N'Orange', N'Orange', N'8098098099', 1, 0, CAST(0x0000A23C00EF0915 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (10, N'Claro', N'Claro', N'0973498173', 1, 0, CAST(0x0000A23C00F25645 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (11, N'Viva', N'Viva', N'8961349817', 1, 0, CAST(0x0000A23C00F2622B AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (12, N'Aduana', N'Aduana', N'9173126391', 1, 0, CAST(0x0000A23C00F2795D AS DateTime), CAST(0x0000A23F011F3204 AS DateTime), 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (13, N'EIS', N'Otra vez', N'0127641239', 1, 0, CAST(0x0000A23C00F28A1A AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (14, N'Aries', N'Muu', N'0617698721', 1, 0, CAST(0x0000A23C00F2A17E AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (15, N'Butter', N'Butter', N'8217932563', 1, 0, CAST(0x0000A23C00F3169F AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (16, N'Despues de 10', N'Despues de 10', N'9865138712', 1, 0, CAST(0x0000A23C00F328DD AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (17, N'Mandy', N'Mandy', N'1763698173', 1, 0, CAST(0x0000A23C00F3C725 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (18, N'Rojo', N'Rojo', N'9813809712', 1, 0, CAST(0x0000A23D00E3874B AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (19, N'Azul', N'Azul', N'8170390130', 1, 0, CAST(0x0000A23D00E395CA AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (20, N'Verde', N'Verde', N'0913789139', 1, 0, CAST(0x0000A23D00E3A51C AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (21, N'Amarillo', N'Amarillo', N'2837489749', 1, 0, CAST(0x0000A23D00E3E485 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (22, N'Anillo', N'Anillo', N'1723901832', 1, 0, CAST(0x0000A23D00E4001C AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (23, N'Presidente', N'Presidente', N'1892312380', 1, 0, CAST(0x0000A23D00E41363 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (24, N'Hotel', N'Hotel', N'1823109832', 1, 0, CAST(0x0000A23D00F378A8 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (25, N'POkemon', N'pokemon', N'0937409183', 1, 0, CAST(0x0000A23D00F38C85 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Entity] ([ID], [name], [address], [phone], [entityTypeID], [status], [createDate], [updateDate], [companyID], [createUser]) VALUES (26, N'Nada', N'Nada', N'0918203810', 1, 0, CAST(0x0000A23D00F39D8E AS DateTime), NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Entity] OFF
SET IDENTITY_INSERT [dbo].[EntityType] ON 

INSERT [dbo].[EntityType] ([ID], [name], [description], [status]) VALUES (1, N'Cliente', N'Cliente', 1)
INSERT [dbo].[EntityType] ([ID], [name], [description], [status]) VALUES (2, N'Proveedor', N'Proveedor', 1)
SET IDENTITY_INSERT [dbo].[EntityType] OFF
SET IDENTITY_INSERT [dbo].[FieldType] ON 

INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (1, N'FieldType_Numeric', N'int', N'input', -2147483648, 2147483647, 0)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (2, N'FieldType_Email', N'string', N'input', 6, 100, 0)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (3, N'FieldType_SimpleText', N'string', N'textarea', 1, 200, 0)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (4, N'FieldType_Comment', N'string', N'textarea', 1, 500, 0)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (5, N'FieldType_Date', N'string', N'input', 0, 500, 0)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (6, N'FieldType_DropdownList', N'string', N'dropdown', 0, 500, 1)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (7, N'FieldType_RadiobuttonList', N'string', N'radio', 0, 500, 1)
INSERT [dbo].[FieldType] ([ID], [name], [dataType], [htmlTag], [minLength], [maxLength], [multiOptions]) VALUES (8, N'FieldType_MultiselectList', N'string', N'checkbox', 0, 500, 1)
SET IDENTITY_INSERT [dbo].[FieldType] OFF
SET IDENTITY_INSERT [dbo].[Form] ON 

INSERT [dbo].[Form] ([ID], [ruleID], [processID], [name], [createDate], [updateDate], [createUser], [companyID], [processTypeID], [version], [statusID]) VALUES (5, 1, 4, N'Test Form', CAST(0x0000A252010475CB AS DateTime), CAST(0x0000A25401665385 AS DateTime), 2, 1, 0, 1, 1)
INSERT [dbo].[Form] ([ID], [ruleID], [processID], [name], [createDate], [updateDate], [createUser], [companyID], [processTypeID], [version], [statusID]) VALUES (6, 1, 1, N'Root', CAST(0x0000A254010DA83D AS DateTime), CAST(0x0000A254016A1D34 AS DateTime), 2, 1, 0, 2, 1)
SET IDENTITY_INSERT [dbo].[Form] OFF
SET IDENTITY_INSERT [dbo].[FormField] ON 

INSERT [dbo].[FormField] ([formID], [question], [variableShortcut], [tooltip], [noOrder], [fieldTypeID], [required], [requiredText], [rangeFrom], [rangeTo], [ID], [panel], [validationMessage]) VALUES (5, N'Test Question', N'Test Short Name', N'Test Help Text', 1, 8, 1, N' es obligatorio', NULL, NULL, 3, NULL, NULL)
INSERT [dbo].[FormField] ([formID], [question], [variableShortcut], [tooltip], [noOrder], [fieldTypeID], [required], [requiredText], [rangeFrom], [rangeTo], [ID], [panel], [validationMessage]) VALUES (5, N'TEST', N'Short', N'Help', 2, 5, 0, N' ', N'2013/10/11', N'2013/10/30', 4, NULL, NULL)
INSERT [dbo].[FormField] ([formID], [question], [variableShortcut], [tooltip], [noOrder], [fieldTypeID], [required], [requiredText], [rangeFrom], [rangeTo], [ID], [panel], [validationMessage]) VALUES (6, N'Field 1', N'Short', N'help', 1, 2, NULL, NULL, NULL, NULL, 5, NULL, NULL)
INSERT [dbo].[FormField] ([formID], [question], [variableShortcut], [tooltip], [noOrder], [fieldTypeID], [required], [requiredText], [rangeFrom], [rangeTo], [ID], [panel], [validationMessage]) VALUES (6, N'Cual es tu nombre?', N'name', N'name', 1, 1, NULL, NULL, NULL, NULL, 6, NULL, NULL)
SET IDENTITY_INSERT [dbo].[FormField] OFF
SET IDENTITY_INSERT [dbo].[FormFieldOption] ON 

INSERT [dbo].[FormFieldOption] ([ID], [formFieldID], [value], [label], [defaultValue], [isOtherOption]) VALUES (22, 3, N'2', N'Otro', NULL, 1)
INSERT [dbo].[FormFieldOption] ([ID], [formFieldID], [value], [label], [defaultValue], [isOtherOption]) VALUES (23, 3, N'a', N'1', 1, NULL)
INSERT [dbo].[FormFieldOption] ([ID], [formFieldID], [value], [label], [defaultValue], [isOtherOption]) VALUES (24, 3, N'a', N'3', 1, NULL)
SET IDENTITY_INSERT [dbo].[FormFieldOption] OFF
SET IDENTITY_INSERT [dbo].[Glossary] ON 

INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (3, N'Angel QA', N'Angel QA', CAST(0x0000A22E00A8C4B0 AS DateTime), CAST(0x0000A2370123A324 AS DateTime), 1, NULL)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (9, N'Angel', N'adfsd', CAST(0x0000A23701232428 AS DateTime), CAST(0x0000A23F01296301 AS DateTime), 1, 2)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (10, N'Test Term', N'Test Definition', CAST(0x0000A23B01073DEA AS DateTime), NULL, 1, 2)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (13, N'Software', N'Se conoce como software al equipamiento lógico o soporte lógico de una computadora digital; comprende el conjunto de los componentes lógicos necesarios que hacen posible la realización de tareas específicas, en contraposición a los componentes físicos del sistema, llamados hardware.', CAST(0x0000A2420121FBE9 AS DateTime), CAST(0x0000A24201224518 AS DateTime), 1, 2)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (1015, N'Pocoyo', N'Pocoyo descripcion', CAST(0x0000A24601089E16 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (2015, N'GTA V', N'Siiiiii pablo piddy', CAST(0x0000A24B00B15EB2 AS DateTime), NULL, 1, 2)
INSERT [dbo].[Glossary] ([ID], [term], [definition], [createDate], [updateDate], [companyID], [createUser]) VALUES (2016, N'Proyecto', N'Un proyecto es una planificación que consiste en un conjunto de actividades que se encuentran interrelacionadas y coordinadas', CAST(0x0000A24D00BC6F13 AS DateTime), NULL, 1, 2)
SET IDENTITY_INSERT [dbo].[Glossary] OFF
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (3, 2)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (9, 2)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (10, 2)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (13, 2)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (1015, 1)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (2015, 1)
INSERT [dbo].[GlossaryRules] ([glossaryID], [ruleID]) VALUES (2016, 1)
SET IDENTITY_INSERT [dbo].[HistDocument] ON 

INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (2, NULL, 8, 0, N'Manual QA1', N'', N'', N'', CAST(0x0000A2140108A242 AS DateTime), 2, 1, 1, 1, N'2', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (8, NULL, 6, 0, N'Politica Qa1', N'', N'', N'', CAST(0x0000A214010B564C AS DateTime), 2, 1, 1, 2, N'AAA', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, 0, N'Mision QA', N'Mision QA', N'Mision QA', N'Mision QA', CAST(0x0000A2140119FF97 AS DateTime), 2, 0, 1, 3, N'dsf', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (13, NULL, 5, 0, N'Valores QA', N'Valores QA', N'Valores QA', N'Valores QA', CAST(0x0000A214011A092D AS DateTime), 2, 0, 1, 4, N'sdf', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (2, NULL, 8, 0, N'Manual QA1', N'', N'css3', N'', CAST(0x0000A21500BEF69C AS DateTime), 2, 2, 1, 5, N'new is needed', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, -1, N'Mision QA', N'Mision QA', N'Mision QA', N'Mision QA', CAST(0x0000A22E010729FD AS DateTime), 2, 1, 1, 7, N'porque si', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (14, NULL, 7, -1, N'Politicas QA1', N'Politicas QA1', N'Politicas QA1', N'Politicas QA1', CAST(0x0000A22E0107394E AS DateTime), 2, 0, 1, 8, N'nooooooo', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (12, NULL, 3, -1, N'Vision QA', N'Vision QA', N'Vision QA', N'Vision QA', CAST(0x0000A22E010743D5 AS DateTime), 2, 0, 1, 9, N'xD', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, -1, N'Mision QA', N'Mision QA', N'Mision QA', N'Mision QA', CAST(0x0000A22E0107922F AS DateTime), 2, 2, 1, 10, N'mmmm', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (1048, NULL, 8, 0, N'Ultima prueba', N'', N'Hola', N'', CAST(0x0000A2360098ECB2 AS DateTime), 10, 1, 1, 12, N'Ver', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (1048, NULL, 8, 0, N'Ultima prueba', N'', N'Hola', N'', CAST(0x0000A236009EA73C AS DateTime), 10, 2, 1, 13, N'Ver', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (2076, NULL, 6, 0, N'Beta', N'', N'Hola', N'', CAST(0x0000A23B013F48E3 AS DateTime), 2, 1, 1, 1015, N'B', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, -1, N'Mision QA', N'Mision QA', N'La mision de esta empresa es progresar', N'', CAST(0x0000A23B0140F49C AS DateTime), 2, 3, 1, 1016, N'a', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, -1, N'Mision QA', N'Mision QA', N'La mision de esta empresa es progresar', N'', CAST(0x0000A23B01410001 AS DateTime), 2, 4, 1, 1017, N'asd', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (2093, NULL, 6, 0, N'New Policy', N'', N'jajajaja', N'', CAST(0x0000A23F00A70703 AS DateTime), 2, 1, 1, 1018, N'ME da la gana', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (11, NULL, 2, 0, N'Mision QA', N'Mision QA', N'La mision de esta empresa es progresar', N'', CAST(0x0000A23F00EBD533 AS DateTime), 2, 5, 1, 1019, N'jajaja', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (2102, NULL, 6, 0, N'Test Pol', N'', N'', N'', CAST(0x0000A2420096AF19 AS DateTime), 2, 1, 1, 1020, N'new', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (15, NULL, 8, 0, N'Angel', N'', N'fdfdfdf', N'', CAST(0x0000A251008D5B0C AS DateTime), 2, 1, 1, 1021, N'jijaaa', 1)
INSERT [dbo].[HistDocument] ([documentID], [documentParentID], [documentTypeID], [EDT], [title], [description], [documentText], [url], [dateAdded], [createUser], [version], [companyID], [ID], [changeReason], [responsible]) VALUES (25, NULL, 9, 0, N'Angel QA1', N'', N'Angel QA', N'', CAST(0x0000A25100A2917A AS DateTime), 2, 1, 1, 1022, N'new version detected', 1)
SET IDENTITY_INSERT [dbo].[HistDocument] OFF
SET IDENTITY_INSERT [dbo].[HistForm] ON 

INSERT [dbo].[HistForm] ([ID], [FormID], [ruleID], [processID], [name], [dateAdded], [version], [createUser], [companyID], [processTypeID], [changeReason], [statusID]) VALUES (1, 6, 1, 1, N'Root', NULL, 1, 2, 1, 0, N'new one<br>', 1)
SET IDENTITY_INSERT [dbo].[HistForm] OFF
SET IDENTITY_INSERT [dbo].[HistInstructionWorks] ON 

INSERT [dbo].[HistInstructionWorks] ([ID], [instructionWorkID], [ruleID], [processID], [workID], [name], [responsible], [statusID], [departmentID], [dateAdded], [changeReason], [companyID], [createUser], [version]) VALUES (1, 3, 1, 1, 0, N'Test IW', 3, 1, 1, CAST(0x0000A235012C42F2 AS DateTime), N'Hola', 1, 2, 1)
INSERT [dbo].[HistInstructionWorks] ([ID], [instructionWorkID], [ruleID], [processID], [workID], [name], [responsible], [statusID], [departmentID], [dateAdded], [changeReason], [companyID], [createUser], [version]) VALUES (1004, 6, 2, 3, 0, N'Test IW2', 3, 1, 2, CAST(0x0000A25100BBA048 AS DateTime), N'new version detected
', 1, 2, 2)
INSERT [dbo].[HistInstructionWorks] ([ID], [instructionWorkID], [ruleID], [processID], [workID], [name], [responsible], [statusID], [departmentID], [dateAdded], [changeReason], [companyID], [createUser], [version]) VALUES (1005, 6, 2, 3, 0, N'Test IW2', 3, 1, 2, CAST(0x0000A25100BCEF95 AS DateTime), N'new <b>testing </b><br>', 1, 2, 3)
INSERT [dbo].[HistInstructionWorks] ([ID], [instructionWorkID], [ruleID], [processID], [workID], [name], [responsible], [statusID], [departmentID], [dateAdded], [changeReason], [companyID], [createUser], [version]) VALUES (1006, 6, 2, 3, 0, N'Test IW2', 3, 1, 2, CAST(0x0000A25100C42183 AS DateTime), N'tang', 1, 2, 4)
SET IDENTITY_INSERT [dbo].[HistInstructionWorks] OFF
SET IDENTITY_INSERT [dbo].[HistProcedure] ON 

INSERT [dbo].[HistProcedure] ([ID], [procedureID], [ruleID], [processID], [responsible], [target], [procedureScope], [dateAdd], [createUser], [companyID], [name], [statusID], [changeReason], [version]) VALUES (1, 4, 1, 1, 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en mayr', CAST(0x0000A24C00C1D591 AS DateTime), 2, 1, N'Procedimiento', 1, N'something changes', 1)
INSERT [dbo].[HistProcedure] ([ID], [procedureID], [ruleID], [processID], [responsible], [target], [procedureScope], [dateAdd], [createUser], [companyID], [name], [statusID], [changeReason], [version]) VALUES (2, 4, 1, 1, 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en mayr', CAST(0x0000A24C00C5675D AS DateTime), 2, 1, N'Procedimiento', 1, N'changed again', 2)
INSERT [dbo].[HistProcedure] ([ID], [procedureID], [ruleID], [processID], [responsible], [target], [procedureScope], [dateAdd], [createUser], [companyID], [name], [statusID], [changeReason], [version]) VALUES (3, 4, 1, 1, 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en mayr', CAST(0x0000A24C00DAA718 AS DateTime), 2, 1, N'Procedimiento', 1, N'there''s nothing for me here', 3)
INSERT [dbo].[HistProcedure] ([ID], [procedureID], [ruleID], [processID], [responsible], [target], [procedureScope], [dateAdd], [createUser], [companyID], [name], [statusID], [changeReason], [version]) VALUES (4, 4, 1, 1, 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en mayr', CAST(0x0000A24C00DBE171 AS DateTime), 2, 1, N'Procedimiento', 1, N'jajaja, xD<br>', 4)
SET IDENTITY_INSERT [dbo].[HistProcedure] OFF
SET IDENTITY_INSERT [dbo].[HistProcess] ON 

INSERT [dbo].[HistProcess] ([processID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [dateAdded], [createUser], [changeReason], [companyID], [ID], [version]) VALUES (3, 2, 1, 1, N'Beta', N'Beta', 1, N'Beta', N'Beta', N'Beta
', N'Beta
', N'Beta', N'Beta', N'Beta', CAST(0x0000A24C00A47D5C AS DateTime), 2, N'Changed something', 1, 1, 1)
INSERT [dbo].[HistProcess] ([processID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [dateAdded], [createUser], [changeReason], [companyID], [ID], [version]) VALUES (3, 2, 1, 1, N'Beta', N'Beta', 1, N'Beta', N'Beta', N'Beta
', N'Beta
', N'Beta', N'Beta', N'Beta', CAST(0x0000A24C00D8465D AS DateTime), 2, N'nothing here for me', 1, 2, 2)
INSERT [dbo].[HistProcess] ([processID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [dateAdded], [createUser], [changeReason], [companyID], [ID], [version]) VALUES (3, 2, 1, 1, N'Beta', N'Beta', 1, N'Beta', N'Beta', N'Beta
', N'Beta
', N'Beta', N'Beta', N'Beta', CAST(0x0000A24C00D9948A AS DateTime), 2, N'the real changes', 1, 3, 3)
INSERT [dbo].[HistProcess] ([processID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [dateAdded], [createUser], [changeReason], [companyID], [ID], [version]) VALUES (3, 2, 1, 1, N'Beta', N'Beta', 1, N'Beta', N'Beta', N'Beta
', N'Beta
', N'Beta', N'Beta', N'Beta', CAST(0x0000A24C00DB2D3A AS DateTime), 2, N'nothing for me here, xD dope<br>', 1, 4, 4)
SET IDENTITY_INSERT [dbo].[HistProcess] OFF
SET IDENTITY_INSERT [dbo].[Indicator] ON 

INSERT [dbo].[Indicator] ([ID], [name], [description], [status], [ruleID], [processID], [target], [dataSourceMeasure], [measureUnit], [periodID], [responsibleOfGenerate], [responsableMonitor], [createDate], [updateDate], [createUser], [processTypeID], [formula], [lowerLimit], [companyID], [goal], [upperLimit], [frequency], [version]) VALUES (2, N'Indicador 1', N'Indicador 1', N'AA', 1, 4, N'Nada', N'Nada', N'Nada', 1, 1, 1, CAST(0x0000A22300F05B0E AS DateTime), CAST(0x0000A22300F05B0E AS DateTime), NULL, 1, N'A+A', CAST(50.00 AS Decimal(15, 2)), 1, CAST(100.00 AS Decimal(15, 2)), CAST(200.00 AS Decimal(15, 2)), NULL, 1)
INSERT [dbo].[Indicator] ([ID], [name], [description], [status], [ruleID], [processID], [target], [dataSourceMeasure], [measureUnit], [periodID], [responsibleOfGenerate], [responsableMonitor], [createDate], [updateDate], [createUser], [processTypeID], [formula], [lowerLimit], [companyID], [goal], [upperLimit], [frequency], [version]) VALUES (5, N'Primer Indicador M', N'NA', N'NA', 1, 3, N'Objetivo ', N'Fuente ', N'Horas', 1, 1, 1, CAST(0x0000A22300F05B0E AS DateTime), CAST(0x0000A25401158F08 AS DateTime), NULL, 0, N'[Test Short Name] +[Test Short Name] * [Test Short Name]', CAST(50.00 AS Decimal(15, 2)), 1, CAST(150.00 AS Decimal(15, 2)), CAST(200.00 AS Decimal(15, 2)), NULL, 1)
SET IDENTITY_INSERT [dbo].[Indicator] OFF
INSERT [dbo].[IndicatorVariables] ([indicatorID], [formFieldID]) VALUES (5, 3)
INSERT [dbo].[IndicatorVariables] ([indicatorID], [formFieldID]) VALUES (5, 4)
INSERT [dbo].[IndicatorVariables] ([indicatorID], [formFieldID]) VALUES (5, 5)
INSERT [dbo].[IndicatorVariables] ([indicatorID], [formFieldID]) VALUES (5, 6)
SET IDENTITY_INSERT [dbo].[InstructionWorks] ON 

INSERT [dbo].[InstructionWorks] ([ruleID], [processID], [ID], [name], [responsible], [statusID], [departmentID], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1, 1, 3, N'Test IW', 3, 1, 1, CAST(0x0000A22D00A87982 AS DateTime), CAST(0x0000A235012D2A80 AS DateTime), 2, 1, 1)
INSERT [dbo].[InstructionWorks] ([ruleID], [processID], [ID], [name], [responsible], [statusID], [departmentID], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (2, 3, 6, N'Test IW2', 3, 1, 2, CAST(0x0000A23E00DBA3E6 AS DateTime), CAST(0x0000A25100C4218D AS DateTime), 2, 1, 5)
INSERT [dbo].[InstructionWorks] ([ruleID], [processID], [ID], [name], [responsible], [statusID], [departmentID], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (2, 4, 9, N'INstriccón de prueba', 5, 1, 1, CAST(0x0000A24200D1B212 AS DateTime), CAST(0x0000A2450129D04D AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[InstructionWorks] OFF
SET IDENTITY_INSERT [dbo].[Menu] ON 

INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (1, N'Inicio', 1, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (2, N'Planificar', 2, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (3, N'Hacer', 4, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (4, N'Verificar', 3, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (5, N'Actuar', 5, 2, 1, NULL)
INSERT [dbo].[Menu] ([ID], [name], [noOrder], [createUser], [companyID], [description]) VALUES (13, N'Administración', 6, 2, 1, NULL)
SET IDENTITY_INSERT [dbo].[Menu] OFF
SET IDENTITY_INSERT [dbo].[Period] ON 

INSERT [dbo].[Period] ([ID], [name], [interval], [createDate], [updateDate], [createUser]) VALUES (1, N'Diario', 1, CAST(0x0000A22300B296C3 AS DateTime), CAST(0x0000A22300B296C3 AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Period] OFF
SET IDENTITY_INSERT [dbo].[Plan] ON 

INSERT [dbo].[Plan] ([ID], [code], [name], [responsible], [createDate], [updateDate], [companyID], [createUser], [processID], [version]) VALUES (1, N'UC-DF', N'Test', 1, NULL, CAST(0x0000A24D0127F90F AS DateTime), 1, NULL, 1, 1)
SET IDENTITY_INSERT [dbo].[Plan] OFF
SET IDENTITY_INSERT [dbo].[PlanObjectives] ON 

INSERT [dbo].[PlanObjectives] ([ID], [startDate], [endDate], [responsible], [planID], [actions], [name], [createUser]) VALUES (1, CAST(0x0000A25400000000 AS DateTime), CAST(0x0000A26200000000 AS DateTime), 1, 1, N'ljfp', N'kghc', 2)
INSERT [dbo].[PlanObjectives] ([ID], [startDate], [endDate], [responsible], [planID], [actions], [name], [createUser]) VALUES (3, CAST(0x0000A24E00000000 AS DateTime), CAST(0x0000A24F00000000 AS DateTime), 1, 1, N'sthxd', N'gfhjg', 2)
SET IDENTITY_INSERT [dbo].[PlanObjectives] OFF
SET IDENTITY_INSERT [dbo].[Position] ON 

INSERT [dbo].[Position] ([ID], [name], [companyID], [description]) VALUES (1, N'Administrador', 1, N'Administrador')
SET IDENTITY_INSERT [dbo].[Position] OFF
SET IDENTITY_INSERT [dbo].[Procedure] ON 

INSERT [dbo].[Procedure] ([ID], [ruleID], [processID], [responsible], [target], [procedureScope], [createDate], [updateDate], [createUser], [name], [companyID], [statusID], [version]) VALUES (1, 2, 1, 1, N'self', N'all', CAST(0x0000A227009A292A AS DateTime), CAST(0x0000A246009A292A AS DateTime), 2, N'Test Procedure', 1, 1, 1)
INSERT [dbo].[Procedure] ([ID], [ruleID], [processID], [responsible], [target], [procedureScope], [createDate], [updateDate], [createUser], [name], [companyID], [statusID], [version]) VALUES (4, 1, 1, 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en mayr', CAST(0x0000A22E00C1D1FD AS DateTime), CAST(0x0000A24C00EE0AB1 AS DateTime), 2, N'Procedimiento', 1, 1, 5)
INSERT [dbo].[Procedure] ([ID], [ruleID], [processID], [responsible], [target], [procedureScope], [createDate], [updateDate], [createUser], [name], [companyID], [statusID], [version]) VALUES (5, 1, 1009, 1, N'Describir la metodología para iniciar formalmente un nuevo proyecto o autorizar la continuación de la siguiente fase de uno en ejecución.', N'Este procedimiento aplica para el Encargado de Consultoría de Estrategias y Proyectos de e-GOB y a los Directores de Proyectos asignados, sin importar el área de la OPTIC a la que pertenezcan.', CAST(0x0000A24D00BBEB5D AS DateTime), CAST(0x0000A24D00CF4E08 AS DateTime), 2, N'Iniciación de Proyecto', 1, 1, 0)
SET IDENTITY_INSERT [dbo].[Procedure] OFF
SET IDENTITY_INSERT [dbo].[ProcedureActivities] ON 

INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (9, 1, 6, N'activity 3', CAST(0x0000A22700E12489 AS DateTime), CAST(0x0000A24900BC5F4D AS DateTime), 2)
INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (20, 1, 4, N'dhdsghfd', CAST(0x0000A24B00BFF0FB AS DateTime), NULL, 2)
INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (21, 4, 4, N'dedrfde', CAST(0x0000A24B00C1EDBF AS DateTime), NULL, 2)
INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (22, 5, 7, N'Asigna el director de proyecto', CAST(0x0000A24D00BCA8A9 AS DateTime), NULL, 2)
INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (23, 5, 4, N'Elabora el Enunciado de Trabajo de acuerdo a la instrucción de trabajo PE-IT-003 Elaboración de Enunciado de Trabajo', CAST(0x0000A24D00BCC4DD AS DateTime), NULL, 2)
INSERT [dbo].[ProcedureActivities] ([ID], [procedureID], [responsible], [activity], [createDate], [updateDate], [createUser]) VALUES (24, 5, 4, N'Elabora el Acta de Constitución del Proyecto de acuerdo a la instrucción de trabajo PE-IT-004 Elaboración de Acta de Constitución de Proyecto o Servicio.', CAST(0x0000A24D00BCDE97 AS DateTime), CAST(0x0000A24D00BCEB15 AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[ProcedureActivities] OFF
INSERT [dbo].[ProcedureAnnexes] ([procedureID], [documentID]) VALUES (1, 25)
INSERT [dbo].[ProcedureAnnexes] ([procedureID], [documentID]) VALUES (4, 20)
INSERT [dbo].[ProcedureAnnexes] ([procedureID], [documentID]) VALUES (5, 1045)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (1, 10)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (1, 13)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (4, 1015)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (4, 2015)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (5, 10)
INSERT [dbo].[ProcedureGlossaries] ([procedureID], [glossaryID]) VALUES (5, 13)
INSERT [dbo].[ProcedureNormatives] ([procedureID], [documentID]) VALUES (1, 2056)
INSERT [dbo].[ProcedureNormatives] ([procedureID], [documentID]) VALUES (4, 2056)
INSERT [dbo].[ProcedureNormatives] ([procedureID], [documentID]) VALUES (5, 2056)
INSERT [dbo].[ProcedureNormatives] ([procedureID], [documentID]) VALUES (5, 3129)
INSERT [dbo].[ProcedureReferences] ([procedureID], [documentID]) VALUES (1, 1045)
INSERT [dbo].[ProcedureReferences] ([procedureID], [documentID]) VALUES (4, 17)
INSERT [dbo].[ProcedureReferences] ([procedureID], [documentID]) VALUES (5, 17)
SET IDENTITY_INSERT [dbo].[Process] ON 

INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1, 2, 1, 1, N'Primer procesoM', N'Descriptción del 1er procesoM', 1, N'Objetivo del 1er procesoM', N'EntradasM', N'ActividadesM', N'SalidasM', N'Requisitos del clienteM', N'Medidas de controlM', N'Requisitos de las salidasM', CAST(0x0000A22100C225CD AS DateTime), CAST(0x0000A23800A3C8FB AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (3, 2, 1, 1, N'Beta', N'Beta', 1, N'Beta', N'Beta', N'Beta
', N'Beta
', N'Beta', N'Beta', N'Beta', CAST(0x0000A23B013FF3F9 AS DateTime), CAST(0x0000A24D00B47313 AS DateTime), 2, 1, 5)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (4, 2, 1, 1, N'Test Process', N'Test Description', 1, N'Test Objective', N'Test Description', N'Test Activities', N'Test outputs', N'Test requisites', N'Test measures', N'Test Output requisites', CAST(0x0000A23F00B3C262 AS DateTime), CAST(0x0000A23F00D3F9F7 AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (5, 2, 1, 1, N'Vuelca', N'si queremos', 1, N'Cantar', N'Entrando con la informacion', N'Activemonos', N'Salimos', N'Lo requiro', N'siiejien n;l', N'lo requirio', CAST(0x0000A2460100019F AS DateTime), CAST(0x0000A24601032B27 AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1005, 1, 1, 1, N'Gestión de Proyectos', N'bla bla bla', 1, N'fasfasdfadsfasfasfas', N'asdfasfSFfDFASDFSADFASDFASFASFAS', N'FDASGFASFASDFASDFASDFAFAFASFASDF', N'dfadfasdfasdfasdfasdfagadfsafasfasfasdfsf', N'adsfasdagasdgasfasfadfadfa', N'adsfasdgasdgfadsf d adsfasdfa asdfadfad a', N'adf adsf adsfadsfds adsf asdfadsf asdfasdfdasfasdf adfa sdfa asdfa sd.', CAST(0x0000A24A01023D87 AS DateTime), CAST(0x0000A24D00B4FA39 AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1006, 1, 1, 1, N'Procesp', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', 1, N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', N'Describir lo que es un gran avance para la humanidad, sobre tdas las yeorias quehan ocuerrodp spnbre l agran mayoria de tdos los crimenes que han surgido sobre el pasar de los anos por eso se viene combatiendo eso para mitigar los aecinatos, el elefante es un animal muy grande sighie adelante orry convbieryeye en nu vencedor que miu pronto seras un gran hmbre fin del reccordio guayyyy en may', CAST(0x0000A24B00A85138 AS DateTime), CAST(0x0000A24B00A8F65D AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1007, 1, 1, 1, N'Gupi', N'Como un fuerte oponente de la expansión de la esclavitud en los Estados Unidos, Lincoln ganó la nominación del Partido Republicano en 1860 y fue elegido presidente a finales de ese año. Durante su período, ayudó a preservar los Estados Unidos por la derrota de los secesionistas Estados Confederados de América en la Guerra Civil estadounidense.4 5 Introdujo medidas que dieron como resultado la abolición de la esclavitud, con la emisión de su Proclamación de Emancipación en 1863 y la promoción de la aprobación de la Decimotercera Enmienda a la Constitución en 1865.6', 1, N'Albert Einstein (en alemán [''alb?t ''a?n?ta?n]; Ulm, Imperio alemán, 14 de marzo de 1879 - Princeton, Estados Unidos, 18 de abril de 1955) fue un físico alemán de origen judío, nacionalizado después suizo y estadounidense. Es considerado como el científico más importante del siglo XX. Manuel Alfonseca cuantifica la importancia de 1000 científicos de todos los tiempos y, en una escala de 1 a 8, Einstein y Freud son los únicos del siglo XX en alcanzar la máxima puntuación;1 asimismo califica a Einstein como «el científico más popular y conocido del siglo XX» 2', N'En 1878 en el Congreso de París de la Sociedad Industrial Minera, celebrado con motivo de la Exposición Universal, Fayol presentó un informe sobre la alteración y la combustión espontánea de la hulla expuesta al aire. Este trabajo tuvo una gran acogi', N'Charles Robert Darwin (12 de febrero de 1809 – 19 de abril de 1882) fue un naturalista inglés que postuló que todas las especies de seres vivos han evolucionado con el tiempo a partir de un antepasado común mediante un proceso denominado selección natural. La evolución fue aceptada como un hecho por la comunidad científica y por buena parte del público en vida de Darwin, mientras que su teoría de la evolución mediante selección natural no fue considerada como la explicación primaria del proceso evolutivo hasta los años 1930.1 Actualmente constituye la base de la síntesis evolutiva moderna. Con sus modificaciones, los descubrimientos científicos de Darwin aún siguen siendo el acta fundacional de la biología como ciencia, puesto que constituyen una explicación lógica que unifica las observaciones sobre la diversidad de la vida.2', N'do (??? literalmente “puerta de lluvia”) es una puerta corrediza exterior o contraventana corrediza;1 que cubre las ventanas y que se usa exclusivamente en exteriores. Forma parte del tategu o conjunto de puertas corredizas y ', N'La función principal de un amado es proteger las ventanas de vidrio o los fusuma (puertas corredizas de papel) del impacto directo de los tifones y vientos fuertes.

Es una estructura importante que protege el interior, y resulta efectivo para prevenir cualquier ingreso no deseado a la casa, convirtiéndose en un elemento de seguridad.

En años recientes, ha tenido también una eficacia contra el fuego, en especial con puertas corredizas hechas de metal.También resulta ser muy efectiva regulando la temperatura de la casa al protegerla del frío de la lluvia intensa o de los rayos directos del sol.', N'En los países occidentales, se utiliza comúnmente para proteger las ventanas de la casa con ornamentos de metal que impiden la entrada desde afuera.', N'Amado is the master.

    Puerta corrediza: Las ventanas y las puertas de cerco como el amado, las ventanas de mallas o las puertas de vidrio, están adjuntas a rieles que se mueven de manera lateral al jalarlas. Están hechas de planchas ligeras de madera, de hierro o de aluminio.
    Contraventana: En las tiendas o mercados son usados de una manera similar, jalando desde arriba hacia abajo para cerrar. Algunos son operados mediante electricidad.
', CAST(0x0000A24C00BE0EC7 AS DateTime), CAST(0x0000A24C00BE2D5B AS DateTime), 2, 1, 1)
INSERT [dbo].[Process] ([ID], [ruleID], [processTypeID], [responsible], [name], [description], [statusID], [target], [entries], [activities], [outputs], [customerRequirements], [controlMeasures], [outputRequirements], [createDate], [updateDate], [createUser], [companyID], [version]) VALUES (1009, 1, 1, 1, N'Gestión de Proyectos2', NULL, 1, N'Administrar recursos con el fin de efectuar las actividades necesarias en un proyecto respecto a alcance, tiempo, calidad y costos definidos.', N'Información sobre requerimientos y necesidades del cliente', N'•	Formulación del proyecto

Implementación:
•	Iniciación del proyecto
•	Planificación del proyecto
•	Ejecución del proyecto
•	Seguimiento y control del proyecto
•	Cierre del proyecto', N'En formulación:
•	Resumen ejecutivo

En implementación:
•	Producto o servicio terminado', N'Pericia del Consultor o Director de Proyecto', N'Controles sobre: 
•	Alcance del proyecto
•	Cronograma
•	Costos
•	Calidad', NULL, CAST(0x0000A24D00B100C2 AS DateTime), CAST(0x0000A24D00C8E57F AS DateTime), 2, 1, 1)
SET IDENTITY_INSERT [dbo].[Process] OFF
SET IDENTITY_INSERT [dbo].[ProcessDocuments] ON 

INSERT [dbo].[ProcessDocuments] ([processID], [documentID], [text], [ID], [ISORequirement]) VALUES (3, NULL, N'build you up', 3, NULL)
INSERT [dbo].[ProcessDocuments] ([processID], [documentID], [text], [ID], [ISORequirement]) VALUES (5, 9, NULL, 5, NULL)
INSERT [dbo].[ProcessDocuments] ([processID], [documentID], [text], [ID], [ISORequirement]) VALUES (1006, NULL, N'Procesos', 1005, NULL)
INSERT [dbo].[ProcessDocuments] ([processID], [documentID], [text], [ID], [ISORequirement]) VALUES (1006, 13, NULL, 1006, NULL)
INSERT [dbo].[ProcessDocuments] ([processID], [documentID], [text], [ID], [ISORequirement]) VALUES (1009, 3, NULL, 1007, NULL)
SET IDENTITY_INSERT [dbo].[ProcessDocuments] OFF
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1, 1)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (3, 1)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (3, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (3, 12)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (4, 1)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (4, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (4, 9)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (5, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (5, 4)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1006, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1006, 4)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1006, 5)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1006, 11)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1007, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1007, 4)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1009, 1)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1009, 2)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1009, 9)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1009, 10)
INSERT [dbo].[ProcessEntities] ([processID], [entityID]) VALUES (1009, 11)
INSERT [dbo].[ProcessRequirements] ([processID], [documentID]) VALUES (3, 2111)
INSERT [dbo].[ProcessRequirements] ([processID], [documentID]) VALUES (5, 2121)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 1)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 3)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 4)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 5)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 1006)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 1007)
INSERT [dbo].[ProcessResources] ([subcategoryID], [processID]) VALUES (1, 1009)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (1, 1)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (1, 2)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (3, 2)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (4, 2)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (5, 2)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (1006, 1)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (1007, 1)
INSERT [dbo].[ProcessRules] ([processID], [ruleID]) VALUES (1009, 1)
SET IDENTITY_INSERT [dbo].[ProcessType] ON 

INSERT [dbo].[ProcessType] ([ID], [name], [companyID], [description]) VALUES (1, N'Estratégico', 1, N'Estratégico')
INSERT [dbo].[ProcessType] ([ID], [name], [companyID], [description]) VALUES (2, N'Operacional', 1, N'Operacional')
INSERT [dbo].[ProcessType] ([ID], [name], [companyID], [description]) VALUES (3, N'De Apoyo', 1, N'De apoyo')
SET IDENTITY_INSERT [dbo].[ProcessType] OFF
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 98)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 99)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 100)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 101)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 102)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 103)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 104)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 105)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 106)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 107)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 108)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 109)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 110)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 111)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 112)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 113)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 114)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 115)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 116)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 117)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 118)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 119)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 120)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 121)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 122)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 123)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 124)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 125)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 126)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 127)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 128)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 129)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 130)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 131)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 132)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 133)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 134)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 135)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 136)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 137)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 138)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 139)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 140)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 141)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 142)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 143)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 144)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 145)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 146)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 147)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 148)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 149)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 150)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 151)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 152)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 153)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 154)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 155)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 156)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 157)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 158)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 159)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 160)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 161)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 162)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 163)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 164)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 165)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 166)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 167)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 168)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 169)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 170)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 171)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 172)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 173)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 174)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 175)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 176)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 177)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 178)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 179)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 180)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 181)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 182)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 183)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 184)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 185)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 186)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 187)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 188)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 189)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 190)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 191)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 192)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 193)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 194)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 195)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 196)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 197)
GO
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 198)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 199)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 200)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 201)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 202)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 203)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 204)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 205)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 206)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 207)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 208)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 209)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 210)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 211)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 212)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 213)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 214)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 215)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1215)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1216)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1217)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1218)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 1219)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2219)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2220)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2221)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2222)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2223)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2224)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2225)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2226)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2227)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2228)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2229)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2230)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2231)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2232)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2233)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2234)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2235)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (1, 2236)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 102)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 104)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 134)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 136)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 137)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 138)
INSERT [dbo].[RolesActions] ([RoleID], [ActionID]) VALUES (2, 139)
INSERT [dbo].[RolesDepartments] ([roleID], [departmentID]) VALUES (1, 2)
SET IDENTITY_INSERT [dbo].[Rules] ON 

INSERT [dbo].[Rules] ([ID], [name], [status], [code], [description], [createDate], [updateDate], [createUser], [documentID]) VALUES (1, N'Calidad', 1, N'ISO 9000', N'QA1', CAST(0x0000A214010195B9 AS DateTime), NULL, 2, 0)
INSERT [dbo].[Rules] ([ID], [name], [status], [code], [description], [createDate], [updateDate], [createUser], [documentID]) VALUES (2, N'Ambiental', 1, N'ISO 70000', N'caaaary', CAST(0x0000A21A01146BF7 AS DateTime), NULL, 2, 2110)
INSERT [dbo].[Rules] ([ID], [name], [status], [code], [description], [createDate], [updateDate], [createUser], [documentID]) VALUES (3, N'EIS', 1, N'EIS-N001', N'Norma 001 de EIS, limpiar la cocina después de comer.', CAST(0x0000A23600A55D9D AS DateTime), NULL, 10, 0)
SET IDENTITY_INSERT [dbo].[Rules] OFF
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (1, N'Creacion', N'Estatus de creacion', CAST(0x0000A21400F595C2 AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Status] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (2, N'Revisión', N'Revisión', CAST(0x0000A21A0118FA35 AS DateTime), NULL, NULL, 2)
INSERT [dbo].[Status] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (3, N'Completado', N'Completado', CAST(0x0000A23501229174 AS DateTime), CAST(0x0000A2350123D61B AS DateTime), NULL, NULL)
INSERT [dbo].[Status] ([ID], [name], [description], [createDate], [updateDate], [companyID], [createUser]) VALUES (5, N'Demo', N'Demo', CAST(0x0000A2380122B712 AS DateTime), CAST(0x0000A2380122C6BB AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Status] OFF
INSERT [dbo].[Subcategory] ([categoryID], [ID], [name], [description], [status], [createDate], [updateDate], [createUser]) VALUES (1, 1, N'Consultores de proyecto', N'Humanos', 1, CAST(0x0000A2230116F66A AS DateTime), CAST(0x0000A2230116F66A AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[SubMenu] ON 

INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2328, 13, N'Administrar Menu', 840, 1)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2329, 13, N'Crear Menu', 821, 2)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2330, 13, N'Clientes', 842, 4)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2331, 13, N'Departamentos', 753, 5)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2332, 13, N'Estados', 803, 6)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2333, 13, N'Tareas', 812, 7)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2334, 13, N'Usuarios', 1877, 3)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2335, 1, N'Dash Board', 773, 1)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2369, 13, N'Procedimientos', 860, 8)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (2371, 13, N'Documentos', 763, 9)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (3372, 13, N'Permisos', 784, 10)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4372, 13, N'roles', 793, 11)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4373, 13, N'planes', 2880, 12)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4374, 13, N'Proceso', 847, 13)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4375, 13, N'Manuales', 776, 14)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4376, 13, N'Objetivos', 782, 15)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4377, 13, N'Instrucciones de Trabajo', 855, 16)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4378, 13, N'Formularios', 2885, 17)
INSERT [dbo].[SubMenu] ([ID], [menuID], [name], [viewID], [noOrder]) VALUES (4379, 13, N'Indicadores', 2893, 18)
SET IDENTITY_INSERT [dbo].[SubMenu] OFF
SET IDENTITY_INSERT [dbo].[Task] ON 

INSERT [dbo].[Task] ([ID], [description], [howTo], [whyDo], [createDate], [updateDate], [createUser], [workID], [ruleID], [processID]) VALUES (4, N'ddr2', N'ddr3', N'ddr4', CAST(0x0000A22D00AC3A13 AS DateTime), NULL, 2, 3, 1, 1)
INSERT [dbo].[Task] ([ID], [description], [howTo], [whyDo], [createDate], [updateDate], [createUser], [workID], [ruleID], [processID]) VALUES (5, N'Nueva', N'Hola', N'Nadie', CAST(0x0000A235012660A8 AS DateTime), NULL, 10, 3, 1, 1)
INSERT [dbo].[Task] ([ID], [description], [howTo], [whyDo], [createDate], [updateDate], [createUser], [workID], [ruleID], [processID]) VALUES (8, N'TAsk Description', N'How to do ', N'Why do it', CAST(0x0000A23E00DBD6D4 AS DateTime), NULL, 2, 6, 2, 3)
INSERT [dbo].[Task] ([ID], [description], [howTo], [whyDo], [createDate], [updateDate], [createUser], [workID], [ruleID], [processID]) VALUES (11, N'Tapar la botella.', N'Agarrar la botella y girar la tapa.', N'Para que no se derrame el agua.', CAST(0x0000A24200D26342 AS DateTime), NULL, 2, 9, 2, 4)
SET IDENTITY_INSERT [dbo].[Task] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (2, N'EISDR', 0, N'mail@eisdr.com', N'123456', N'', CAST(0x0000A254010D83C3 AS DateTime), 1, NULL, 1, CAST(0x0000A21400F592C1 AS DateTime), CAST(0x0000A21400F592C1 AS DateTime), NULL, NULL, N'0696db7b-a02b-4ae6-9d56-af5887ce66c6.jpg')
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (3, N'Yugi', 1, N'arodriguez@eisdr.com', N'123123', N'', CAST(0x0000A23D00DAC501 AS DateTime), 0, 1, 1, CAST(0x0000A21400FC3D0F AS DateTime), CAST(0x0000A21400FC3D0F AS DateTime), 2, 1, NULL)
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (4, N'Angel Luis', 1, N'arodriguez2@eisdr.com', N'123123', N'', NULL, 1, 1, 1, CAST(0x0000A21500E17E7B AS DateTime), CAST(0x0000A21500E17E7B AS DateTime), 2, 1, N'')
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (5, N'Naruto', 1, N'Naruto@Naruto.com', N'123123', N'', NULL, 0, 1, 1, CAST(0x0000A21A011664CA AS DateTime), CAST(0x0000A21A011664CA AS DateTime), 2, 1, NULL)
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (6, N'Hallet', 1, N'logan@logan.com', N'123123', N'', CAST(0x0000A21A011EE0C0 AS DateTime), 0, 1, 1, CAST(0x0000A21A011EADB9 AS DateTime), CAST(0x0000A21A011EADB9 AS DateTime), 2, 1, NULL)
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (7, N'Johan', 1, N'king_sayan@hotmail.com', N'123456', N'', NULL, 0, 1, 1, CAST(0x0000A22F0110D16E AS DateTime), CAST(0x0000A22F0110D16E AS DateTime), 2, 1, N'f4727291-1ee0-4856-96a4-3b12f9fa3c89.jpg')
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (10, N'Ash', 1, N'angel.rodriguez810@gmail.com', N'123123', N'', CAST(0x0000A23400AA6F87 AS DateTime), 1, 1, 1, CAST(0x0000A23400A9F740 AS DateTime), CAST(0x0000A23400A9F740 AS DateTime), 2, 1, N'b8569b95-6a14-4309-87b9-f691dc491445.gif')
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (11, N'Nuevo', 1, N'nuevo@nuevo.com', N'123123', N'', NULL, 1, 1, 1, CAST(0x0000A23B00A50FB0 AS DateTime), CAST(0x0000A23B00A50FB0 AS DateTime), 2, 1, NULL)
INSERT [dbo].[User] ([ID], [name], [status], [username], [password], [activeKey], [lastVisitAt], [superUser], [departmentID], [companyID], [createDate], [updateDate], [createUser], [positionID], [imageUrl]) VALUES (14, N'GGGG', 1, N'mail4@eisdr.com', N'123123', N'', NULL, 1, 1, 1, CAST(0x0000A24200B5BBC1 AS DateTime), CAST(0x0000A24200B5BBC1 AS DateTime), 2, 1, N'ea35f7e2-39ce-4ae1-ae10-3b08169e9e91.jpg')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[UserTask] ON 

INSERT [dbo].[UserTask] ([ID], [parentTaskID], [name], [description], [ruleID], [fromDate], [toDate], [createDate], [updateDate], [createUser], [statusID], [companyID], [responsible]) VALUES (11, NULL, N'Beta', N'Beta', 2, CAST(0x0000A23800000000 AS DateTime), CAST(0x0000A24200000000 AS DateTime), NULL, CAST(0x0000A23B01416E7E AS DateTime), NULL, 1, 1, 2)
INSERT [dbo].[UserTask] ([ID], [parentTaskID], [name], [description], [ruleID], [fromDate], [toDate], [createDate], [updateDate], [createUser], [statusID], [companyID], [responsible]) VALUES (12, NULL, N'jhkhg', N'cjgcg', 1, CAST(0x0000A24D00000000 AS DateTime), CAST(0x0000A24E00000000 AS DateTime), NULL, NULL, 2, 1, 1, 2)
SET IDENTITY_INSERT [dbo].[UserTask] OFF
SET IDENTITY_INSERT [dbo].[View] ON 

INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (740, N'Cuentas de Usuario-(Registrar)', 98, N'Register-AccountController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (741, N'Cuentas de Usuario-(Ver Detalles)', 99, N'Details-AccountController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (742, N'Cuentas de Usuario-(Eliminar)', 100, N'Disassociate-AccountController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (743, N'Cuentas de Usuario-(Editar)', 101, N'Manage-AccountController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (744, N'Base Legal-(Pagina Principal)', 102, N'Index-BaseLegalController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (745, N'Base Legal-(Crear)', 103, N'Create-BaseLegalController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (746, N'Base Legal-(Editar)', 104, N'Edit-BaseLegalController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (747, N'Base Legal-(Eliminar)', 105, N'Delete-BaseLegalController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (748, N'Compañia-(Pagina Principal)', 106, N'Index-CompanyController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (749, N'Compañia-(Ver Detalles)', 107, N'Details-CompanyController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (750, N'Compañia-(Crear)', 108, N'Create-CompanyController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (751, N'Compañia-(Editar)', 109, N'Edit-CompanyController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (752, N'Compañia-(Eliminar)', 110, N'Delete-CompanyController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (753, N'Departamentos-(Pagina Principal)', 111, N'Index-DepartmentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (754, N'Departamentos-(Ver Detalles)', 112, N'Details-DepartmentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (755, N'Departamentos-(Crear)', 113, N'Create-DepartmentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (756, N'Departamentos-(Editar)', 114, N'Edit-DepartmentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (757, N'Departamentos-(Eliminar)', 115, N'Delete-DepartmentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (758, N'Tipos de documentos-(Pagina Principal)', 116, N'Index-DocTypeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (759, N'Tipos de documentos-(Ver Detalles)', 117, N'Details-DocTypeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (760, N'Tipos de documentos-(Crear)', 118, N'Create-DocTypeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (761, N'Tipos de documentos-(Editar)', 119, N'Edit-DocTypeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (762, N'Tipos de documentos-(Eliminar)', 120, N'Delete-DocTypeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (763, N'Documentos-(Pagina Principal)', 121, N'Index-DocumentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (764, N'Documentos-(Ver Detalles)', 122, N'Details-DocumentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (765, N'Documentos-(Crear)', 123, N'Create-DocumentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (766, N'Documentos-(Editar)', 124, N'Edit-DocumentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (767, N'Documentos-(Eliminar)', 125, N'Delete-DocumentController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (768, N'Glosario-(Pagina Principal)', 126, N'Index-GlossaryController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (769, N'Glosario-(Ver Detalles)', 127, N'Details-GlossaryController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (770, N'Glosario-(Crear)', 128, N'Create-GlossaryController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (771, N'Glosario-(Editar)', 129, N'Edit-GlossaryController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (772, N'Glosario-(Eliminar)', 130, N'Delete-GlossaryController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (773, N'Pagina Principal-(Pagina Principal)', 131, N'Index-HomeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (774, N'Pagina Principal-(Acerca De)', 132, N'About-HomeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (775, N'Pagina Principal-(Contactar)', 133, N'Contact-HomeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (776, N'Manuales-(Pagina Principal)', 134, N'Index-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (777, N'Manuales-(Crear)', 135, N'Create-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (778, N'Manuales-(Editar)', 136, N'Edit-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (779, N'Manuales-(Crear Sub Documento)', 137, N'CreateChild-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (780, N'Manuales-(Editar Sub Documento)', 138, N'EditChild-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (781, N'Manuales-(Eliminar Sub Documento)', 139, N'DeleteChild-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (782, N'Objetivos-(Pagina Principal)', 140, N'Index-ObjectivesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (783, N'Objetivos-(Crear)', 141, N'Create-ObjectivesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (784, N'Permisos-(Editar)', 142, N'Edit-PermissionsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (785, N'Politicas-(Pagina Principal)', 143, N'Index-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (786, N'Politicas-(Crear)', 144, N'Create-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (787, N'Politicas-(Editar)', 145, N'Edit-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (788, N'Politicas-(Crear Sub Documento)', 146, N'CreateChild-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (789, N'Politicas-(Editar Sub Documento)', 147, N'EditChild-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (790, N'Politicas-(Eliminar Sub Documento)', 148, N'DeleteChild-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (791, N'Proposito-(Pagina Principal)', 149, N'Index-PurposeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (792, N'Proposito-(Editar)', 150, N'Edit-PurposeController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (793, N'Roles-(Pagina Principal)', 151, N'Index-RolesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (794, N'Roles-(Ver Detalles)', 152, N'Details-RolesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (795, N'Roles-(Crear)', 153, N'Create-RolesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (796, N'Roles-(Editar)', 154, N'Edit-RolesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (797, N'Roles-(Eliminar)', 155, N'Delete-RolesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (798, N'Normas-(Pagina Principal)', 156, N'Index-RulesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (799, N'Normas-(Ver Detalles)', 157, N'Details-RulesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (800, N'Normas-(Crear)', 158, N'Create-RulesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (801, N'Normas-(Editar)', 159, N'Edit-RulesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (802, N'Normas-(Eliminar)', 160, N'Delete-RulesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (803, N'Estatus-(Pagina Principal)', 161, N'Index-StatusController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (804, N'Estatus-(Ver Detalles)', 162, N'Details-StatusController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (805, N'Estatus-(Crear)', 163, N'Create-StatusController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (806, N'Estatus-(Editar)', 164, N'Edit-StatusController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (807, N'Estatus-(Eliminar)', 165, N'Delete-StatusController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (808, N'-(Pagina Principal)', 166, N'Index-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (809, N'-(Crear)', 167, N'Create-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (810, N'-(Editar)', 168, N'Edit-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (811, N'-(Eliminar)', 169, N'Delete-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (812, N'TaskController-(Index)', 170, N'Index-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (813, N'TaskController-(Details)', 171, N'Details-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (814, N'TaskController-(Create)', 172, N'Create-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (815, N'TaskController-(CreateChildTask)', 173, N'CreateChildTask-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (816, N'TaskController-(Edit)', 174, N'Edit-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (817, N'TaskController-(Delete)', 175, N'Delete-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (818, N'-(CreateChild)', 176, N'CreateChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (819, N'-(EditChild)', 177, N'EditChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (820, N'-(DeleteChild)', 178, N'DeleteChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (821, N'Menu-(Pagina Principal)', 166, N'Index-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (822, N'Menu-(Crear)', 167, N'Create-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (823, N'Menu-(Editar)', 168, N'Edit-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (824, N'Menu-(Eliminar)', 169, N'Delete-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (825, N'Tareas-(Index)', 170, N'Index-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (826, N'Tareas-(Details)', 171, N'Details-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (827, N'Tareas-(Create)', 172, N'Create-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (828, N'Tareas-(CreateChildTask)', 173, N'CreateChildTask-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (829, N'Tareas-(Edit)', 174, N'Edit-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (830, N'Tareas-(Delete)', 175, N'Delete-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (831, N'Menu-(CreateChild)', 176, N'CreateChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (832, N'Menu-(EditChild)', 177, N'EditChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (833, N'Menu-(DeleteChild)', 178, N'DeleteChild-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (834, N'Tareas-(Pagina Principal)', 170, N'Index-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (835, N'Tareas-(Ver Detalles)', 171, N'Details-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (836, N'Tareas-(Crear)', 172, N'Create-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (837, N'Tareas-(Crear Tarea)', 173, N'CreateChildTask-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (838, N'Tareas-(Editar)', 174, N'Edit-TaskController')
GO
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (839, N'Tareas-(Eliminar)', 175, N'Delete-TaskController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (840, N'Menu-(Administrar)', 179, N'admin-MenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (841, N'Editar-Objetivos', 180, N'Edit-ObjectivesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (842, N'Pagina Principal-Clientes', 181, N'Index-ClientsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (843, N'Ver Detalles-Clientes', 182, N'Details-ClientsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (844, N'Crear-Clientes', 183, N'Create-ClientsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (845, N'Editar-Clientes', 184, N'Edit-ClientsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (846, N'Eliminar-Clientes', 185, N'Delete-ClientsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (847, N'Index-ProcessController', 186, N'Index-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (848, N'Details-ProcessController', 187, N'Details-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (849, N'Create-ProcessController', 188, N'Create-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (850, N'Edit-ProcessController', 189, N'Edit-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (851, N'Delete-ProcessController', 190, N'Delete-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (852, N'Create-InstructionTasksController', 191, N'Create-InstructionTasksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (853, N'Edit-InstructionTasksController', 192, N'Edit-InstructionTasksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (854, N'Delete-InstructionTasksController', 193, N'Delete-InstructionTasksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (855, N'Index-InstructionWorksController', 194, N'Index-InstructionWorksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (856, N'Details-InstructionWorksController', 195, N'Details-InstructionWorksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (857, N'Create-InstructionWorksController', 196, N'Create-InstructionWorksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (858, N'Edit-InstructionWorksController', 197, N'Edit-InstructionWorksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (859, N'Delete-InstructionWorksController', 198, N'Delete-InstructionWorksController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (860, N'Index-ProceduresController', 199, N'Index-ProceduresController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (861, N'Details-ProceduresController', 200, N'Details-ProceduresController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (862, N'Create-ProceduresController', 201, N'Create-ProceduresController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (863, N'Edit-ProceduresController', 202, N'Edit-ProceduresController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (864, N'Delete-ProceduresController', 203, N'Delete-ProceduresController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (865, N'AssociatedDocuments-ProcessController', 204, N'AssociatedDocuments-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (866, N'DeleteAssociatedDocuments-ProcessController', 205, N'DeleteAssociatedDocuments-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (867, N'Delete-Manuales', 206, N'Delete-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (868, N'Details-Manuales', 207, N'Details-ManualController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (869, N'Delete-Objetivos', 208, N'Delete-ObjectivesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (870, N'Delete-Politicas', 209, N'Delete-PoliciesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (871, N'Index-SubMenuController', 210, N'Index-SubMenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (872, N'Details-SubMenuController', 211, N'Details-SubMenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (873, N'Create-SubMenuController', 212, N'Create-SubMenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (874, N'Edit-SubMenuController', 213, N'Edit-SubMenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (875, N'Delete-SubMenuController', 214, N'Delete-SubMenuController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (876, N'EditAccount-Cuentas de Usuario', 215, N'EditAccount-AccountController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (1876, N'Details-Objetivos', 1215, N'Details-ObjectivesController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (1877, N'Index-UsersController', 1216, N'Index-UsersController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (1878, N'Details-UsersController', 1217, N'Details-UsersController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (1879, N'Edit-UsersController', 1218, N'Edit-UsersController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (1880, N'EditAssociatedDocument-Procesos', 1219, N'EditAssociatedDocument-ProcessController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2880, N'Index-PlanController', 2219, N'Index-PlanController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2881, N'Details-PlanController', 2220, N'Details-PlanController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2882, N'Create-PlanController', 2221, N'Create-PlanController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2883, N'Edit-PlanController', 2222, N'Edit-PlanController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2884, N'Delete-PlanController', 2223, N'Delete-PlanController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2885, N'Index-FormsController', 2224, N'Index-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2886, N'Details-FormsController', 2225, N'Details-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2887, N'Create-FormsController', 2226, N'Create-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2888, N'Edit-FormsController', 2227, N'Edit-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2889, N'Delete-FormsController', 2228, N'Delete-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2890, N'AddField-FormsController', 2229, N'AddField-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2891, N'EditField-FormsController', 2230, N'EditField-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2892, N'DeleteField-FormsController', 2231, N'DeleteField-FormsController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2893, N'Index-IndicatorController', 2232, N'Index-IndicatorController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2894, N'Details-IndicatorController', 2233, N'Details-IndicatorController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2895, N'Create-IndicatorController', 2234, N'Create-IndicatorController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2896, N'Edit-IndicatorController', 2235, N'Edit-IndicatorController')
INSERT [dbo].[View] ([ID], [name], [actionID], [description]) VALUES (2897, N'Delete-IndicatorController', 2236, N'Delete-IndicatorController')
SET IDENTITY_INSERT [dbo].[View] OFF
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (2, CAST(0x0000A21401377DE5 AS DateTime), NULL, 1, CAST(0x0000A24900DE37C1 AS DateTime), 0, N'AAuWo8HOV7bbv6rZwYUNgnnw1kBRocyB1ec2mxRhEzbgyVsIjm+lYhXqbTtjbzYbTg==', CAST(0x0000A21401377DE5 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (3, CAST(0x0000A214013E2819 AS DateTime), NULL, 1, NULL, 0, N'AM2aWfYiewErXYt1c2pJ44IJownSYz2UtrNhgrpA3lhdBIEv+cYcFpnB5dMXMJEi/g==', CAST(0x0000A214013E2819 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (4, CAST(0x0000A21501236990 AS DateTime), NULL, 1, NULL, 0, N'AFBJjyX7OCum4njT744Xhds+uEiQ/YX5Uc2FBSGAHrPvA/RTIsdA2y/+VwHGO/rKsQ==', CAST(0x0000A21501236990 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (5, CAST(0x0000A21A01584FE3 AS DateTime), NULL, 1, NULL, 0, N'AOHX8+ToDk9hQcGfkzhmE5HB1MWoTym7hV5M9/FEko+wI1UUwNIoSgU6V/JTcT0aEA==', CAST(0x0000A21A01584FE3 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (6, CAST(0x0000A21A016098C7 AS DateTime), NULL, 1, NULL, 0, N'APUaU5XLgy5By2ZCImNit5AyGaQmTd9LD+9hAw/PS2lGigL1kpS38noRr5T1GbFe+w==', CAST(0x0000A21A016098C7 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (7, CAST(0x0000A22F0152BC7D AS DateTime), NULL, 1, NULL, 0, N'AN3msFb76EOdNgkSENaWQiNdgpHDIekqm9ldbZjk0v+Uc6OrCMSdyT2sCsLwIPn5Gw==', CAST(0x0000A22F0152BC7D AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (8, CAST(0x0000A23100DBB0C9 AS DateTime), NULL, 1, NULL, 0, N'AHZkvhK6rcFXhTrM9Zts8Ify6aAByrBhjm50tEj0qpnvzJ9q70I1HFhUVg+3RVISPw==', CAST(0x0000A23100DBB0C9 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (9, CAST(0x0000A23100DC7B6F AS DateTime), NULL, 1, NULL, 0, N'AC6d1H74t2HMPZM9FY5G9BZjxDfOQfRABZeoJj9WUBHTifK/jchOvj539zk8Q7KPmQ==', CAST(0x0000A23100DC7B6F AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (10, CAST(0x0000A23400EBE773 AS DateTime), NULL, 1, NULL, 0, N'AOXkL/7T6sbbP/DG4wn3hn0MTS9U/3iKDvmVW5Tv9PqlIsNashbd2ELcPe+uMCTGXQ==', CAST(0x0000A23400EBE773 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (11, CAST(0x0000A23B00E7005B AS DateTime), NULL, 1, NULL, 0, N'APkPCnJILxo9y7UlRkG02WZRJwPUIKlzEn3XdECywJ65vOZaJbr7AlI1ugfGWAuD6Q==', CAST(0x0000A23B00E7005B AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (12, CAST(0x0000A24200F4C562 AS DateTime), NULL, 1, NULL, 0, N'AEm9mQIf/3LYM6eczugdWL3aieZLH9UTgi1bc3lMZhVGqpjxYKI5/CVmRIZhUvBGWA==', CAST(0x0000A24200F4C562 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (13, CAST(0x0000A24200F6FAF5 AS DateTime), NULL, 1, NULL, 0, N'ALxzHeNbDpPUfAzAnPn8yO3NY63x3P/2L/vzMnu4XTJ+fWlCz/I9N6c49yNU5HybXg==', CAST(0x0000A24200F6FAF5 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (14, CAST(0x0000A24200F7A911 AS DateTime), NULL, 1, NULL, 0, N'ALpA9wfE6YcihFibhJQyajiodvsRB3dwE+ZL6DF8H5GKUMmf1cCrq1Rv1cyEZgsWEA==', CAST(0x0000A24200F7A911 AS DateTime), N'', NULL, NULL)
INSERT [dbo].[Webpages_Membership] ([UserID], [CreateDate], [ConfirmationToken], [IsConfirmed], [LastPasswordFailureDate], [PasswordFailuresSinceLastSuccess], [Password], [PasswordChangedDate], [PasswordSalt], [PasswordVerificationToken], [PasswordVerificationTokenExpirationDate]) VALUES (15, CAST(0x0000A24601458F52 AS DateTime), NULL, 1, NULL, 0, N'AOdjVsD2UVL1P+lGlekgsdbTFp7ZAC14/y32/GdCe159FbYdrLs9JOSkL98c45vPYg==', CAST(0x0000A24601458F52 AS DateTime), N'', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Webpages_Roles] ON 

INSERT [dbo].[Webpages_Roles] ([RoleID], [RoleName], [RoleDescription]) VALUES (1, N'Administrators', N'Rol de administradores del sistema')
INSERT [dbo].[Webpages_Roles] ([RoleID], [RoleName], [RoleDescription]) VALUES (2, N'Programadores', N'Programadores')
INSERT [dbo].[Webpages_Roles] ([RoleID], [RoleName], [RoleDescription]) VALUES (3, N'Caja', N'Caja')
SET IDENTITY_INSERT [dbo].[Webpages_Roles] OFF
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (2, 1)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (3, 2)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (4, 2)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (5, 3)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (6, 2)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (7, 1)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (10, 1)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (11, 1)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (14, 1)
INSERT [dbo].[Webpages_UsersInRoles] ([UserID], [RoleID]) VALUES (14, 3)
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Audit_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Audit_name] ON [dbo].[Audit]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_AuditPlans_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_AuditPlans_name] ON [dbo].[AuditPlans]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Category_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Category_name] ON [dbo].[Category]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Company]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Company] ON [dbo].[Company]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Department_Name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Department_Name] ON [dbo].[Department]
(
	[name] ASC,
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Document_Title]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Document_Title] ON [dbo].[Document]
(
	[title] ASC,
	[documentTypeID] ASC,
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_DocumentType_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_DocumentType_name] ON [dbo].[DocumentType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Entity_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Entity_name] ON [dbo].[Entity]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Form_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Form_name] ON [dbo].[Form]
(
	[name] ASC,
	[companyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_FormField_label]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE NONCLUSTERED INDEX [UK_FormField_label] ON [dbo].[FormField]
(
	[formID] ASC,
	[question] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_FormFieldOption_label]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_FormFieldOption_label] ON [dbo].[FormFieldOption]
(
	[formFieldID] ASC,
	[label] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Glossary_term]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Glossary_term] ON [dbo].[Glossary]
(
	[term] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Indicator_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Indicator_name] ON [dbo].[Indicator]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_InstructionWorks_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_InstructionWorks_name] ON [dbo].[InstructionWorks]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Menu_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Menu_name] ON [dbo].[Menu]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [nameUnique]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [nameUnique] ON [dbo].[Period]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Plan_code]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Plan_code] ON [dbo].[Plan]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Plan_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Plan_name] ON [dbo].[Plan]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Poll_code]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Poll_code] ON [dbo].[Poll]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Poll_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Poll_name] ON [dbo].[Poll]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Position_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Position_name] ON [dbo].[Position]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Procedure_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Procedure_name] ON [dbo].[Procedure]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Process_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Process_name] ON [dbo].[Process]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_ProcessType_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_ProcessType_name] ON [dbo].[ProcessType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Question_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Question_name] ON [dbo].[Question]
(
	[pollID] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_QuestionType_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_QuestionType_name] ON [dbo].[QuestionType]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Rules_code]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Rules_code] ON [dbo].[Rules]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_Status_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Status_name] ON [dbo].[Status]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SubCategory_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_SubCategory_name] ON [dbo].[Subcategory]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_SubMenu_name]    Script Date: 14/10/13 8:44:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_SubMenu_name] ON [dbo].[SubMenu]
(
	[menuID] ASC,
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UK_User_username]    Script Date: 14/10/13 8:44:57 a. m. ******/
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [UK_User_username] UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Action] ADD  CONSTRAINT [DFActionIsView]  DEFAULT ((0)) FOR [isView]
GO
ALTER TABLE [dbo].[Action] ADD  CONSTRAINT [DFActionDisplayName]  DEFAULT (N'') FOR [displayName]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DFAdvertisementCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Advertisement] ADD  CONSTRAINT [DFAdvertisementUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Audit] ADD  CONSTRAINT [DFAuditCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Audit] ADD  CONSTRAINT [DFAuditUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[AuditMeeting] ADD  CONSTRAINT [DF_AuditMeeting_isOpening]  DEFAULT ((1)) FOR [isOpening]
GO
ALTER TABLE [dbo].[AuditPlans] ADD  CONSTRAINT [DFAuditPlansCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[AuditPlans] ADD  CONSTRAINT [DFAuditPlansUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DFCategoriaFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Category] ADD  CONSTRAINT [DFCategoriaFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DFDepartamentoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Department] ADD  CONSTRAINT [DFDepartamentoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DFDocumentoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DFDocumentoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Document] ADD  CONSTRAINT [DFDocumentStatusID]  DEFAULT ((1)) FOR [statusID]
GO
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DFTipoDocumentoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[DocumentType] ADD  CONSTRAINT [DFTipoDocumentoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DFEntidadFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Entity] ADD  CONSTRAINT [DFEntidadFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DFFieldTypeMinLength]  DEFAULT ((0)) FOR [minLength]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DFFieldTypeMaxLength]  DEFAULT ((500)) FOR [maxLength]
GO
ALTER TABLE [dbo].[FieldType] ADD  CONSTRAINT [DFFieldTypeMultiOptions]  DEFAULT ((0)) FOR [multiOptions]
GO
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [DFFormCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [DFFormUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Form] ADD  CONSTRAINT [DF_Form_version]  DEFAULT ((1)) FOR [version]
GO
ALTER TABLE [dbo].[FormField] ADD  CONSTRAINT [DFFormFieldRequired]  DEFAULT ((0)) FOR [required]
GO
ALTER TABLE [dbo].[Glossary] ADD  CONSTRAINT [DFGlosarioFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Glossary] ADD  CONSTRAINT [DFGlosarioFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[HistDocument] ADD  CONSTRAINT [DFHistDocumentCreateDate]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistForm] ADD  CONSTRAINT [DK_HistForm_DateAdded]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistInstructionWorks] ADD  CONSTRAINT [DF_HistInstructionWorks_dateAdded]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistPlan] ADD  CONSTRAINT [DF_HistPlan_dateAdded]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistPoll] ADD  CONSTRAINT [DFHistPollCreateDate]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistProcedure] ADD  CONSTRAINT [DF__HistProce__dateA__59C55456]  DEFAULT (getdate()) FOR [dateAdd]
GO
ALTER TABLE [dbo].[HistProcess] ADD  CONSTRAINT [DFHistProcessCreateDate]  DEFAULT (getdate()) FOR [dateAdded]
GO
ALTER TABLE [dbo].[HistRules] ADD  CONSTRAINT [DFHistNormaFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[HistRules] ADD  CONSTRAINT [DFHistNormaFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Indicator] ADD  CONSTRAINT [DFIndicadorFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Indicator] ADD  CONSTRAINT [DFIndicadorFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Indicator] ADD  CONSTRAINT [DF_Indicator_version]  DEFAULT ((1)) FOR [version]
GO
ALTER TABLE [dbo].[Infrastructure] ADD  CONSTRAINT [DFInfraestructuraFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Infrastructure] ADD  CONSTRAINT [DFInfraestructuraFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[InstructionWorks] ADD  CONSTRAINT [DFInstTrabajoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[InstructionWorks] ADD  CONSTRAINT [DFInstTrabajoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Option] ADD  CONSTRAINT [DFOptionCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Option] ADD  CONSTRAINT [DFOptionUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Period] ADD  CONSTRAINT [DFPeriodoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Period] ADD  CONSTRAINT [DFPeriodoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DFPlanCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Plan] ADD  CONSTRAINT [DFPlanUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Poll] ADD  CONSTRAINT [DFPollCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Poll] ADD  CONSTRAINT [DFPollUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Procedure] ADD  CONSTRAINT [DF_Procedure_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[ProcedureActivities] ADD  CONSTRAINT [DF_ProcedureActivities_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Process] ADD  CONSTRAINT [DFProcesoFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Process] ADD  CONSTRAINT [DFProcesoFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[ProcessDocuments] ADD  CONSTRAINT [DF_ProcessDocuments_ISORequirement]  DEFAULT ((0)) FOR [ISORequirement]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DFQuestionCreateDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Question] ADD  CONSTRAINT [DFQuestionUpdateDate]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Rules] ADD  CONSTRAINT [DFNormaFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Rules] ADD  CONSTRAINT [DFNormaFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DFStatusFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Status] ADD  CONSTRAINT [DFStatusFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Subcategory] ADD  CONSTRAINT [DFSubcategoriaFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Subcategory] ADD  CONSTRAINT [DFSubcategoriaFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [DFTareaFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Task] ADD  CONSTRAINT [DFTareaFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[TemplateFields] ADD  CONSTRAINT [DFTemplateFieldsIsDefault]  DEFAULT ((0)) FOR [isDefault]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_status]  DEFAULT ((1)) FOR [status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DFUsuarioFechaCreacion]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DFUsuarioFechaModificacion]  DEFAULT (getdate()) FOR [updateDate]
GO
ALTER TABLE [dbo].[UserTask] ADD  CONSTRAINT [DF_UserTask_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_Controller] FOREIGN KEY([controllerID])
REFERENCES [dbo].[Controller] ([ID])
GO
ALTER TABLE [dbo].[Action] CHECK CONSTRAINT [FK_Action_Controller]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FK_Advertisement_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FK_Advertisement_Company]
GO
ALTER TABLE [dbo].[Advertisement]  WITH CHECK ADD  CONSTRAINT [FKAdvertisementUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Advertisement] CHECK CONSTRAINT [FKAdvertisementUser]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_AuditStage] FOREIGN KEY([stageID])
REFERENCES [dbo].[AuditStage] ([ID])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_AuditStage]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_AuditType] FOREIGN KEY([auditTypeID])
REFERENCES [dbo].[AuditType] ([ID])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_AuditType]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_Company]
GO
ALTER TABLE [dbo].[Audit]  WITH CHECK ADD  CONSTRAINT [FK_Audit_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Audit] CHECK CONSTRAINT [FK_Audit_User]
GO
ALTER TABLE [dbo].[AuditAuditors]  WITH CHECK ADD  CONSTRAINT [FK_AuditAuditors_Audit] FOREIGN KEY([auditID])
REFERENCES [dbo].[Audit] ([ID])
GO
ALTER TABLE [dbo].[AuditAuditors] CHECK CONSTRAINT [FK_AuditAuditors_Audit]
GO
ALTER TABLE [dbo].[AuditAuditors]  WITH CHECK ADD  CONSTRAINT [FK_AuditAuditors_AuditAuditorRole] FOREIGN KEY([auditAuditorRoleID])
REFERENCES [dbo].[AuditAuditorRole] ([ID])
GO
ALTER TABLE [dbo].[AuditAuditors] CHECK CONSTRAINT [FK_AuditAuditors_AuditAuditorRole]
GO
ALTER TABLE [dbo].[AuditAuditors]  WITH CHECK ADD  CONSTRAINT [FK_AuditAuditors_User] FOREIGN KEY([auditor])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AuditAuditors] CHECK CONSTRAINT [FK_AuditAuditors_User]
GO
ALTER TABLE [dbo].[AuditDocuments]  WITH CHECK ADD  CONSTRAINT [FK_AuditDocuments_Audit] FOREIGN KEY([auditID])
REFERENCES [dbo].[Audit] ([ID])
GO
ALTER TABLE [dbo].[AuditDocuments] CHECK CONSTRAINT [FK_AuditDocuments_Audit]
GO
ALTER TABLE [dbo].[AuditDocuments]  WITH CHECK ADD  CONSTRAINT [FK_AuditDocuments_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[AuditDocuments] CHECK CONSTRAINT [FK_AuditDocuments_Document]
GO
ALTER TABLE [dbo].[AuditMeeting]  WITH CHECK ADD  CONSTRAINT [FK_AuditMeeting_Audit] FOREIGN KEY([auditID])
REFERENCES [dbo].[Audit] ([ID])
GO
ALTER TABLE [dbo].[AuditMeeting] CHECK CONSTRAINT [FK_AuditMeeting_Audit]
GO
ALTER TABLE [dbo].[AuditMeetingParticipants]  WITH CHECK ADD  CONSTRAINT [FK_AuditMeetingParticipants_AuditMeeting] FOREIGN KEY([auditMeetingID])
REFERENCES [dbo].[AuditMeeting] ([ID])
GO
ALTER TABLE [dbo].[AuditMeetingParticipants] CHECK CONSTRAINT [FK_AuditMeetingParticipants_AuditMeeting]
GO
ALTER TABLE [dbo].[AuditMeetingParticipants]  WITH CHECK ADD  CONSTRAINT [FK_AuditMeetingParticipants_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AuditMeetingParticipants] CHECK CONSTRAINT [FK_AuditMeetingParticipants_User]
GO
ALTER TABLE [dbo].[AuditPlanAuditors]  WITH CHECK ADD  CONSTRAINT [FK_AuditPlanAuditors_User] FOREIGN KEY([auditor])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AuditPlanAuditors] CHECK CONSTRAINT [FK_AuditPlanAuditors_User]
GO
ALTER TABLE [dbo].[AuditPlanResponsibles]  WITH CHECK ADD  CONSTRAINT [FKAuditPlanResponsiblesUser] FOREIGN KEY([responsible])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AuditPlanResponsibles] CHECK CONSTRAINT [FKAuditPlanResponsiblesUser]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FK_AuditPlans_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FK_AuditPlans_Company]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FK_AuditPlans_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FK_AuditPlans_Process]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FK_AuditPlans_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FK_AuditPlans_User]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FKAuditPlansAudit] FOREIGN KEY([auditID])
REFERENCES [dbo].[Audit] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FKAuditPlansAudit]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FKAuditPlansDepartment] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FKAuditPlansDepartment]
GO
ALTER TABLE [dbo].[AuditPlans]  WITH CHECK ADD  CONSTRAINT [FKAuditPlansProcessType1] FOREIGN KEY([processTypeID])
REFERENCES [dbo].[ProcessType] ([ID])
GO
ALTER TABLE [dbo].[AuditPlans] CHECK CONSTRAINT [FKAuditPlansProcessType1]
GO
ALTER TABLE [dbo].[AuditProcesses]  WITH CHECK ADD  CONSTRAINT [FKAuditProcessesAudit] FOREIGN KEY([auditID])
REFERENCES [dbo].[Audit] ([ID])
GO
ALTER TABLE [dbo].[AuditProcesses] CHECK CONSTRAINT [FKAuditProcessesAudit]
GO
ALTER TABLE [dbo].[AuditProcesses]  WITH CHECK ADD  CONSTRAINT [FKAuditProcessesDocument] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[AuditProcesses] CHECK CONSTRAINT [FKAuditProcessesDocument]
GO
ALTER TABLE [dbo].[AuditProcesses]  WITH CHECK ADD  CONSTRAINT [FKAuditProcessesProcessType] FOREIGN KEY([processTypeID])
REFERENCES [dbo].[ProcessType] ([ID])
GO
ALTER TABLE [dbo].[AuditProcesses] CHECK CONSTRAINT [FKAuditProcessesProcessType]
GO
ALTER TABLE [dbo].[AuditType]  WITH CHECK ADD  CONSTRAINT [FK_AuditType_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[AuditType] CHECK CONSTRAINT [FK_AuditType_Company]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_Company]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD  CONSTRAINT [FK_Category_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Category] CHECK CONSTRAINT [FK_Category_User]
GO
ALTER TABLE [dbo].[CompanyRules]  WITH CHECK ADD  CONSTRAINT [FK_CompanyRules_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[CompanyRules] CHECK CONSTRAINT [FK_CompanyRules_Company]
GO
ALTER TABLE [dbo].[CompanyRules]  WITH CHECK ADD  CONSTRAINT [FK_CompanyRules_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[CompanyRules] CHECK CONSTRAINT [FK_CompanyRules_Rules]
GO
ALTER TABLE [dbo].[Dashboard]  WITH CHECK ADD  CONSTRAINT [FKDashboardUser] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Dashboard] CHECK CONSTRAINT [FKDashboardUser]
GO
ALTER TABLE [dbo].[DashboardItems]  WITH CHECK ADD  CONSTRAINT [FKDashboardItemsDashboard] FOREIGN KEY([dashboardID])
REFERENCES [dbo].[Dashboard] ([ID])
GO
ALTER TABLE [dbo].[DashboardItems] CHECK CONSTRAINT [FKDashboardItemsDashboard]
GO
ALTER TABLE [dbo].[DeashboardItem]  WITH CHECK ADD  CONSTRAINT [FKDeashboardItemAction] FOREIGN KEY([actionID])
REFERENCES [dbo].[Action] ([ID])
GO
ALTER TABLE [dbo].[DeashboardItem] CHECK CONSTRAINT [FKDeashboardItemAction]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Company]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_DocumentType] FOREIGN KEY([documentTypeID])
REFERENCES [dbo].[DocumentType] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_DocumentType]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_Position] FOREIGN KEY([responsible])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_Position]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_Document_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_Document_User]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FK_ParentDocument_ParentDocument] FOREIGN KEY([documentParentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FK_ParentDocument_ParentDocument]
GO
ALTER TABLE [dbo].[Document]  WITH CHECK ADD  CONSTRAINT [FKDocumentStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Document] CHECK CONSTRAINT [FKDocumentStatus]
GO
ALTER TABLE [dbo].[DocumentRules]  WITH CHECK ADD  CONSTRAINT [FK_DocumentRules_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[DocumentRules] CHECK CONSTRAINT [FK_DocumentRules_Document]
GO
ALTER TABLE [dbo].[DocumentRules]  WITH CHECK ADD  CONSTRAINT [FK_DocumentRules_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[DocumentRules] CHECK CONSTRAINT [FK_DocumentRules_Rules]
GO
ALTER TABLE [dbo].[DocumentStatus]  WITH CHECK ADD  CONSTRAINT [FK_DocumentStatus_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[DocumentStatus] CHECK CONSTRAINT [FK_DocumentStatus_Document]
GO
ALTER TABLE [dbo].[DocumentStatus]  WITH CHECK ADD  CONSTRAINT [FK_DocumentStatus_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[DocumentStatus] CHECK CONSTRAINT [FK_DocumentStatus_Status]
GO
ALTER TABLE [dbo].[DocumentStatus]  WITH CHECK ADD  CONSTRAINT [FK_DocumentStatus_User] FOREIGN KEY([responsible])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[DocumentStatus] CHECK CONSTRAINT [FK_DocumentStatus_User]
GO
ALTER TABLE [dbo].[DocumentType]  WITH CHECK ADD  CONSTRAINT [FK_DocumentType_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[DocumentType] CHECK CONSTRAINT [FK_DocumentType_User]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_Company]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_EntityType] FOREIGN KEY([entityTypeID])
REFERENCES [dbo].[EntityType] ([ID])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_EntityType]
GO
ALTER TABLE [dbo].[Entity]  WITH CHECK ADD  CONSTRAINT [FK_Entity_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Entity] CHECK CONSTRAINT [FK_Entity_User]
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_Company]
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_Process]
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FK_Form_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FK_Form_Status]
GO
ALTER TABLE [dbo].[Form]  WITH CHECK ADD  CONSTRAINT [FKFormUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Form] CHECK CONSTRAINT [FKFormUser]
GO
ALTER TABLE [dbo].[FormField]  WITH CHECK ADD  CONSTRAINT [FK_FormField_Form] FOREIGN KEY([formID])
REFERENCES [dbo].[Form] ([ID])
GO
ALTER TABLE [dbo].[FormField] CHECK CONSTRAINT [FK_FormField_Form]
GO
ALTER TABLE [dbo].[FormField]  WITH CHECK ADD  CONSTRAINT [FKFormFieldFieldType] FOREIGN KEY([fieldTypeID])
REFERENCES [dbo].[FieldType] ([ID])
GO
ALTER TABLE [dbo].[FormField] CHECK CONSTRAINT [FKFormFieldFieldType]
GO
ALTER TABLE [dbo].[FormFieldOption]  WITH CHECK ADD  CONSTRAINT [FKFormFieldOptionFormField] FOREIGN KEY([formFieldID])
REFERENCES [dbo].[FormField] ([ID])
GO
ALTER TABLE [dbo].[FormFieldOption] CHECK CONSTRAINT [FKFormFieldOptionFormField]
GO
ALTER TABLE [dbo].[FormRecords]  WITH CHECK ADD  CONSTRAINT [FKFormRecordsFormField] FOREIGN KEY([formFieldID])
REFERENCES [dbo].[FormField] ([ID])
GO
ALTER TABLE [dbo].[FormRecords] CHECK CONSTRAINT [FKFormRecordsFormField]
GO
ALTER TABLE [dbo].[Glossary]  WITH CHECK ADD  CONSTRAINT [FK_Glossary_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Glossary] CHECK CONSTRAINT [FK_Glossary_Company]
GO
ALTER TABLE [dbo].[Glossary]  WITH CHECK ADD  CONSTRAINT [FK_Glossary_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Glossary] CHECK CONSTRAINT [FK_Glossary_User]
GO
ALTER TABLE [dbo].[GlossaryRules]  WITH CHECK ADD  CONSTRAINT [FKGlossaryRulesGlossary] FOREIGN KEY([glossaryID])
REFERENCES [dbo].[Glossary] ([ID])
GO
ALTER TABLE [dbo].[GlossaryRules] CHECK CONSTRAINT [FKGlossaryRulesGlossary]
GO
ALTER TABLE [dbo].[GlossaryRules]  WITH CHECK ADD  CONSTRAINT [FKGlossaryRulesRules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[GlossaryRules] CHECK CONSTRAINT [FKGlossaryRulesRules]
GO
ALTER TABLE [dbo].[HistInstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_HistInstructionWorks_InstructionWorks] FOREIGN KEY([ruleID], [processID], [instructionWorkID])
REFERENCES [dbo].[InstructionWorks] ([ruleID], [processID], [ID])
GO
ALTER TABLE [dbo].[HistInstructionWorks] CHECK CONSTRAINT [FK_HistInstructionWorks_InstructionWorks]
GO
ALTER TABLE [dbo].[HistPoll]  WITH CHECK ADD  CONSTRAINT [FK_HistPoll_Poll] FOREIGN KEY([pollID])
REFERENCES [dbo].[Poll] ([ID])
GO
ALTER TABLE [dbo].[HistPoll] CHECK CONSTRAINT [FK_HistPoll_Poll]
GO
ALTER TABLE [dbo].[HistPoll]  WITH CHECK ADD  CONSTRAINT [FK_HistPoll_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[HistPoll] CHECK CONSTRAINT [FK_HistPoll_Rules]
GO
ALTER TABLE [dbo].[HistPoll]  WITH CHECK ADD  CONSTRAINT [FK_HistPoll_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[HistPoll] CHECK CONSTRAINT [FK_HistPoll_User]
GO
ALTER TABLE [dbo].[HistProcess]  WITH CHECK ADD  CONSTRAINT [FK_HistProcess_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[HistProcess] CHECK CONSTRAINT [FK_HistProcess_Process]
GO
ALTER TABLE [dbo].[HistProcess]  WITH CHECK ADD  CONSTRAINT [FK_HistProcess_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[HistProcess] CHECK CONSTRAINT [FK_HistProcess_User]
GO
ALTER TABLE [dbo].[HistRules]  WITH CHECK ADD  CONSTRAINT [FK_HistRules_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[HistRules] CHECK CONSTRAINT [FK_HistRules_Document]
GO
ALTER TABLE [dbo].[HistRules]  WITH CHECK ADD  CONSTRAINT [FK_HistRules_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[HistRules] CHECK CONSTRAINT [FK_HistRules_Rules]
GO
ALTER TABLE [dbo].[HistRules]  WITH CHECK ADD  CONSTRAINT [FK_HistRules_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[HistRules] CHECK CONSTRAINT [FK_HistRules_User]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Company]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Period] FOREIGN KEY([periodID])
REFERENCES [dbo].[Period] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Period]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Position] FOREIGN KEY([responsibleOfGenerate])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Position]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Position1] FOREIGN KEY([responsableMonitor])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Position1]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Process]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_Rules]
GO
ALTER TABLE [dbo].[Indicator]  WITH CHECK ADD  CONSTRAINT [FK_Indicator_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Indicator] CHECK CONSTRAINT [FK_Indicator_User]
GO
ALTER TABLE [dbo].[IndicatorVariables]  WITH CHECK ADD  CONSTRAINT [FK_IndicatorVariables_Indicator] FOREIGN KEY([indicatorID])
REFERENCES [dbo].[Indicator] ([ID])
GO
ALTER TABLE [dbo].[IndicatorVariables] CHECK CONSTRAINT [FK_IndicatorVariables_Indicator]
GO
ALTER TABLE [dbo].[IndicatorVariables]  WITH CHECK ADD  CONSTRAINT [FKIndicatorVariablesFormField] FOREIGN KEY([formFieldID])
REFERENCES [dbo].[FormField] ([ID])
GO
ALTER TABLE [dbo].[IndicatorVariables] CHECK CONSTRAINT [FKIndicatorVariablesFormField]
GO
ALTER TABLE [dbo].[Infrastructure]  WITH CHECK ADD  CONSTRAINT [FK_Infrastructure_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Infrastructure] CHECK CONSTRAINT [FK_Infrastructure_Company]
GO
ALTER TABLE [dbo].[Infrastructure]  WITH CHECK ADD  CONSTRAINT [FK_Infrastructure_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Infrastructure] CHECK CONSTRAINT [FK_Infrastructure_User]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_Company]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_Department]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_Process]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_Rules]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_Status]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_User] FOREIGN KEY([responsible])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_User]
GO
ALTER TABLE [dbo].[InstructionWorks]  WITH CHECK ADD  CONSTRAINT [FK_InstructionWorks_User1] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[InstructionWorks] CHECK CONSTRAINT [FK_InstructionWorks_User1]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FK_Menu_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FK_Menu_Company]
GO
ALTER TABLE [dbo].[Menu]  WITH CHECK ADD  CONSTRAINT [FKMenuUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Menu] CHECK CONSTRAINT [FKMenuUser]
GO
ALTER TABLE [dbo].[ObjectiveResources]  WITH CHECK ADD  CONSTRAINT [FK_ObjectiveResources_PlanObjectives] FOREIGN KEY([objectiveID])
REFERENCES [dbo].[PlanObjectives] ([ID])
GO
ALTER TABLE [dbo].[ObjectiveResources] CHECK CONSTRAINT [FK_ObjectiveResources_PlanObjectives]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [FKOptionQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[Question] ([ID])
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [FKOptionQuestion]
GO
ALTER TABLE [dbo].[Option]  WITH CHECK ADD  CONSTRAINT [FKOptionUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Option] CHECK CONSTRAINT [FKOptionUser]
GO
ALTER TABLE [dbo].[Period]  WITH CHECK ADD  CONSTRAINT [FK_Period_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Period] CHECK CONSTRAINT [FK_Period_User]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Company]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FK_Plan_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FK_Plan_Process]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FKPlanPosition] FOREIGN KEY([responsible])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FKPlanPosition]
GO
ALTER TABLE [dbo].[Plan]  WITH CHECK ADD  CONSTRAINT [FKPlanUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Plan] CHECK CONSTRAINT [FKPlanUser]
GO
ALTER TABLE [dbo].[PlanObjectives]  WITH CHECK ADD  CONSTRAINT [FK_PlanObjectives_Plan] FOREIGN KEY([planID])
REFERENCES [dbo].[Plan] ([ID])
GO
ALTER TABLE [dbo].[PlanObjectives] CHECK CONSTRAINT [FK_PlanObjectives_Plan]
GO
ALTER TABLE [dbo].[PlanObjectives]  WITH CHECK ADD  CONSTRAINT [FK_PlanObjectives_Position] FOREIGN KEY([responsible])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[PlanObjectives] CHECK CONSTRAINT [FK_PlanObjectives_Position]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FK_Poll_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FK_Poll_Company]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FKPollRules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FKPollRules]
GO
ALTER TABLE [dbo].[Poll]  WITH CHECK ADD  CONSTRAINT [FKPollUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Poll] CHECK CONSTRAINT [FKPollUser]
GO
ALTER TABLE [dbo].[Position]  WITH CHECK ADD  CONSTRAINT [FK_Position_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Position] CHECK CONSTRAINT [FK_Position_Company]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_Procedure_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_Procedure_Company]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_Procedure_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_Procedure_Process]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_Procedure_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_Procedure_Status]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureInformation_Position] FOREIGN KEY([responsible])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_ProcedureInformation_Position]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureInformation_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_ProcedureInformation_Rules]
GO
ALTER TABLE [dbo].[Procedure]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureInformation_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Procedure] CHECK CONSTRAINT [FK_ProcedureInformation_User]
GO
ALTER TABLE [dbo].[ProcedureActivities]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureActivities_Procedure] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedure] ([ID])
GO
ALTER TABLE [dbo].[ProcedureActivities] CHECK CONSTRAINT [FK_ProcedureActivities_Procedure]
GO
ALTER TABLE [dbo].[ProcedureActivities]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureActivities_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ProcedureActivities] CHECK CONSTRAINT [FK_ProcedureActivities_User]
GO
ALTER TABLE [dbo].[ProcedureActivities]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureActivities_User1] FOREIGN KEY([responsible])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[ProcedureActivities] CHECK CONSTRAINT [FK_ProcedureActivities_User1]
GO
ALTER TABLE [dbo].[ProcedureAnnexes]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureDocuments_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[ProcedureAnnexes] CHECK CONSTRAINT [FK_ProcedureDocuments_Document]
GO
ALTER TABLE [dbo].[ProcedureAnnexes]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureDocuments_Procedure] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedure] ([ID])
GO
ALTER TABLE [dbo].[ProcedureAnnexes] CHECK CONSTRAINT [FK_ProcedureDocuments_Procedure]
GO
ALTER TABLE [dbo].[ProcedureGlossaries]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureGlossaries_Procedure] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedure] ([ID])
GO
ALTER TABLE [dbo].[ProcedureGlossaries] CHECK CONSTRAINT [FK_ProcedureGlossaries_Procedure]
GO
ALTER TABLE [dbo].[ProcedureGlossaries]  WITH CHECK ADD  CONSTRAINT [FKProcedureGlossaryGlossary] FOREIGN KEY([glossaryID])
REFERENCES [dbo].[Glossary] ([ID])
GO
ALTER TABLE [dbo].[ProcedureGlossaries] CHECK CONSTRAINT [FKProcedureGlossaryGlossary]
GO
ALTER TABLE [dbo].[ProcedureNormatives]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureNormatives_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[ProcedureNormatives] CHECK CONSTRAINT [FK_ProcedureNormatives_Document]
GO
ALTER TABLE [dbo].[ProcedureNormatives]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureNormatives_Procedure] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedure] ([ID])
GO
ALTER TABLE [dbo].[ProcedureNormatives] CHECK CONSTRAINT [FK_ProcedureNormatives_Procedure]
GO
ALTER TABLE [dbo].[ProcedureReferences]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureReferences_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[ProcedureReferences] CHECK CONSTRAINT [FK_ProcedureReferences_Document]
GO
ALTER TABLE [dbo].[ProcedureReferences]  WITH CHECK ADD  CONSTRAINT [FK_ProcedureReferences_Procedure] FOREIGN KEY([procedureID])
REFERENCES [dbo].[Procedure] ([ID])
GO
ALTER TABLE [dbo].[ProcedureReferences] CHECK CONSTRAINT [FK_ProcedureReferences_Procedure]
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD  CONSTRAINT [FK_Process_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Process] CHECK CONSTRAINT [FK_Process_Company]
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD  CONSTRAINT [FK_Process_Position] FOREIGN KEY([responsible])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[Process] CHECK CONSTRAINT [FK_Process_Position]
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD  CONSTRAINT [FK_Process_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[Process] CHECK CONSTRAINT [FK_Process_Status]
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD  CONSTRAINT [FK_Process_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Process] CHECK CONSTRAINT [FK_Process_User]
GO
ALTER TABLE [dbo].[Process]  WITH CHECK ADD  CONSTRAINT [FKProcessProcessType] FOREIGN KEY([processTypeID])
REFERENCES [dbo].[ProcessType] ([ID])
GO
ALTER TABLE [dbo].[Process] CHECK CONSTRAINT [FKProcessProcessType]
GO
ALTER TABLE [dbo].[ProcessDocuments]  WITH CHECK ADD  CONSTRAINT [FK_ProcessDocuments_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[ProcessDocuments] CHECK CONSTRAINT [FK_ProcessDocuments_Process]
GO
ALTER TABLE [dbo].[ProcessDocuments]  WITH CHECK ADD  CONSTRAINT [FKProcessDocumentsDocument] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[ProcessDocuments] CHECK CONSTRAINT [FKProcessDocumentsDocument]
GO
ALTER TABLE [dbo].[ProcessEntities]  WITH CHECK ADD  CONSTRAINT [FK_ProcessEntities_Entity] FOREIGN KEY([entityID])
REFERENCES [dbo].[Entity] ([ID])
GO
ALTER TABLE [dbo].[ProcessEntities] CHECK CONSTRAINT [FK_ProcessEntities_Entity]
GO
ALTER TABLE [dbo].[ProcessEntities]  WITH CHECK ADD  CONSTRAINT [FK_ProcessEntities_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[ProcessEntities] CHECK CONSTRAINT [FK_ProcessEntities_Process]
GO
ALTER TABLE [dbo].[ProcessRequirements]  WITH CHECK ADD  CONSTRAINT [FK_ProcessRequirements_Document] FOREIGN KEY([documentID])
REFERENCES [dbo].[Document] ([ID])
GO
ALTER TABLE [dbo].[ProcessRequirements] CHECK CONSTRAINT [FK_ProcessRequirements_Document]
GO
ALTER TABLE [dbo].[ProcessRequirements]  WITH CHECK ADD  CONSTRAINT [FK_ProcessRequirements_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[ProcessRequirements] CHECK CONSTRAINT [FK_ProcessRequirements_Process]
GO
ALTER TABLE [dbo].[ProcessResources]  WITH CHECK ADD  CONSTRAINT [FK_ProcessResources_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[ProcessResources] CHECK CONSTRAINT [FK_ProcessResources_Process]
GO
ALTER TABLE [dbo].[ProcessResources]  WITH CHECK ADD  CONSTRAINT [FK_ProcessResources_Subcategory] FOREIGN KEY([subcategoryID])
REFERENCES [dbo].[Subcategory] ([ID])
GO
ALTER TABLE [dbo].[ProcessResources] CHECK CONSTRAINT [FK_ProcessResources_Subcategory]
GO
ALTER TABLE [dbo].[ProcessRules]  WITH CHECK ADD  CONSTRAINT [FK_ProcessRules_Process] FOREIGN KEY([processID])
REFERENCES [dbo].[Process] ([ID])
GO
ALTER TABLE [dbo].[ProcessRules] CHECK CONSTRAINT [FK_ProcessRules_Process]
GO
ALTER TABLE [dbo].[ProcessRules]  WITH CHECK ADD  CONSTRAINT [FK_ProcessRules_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[ProcessRules] CHECK CONSTRAINT [FK_ProcessRules_Rules]
GO
ALTER TABLE [dbo].[ProcessType]  WITH CHECK ADD  CONSTRAINT [FK_ProcessType_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[ProcessType] CHECK CONSTRAINT [FK_ProcessType_Company]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FK_Question_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FK_Question_User]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FKQuestionPoll] FOREIGN KEY([pollID])
REFERENCES [dbo].[Poll] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FKQuestionPoll]
GO
ALTER TABLE [dbo].[Question]  WITH CHECK ADD  CONSTRAINT [FKQuestionQuestionType] FOREIGN KEY([questionTypeID])
REFERENCES [dbo].[QuestionType] ([ID])
GO
ALTER TABLE [dbo].[Question] CHECK CONSTRAINT [FKQuestionQuestionType]
GO
ALTER TABLE [dbo].[RolesActions]  WITH NOCHECK ADD  CONSTRAINT [FK_Roles_ActionsAction] FOREIGN KEY([ActionID])
REFERENCES [dbo].[Action] ([ID])
GO
ALTER TABLE [dbo].[RolesActions] NOCHECK CONSTRAINT [FK_Roles_ActionsAction]
GO
ALTER TABLE [dbo].[RolesActions]  WITH NOCHECK ADD  CONSTRAINT [FK_Roles_ActionsWebpages_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Webpages_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RolesActions] NOCHECK CONSTRAINT [FK_Roles_ActionsWebpages_Roles]
GO
ALTER TABLE [dbo].[RolesDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_Roles_DepartmentsDepartment] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[RolesDepartments] NOCHECK CONSTRAINT [FK_Roles_DepartmentsDepartment]
GO
ALTER TABLE [dbo].[RolesDepartments]  WITH NOCHECK ADD  CONSTRAINT [FK_Roles_DepartmentsWebpages_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Webpages_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RolesDepartments] NOCHECK CONSTRAINT [FK_Roles_DepartmentsWebpages_Roles]
GO
ALTER TABLE [dbo].[RolesStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_RolesStatusStatus] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[RolesStatus] NOCHECK CONSTRAINT [FK_RolesStatusStatus]
GO
ALTER TABLE [dbo].[RolesStatus]  WITH NOCHECK ADD  CONSTRAINT [FK_RolesStatusWebpages_Roles] FOREIGN KEY([roleID])
REFERENCES [dbo].[Webpages_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[RolesStatus] NOCHECK CONSTRAINT [FK_RolesStatusWebpages_Roles]
GO
ALTER TABLE [dbo].[Rules]  WITH CHECK ADD  CONSTRAINT [FK_Rules_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Rules] CHECK CONSTRAINT [FK_Rules_User]
GO
ALTER TABLE [dbo].[RuleTypeDocuments]  WITH CHECK ADD  CONSTRAINT [FK_RuleTypeDocuments_DocumentType] FOREIGN KEY([documentTypeID])
REFERENCES [dbo].[DocumentType] ([ID])
GO
ALTER TABLE [dbo].[RuleTypeDocuments] CHECK CONSTRAINT [FK_RuleTypeDocuments_DocumentType]
GO
ALTER TABLE [dbo].[RuleTypeDocuments]  WITH CHECK ADD  CONSTRAINT [FK_RuleTypeDocuments_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[RuleTypeDocuments] CHECK CONSTRAINT [FK_RuleTypeDocuments_Rules]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_Company]
GO
ALTER TABLE [dbo].[Status]  WITH CHECK ADD  CONSTRAINT [FK_Status_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Status] CHECK CONSTRAINT [FK_Status_User]
GO
ALTER TABLE [dbo].[Subcategory]  WITH CHECK ADD  CONSTRAINT [FK_Subcategory_Category] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Subcategory] CHECK CONSTRAINT [FK_Subcategory_Category]
GO
ALTER TABLE [dbo].[Subcategory]  WITH CHECK ADD  CONSTRAINT [FK_Subcategory_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Subcategory] CHECK CONSTRAINT [FK_Subcategory_User]
GO
ALTER TABLE [dbo].[SubMenu]  WITH CHECK ADD  CONSTRAINT [FKSubMenuMenu] FOREIGN KEY([menuID])
REFERENCES [dbo].[Menu] ([ID])
GO
ALTER TABLE [dbo].[SubMenu] CHECK CONSTRAINT [FKSubMenuMenu]
GO
ALTER TABLE [dbo].[SubMenu]  WITH CHECK ADD  CONSTRAINT [FKSubMenuView] FOREIGN KEY([viewID])
REFERENCES [dbo].[View] ([ID])
GO
ALTER TABLE [dbo].[SubMenu] CHECK CONSTRAINT [FKSubMenuView]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_InstructionWorks] FOREIGN KEY([ruleID], [processID], [workID])
REFERENCES [dbo].[InstructionWorks] ([ruleID], [processID], [ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_InstructionWorks]
GO
ALTER TABLE [dbo].[Task]  WITH CHECK ADD  CONSTRAINT [FK_Task_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Task] CHECK CONSTRAINT [FK_Task_User]
GO
ALTER TABLE [dbo].[Template]  WITH CHECK ADD  CONSTRAINT [FK_Template_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [FK_Template_Company]
GO
ALTER TABLE [dbo].[Template]  WITH CHECK ADD  CONSTRAINT [FKTemplateAction] FOREIGN KEY([actionID])
REFERENCES [dbo].[Action] ([ID])
GO
ALTER TABLE [dbo].[Template] CHECK CONSTRAINT [FKTemplateAction]
GO
ALTER TABLE [dbo].[TemplateFields]  WITH CHECK ADD  CONSTRAINT [FKTemplateFieldsTemplate] FOREIGN KEY([templateID])
REFERENCES [dbo].[Template] ([ID])
GO
ALTER TABLE [dbo].[TemplateFields] CHECK CONSTRAINT [FKTemplateFieldsTemplate]
GO
ALTER TABLE [dbo].[TemplateFields]  WITH CHECK ADD  CONSTRAINT [FKTemplateFieldsTemplateFieldType] FOREIGN KEY([templateFieldTypeID])
REFERENCES [dbo].[TemplateFieldType] ([ID])
GO
ALTER TABLE [dbo].[TemplateFields] CHECK CONSTRAINT [FKTemplateFieldsTemplateFieldType]
GO
ALTER TABLE [dbo].[TemplateFields]  WITH CHECK ADD  CONSTRAINT [FKTemplateFieldsUser] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[TemplateFields] CHECK CONSTRAINT [FKTemplateFieldsUser]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Company]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([departmentID])
REFERENCES [dbo].[Department] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FKUserPosition] FOREIGN KEY([positionID])
REFERENCES [dbo].[Position] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FKUserPosition]
GO
ALTER TABLE [dbo].[UserIndexColums]  WITH CHECK ADD  CONSTRAINT [FK_UserIndexColums_User] FOREIGN KEY([userID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserIndexColums] CHECK CONSTRAINT [FK_UserIndexColums_User]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_Company] FOREIGN KEY([companyID])
REFERENCES [dbo].[Company] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_Company]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_Rules] FOREIGN KEY([ruleID])
REFERENCES [dbo].[Rules] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_Rules]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_Status] FOREIGN KEY([statusID])
REFERENCES [dbo].[Status] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_Status]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_User] FOREIGN KEY([createUser])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_User]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_User1] FOREIGN KEY([responsible])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_User1]
GO
ALTER TABLE [dbo].[UserTask]  WITH CHECK ADD  CONSTRAINT [FK_UserTask_UserTask] FOREIGN KEY([parentTaskID])
REFERENCES [dbo].[UserTask] ([ID])
GO
ALTER TABLE [dbo].[UserTask] CHECK CONSTRAINT [FK_UserTask_UserTask]
GO
ALTER TABLE [dbo].[View]  WITH CHECK ADD  CONSTRAINT [FKViewAction] FOREIGN KEY([actionID])
REFERENCES [dbo].[Action] ([ID])
GO
ALTER TABLE [dbo].[View] CHECK CONSTRAINT [FKViewAction]
GO
ALTER TABLE [dbo].[Webpages_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FKWebpages_UsersInRolesUser] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([ID])
GO
ALTER TABLE [dbo].[Webpages_UsersInRoles] NOCHECK CONSTRAINT [FKWebpages_UsersInRolesUser]
GO
ALTER TABLE [dbo].[Webpages_UsersInRoles]  WITH NOCHECK ADD  CONSTRAINT [FKWebpages_UsersInRolesWebpages_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Webpages_Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Webpages_UsersInRoles] NOCHECK CONSTRAINT [FKWebpages_UsersInRolesWebpages_Roles]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vs_glossary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vs_glossary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Document"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 227
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 2130
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BaseLegal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_BaseLegal'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "PT"
            Begin Extent = 
               Top = 6
               Left = 246
               Bottom = 136
               Right = 416
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 3015
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Plan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_policies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_policies'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 213
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 6
               Left = 251
               Bottom = 136
               Right = 421
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Procedure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_Procedure'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "P"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "U"
            Begin Extent = 
               Top = 6
               Left = 288
               Bottom = 136
               Right = 458
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "D"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 208
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_process'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vw_process'
GO
USE [master]
GO
ALTER DATABASE [SAS] SET  READ_WRITE 
GO
