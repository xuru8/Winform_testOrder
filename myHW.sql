USE [master]
GO
/****** Object:  Database [myHW]    Script Date: 2022/7/18 上午 05:49:40 ******/
CREATE DATABASE [myHW]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myHW', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\myHW.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'myHW_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER_2019\MSSQL\DATA\myHW_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [myHW] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myHW].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myHW] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myHW] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myHW] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myHW] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myHW] SET ARITHABORT OFF 
GO
ALTER DATABASE [myHW] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myHW] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myHW] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myHW] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myHW] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myHW] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myHW] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myHW] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myHW] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [myHW] SET  DISABLE_BROKER 
GO
ALTER DATABASE [myHW] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [myHW] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [myHW] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myHW] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myHW] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myHW] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myHW] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myHW] SET RECOVERY FULL 
GO
ALTER DATABASE [myHW] SET  MULTI_USER 
GO
ALTER DATABASE [myHW] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myHW] SET DB_CHAINING OFF 
GO
ALTER DATABASE [myHW] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [myHW] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [myHW] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [myHW] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'myHW', N'ON'
GO
ALTER DATABASE [myHW] SET QUERY_STORE = OFF
GO
USE [myHW]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[生日] [date] NULL,
	[住址] [nvarchar](100) NULL,
	[密碼] [nvarchar](50) NULL,
	[會員點數] [int] NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetailTest]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetailTest](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[數量] [int] NULL,
	[會員點數折抵] [int] NULL,
	[折抵金額] [int] NULL,
	[金額] [int] NULL,
	[單價] [int] NULL,
 CONSTRAINT [pk_Customer_Id] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[是否為會員] [bit] NULL,
	[收件人] [nvarchar](50) NULL,
	[電話] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[地址] [nvarchar](100) NULL,
	[Orderdate] [datetime] NULL,
	[總金額] [int] NULL,
	[備註] [nvarchar](100) NULL,
	[訂單是否成立] [bit] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Pname] [nvarchar](100) NULL,
	[Price] [int] NULL,
	[Pdesc] [nvarchar](100) NULL,
	[Pimage] [nvarchar](100) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingCar]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingCar](
	[CustomerID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[數量] [int] NULL,
	[會員點數折抵] [int] NULL,
	[折抵金額] [int] NULL,
	[金額] [int] NULL,
	[單價] [int] NULL,
 CONSTRAINT [pk_shoppingCar_Id] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Visitors]    Script Date: 2022/7/18 上午 05:49:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Visitors](
	[VisitorID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[送貨地址] [nvarchar](100) NULL,
 CONSTRAINT [PK_Visitor] PRIMARY KEY CLUSTERED 
(
	[VisitorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([CustomerID], [Name], [Phone], [Email], [生日], [住址], [密碼], [會員點數]) VALUES (1, N'我老大', N'0953555666', N'sdfds@dfds.com', CAST(N'1999-06-20' AS Date), N'屏東縣屏東市', N'0605', 88888888)
INSERT [dbo].[Customers] ([CustomerID], [Name], [Phone], [Email], [生日], [住址], [密碼], [會員點數]) VALUES (2, N'我是誰', N'0978124987', N'sdfsd@dfgqa.com', CAST(N'1998-06-11' AS Date), N'高雄市苓雅區', N'0625', 88888888)
INSERT [dbo].[Customers] ([CustomerID], [Name], [Phone], [Email], [生日], [住址], [密碼], [會員點數]) VALUES (5, N'123', N'123', N'123', CAST(N'2022-07-01' AS Date), N'123', N'123', 0)
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1, 1, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1, 2, 2, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (2, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (3, 2, 1, NULL, NULL, 30, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (3, 3, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (4, 2, 1, NULL, NULL, 30, NULL)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1003, 1, 2, NULL, NULL, 90, 45)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1003, 2, 5, NULL, NULL, 150, 30)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1029, 1, 2, NULL, NULL, 90, 45)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1029, 2, 5, NULL, NULL, 150, 30)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1029, 3, 2, NULL, NULL, 360, 180)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1030, 1, 2, NULL, NULL, 90, 45)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1030, 2, 5, NULL, NULL, 150, 30)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1030, 3, 2, NULL, NULL, 360, 180)
INSERT [dbo].[OrderDetailTest] ([OrderID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1030, 4, 2, NULL, NULL, 100, 50)
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1, 3, 0, NULL, NULL, NULL, NULL, CAST(N'2022-07-02T00:00:00.000' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (2, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-02T21:30:13.640' AS DateTime), NULL, NULL, 0)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1003, 3, 1, N'大中天', N'938538538', N'gigi@gigi.com', N'高雄市', CAST(N'2022-07-18T02:37:55.840' AS DateTime), 1000, N'他不加麻辣', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1004, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T03:51:24.050' AS DateTime), 700, N'try', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1005, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T03:56:35.073' AS DateTime), 700, N'try', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1006, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T03:58:31.983' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1007, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T03:58:32.613' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1008, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T03:59:14.260' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1009, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:00:33.193' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1010, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:00:33.803' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1011, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:02:41.803' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1012, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:02:42.393' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1013, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:04:02.280' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1014, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:04:02.890' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1015, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:09:48.727' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1016, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:10:51.430' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1017, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:12:45.493' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1018, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:13:52.740' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1019, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:15:21.130' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1020, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:18:32.750' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1021, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:23:55.460' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1022, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:26:16.270' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1023, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:30:23.143' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1024, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:32:41.937' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1025, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:33:16.877' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1026, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:33:58.203' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1027, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:36:01.393' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1028, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:37:02.500' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1029, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:37:18.183' AS DateTime), 700, N'', 1)
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [是否為會員], [收件人], [電話], [Email], [地址], [Orderdate], [總金額], [備註], [訂單是否成立]) VALUES (1030, 5, 1, N'123', N'123', N'123', N'123', CAST(N'2022-07-18T04:38:33.590' AS DateTime), 700, N'', 1)
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (1, N'義式芒果奶酪', 45, N'包含芒果果肉，芒果果泥，鮮奶油，建議三日內食用完畢，需冰溫冷藏', N'義式芒果奶酪.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (2, N'焦糖雞蛋布丁', 30, N'只有牛奶，動物性鮮奶油，雞蛋等自然新鮮材料，不使用預拌粉，無防腐劑，不加香料．

建議三天內食用完畢． 冷藏保存．', N'焦糖雞蛋布丁.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (3, N'酥皮奶醬蛋塔(6入)', 180, N'使用麵粉，無鹽奶油，牛奶，動物性鮮奶油，雞蛋等天然食材，無使用預拌材料，無防腐劑，建議三天內食用完畢． 冷藏可保存三天．', N'酥皮奶醬蛋塔.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (4, N'香草脆皮泡芙', 50, N'材料：麵粉，杏仁粉，無鹽奶油，牛奶，動物性鮮奶油，香草籽醬，玉米粉，雞蛋，糖，鹽', N'香草脆皮泡芙.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (5, N'宇治抹茶脆皮泡芙', 50, N'材料：麵粉，杏仁粉，無鹽奶油，牛奶，動物性鮮奶油，抹茶粉，玉米粉，雞蛋，糖，鹽', N'宇治抹茶脆皮泡芙.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (6, N'黑巧克力脆皮泡芙', 50, N'材料：麵粉，杏仁粉，無鹽奶油，牛奶，動物性鮮奶油，玉米粉，可可粉，咖啡粉，75%調溫黑巧克力，雞蛋，糖，鹽', N'黑巧克力脆皮泡芙.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (7, N'伯爵紅茶脆皮泡芙', 50, N'材料：麵粉，杏仁粉，無鹽奶油，牛奶，動物性鮮奶油，玉米粉，伯爵紅茶，雞蛋，糖，鹽', N'伯爵紅茶脆皮泡芙.png')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (8, N'香草閃電泡芙', 50, N'材料：麵粉，無鹽奶油，牛奶，動物性鮮奶油，香草籽醬，玉米粉，雞蛋，糖，鹽', N'香草閃電泡芙.jpg')
INSERT [dbo].[Products] ([ProductID], [Pname], [Price], [Pdesc], [Pimage]) VALUES (9, N'香草脆皮閃電泡芙', 50, N'材料：麵粉，杏仁粉，無鹽奶油，牛奶，動物性鮮奶油，香草籽醬，玉米粉，雞蛋，糖，鹽', N'香草脆皮閃電泡芙.jpg')
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1, 1, 1, NULL, NULL, 45, 45)
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (1, 2, 1, NULL, NULL, 30, 30)
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (5, 1, 2, NULL, NULL, 90, 45)
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (5, 2, 5, NULL, NULL, 150, 30)
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (5, 3, 2, NULL, NULL, 360, 180)
INSERT [dbo].[ShoppingCar] ([CustomerID], [ProductID], [數量], [會員點數折抵], [折抵金額], [金額], [單價]) VALUES (5, 4, 2, NULL, NULL, 100, 50)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__5C7E359E0A12D556]    Script Date: 2022/7/18 上午 05:49:40 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Phone] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Customer__A9D105340538D104]    Script Date: 2022/7/18 上午 05:49:40 ******/
ALTER TABLE [dbo].[Customers] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetailTest]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailTest_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetailTest] CHECK CONSTRAINT [FK_OrderDetailTest_Orders]
GO
ALTER TABLE [dbo].[OrderDetailTest]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetailTest_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetailTest] CHECK CONSTRAINT [FK_OrderDetailTest_Products]
GO
ALTER TABLE [dbo].[ShoppingCar]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCar_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[ShoppingCar] CHECK CONSTRAINT [FK_ShoppingCar_Customers]
GO
ALTER TABLE [dbo].[ShoppingCar]  WITH CHECK ADD  CONSTRAINT [FK_ShoppingCar_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[ShoppingCar] CHECK CONSTRAINT [FK_ShoppingCar_Products]
GO
USE [master]
GO
ALTER DATABASE [myHW] SET  READ_WRITE 
GO
