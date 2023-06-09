USE [master]
GO
/****** Object:  Database [BookStoreAPI]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE DATABASE [BookStoreAPI]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BookStoreAPI', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreAPI.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BookStoreAPI_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\BookStoreAPI_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [BookStoreAPI] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BookStoreAPI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BookStoreAPI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BookStoreAPI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BookStoreAPI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BookStoreAPI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BookStoreAPI] SET ARITHABORT OFF 
GO
ALTER DATABASE [BookStoreAPI] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [BookStoreAPI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BookStoreAPI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BookStoreAPI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BookStoreAPI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BookStoreAPI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BookStoreAPI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BookStoreAPI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BookStoreAPI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BookStoreAPI] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BookStoreAPI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BookStoreAPI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BookStoreAPI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BookStoreAPI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BookStoreAPI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BookStoreAPI] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BookStoreAPI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BookStoreAPI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BookStoreAPI] SET  MULTI_USER 
GO
ALTER DATABASE [BookStoreAPI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BookStoreAPI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BookStoreAPI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BookStoreAPI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BookStoreAPI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BookStoreAPI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BookStoreAPI] SET QUERY_STORE = ON
GO
ALTER DATABASE [BookStoreAPI] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [BookStoreAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Book_Id] [nvarchar](450) NOT NULL,
	[Category_Id] [nvarchar](450) NOT NULL,
	[Book_Title] [nvarchar](max) NOT NULL,
	[Book_Author] [nvarchar](max) NOT NULL,
	[Book_Price] [real] NOT NULL,
	[Book_Year_Public] [int] NOT NULL,
	[Book_ISBN] [int] NOT NULL,
	[Is_Book_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Category_Id] [nvarchar](450) NOT NULL,
	[Category_Name] [nvarchar](max) NOT NULL,
	[Is_Category_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Image_Id] [int] IDENTITY(1,1) NOT NULL,
	[Book_Id] [nvarchar](450) NOT NULL,
	[Image_Name] [nvarchar](max) NOT NULL,
	[Image_URL] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Image_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Importation]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Importation](
	[Import_Id] [nvarchar](450) NOT NULL,
	[User_Id] [nvarchar](450) NOT NULL,
	[Import_Quantity] [int] NOT NULL,
	[Import_Amount] [real] NOT NULL,
	[Is_Import_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Importation] PRIMARY KEY CLUSTERED 
(
	[Import_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ImportationDetail]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImportationDetail](
	[Import_Detail_Id] [nvarchar](450) NOT NULL,
	[Import_Id] [nvarchar](450) NOT NULL,
	[Book_Id] [nvarchar](450) NOT NULL,
	[Import_Detail_Quantity] [int] NOT NULL,
	[Import_Detail_Price] [real] NOT NULL,
	[Import_Detail_Amount] [real] NOT NULL,
 CONSTRAINT [PK_ImportationDetail] PRIMARY KEY CLUSTERED 
(
	[Import_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Inventory]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory](
	[Inventory_Id] [nvarchar](450) NOT NULL,
	[User_Id] [nvarchar](450) NOT NULL,
	[Inventory_Date_Into] [datetime2](7) NOT NULL,
	[Is_Inventory_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Inventory] PRIMARY KEY CLUSTERED 
(
	[Inventory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InventoryDetail]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InventoryDetail](
	[Inventory_Detail_Id] [nvarchar](450) NOT NULL,
	[Inventory_Id] [nvarchar](450) NOT NULL,
	[Book_Id] [nvarchar](450) NOT NULL,
	[Inventory_Detail_Quantity] [int] NOT NULL,
	[Inventory_Detail_Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_InventoryDetail] PRIMARY KEY CLUSTERED 
(
	[Inventory_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Order_Id] [nvarchar](450) NOT NULL,
	[User_Id] [nvarchar](450) NOT NULL,
	[Order_Date] [datetime2](7) NOT NULL,
	[Order_Quantity] [int] NOT NULL,
	[Order_Amount] [real] NOT NULL,
	[Order_Customer_Name] [nvarchar](max) NOT NULL,
	[Order_Customer_Address] [nvarchar](max) NOT NULL,
	[Order_Customer_Phone] [nvarchar](max) NOT NULL,
	[Is_Order_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[Order_Detail_Id] [nvarchar](450) NOT NULL,
	[Order_Id] [nvarchar](450) NOT NULL,
	[Book_Id] [nvarchar](450) NOT NULL,
	[Order_Detail_Quantity] [int] NOT NULL,
	[Order_Detail_Amount] [real] NOT NULL,
	[Order_Detail_Price] [real] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[Order_Detail_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[Request_Id] [nvarchar](450) NOT NULL,
	[Book_Id] [nvarchar](450) NOT NULL,
	[Import_Id] [nvarchar](450) NOT NULL,
	[Request_Image_Url] [nvarchar](max) NOT NULL,
	[Request_Book_Name] [nvarchar](max) NOT NULL,
	[Request_Quantity] [int] NOT NULL,
	[Request_Price] [real] NOT NULL,
	[Request_Amount] [real] NOT NULL,
	[Request_Date] [datetime2](7) NOT NULL,
	[Request_Date_Done] [datetime2](7) NOT NULL,
	[Request_Note] [nvarchar](max) NULL,
	[Is_Request_Status] [bit] NOT NULL,
 CONSTRAINT [PK_Request] PRIMARY KEY CLUSTERED 
(
	[Request_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_Id] [int] IDENTITY(1,1) NOT NULL,
	[Role_Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 6/9/2023 1:04:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_Id] [nvarchar](450) NOT NULL,
	[Role_Id] [int] NOT NULL,
	[User_Name] [nvarchar](max) NOT NULL,
	[User_Email] [nvarchar](max) NOT NULL,
	[User_Address] [nvarchar](max) NOT NULL,
	[User_Phone] [nvarchar](max) NOT NULL,
	[Is_User_Gender] [bit] NOT NULL,
	[Is_User_Status] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Book_Category_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Book_Category_Id] ON [dbo].[Book]
(
	[Category_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Image_Book_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Image_Book_Id] ON [dbo].[Image]
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Importation_User_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Importation_User_Id] ON [dbo].[Importation]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ImportationDetail_Book_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportationDetail_Book_Id] ON [dbo].[ImportationDetail]
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ImportationDetail_Import_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_ImportationDetail_Import_Id] ON [dbo].[ImportationDetail]
(
	[Import_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Inventory_User_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Inventory_User_Id] ON [dbo].[Inventory]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InventoryDetail_Book_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDetail_Book_Id] ON [dbo].[InventoryDetail]
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_InventoryDetail_Inventory_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_InventoryDetail_Inventory_Id] ON [dbo].[InventoryDetail]
(
	[Inventory_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Order_User_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Order_User_Id] ON [dbo].[Order]
(
	[User_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetail_Book_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_Book_Id] ON [dbo].[OrderDetail]
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_OrderDetail_Order_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_OrderDetail_Order_Id] ON [dbo].[OrderDetail]
(
	[Order_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Request_Book_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_Book_Id] ON [dbo].[Request]
(
	[Book_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Request_Import_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_Request_Import_Id] ON [dbo].[Request]
(
	[Import_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_User_Role_Id]    Script Date: 6/9/2023 1:04:03 PM ******/
CREATE NONCLUSTERED INDEX [IX_User_Role_Id] ON [dbo].[User]
(
	[Role_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category_Category_Id] FOREIGN KEY([Category_Id])
REFERENCES [dbo].[Category] ([Category_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category_Category_Id]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Book_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Book_Book_Id]
GO
ALTER TABLE [dbo].[Importation]  WITH CHECK ADD  CONSTRAINT [FK_Importation_User_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Importation] CHECK CONSTRAINT [FK_Importation_User_User_Id]
GO
ALTER TABLE [dbo].[ImportationDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportationDetail_Book_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportationDetail] CHECK CONSTRAINT [FK_ImportationDetail_Book_Book_Id]
GO
ALTER TABLE [dbo].[ImportationDetail]  WITH CHECK ADD  CONSTRAINT [FK_ImportationDetail_Importation_Import_Id] FOREIGN KEY([Import_Id])
REFERENCES [dbo].[Importation] ([Import_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ImportationDetail] CHECK CONSTRAINT [FK_ImportationDetail_Importation_Import_Id]
GO
ALTER TABLE [dbo].[Inventory]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_User_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Inventory] CHECK CONSTRAINT [FK_Inventory_User_User_Id]
GO
ALTER TABLE [dbo].[InventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDetail_Book_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryDetail] CHECK CONSTRAINT [FK_InventoryDetail_Book_Book_Id]
GO
ALTER TABLE [dbo].[InventoryDetail]  WITH CHECK ADD  CONSTRAINT [FK_InventoryDetail_Inventory_Inventory_Id] FOREIGN KEY([Inventory_Id])
REFERENCES [dbo].[Inventory] ([Inventory_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[InventoryDetail] CHECK CONSTRAINT [FK_InventoryDetail_Inventory_Inventory_Id]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[User] ([User_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User_User_Id]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Book_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Book_Book_Id]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order_Order_Id] FOREIGN KEY([Order_Id])
REFERENCES [dbo].[Order] ([Order_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order_Order_Id]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Book_Book_Id] FOREIGN KEY([Book_Id])
REFERENCES [dbo].[Book] ([Book_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Book_Book_Id]
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD  CONSTRAINT [FK_Request_Importation_Import_Id] FOREIGN KEY([Import_Id])
REFERENCES [dbo].[Importation] ([Import_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Request] CHECK CONSTRAINT [FK_Request_Importation_Import_Id]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role_Id] FOREIGN KEY([Role_Id])
REFERENCES [dbo].[Role] ([Role_Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role_Role_Id]
GO
USE [master]
GO
ALTER DATABASE [BookStoreAPI] SET  READ_WRITE 
GO
