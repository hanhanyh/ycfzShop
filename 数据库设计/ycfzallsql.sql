USE [master]
GO
/****** Object:  Database [ycfz]    Script Date: 2018/2/12 14:25:22 ******/
CREATE DATABASE [ycfz]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ycfz', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ycfz.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ycfz_log', FILENAME = N'D:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ycfz_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ycfz] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ycfz].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ycfz] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ycfz] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ycfz] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ycfz] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ycfz] SET ARITHABORT OFF 
GO
ALTER DATABASE [ycfz] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ycfz] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ycfz] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ycfz] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ycfz] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ycfz] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ycfz] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ycfz] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ycfz] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ycfz] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ycfz] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ycfz] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ycfz] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ycfz] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ycfz] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ycfz] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ycfz] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ycfz] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ycfz] SET  MULTI_USER 
GO
ALTER DATABASE [ycfz] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ycfz] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ycfz] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ycfz] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ycfz] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ycfz]
GO
/****** Object:  Table [dbo].[YC_Address]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_Address](
	[AID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](15) NOT NULL,
	[MailNumber] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_YC_ADDRESS] PRIMARY KEY CLUSTERED 
(
	[AID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_Goods]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_Goods](
	[GID] [int] IDENTITY(1,1) NOT NULL,
	[GTID] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[SCPrice] [money] NOT NULL,
	[CXPrice] [money] NOT NULL,
	[DesImg1Url] [nvarchar](50) NOT NULL,
	[DesImg2Url] [nvarchar](50) NOT NULL,
	[DesImg3Url] [nvarchar](50) NOT NULL,
	[DetailImages] [nvarchar](max) NOT NULL,
	[AllSize] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_YC_GOODS] PRIMARY KEY CLUSTERED 
(
	[GID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_GoodType]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_GoodType](
	[GTID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](200) NULL,
 CONSTRAINT [PK_YC_GOODTYPE] PRIMARY KEY CLUSTERED 
(
	[GTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_MoneyRecord]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_MoneyRecord](
	[MRID] [int] IDENTITY(1,1) NOT NULL,
	[UID] [int] NOT NULL,
	[RMoney] [money] NOT NULL,
	[RType] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_YC_MONEYRECORD] PRIMARY KEY CLUSTERED 
(
	[MRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_Order]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_Order](
	[OID] [int] IDENTITY(1,1) NOT NULL,
	[GID] [int] NOT NULL,
	[UID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Count] [int] NOT NULL,
	[isClosed] [int] NULL,
	[SendType] [nvarchar](20) NULL,
	[Address] [nvarchar](max) NOT NULL,
	[BuyTime] [datetime] NOT NULL,
	[SendTime] [datetime] NULL,
	[FinishedTime] [datetime] NULL,
	[GoodSize] [nvarchar](max) NOT NULL,
	[WayNumber] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_YC_ORDER] PRIMARY KEY CLUSTERED 
(
	[OID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_User]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_User](
	[UID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NULL,
	[NickName] [nvarchar](16) NULL,
	[PassWord] [nvarchar](32) NOT NULL,
	[Address] [nvarchar](50) NULL,
	[Sex] [int] NOT NULL,
	[Admin] [int] NOT NULL,
	[Phone] [nvarchar](15) NULL,
	[QQ] [nvarchar](11) NULL,
	[Enable] [int] NOT NULL,
	[headImg] [nvarchar](50) NULL,
	[Moneysum] [money] NOT NULL,
	[RegDateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YC_USER] PRIMARY KEY CLUSTERED 
(
	[UID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YC_WebSite]    Script Date: 2018/2/12 14:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YC_WebSite](
	[WID] [int] IDENTITY(1,1) NOT NULL,
	[WName] [nvarchar](50) NOT NULL,
	[LogoUrl] [nvarchar](100) NOT NULL,
	[LunboImgUrl] [nvarchar](max) NOT NULL,
	[CompanyDescription] [text] NOT NULL,
	[OurTeam] [text] NOT NULL,
	[ContactUs] [text] NOT NULL,
	[ContactUsWeChatImage] [nvarchar](50) NULL,
	[TodayMovieUrl] [nvarchar](50) NULL,
 CONSTRAINT [PK_YC_WEBSITE] PRIMARY KEY CLUSTERED 
(
	[WID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[YC_Address] ON 

INSERT [dbo].[YC_Address] ([AID], [UID], [Address], [Phone], [MailNumber], [Name]) VALUES (5, 1, N'四川水利', N'18381506390', N'614200', N'邱于涵')
SET IDENTITY_INSERT [dbo].[YC_Address] OFF
SET IDENTITY_INSERT [dbo].[YC_Goods] ON 

INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (1, 1, N'衣服', 555.0000, 222.0000, N'xx', N'xxx', N'xxx', N'xxxxxx', N'XL|XXL|M')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (3, 1, N'THETHING 涂鸦印花斜门襟长款女风衣', 1280.0000, 1280.0000, N'58985a3da22011720eb6555b6d59b9a0_90.jpg', N'a95083950a6b9909510d31fc6ff1e444_90.jpg', N'02e93a0152f0700eb929fb3ec51760bd12.jpg', N'<p>&nbsp;这是描述描述描述</p>', N'S|M|L')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (4, 5, N'steelsir 时尚黑色翻领流苏皮衣', 1099.0000, 1099.0000, N'520171225484127.jpg', N'1020171225484127.jpg', N'1220171225484127.jpg', N'<p>&nbsp;cdffdvfffffffffffffffffffffffff</p>', N'S|M|L')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (5, 5, N'steelsir 时尚长袖拼接宽松衬衫', 798.0000, 798.0000, N'pic120171226456610.jpg', N'pic220171226456610.jpg', N'pic320171226456610.jpg', N'<p>&nbsp;这是描述</p>', N'M|X|L')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (6, 5, N'MANGO 流苏翻领山羊皮夹克 棕色', 1990.0000, 1990.0000, N'620171227123952.jpg', N'pic320171227123952.jpg', N'pic120171227123952.jpg', N'<p>衣服简介</p>', N'X|X|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (7, 1, N'ickies 女士图案提花长袖毛衫', 599.0000, 599.0000, N'1520171227266067.jpg', N'1620171227266067.jpg', N'1420171227266067.jpg', N'<p>描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (8, 5, N'JOYRICH 图案印花卫衣（女款）', 899.0000, 899.0000, N'1520171227669772.jpg', N'1420171227669772.jpg', N'1620171227669772.jpg', N'<p>&nbsp;xx</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (9, 3, N'Hot Heart 翻领羊毛长款大衣', 999.0000, 999.0000, N'420171227382901.jpg', N'520171227382901.jpg', N'620171227382901.jpg', N'<p>&nbsp;这是描述&nbsp; 这是描述</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (10, 1, N'damooshu 萌趣印花翻领衬衣', 888.0000, 888.0000, N'920171227567157.jpg', N'1020171227567157.jpg', N'1220171227567157.jpg', N'<p>&nbsp;这是描述&nbsp; 这是描述</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (11, 7, N'Mee joan 冰山印花短羽绒服', 1788.0000, 1788.0000, N'1020171227752126.jpg', N'920171227752126.jpg', N'720171227752126.jpg', N'<p>&nbsp;这是测试数据</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (12, 7, N'steelsir 深色呢子西服马甲短裤套装', 1588.0000, 1588.0000, N'1620171227710964.jpg', N'1720171227710964.jpg', N'1220171227710964.jpg', N'<p>描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (13, 1, N'LUNA LIMITED 暗黑鱼尾连衣裙', 1233.0000, 1233.0000, N'120171227977133.jpg', N'2020171227977133.jpg', N'1720171227977133.jpg', N'<p>&nbsp;描述</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (14, 1, N'LOYDA 彩绘波纹印花蓬蓬裙', 1099.0000, 1099.0000, N'120171227868548.jpg', N'920171227868548.jpg', N'620171227868548.jpg', N'<p>&nbsp;描述</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (15, 1, N'花纳 压折灯笼袖连衣裙', 1699.0000, 1699.0000, N'102017122772322.jpg', N'122017122772322.jpg', N'122017122772322.jpg', N'<p>&nbsp;描述</p>', N'X|M|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (16, 1, N'Dear栗 吟游诗系列点纱长罩裙', 299.0000, 299.0000, N'22017122779385.jpg', N'12017122779385.jpg', N'32017122779385.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (18, 1, N'Dear栗 丝绒金刺绣一字领连衣裙', 599.0000, 599.0000, N'220171227490504.jpg', N'120171227490504.jpg', N'320171227490504.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (19, 1, N'MANGO 长袖碎花连衣裙', 899.0000, 899.0000, N'120171227934639.jpg', N'220171227934639.jpg', N'320171227934639.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (20, 1, N'BLACK JACK GIRL logo印花PU镶边大衣', 999.0000, 999.0000, N'220171227115963.jpg', N'120171227115963.jpg', N'320171227115963.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (21, 1, N'Dear栗 丝绒金刺绣一字领连衣裙', 599.0000, 599.0000, N'320171227650770.jpg', N'320171227650770.jpg', N'220171227650770.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (22, 1, N'Lazy oaf 小高领眼球图案印花卫衣', 929.0000, 929.0000, N'220171227887207.jpg', N'320171227887207.jpg', N'120171227887207.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (23, 1, N'banana baby 复古修身针织连衣裙 黑色', 599.0000, 599.0000, N'120171227318854.jpg', N'220171227318854.jpg', N'320171227318854.jpg', N'<p>&nbsp;描述</p>', N'M|XL|L|XXL')
INSERT [dbo].[YC_Goods] ([GID], [GTID], [Name], [SCPrice], [CXPrice], [DesImg1Url], [DesImg2Url], [DesImg3Url], [DetailImages], [AllSize]) VALUES (26, 5, N'商品1', 1999.0000, 1999.0000, N'920171229412371.jpg', N'1020171229412371.jpg', N'1120171229412371.jpg', N'<p>&nbsp;描述文字</p>', N'M|XL|L')
SET IDENTITY_INSERT [dbo].[YC_Goods] OFF
SET IDENTITY_INSERT [dbo].[YC_GoodType] ON 

INSERT [dbo].[YC_GoodType] ([GTID], [Name], [Description]) VALUES (1, N'中国风', N'中国')
INSERT [dbo].[YC_GoodType] ([GTID], [Name], [Description]) VALUES (3, N'日本', N'日本')
INSERT [dbo].[YC_GoodType] ([GTID], [Name], [Description]) VALUES (5, N'成都', N'成都')
INSERT [dbo].[YC_GoodType] ([GTID], [Name], [Description]) VALUES (6, N'欧美', N'欧美')
INSERT [dbo].[YC_GoodType] ([GTID], [Name], [Description]) VALUES (7, N'韩国', N'韩国')
SET IDENTITY_INSERT [dbo].[YC_GoodType] OFF
SET IDENTITY_INSERT [dbo].[YC_Order] ON 

INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (2, 1, 1, 666.0000, 1, 1, N'EMS', N'四川成都', CAST(N'2017-12-18 14:41:30.000' AS DateTime), CAST(N'2017-12-25 16:43:45.000' AS DateTime), NULL, N'XXL', N'55555')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (3, 1, 1, 666.0000, 1, 1, N'韵达', N'四川成都', CAST(N'2017-12-18 14:41:30.000' AS DateTime), CAST(N'2017-12-25 10:05:51.000' AS DateTime), NULL, N'XXL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (4, 5, 1, 1596.0000, 2, 0, N'', N'四川水利    邱于涵    18381506390    55555', CAST(N'2017-12-27 11:07:11.000' AS DateTime), NULL, NULL, N'M', N'')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (5, 5, 1, 1596.0000, 2, 1, N'韵达', N'四川水利    何建均    18381506390    614200', CAST(N'2017-12-27 11:09:17.000' AS DateTime), CAST(N'2017-12-27 15:24:15.000' AS DateTime), NULL, N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (6, 12, 15, 1588.0000, 1, 1, N'EMS', N'四川 成都 川水园    何建均    1831506390    65615', CAST(N'2017-12-27 14:45:13.000' AS DateTime), CAST(N'2017-12-27 14:46:19.000' AS DateTime), NULL, N'XL', N'151165')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (7, 19, 17, 17980.0000, 20, 1, N'顺丰', N'成都    潘佳    18516    151', CAST(N'2017-12-27 15:11:57.000' AS DateTime), CAST(N'2017-12-27 15:22:12.000' AS DateTime), NULL, N'XXL', N'66666666')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (8, 18, 15, 52712.0000, 88, 1, N'韵达', N'崇州    何总    15456    1516', CAST(N'2017-12-27 15:37:23.000' AS DateTime), CAST(N'2017-12-27 15:37:48.000' AS DateTime), NULL, N'XXL', N'15465')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (9, 11, 1, 3576.0000, 2, 1, N'韵达', N'四川成都    邱于涵    18381506390    614200', CAST(N'2017-12-27 15:56:05.000' AS DateTime), CAST(N'2017-12-27 16:20:42.000' AS DateTime), NULL, N'XL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (10, 19, 19, 899.0000, 1, 1, N'韵达', N'哈哈哈    王总    18381506390    222', CAST(N'2017-12-27 16:07:18.000' AS DateTime), CAST(N'2017-12-27 16:16:06.000' AS DateTime), NULL, N'XL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (11, 19, 1, 79112.0000, 88, 1, N'韵达', N'1441    1414    1441    114', CAST(N'2017-12-27 16:28:20.000' AS DateTime), CAST(N'2017-12-27 16:28:30.000' AS DateTime), NULL, N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (12, 14, 1, 2198.0000, 2, NULL, N'韵达', N'c    cs    cd    6516', CAST(N'2017-12-27 16:49:32.000' AS DateTime), CAST(N'2017-12-27 16:49:56.000' AS DateTime), CAST(N'2017-12-27 16:56:38.000' AS DateTime), N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (13, 20, 15, 1998.0000, 2, 1, N'韵达', N'重庆    何建均    18381506390    1515454564', CAST(N'2017-12-27 16:58:06.000' AS DateTime), CAST(N'2017-12-27 16:58:26.000' AS DateTime), NULL, N'XL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (14, 16, 22, 3588.0000, 12, NULL, N'韵达', N'254    254    542    2424', CAST(N'2017-12-27 21:41:24.000' AS DateTime), CAST(N'2017-12-27 21:42:11.000' AS DateTime), CAST(N'2017-12-27 21:42:21.000' AS DateTime), N'XL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (15, 20, 1, 1998.0000, 2, NULL, N'韵达', N'1516    515    1515    15665165', CAST(N'2017-12-28 09:10:39.000' AS DateTime), CAST(N'2017-12-28 09:10:58.000' AS DateTime), CAST(N'2017-12-28 09:11:03.000' AS DateTime), N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (16, 19, 1, 1798.0000, 2, NULL, N'韵达', N'151551    邱于涵    18381506390    614200', CAST(N'2017-12-28 11:50:08.000' AS DateTime), CAST(N'2017-12-28 11:50:41.000' AS DateTime), CAST(N'2017-12-28 11:50:50.000' AS DateTime), N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (17, 20, 1, 1998.0000, 2, NULL, N'', N'四川成都    涵涵思密达    18381506390    么么哒', CAST(N'2017-12-28 11:58:38.000' AS DateTime), NULL, NULL, N'M', N'')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (18, 13, 1, 40689.0000, 33, NULL, N'韵达', N'四川水利    罗乐    18381506390    6451', CAST(N'2017-12-28 14:06:21.000' AS DateTime), CAST(N'2017-12-28 14:07:14.000' AS DateTime), CAST(N'2017-12-28 14:07:25.000' AS DateTime), N'X', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (19, 18, 1, 11980.0000, 20, NULL, N'韵达', N'14424    15561    15156    1515', CAST(N'2017-12-28 14:15:58.000' AS DateTime), CAST(N'2017-12-28 14:16:32.000' AS DateTime), CAST(N'2017-12-28 19:14:21.000' AS DateTime), N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (20, 22, 1, 929.0000, 1, NULL, N'', N'四川成都崇州    邱于涵    18381506390    614200', CAST(N'2017-12-28 16:19:13.000' AS DateTime), NULL, NULL, N'M', N'')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (21, 19, 1, 3596.0000, 4, NULL, N'', N'四川成都崇州    涵涵    18381506390    3450', CAST(N'2017-12-28 18:03:19.000' AS DateTime), NULL, NULL, N'XL', N'')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (22, 18, 24, 599.0000, 1, NULL, N'韵达', N'254542    邱于涵    542    155', CAST(N'2017-12-28 18:38:32.000' AS DateTime), CAST(N'2017-12-28 18:43:25.000' AS DateTime), CAST(N'2017-12-28 18:43:49.000' AS DateTime), N'M', N'88142422542455')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (23, 20, 1, 99900.0000, 100, 1, N'韵达', N'1516    何总    15561    njkcd', CAST(N'2017-12-28 19:15:39.000' AS DateTime), CAST(N'2017-12-28 19:16:11.000' AS DateTime), NULL, N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (24, 23, 25, 13178.0000, 22, NULL, N'韵达', N'22    22    222    22', CAST(N'2017-12-28 19:58:51.000' AS DateTime), CAST(N'2017-12-28 19:59:36.000' AS DateTime), CAST(N'2017-12-28 19:59:42.000' AS DateTime), N'M', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (25, 20, 1, 999.0000, 1, NULL, N'', N'15    1515    151    1515', CAST(N'2017-12-28 20:31:09.000' AS DateTime), NULL, NULL, N'M', N'')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (26, 19, 26, 899.0000, 1, NULL, N'韵达', N'四川成都    邱于涵    18381506390    614200', CAST(N'2017-12-28 22:29:29.000' AS DateTime), CAST(N'2017-12-28 22:30:05.000' AS DateTime), NULL, N'XL', N'8888888')
INSERT [dbo].[YC_Order] ([OID], [GID], [UID], [Price], [Count], [isClosed], [SendType], [Address], [BuyTime], [SendTime], [FinishedTime], [GoodSize], [WayNumber]) VALUES (27, 19, 27, 4495.0000, 5, NULL, N'韵达', N'四川水利    邱于涵    1155151    65', CAST(N'2017-12-29 10:39:10.000' AS DateTime), CAST(N'2017-12-29 10:39:43.000' AS DateTime), CAST(N'2017-12-29 10:40:07.000' AS DateTime), N'XL', N'8888888')
SET IDENTITY_INSERT [dbo].[YC_Order] OFF
SET IDENTITY_INSERT [dbo].[YC_User] ON 

INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (1, N'admin', N'我是涵大大', N'admin', N'', 1, 1, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-22 13:42:24.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (3, N'user1', N'user1', N'user1', N'地址', 1, 0, N'123', NULL, 1, NULL, 0.0000, CAST(N'2017-12-22 13:42:29.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (4, N'user2', N'user2', N'user2', N'地址', 1, 0, N'123123', N'123132', 1, NULL, 0.0000, CAST(N'2017-12-22 13:42:31.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (6, N'u122', N'哈哈哈', N'user3', N'美国', 1, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-22 13:42:34.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (7, N'user251', N'user251', N'user251', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-25 14:09:52.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (8, N'name1', N'name1', N'name1', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-25 14:35:07.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (12, N'u8755', N'u8755', N'u8755', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-25 14:53:30.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (15, N'何总', N'何建均', N'hezong', N'', 1, 0, N'1838150', N'1031', 1, NULL, 0.0000, CAST(N'2017-12-26 09:40:03.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (17, N'潘总', N'潘', N'panzong', N'四川', 0, 0, N'1838150639', N'103189346', 1, NULL, 0.0000, CAST(N'2017-12-26 09:53:49.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (18, N'admi', N'涵大大', N'admi', N'', 1, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-26 17:26:45.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (19, N'王总', N'王总', N'wangzong', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-27 16:06:40.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (20, N'ad666', N'ad666', N'1213545623123456', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-27 19:22:03.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (21, N'gttg', N'gttg', N'gttggt', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-27 19:25:10.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (22, N'杨总', N'杨总', N'yangzong', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-27 21:40:44.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (23, N'罗总', N'罗总', N'luozong', N'', 1, 0, N'18381506390', N'103189', 1, NULL, 0.0000, CAST(N'2017-12-28 09:12:41.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (24, N'a123', N'a1', N'a123', N'', 1, 0, N'183815', N'1031', 1, NULL, 0.0000, CAST(N'2017-12-28 18:35:32.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (25, N'aaa', N'aaa', N'aa', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-28 19:57:59.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (26, N'ajk', N'ajk', N'ajk', N'四川', 0, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-28 22:28:36.000' AS DateTime))
INSERT [dbo].[YC_User] ([UID], [Name], [NickName], [PassWord], [Address], [Sex], [Admin], [Phone], [QQ], [Enable], [headImg], [Moneysum], [RegDateTime]) VALUES (27, N'adm', N'adm', N'adm', N'', 1, 0, N'18381506390', N'1031893464', 1, NULL, 0.0000, CAST(N'2017-12-29 10:37:33.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[YC_User] OFF
SET IDENTITY_INSERT [dbo].[YC_WebSite] ON 

INSERT [dbo].[YC_WebSite] ([WID], [WName], [LogoUrl], [LunboImgUrl], [CompanyDescription], [OurTeam], [ContactUs], [ContactUsWeChatImage], [TodayMovieUrl]) VALUES (1, N'一号原创服装店1', N'1hycz2017122912888.png', N'0124df7d5d82ebe12cdb75f6329ac345842017122912888.jpg|0184636ec0872d50dee6f02c0e8a6f48992017122912888.jpg|b32017122912888.jpg', N'<h3>《一号原创装》公司概念</h3>
<h3>&nbsp;</h3>
<h4>公司简介</h4>
<p>1.一号原创装股份有限公司成立于2016年,注册资金xx万,是成都一家专业的原创服装公司。公司主要服务女性网络消费者针对当今服装种类，品牌繁多导致客户选择疲劳的情况，公司通过服装设计师，分析师，结合当今社会的服装潮流和趋势的方式,提供世界多地原创时装,私人定制,网络推广，个人推荐，产品推荐营销于一体的专业服务。公司以&ldquo;品质为人&rdquo;为核心价值,希望通过我们的专业水平和不懈努力,为广大消费者提供服务指导，优质产品。</p>
<h4>项目背景</h4>
<p>1.21世纪女性消费者的市场需求日益膨胀，据调查数据表明现代女性，尤其是年轻女性91.8%的人网购，而购买服装服饰为被调查女性最大一笔开，已连续7年稳居个人最大一笔开支的第一位。但是不少消费者渴望时尚的服装又缺乏对于服装品牌的了解，面对市场对此的空缺，本公司应运而生，提出原创，定制，品质，个人等理念的多合一的市场理念，为消费者提供一个私人定制的平台。</p>
<p><strong>商业价值 </strong><br />
1.	让我们的服装设计师，分析师为中国每一位女性打造独一无二的原创服装，告别撞衫时代！！！满足消费者心理。  2.	公司结合当今服装时尚潮流数据，让中国每一位女性消费者在我们网站上都能自动匹配，合格，正确称心如意的服装，告别选择困难！！！ <br />
3.	让中国每一位女性消费者告别疲劳的逛商场，找不到称心如意合适服装的时代。 <br />
4利用线上网络，连接当地实体店铺 ，推出送货上门试衣，满意当场付款的方式，打造一条线上线下结合的独立运营网络。  <br />
<strong>发展规划</strong> <br />
<br />
公司前期投资少，范围小，安全稳定可靠，中期公司客户量大量增加，提高当地范围内客户的认知度，本公司将把范围扩大到一线和二线城市。公司稳定后，会招收国内外知名服装设计师，分析师等高端人才，同国外知名度，质量，性价比高的原创服装品牌进行宣传，同时和国内知名服装品牌，知名互联网公司进行合作联盟，扩大本公司的规模，和知名度。</p>', N'<p>我们是一支有组织、有纪律的团队。积极进取、热爱学习。</p>', N'<p>地址：四川水利职业技术学院</p>
<p>Email:2505153740@qq.com</p>
<p>Phone:15982251322</p>
<p>&nbsp;</p>', N'', N'')
SET IDENTITY_INSERT [dbo].[YC_WebSite] OFF
ALTER TABLE [dbo].[YC_Address]  WITH CHECK ADD  CONSTRAINT [FK_YC_ADDRE_REFERENCE_YC_USER] FOREIGN KEY([UID])
REFERENCES [dbo].[YC_User] ([UID])
GO
ALTER TABLE [dbo].[YC_Address] CHECK CONSTRAINT [FK_YC_ADDRE_REFERENCE_YC_USER]
GO
ALTER TABLE [dbo].[YC_Goods]  WITH CHECK ADD  CONSTRAINT [FK_YC_GOODS_REFERENCE_YC_GOODT] FOREIGN KEY([GTID])
REFERENCES [dbo].[YC_GoodType] ([GTID])
GO
ALTER TABLE [dbo].[YC_Goods] CHECK CONSTRAINT [FK_YC_GOODS_REFERENCE_YC_GOODT]
GO
ALTER TABLE [dbo].[YC_MoneyRecord]  WITH CHECK ADD  CONSTRAINT [FK_YC_MONEY_REFERENCE_YC_USER] FOREIGN KEY([UID])
REFERENCES [dbo].[YC_User] ([UID])
GO
ALTER TABLE [dbo].[YC_MoneyRecord] CHECK CONSTRAINT [FK_YC_MONEY_REFERENCE_YC_USER]
GO
ALTER TABLE [dbo].[YC_Order]  WITH CHECK ADD  CONSTRAINT [FK_YC_ORDER_REFERENCE_YC_GOODS] FOREIGN KEY([GID])
REFERENCES [dbo].[YC_Goods] ([GID])
GO
ALTER TABLE [dbo].[YC_Order] CHECK CONSTRAINT [FK_YC_ORDER_REFERENCE_YC_GOODS]
GO
ALTER TABLE [dbo].[YC_Order]  WITH CHECK ADD  CONSTRAINT [FK_YC_ORDER_REFERENCE_YC_USER] FOREIGN KEY([UID])
REFERENCES [dbo].[YC_User] ([UID])
GO
ALTER TABLE [dbo].[YC_Order] CHECK CONSTRAINT [FK_YC_ORDER_REFERENCE_YC_USER]
GO
USE [master]
GO
ALTER DATABASE [ycfz] SET  READ_WRITE 
GO
