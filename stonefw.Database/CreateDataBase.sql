USE [master]
GO
/****** Object:  Database [stonefw2]    Script Date: 2015/8/31 9:22:33 ******/
CREATE DATABASE [stonefw2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'stonefw2', FILENAME = N'D:\Code\github\stone0090\stonefw\stonefw.Database\stonefw2.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'stonefw2_log', FILENAME = N'D:\Code\github\stone0090\stonefw\stonefw.Database\stonefw2_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [stonefw2] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [stonefw2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [stonefw2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [stonefw2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [stonefw2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [stonefw2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [stonefw2] SET ARITHABORT OFF 
GO
ALTER DATABASE [stonefw2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [stonefw2] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [stonefw2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [stonefw2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [stonefw2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [stonefw2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [stonefw2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [stonefw2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [stonefw2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [stonefw2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [stonefw2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [stonefw2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [stonefw2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [stonefw2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [stonefw2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [stonefw2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [stonefw2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [stonefw2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [stonefw2] SET RECOVERY FULL 
GO
ALTER DATABASE [stonefw2] SET  MULTI_USER 
GO
ALTER DATABASE [stonefw2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [stonefw2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [stonefw2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [stonefw2] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'stonefw2', N'ON'
GO
USE [stonefw2]
GO
/****** Object:  Table [dbo].[Bc_AutoCode]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_AutoCode](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Prefix] [varchar](20) NOT NULL,
	[DateFormat] [varchar](20) NOT NULL,
	[FuncPointId] [varchar](50) NOT NULL,
	[Digit] [int] NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[CurrentDate] [date] NOT NULL,
	[CurrentCode] [int] NOT NULL,
 CONSTRAINT [PK_AutoCodeSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_Group]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_Group](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Group] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_LogError]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_LogError](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[OpUrl] [varchar](500) NOT NULL,
	[OpTime] [datetime] NOT NULL,
	[OpHostAddress] [varchar](50) NOT NULL,
	[OpHostName] [varchar](50) NOT NULL,
	[OpUserAgent] [varchar](max) NOT NULL,
	[OpQueryString] [varchar](max) NOT NULL,
	[OpHttpMethod] [varchar](10) NOT NULL,
	[Message] [varchar](max) NOT NULL,
 CONSTRAINT [PK_LogError] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_Permission]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_Permission](
	[UserRoleId] [int] NOT NULL,
	[PermissionType] [int] NOT NULL,
	[ModuleId] [varchar](50) NOT NULL,
	[FuncPointId] [varchar](50) NOT NULL,
	[Permissions] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Bc_Permission] PRIMARY KEY CLUSTERED 
(
	[UserRoleId] ASC,
	[PermissionType] ASC,
	[ModuleId] ASC,
	[FuncPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_Role]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_UserInfo]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Bc_UserInfo](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NOT NULL,
	[UserAccount] [varchar](50) NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[Password] [varchar](500) NOT NULL,
	[Sex] [bit] NOT NULL,
	[OfficePhone] [varchar](50) NOT NULL,
	[MobilePhone] [varchar](50) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[ActivityFlag] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Bc_UserRole]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bc_UserRole](
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Bc_UserRole] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Cu_ContactPerson]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cu_ContactPerson](
	[CuId] [varchar](50) NOT NULL,
	[CpId] [int] IDENTITY(1,1) NOT NULL,
	[CpName] [varchar](50) NOT NULL,
	[Mobile] [varchar](50) NOT NULL,
	[Phone] [varchar](50) NOT NULL,
	[QQ] [varchar](50) NOT NULL,
	[WeChat] [varchar](50) NOT NULL,
	[Weibo] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Other] [varchar](50) NOT NULL,
	[Remark] [varchar](50) NOT NULL,
	[IsDefault] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Cu_ContactPerson] PRIMARY KEY CLUSTERED 
(
	[CpId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Cu_Customer]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Cu_Customer](
	[CuId] [varchar](50) NOT NULL,
	[CuName] [varchar](50) NOT NULL,
	[District] [varchar](50) NOT NULL,
	[Address] [varchar](50) NOT NULL,
	[Remark] [varchar](max) NOT NULL,
	[ActivityFlag] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Cu_Customer] PRIMARY KEY CLUSTERED 
(
	[CuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_EnumName]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_EnumName](
	[Type] [varchar](50) NOT NULL,
	[Value] [varchar](50) NOT NULL,
	[Name] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Sys_NameList] PRIMARY KEY CLUSTERED 
(
	[Type] ASC,
	[Value] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_GlobalSetting]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_GlobalSetting](
	[SysKey] [varchar](50) NOT NULL,
	[SysValue] [varchar](max) NOT NULL,
 CONSTRAINT [PK_SysSetting] PRIMARY KEY CLUSTERED 
(
	[SysKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Menu]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Menu](
	[MenuId] [int] IDENTITY(1,1) NOT NULL,
	[MenuName] [varchar](50) NOT NULL,
	[MenuLevel] [int] NOT NULL,
	[Seq] [int] NOT NULL,
	[FatherNode] [int] NOT NULL,
	[Description] [varchar](500) NOT NULL,
	[PageUrl] [varchar](500) NOT NULL,
	[UrlParameter] [varchar](500) NOT NULL,
	[ActivityFlag] [bit] NOT NULL,
	[DeleteFlag] [bit] NOT NULL,
 CONSTRAINT [PK_Menu] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_PageFuncPoint]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_PageFuncPoint](
	[PageUrl] [varchar](500) NOT NULL,
	[FuncPointId] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Sys_PageFuncPoint] PRIMARY KEY CLUSTERED 
(
	[PageUrl] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Relation]    Script Date: 2015/8/31 9:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Relation](
	[ModuleId] [varchar](50) NOT NULL,
	[FuncPointId] [varchar](50) NOT NULL,
	[Permissions] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Sys_MfpRelation] PRIMARY KEY CLUSTERED 
(
	[ModuleId] ASC,
	[FuncPointId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Bc_Group]  WITH CHECK ADD  CONSTRAINT [FK_Bc_Group_Bc_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Bc_Group] ([GroupId])
GO
ALTER TABLE [dbo].[Bc_Group] CHECK CONSTRAINT [FK_Bc_Group_Bc_Group]
GO
ALTER TABLE [dbo].[Bc_UserInfo]  WITH CHECK ADD  CONSTRAINT [FK_Bc_UserInfo_Bc_Group] FOREIGN KEY([GroupId])
REFERENCES [dbo].[Bc_Group] ([GroupId])
GO
ALTER TABLE [dbo].[Bc_UserInfo] CHECK CONSTRAINT [FK_Bc_UserInfo_Bc_Group]
GO
ALTER TABLE [dbo].[Bc_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Bc_UserRole_Bc_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Bc_Role] ([RoleId])
GO
ALTER TABLE [dbo].[Bc_UserRole] CHECK CONSTRAINT [FK_Bc_UserRole_Bc_Role]
GO
ALTER TABLE [dbo].[Bc_UserRole]  WITH CHECK ADD  CONSTRAINT [FK_Bc_UserRole_Bc_UserInfo] FOREIGN KEY([UserId])
REFERENCES [dbo].[Bc_UserInfo] ([UserId])
GO
ALTER TABLE [dbo].[Bc_UserRole] CHECK CONSTRAINT [FK_Bc_UserRole_Bc_UserInfo]
GO
ALTER TABLE [dbo].[Cu_ContactPerson]  WITH CHECK ADD  CONSTRAINT [FK_Cu_ContactPerson_Cu_Customer1] FOREIGN KEY([CuId])
REFERENCES [dbo].[Cu_Customer] ([CuId])
GO
ALTER TABLE [dbo].[Cu_ContactPerson] CHECK CONSTRAINT [FK_Cu_ContactPerson_Cu_Customer1]
GO
USE [master]
GO
ALTER DATABASE [stonefw2] SET  READ_WRITE 
GO
