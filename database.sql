USE [master]
GO
/****** Object:  Database [EStore]    Script Date: 12/21/2019 12:03:52 AM ******/
CREATE DATABASE [EStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\EStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [EStore] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [EStore] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EStore] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EStore] SET  MULTI_USER 
GO
ALTER DATABASE [EStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EStore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [EStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EStore] SET QUERY_STORE = OFF
GO
USE [EStore]
GO
/****** Object:  Table [dbo].[BanBe]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BanBe](
	[MaBB] [int] IDENTITY(1,1) NOT NULL,
	[MaKH] [int] NULL,
	[MaSP] [int] NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NgayGui] [datetime] NULL,
	[GhiChu] [nchar](10) NULL,
 CONSTRAINT [PK_BanBe] PRIMARY KEY CLUSTERED 
(
	[MaBB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBL] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaKH] [int] NULL,
	[NgayBL] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
 CONSTRAINT [PK_BinhLuan] PRIMARY KEY CLUSTERED 
(
	[MaBL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[MaBlog] [int] IDENTITY(1,1) NOT NULL,
	[TenBlog] [nvarchar](50) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayDang] [datetime] NULL,
	[MaLoaiBlog] [int] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[MaBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChiTietHD]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietHD](
	[MaCT] [int] IDENTITY(0,1) NOT NULL,
	[MaHD] [int] NULL,
	[MaSP] [int] NULL,
	[DonGia] [float] NULL,
	[SoLuong] [int] NULL,
	[GiamGia] [float] NULL,
 CONSTRAINT [PK_ChiTietHD] PRIMARY KEY CLUSTERED 
(
	[MaCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaCD] [int] IDENTITY(1,1) NOT NULL,
	[TenCD] [nvarchar](50) NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_ChuDe] PRIMARY KEY CLUSTERED 
(
	[MaCD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoaDon]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoaDon](
	[MaHD] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[CachThanhToan] [nvarchar](50) NULL,
	[CachVanChuyen] [nvarchar](50) NULL,
	[PhiVanChuyen] [float] NULL,
	[MaTrangThai] [int] NULL,
	[GhiChu] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[TongTien] [float] NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HoiDap]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HoiDap](
	[MaHDap] [int] NOT NULL,
	[CauHoi] [nvarchar](50) NULL,
	[TraLoi] [nvarchar](50) NULL,
	[NgayDua] [datetime] NULL,
	[MaNV] [nvarchar](50) NULL,
 CONSTRAINT [PK_HoiDap] PRIMARY KEY CLUSTERED 
(
	[MaHDap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[MatKhau] [nvarchar](100) NULL,
	[HoTen] [nvarchar](50) NULL,
	[GioiTinh] [bit] NULL,
	[NgaySinh] [date] NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[HieuLuc] [bit] NULL,
	[VaiTro] [int] NULL,
	[RandomKey] [varchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhoHang]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhoHang](
	[MaKho] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_KhoHang] PRIMARY KEY CLUSTERED 
(
	[MaKho] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[KhuyenMai]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhuyenMai](
	[MaKM] [int] IDENTITY(1,1) NOT NULL,
	[codeKM] [nvarchar](50) NULL,
	[LoaiKM] [nvarchar](50) NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_KhuyenMai] PRIMARY KEY CLUSTERED 
(
	[MaKM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaGY] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[NgayGY] [datetime] NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
 CONSTRAINT [PK_LienHe] PRIMARY KEY CLUSTERED 
(
	[MaGY] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Loai]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](50) NULL,
	[TenLoaiAlias] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LoaiBlog]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiBlog](
	[MaLoaiBlog] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiBlog] [nvarchar](max) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiBlog] PRIMARY KEY CLUSTERED 
(
	[MaLoaiBlog] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhaCungCap]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhaCungCap](
	[MaNCC] [nvarchar](50) NOT NULL,
	[TenCongTy] [nvarchar](50) NULL,
	[Logo] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[MoTa] [nvarchar](max) NULL,
 CONSTRAINT [PK_NhaCungCap] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NhanVien]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NhanVien](
	[MaNV] [nvarchar](50) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](100) NULL,
 CONSTRAINT [PK_NhanVien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanCong]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanCong](
	[MaPC] [int] IDENTITY(1,1) NOT NULL,
	[MaNV] [nvarchar](50) NULL,
	[MaPB] [varchar](7) NULL,
	[NgayPC] [datetime] NULL,
	[HieuLuc] [bit] NULL,
 CONSTRAINT [PK_PhanCong] PRIMARY KEY CLUSTERED 
(
	[MaPC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhanQuyen]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhanQuyen](
	[MaPQ] [int] IDENTITY(1,1) NOT NULL,
	[MaPB] [varchar](7) NULL,
	[MaTrang] [int] NULL,
	[Them] [bit] NULL,
	[Sua] [bit] NULL,
	[Xoa] [bit] NULL,
	[Xem] [bit] NULL,
 CONSTRAINT [PK_PhanQuyen] PRIMARY KEY CLUSTERED 
(
	[MaPQ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhongBan]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhongBan](
	[MaPB] [varchar](7) NOT NULL,
	[TenPB] [nvarchar](50) NULL,
	[ThongTin] [nvarchar](max) NULL,
 CONSTRAINT [PK_PhongBan] PRIMARY KEY CLUSTERED 
(
	[MaPB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[MaHieu] [int] NULL,
	[TenSP] [nvarchar](50) NULL,
	[TenAlias] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
	[MoTa] [nvarchar](max) NULL,
	[DonGia] [float] NULL,
	[Hinh] [nvarchar](50) NULL,
	[Hinh2] [nvarchar](50) NULL,
	[Hinh3] [nvarchar](50) NULL,
	[GiaCu] [float] NULL,
	[MaNCC] [nvarchar](50) NULL,
	[SpHot] [bit] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaHieu] [int] IDENTITY(1,1) NOT NULL,
	[TenHieu] [nvarchar](50) NULL,
	[Hinh] [nvarchar](50) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaHieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangThai]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangThai](
	[MaTrangThai] [int] NOT NULL,
	[TenTrangThai] [nvarchar](50) NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_TrangThai] PRIMARY KEY CLUSTERED 
(
	[MaTrangThai] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TrangWeb]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TrangWeb](
	[MaTrang] [int] IDENTITY(1,1) NOT NULL,
	[TenTrang] [nvarchar](50) NULL,
	[URL] [nvarchar](250) NULL,
 CONSTRAINT [PK_TrangWeb] PRIMARY KEY CLUSTERED 
(
	[MaTrang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YeuThich]    Script Date: 12/21/2019 12:03:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuThich](
	[MaYT] [int] IDENTITY(1,1) NOT NULL,
	[MaSP] [int] NULL,
	[MaKH] [int] NULL,
	[NgayChon] [datetime] NULL,
	[MoTa] [nvarchar](50) NULL,
 CONSTRAINT [PK_YeuThich] PRIMARY KEY CLUSTERED 
(
	[MaYT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBL], [MaSP], [MaKH], [NgayBL], [HoTen], [Email], [NoiDung]) VALUES (2, 11, 2, CAST(N'2019-12-18T23:30:58.810' AS DateTime), N'Cao Đức Minh', N'minh21298@gmail.com', N' Màn hình nét, CPU nhanh. Máy ngon!')
INSERT [dbo].[BinhLuan] ([MaBL], [MaSP], [MaKH], [NgayBL], [HoTen], [Email], [NoiDung]) VALUES (3, 11, 5, CAST(N'2019-12-18T23:33:04.400' AS DateTime), N'Minh Đức Cao', N'calmin21298@gmail.com', N' Máy này nâng cấp lên core i5 được không nhỉ ?')
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[ChiTietHD] ON 

INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (0, 2, 4, 34490000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (1, 3, 59, 16990000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (2, 4, 9, 15390000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (3, 4, 40, 1749000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (4, 5, 23, 590000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (5, 6, 56, 15990000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (6, 6, 21, 849000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (7, 7, 59, 16990000, 1, NULL)
INSERT [dbo].[ChiTietHD] ([MaCT], [MaHD], [MaSP], [DonGia], [SoLuong], [GiamGia]) VALUES (8, 7, 46, 2699000, 1, NULL)
SET IDENTITY_INSERT [dbo].[ChiTietHD] OFF
SET IDENTITY_INSERT [dbo].[HoaDon] ON 

INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (2, CAST(N'2019-12-19T22:05:02.613' AS DateTime), NULL, N'Park Hang Seo', N'1337 Nam Kỳ Khởi Nghĩa', NULL, NULL, 0, 1, N'Giao hàng trong khoảng thời gian 18h -> 23h', N'0769517632', 34490000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (3, CAST(N'2019-12-19T22:08:08.520' AS DateTime), NULL, N'Minh Đức Cao', N'04 Phan Văn Trị', NULL, NULL, 0, 1, N'Xin giao hàng gấp ngay trong ngày', N'0779852632', 16990000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (4, CAST(N'2019-12-19T22:40:42.010' AS DateTime), NULL, N'Nguyễn Quang Hải', N'280 PHan Đình Phùng', NULL, NULL, 0, 0, N'Không', N'0748523963', 17139000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (5, CAST(N'2019-12-19T23:18:55.953' AS DateTime), NULL, N'Lê Quang Liêm', N'138 Lý Chính Thắng', NULL, NULL, 0, 0, N'Nhớ đóng hộp kín!', N'0789512369', 590000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (6, CAST(N'2019-12-19T23:47:02.063' AS DateTime), NULL, N'Lưu Xuân Trường', N'28 Hồ Xuân Hương', NULL, NULL, 0, 0, N'Đóng gói riêng từng món ', N'0957412685', 16839000)
INSERT [dbo].[HoaDon] ([MaHD], [NgayDat], [NgayGiao], [HoTen], [DiaChi], [CachThanhToan], [CachVanChuyen], [PhiVanChuyen], [MaTrangThai], [GhiChu], [DienThoai], [TongTien]) VALUES (7, CAST(N'2019-12-20T09:52:41.937' AS DateTime), NULL, N'Cao Đức Minh', N'280 An Dương Vương', NULL, NULL, 0, 1, N' Giao hàng trong ngày', N'0769517368', 19689000)
SET IDENTITY_INSERT [dbo].[HoaDon] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [HieuLuc], [VaiTro], [RandomKey]) VALUES (2, N'ASTSuNQPBS54n3jgS3NO9hmLqtqffTcPKMdfuG9UMQZpKAg6HpVhYPwnpwv6Kx9X5Q==', N'Cao Đức Minh', 1, CAST(N'1999-02-12' AS Date), N'280 An Dương Vương', N'0769517368', N'minh21298@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [HieuLuc], [VaiTro], [RandomKey]) VALUES (5, N'AfyrN7nTp/yL3NY5MyGwRG1xpslxX3xxDU5qu50naF1X1oEI0Dt4exaYzzNHONBYVA==', N'Minh Đức Cao', 1, CAST(N'2012-12-02' AS Date), N'04 Phan Văn Trị', N'0779852632', N'calmin21298@gmail.com', NULL, NULL, NULL)
INSERT [dbo].[KhachHang] ([MaKH], [MatKhau], [HoTen], [GioiTinh], [NgaySinh], [DiaChi], [DienThoai], [Email], [HieuLuc], [VaiTro], [RandomKey]) VALUES (6, N'Aa1cEx8QsYCMNUyfqdECnLmaLdN9DhUPp1Xh1pjq51Mf7kYGcJi+AQ0Q6r80PfKQyw==', NULL, NULL, NULL, NULL, NULL, N'example@gmail.com', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[KhoHang] ON 

INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (1, 1, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (2, 2, 97)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (3, 3, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (4, 4, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (5, 5, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (6, 6, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (7, 7, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (8, 8, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (9, 9, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (10, 10, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (11, 11, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (12, 12, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (13, 13, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (14, 14, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (15, 15, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (16, 16, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (17, 17, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (18, 18, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (19, 19, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (20, 20, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (21, 21, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (22, 22, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (23, 23, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (24, 24, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (39, 31, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (40, 32, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (41, 33, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (42, 35, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (43, 36, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (44, 37, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (45, 38, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (46, 39, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (47, 40, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (50, 43, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (53, 46, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (56, 49, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (58, 51, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (59, 52, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (61, 54, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (62, 55, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (63, 56, 99)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (64, 57, 100)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (65, 58, 0)
INSERT [dbo].[KhoHang] ([MaKho], [MaSP], [SoLuong]) VALUES (66, 59, 98)
SET IDENTITY_INSERT [dbo].[KhoHang] OFF
SET IDENTITY_INSERT [dbo].[LienHe] ON 

INSERT [dbo].[LienHe] ([MaGY], [TieuDe], [NoiDung], [NgayGY], [HoTen], [Email], [DienThoai]) VALUES (1, N's', N's', CAST(N'2018-12-19T00:08:09.453' AS DateTime), N'a', N's', N's')
SET IDENTITY_INSERT [dbo].[LienHe] OFF
SET IDENTITY_INSERT [dbo].[Loai] ON 

INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (1, N'Apple', N'apple', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (2, N'Dell', N'dell', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (7, N'Asus', N'asus', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (8, N'Acer', N'acer', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (11, N'Sony', N'sony', N'1')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (12, N'Logitech', N'logitech', N'1')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (13, N'Kingston', N'kingston', N'1')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (14, N'Steelseries', N'steelseries', N'1')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (15, N'Razer', N'razer', N'1')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (19, N'HP', N'hp', N'0')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai], [TenLoaiAlias], [MoTa]) VALUES (20, N'Avita', N'avita', N'0')
SET IDENTITY_INSERT [dbo].[Loai] OFF
SET IDENTITY_INSERT [dbo].[LoaiBlog] ON 

INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (1, N'Review mỹ phẩm ', N'2')
INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (2, N'Makeup', N'2')
INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (3, N'Skincare', N'2')
INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (4, N'ChangMakeup', N'3')
INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (5, N'CIn CIty', N'3')
INSERT [dbo].[LoaiBlog] ([MaLoaiBlog], [TenLoaiBlog], [MoTa]) VALUES (6, N'Chlole', N'3')
SET IDENTITY_INSERT [dbo].[LoaiBlog] OFF
INSERT [dbo].[NhanVien] ([MaNV], [HoTen], [Email], [MatKhau]) VALUES (N'1', N'Minh', N'minh21298@gmail.com', N'ASTSuNQPBS54n3jgS3NO9hmLqtqffTcPKMdfuG9UMQZpKAg6HpVhYPwnpwv6Kx9X5Q==')
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (1, 1, N'Laptop MacBook Pro 2017 MPXR2', NULL, 1, N'CPU: Core i5 ( 2.3 GHz )
; Màn hình: 13.3" ( 2560 x 1600 ) , không cảm ứng
, RAM: 8GB; Đồ họa: Intel Iris Plus Graphics 640; Lưu trữ: 128GB SSD
; Hệ điều hành: macOS
; Pin: Pin liền , khối lượng: 1.3 kg', 31605000, N'macbookpro2017-1.jpg', N'macbookpro2017-2.jpg', N'macbookpro2017-3.jpg', 33300000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (2, 1, N'Laptop MacBook Air 2018 MREA2', NULL, 1, N'CPU: Core i5 ( 1.6 GHz - 3.6 GHz / 4MB; Màn hình: 13.3" IPS ( 2560 x 1600 ) , không cảm ứng; RAM: 1 x 8GB Onboard LPDDR3 2133MHz; Đồ họa: Intel UHD Graphics 617; Lưu trữ: 128GB SSD; Hệ điều hành: macOS; Pin: Pin liền , khối lượng: 1.2 kg', 28717000, N'macbook_air_2018_silver_1.jpg', N'macbook_air_2018_silver_2.jpg', N'macbook_air_2018_silver_3.jpg', 31900000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (3, 1, N'Laptop MacBook Air 2019 MVFN2', NULL, 1, N'CPU: Intel Core i5 (1.6 GHz - 3.6 GHz/4MB/2 nhân, 4 luồng); Màn hình: 13.3" IPS (2560 x 1600), không cảm ứng; RAM: 8GB Onboard DDR3L 2133MHz; Đồ họa: Intel UHD Graphics 617; Lưu trữ: 256GB SSD M.2 NVMe /; Hệ điều hành: macOS; 50 Wh Pin liền, Khối lượng: 1.3 kg', 34990000, N'Macbook_Air_13_3_2019_Gold_1.jpg', N'Macbook_Air_13_3_2019_Gold_2.jpg', N'Macbook_Air_13_3_2019_Gold_3.jpg', 36990000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (4, 1, N'Laptop MacBook Pro 2019 MUHN2', NULL, 1, N'CPU: Intel Core i5; Màn hình: 13.3" IPS (2560 x 1600), không cảm ứng; RAM: 8GB Onboard LPDDR3 2133MHz; Đồ họa: Intel Iris Plus Graphics 645; Lưu trữ: 128GB SSD /; Hệ điều hành: macOS - 59 Wh Pin liền, Khối lượng: 1.4 kg', 34490000, N'MacBook_Pro_2019_15_4_SpaceGray_1.jpg', N'MacBook_Pro_2019_15_4_SpaceGray_2.jpg', N'MacBook_Pro_2019_15_4_SpaceGray_3.jpg', 34990000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (5, 2, N'Laptop Dell Inspiron 15 5584', NULL, 2, N'CPU: Intel Core i5-8265U ( 1.6 GHz - 3.9 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 15.6" ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz; Đồ họa: Intel UHD Graphics 620 / NVIDIA GeForce MX130 2GB GDDR5; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 3 cell 42 Wh Pin liền , khối lượng: 1.9 kg', 16990000, N'Dell inspiron 15 5584_silver_1.jpg', N'Dell inspiron 15 5584_silver_2.jpg', N'Dell inspiron 15 5584_silver_3.jpg', 18190000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (6, 2, N'Laptop Dell Vostro 14 3480', NULL, 2, N'CPU: Intel Core i5-8265U ( 1.6 GHz - 3.9 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 14" ( 1366 x 768 ) , không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz; Đồ họa: Intel UHD Graphics 620 / AMD Radeon 520 2GB GDDR5; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 3 cell 42 Wh Pin liền , khối lượng: 1.8 kg', 14890000, N'Dell vostro 14 3480_black_1.jpg', N'Dell vostro 14 3480_black_2.jpg', N'Dell vostro 14 3480_black_3.jpg', 15190000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (7, 2, N'Laptop Dell Vostro 15 3580', NULL, 2, N'CPU: Intel Core i5-8265U (1.6 GHz - 3.9 GHz/6MB/4 nhân, 8 luồng); Màn hình: 15.6" TN (1920 x 1080), không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz (2 Khe cắm, Hỗ trợ tối đa 32GB); Đồ họa: Intel UHD Graphics 620/ AMD Radeon 520 2GB; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home 64-bit; Pin: 3 cell Pin liền, Khối lượng: 2.3 kg', 15590000, N'Dell_Vostro_15_3580_1.jpg', N'Dell_Vostro_15_3580_2.jpg', N'Dell_Vostro_15_3580_3.jpg', 16290000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (8, 2, N'Laptop Dell Inspiron 15 3593', NULL, 2, N'CPU: Intel Core i5-1035G1 (1.0 GHz - 3.6 GHz/6MB/4 nhân, 8 luồng); Màn hình: 15.6" (1920 x 1080), không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz (2 Khe cắm, Hỗ trợ tối đa 32GB); Đồ họa: Intel UHD Graphics/ NVIDIA GeForce MX230 2GB; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 3 cell 42 Wh Pin liền, Khối lượng: 2.2 kg', 14990000, N'Dell_Inspiron_15_3593_Black_1.jpg', N'Dell_Inspiron_15_3593_Black_2.jpg', N'Dell_Inspiron_15_3593_Black_3.jpg', 16390000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (9, 3, N'Laptop Asus Vivobook 15', NULL, 7, N'CPU: Intel Core i5-8265U ( 1.6 GHz - 3.9 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 15.6" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 8GB (4GB + 4GB Onboard) DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 2 cell 37 Wh Pin liền , khối lượng: 1.7 kg', 15390000, N'Asus a512_transparent silver_fingerprint_1.jpg', N'Asus a512_transparent silver_fingerprint_2.jpg', N'Asus a512_transparent silver_fingerprint_3.jpg', 15790000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (10, 3, N'Laptop ASUS TUF Gaming FX505DD-AL186T', NULL, 7, N'CPU: AMD Ryzen 5 3550H ( 2.1 GHz - 3.7 GHz / 4MB / 4 nhân, 8 luồng ); Màn hình: 15.6" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 8GB DDR4 2666MHz; Đồ họa: AMD Radeon Vega 8 Graphics / NVIDIA GeForce GTX 1050 3GB GDDR5; Lưu trữ: 512GB SSD M.2 NVMe; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 3 cell 48 Wh Pin liền , khối lượng: 2.2 kg', 18290000, N'Asus tuf gaming fx505dd_1.jpg', N'Asus tuf gaming fx505dd_2.jpg', N'Asus tuf gaming fx505dd_3.jpg', 18990000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (11, 3, N'Laptop ASUS 14 X409UA-EK092T', NULL, 7, N'CPU: Intel Core i3-7020U (2.3 GHz/3MB/2 nhân, 4 luồng); Màn hình: 14" (1920 x 1080), không cảm ứng; RAM: 1 x 4GB Onboard DDR4 (1 Khe cắm, Hỗ trợ tối đa 16GB); Đồ họa: Intel HD Graphics 620; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home 64-bit; Pin: 2 cell 32 Wh Pin rời, Khối lượng: 1.6 kg', 9890000, N'Asus_Vivobook_X409_Silver_1.jpg', N'Asus_Vivobook_X409_Silver_2.jpg', N'Asus_Vivobook_X409_Silver_3.jpg', 9890000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (12, 3, N'Laptop ASUS ROG Strix G G531GD-AL034T', NULL, 7, N'CPU: Intel Core i7-9750H ( 2.6 GHz - 4.5 GHz / 12MB / 6 nhân, 12 luồng ); Màn hình: 15.6" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 8GB DDR4 2666MHz; Đồ họa: Intel HD Graphics 630 / NVIDIA GeForce GTX 1050 4GB GDDR5; Lưu trữ: 512GB SSD M.2 NVMe; Hệ điều hành: Windows 10 Home 64-bit; Pin: 3 cell 48 Wh Pin liền , khối lượng: 2.4 kg', 24990000, N'Asus_ROG_Strix_G531GD-GT_1.jpg', N'Asus_ROG_Strix_G531GD-GT_2.jpg', N'Asus_ROG_Strix_G531GD-GT_3.jpg', 26490000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (13, 4, N'Laptop Acer Aspire 3 A315-54K-36QU', NULL, 8, N'CPU: Intel Core i3-7020U ( 2.3 GHz / 3MB / 2 nhân, 4 luồng ); Màn hình: 15.6" ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 4GB Onboard DDR4 2133MHz; Đồ họa: Intel HD Graphics 620; Lưu trữ: 256GB SSD M.2 NVMe; Hệ điều hành: Windows 10 Home 64-bit; Pin: 2 cell 37 Wh , khối lượng: 1.7 kg', 9490000, N'Acer aspire a315-54_2019_1.jpg', N'Acer aspire a315-54_2019_2.jpg', N'Acer aspire a315-54_2019_3.jpg', 9990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (14, 4, N'Laptop Acer Swift 3 SF315-52-38YQ', NULL, 8, N'CPU: Intel Core i3-8130U ( 2.2 GHz - 3.4 GHz / 4MB / 2 nhân, 4 luồng ); Màn hình: 15.6" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 4 cell 48 Wh Pin liền , khối lượng: 1.6 kg', 11490000, N'Acer swift 3 sf315-52_1.jpg', N'Acer swift 3 sf315-52_2.jpg', N'Acer swift 3 sf315-52_3.jpg', 13499000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (15, 4, N'Laptop Acer Nitro 5 AN515-54-51X1', NULL, 8, N'CPU: Intel Core i5 9300H (2.4 GHz - 4.1 GHz/8MB/4 nhân, 8 luồng); Màn hình: 15.6" IPS (1920 x 1080), không cảm ứng; RAM: 1 x 8GB DDR4 2400MHz (2 Khe cắm, Hỗ trợ tối đa 32GB); Đồ họa: Intel UHD Graphics 630/ NVIDIA GeForce GTX 1050 3GB; Lưu trữ: 256GB SSD M.2 NVMe /; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 55 Wh Pin liền, Khối lượng: 2.3 kg', 19790000, N'Acer_Nitro_5_AN515-54_2019_1.jpg', N'Acer_Nitro_5_AN515-54_2019_2.jpg', N'Acer_Nitro_5_AN515-54_2019_3.jpg', 19990000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (16, 4, N'Laptop Acer Aspire 5 A515-54-54EU', NULL, 8, N'CPU: Intel Core i5-10210U (1.6 GHz - 4.2 GHz/6MB/4 nhân, 8 luồng); Màn hình: 15.6" (1920 x 1080), không cảm ứng; RAM: 1 x 8GB DDR4 2133MHz (1 Khe cắm, Hỗ trợ tối đa 16GB); Đồ họa: Intel UHD Graphics 620; Lưu trữ: 512GB SSD M.2 NVMe /; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 48 WhKhối lượng: 1.7 kg', 15590000, N'Acer_Aspire_A515-54_Silver_2019_1.jpg', N'Acer_Aspire_A515-54_Silver_2019_2.jpg', N'Acer_Aspire_A515-54_Silver_2019_3.jpg', 15990000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (17, 5, N'Tai nghe không dây On-ear Sony WH-CH500/BCE', NULL, 11, N'Kiểu tai nghe: bluetooth - trùm đầu. - Chức năng kết nối 1 chạm NFC. - Sạc đầy: 4.5 giờ - 20 giờ sử dụng. - Công nghệ âm thanh: Extra Bass - Bộ màng loa Dynamic 30mm. - Chất liệu đệm tai bằng bọt biển cho cảm giác đeo thoải mái.', 1990000, N'Sony_ch500_tainghe-com-vn--1--r.jpg', N'Sony_ch500_tainghe-com-vn--2--r.jpg', N'Sony_ch500_tainghe-com-vn--3--r.jpg', 2000000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (18, 5, N'Tai nghe On-ear Sony MDRZX110APWCE', NULL, 11, N'Thiết Kế: On Ear; Kết Nối: Jack 3.5mm (audio); Chức Năng: Gấp gọn lại được; Tai nghe "Audio" mang một phong cách độc đáo cùng với một chất âm cân bằng, chi tiết.', 510000, N'Tai-nghe-sony-mdrzx110apwce-1.jpg', N'Tai-nghe-sony-mdrzx110apwce-2.jpg', N'Tai-nghe-sony-mdrzx110apwce-3.jpg', 590000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (19, 5, N'Loa bluetooth Sony SRS-XB41 - BC SP6', NULL, 11, N'Sử dụng công nghệ Extra Bass cùng tính năng LIVE SOUND, phát nhạc liên tục 24 giờ. - Tính năng Party Chain cho phép kết nối lên đến 100 loa khác nhau (có mã SRS) - Chống nước, chống bụi chống rỉ sét (IP67), có LED đa màu, nháy theo giai điệu. - Tính năng sạc cho điện thoại qua cổng USB.', 3490000, N'Loa-Sony-SRS-XB41LC-SP6-1.jpg', N'Loa-Sony-SRS-XB41LC-SP6-2.jpg', N'Loa-Sony-SRS-XB41LC-SP6-3.jpg', 4490000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (20, 5, N'Loa Sony SRS-X11 - LC', NULL, 11, N'Công suất: 10W, phát nhạc liên tục 12 giờ, kết nối cùng lúc 2 loa để trải nghiệm âm thanh Stereo với công suất gấp đôi, hỗ trợ nghe nhạc không dây qua kết nối 1 chạm NFC và Bluetooth. Bảo hành 6 tháng', 1119000, N'Loa_srs-x11lc-xanh_1.jpg', N'Loa_srs-x11lc-xanh_2.png', N'Loa_srs-x11lc-xanh_3.png', 1490000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (21, 6, N'Tai nghe Over-ear Logitech G231', NULL, 12, N'Thiết kế trùm tai và cách âm; Đệm tai được thiết kế dạng lưới thể thao; Củ tai có thể xoay ngang 180 độ, vừa có thể ôm khít mọi khung đầu khác nhau; Âm bass được đầu tư dày và chắc, âm mid được tái tạo trong trẻo; Microphone dạng gấp, tích hợp tắt tiếng khi gạt lên rất tiện lợi; Tương thích với tất cả các hệ máy console.', 849000, N'Tai nghe Over-ear Logitech G231_1.jpg', N'Tai nghe Over-ear Logitech G231_2.jpg', N'Tai nghe Over-ear Logitech G231_3.jpg', 1090000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (22, 6, N'Tai nghe Over-ear Logitech G433', NULL, 12, N'Thiết Kế: Over Ear (trùm kín quanh tai); Kết Nối: Jack 3.5mm (audio & mic) / Jack 3.5mm (volume & microphone mute) / Jack 3.5mm (1 female to 2 male) / USB; Chức Năng: Play / Pause / Call / Answer / Next / Previous (khi sử dụng với Smartphone*) / Dây tháo rời được / Volume Control / Microphone Mute / 7.1 Surround; Tai nghe "Gaming" mang một phong cách độc đáo, hiện đại nhưng lại có những nét nổi bật mang tính tự nhiên và phong cách đường phố.', 1679000, N'logitech_g433_1.jpg', N'logitech_g433_2.jpg', N'logitech_g433_3.jpg', 2490000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (23, 6, N'Loa bluetooth Logitech X50', NULL, 12, N'Loa không dây bluetooth 4.0; Tương thích với điện thoại và máy tính bảng; Có jack cắm 3.5mm; Phạm vi kết nối lên đến 10m; Công suất 3W RMS; Thời gian nghe nhạc lên đến 5h; Bảo hành 12 tháng', 590000, N'X50-1.jpg', N'X50-2.jpg', N'X50-3.jpg', 660000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (24, 6, N'Loa bluetooth Logitech MX Sound', NULL, 12, N'Công suất đỉnh: 24W - Công suất (RMS): 12W - Phiên bản Bluetooth: 4.1 - Phạm vi: 25m - Cổng 3.5mm: 2 - Cổng Headphone: 1', 1990000, N'mx-sound-1.jpg', N'mx-sound-2.jpg', N'mx-sound-3.jpg', 2511000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (31, 7, N'Tai nghe Over-ear Kingston Cloud Stinger', NULL, 13, N'Tai nghe nhẹ với cốc tai xoay 90 độ; Trình điều khiển hướng 50mm cho độ chính xác âm thanh; Thanh trượt điều chỉnh được; Micro cách tiếng ồn', 1199000, N'kingston_cloud_stinger-1.jpg', N'kingston_cloud_stinger-2.jpg', N'kingston_cloud_stinger-3.jpg', 1290000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (32, 7, N'Tai nghe In-ear Kingston Cloud Earbuds', NULL, 13, N'Lý tưởng cho Nintendo Switch™ - Đi kèm nút tai có 3 kích thước - Mic trên dây với nút đa chức năng - Tương thích với các thiết bị có đầu nối chuẩn CTIA 3,5mm.', 899000, N'cloud_earbuds_red_1.jpg', N'cloud_earbuds_red_2.jpg', N'cloud_earbuds_red_3.jpg', 990000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (33, 7, N'Tai nghe Over-ear Kingston Cloud II', NULL, 13, N'Đi kèm soundcard giả lập âm thành vòm 7.1 - Chất lượng âm thanh tuyệt vời cho game và nghe nhạc - Có thể sử dụng với PS4, Tablet và Smartphone - Âm treble sáng, âm mid trong, bass vừa phải, thích hợp với nghe nhạc Pop, Trance, Dance, Metal', 2299000, N'kingston hyperx cloud ii khx-hscp-rd_1.jpg', N'kingston hyperx cloud ii khx-hscp-rd_2.jpg', N'kingston hyperx cloud ii khx-hscp-rd_3.jpg', 2490000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (35, 7, N'Tai nghe Over-ear Kingston Cloud Alpha', NULL, 13, N'Tương thích với nhiều nền tảng - Micro khử nhiễu có thể tháo rời - Dây cáp bện có thể tháo rời cùng bộ điều khiển âm thanh ngay trên dây', 2290000, N'Kingston-HyperX-Cloud-Alpha-1.jpg', N'Kingston-HyperX-Cloud-Alpha-2.jpg', N'Kingston-HyperX-Cloud-Alpha-3.jpg', 2490000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (36, 8, N'Tai nghe SteelSeries Arctis Raw', NULL, 14, N'Thiết kế fullsize overear, bao trùm toàn bộ vành tai - Chất liệu đệm mềm mại, thoải mái - Chuẩn kết nối: 3.5mm', 1190000, N'steelseries arctis raw_1.jpg', N'steelseries arctis raw_2.jpg', N'steelseries arctis raw_3.jpg', 1290000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (37, 8, N'Tai nghe không dây Over-ear SteelSeries Arctis 7', NULL, 14, N'Loa S1+Tai nghe DTS X : Sử dụng loa tương tự với các tai nghe đời cao, S1 được thiết kế để cung cấp một âm thanh cân bằng chi tiết, cân bằng với độ méo cực thấp; Micro ClearCast sử dụng thiết kế hai chiều độc quyền cung cấp sự rõ nét về giọng nói và lọc ồn xuất sắc; Ski Goggle Headband : Vải đàn hồi điều chỉnh đường viền hoàn hảo trên đầu, phân bố đều khối lượng, loại bỏ tất cả các điểm áp lực.; Đệm tai nghe AirWeave : lấy cảm hứng từ các loại vải tìm thấy trong quần áo thể thao, đệm tai AirWeave mềm và giữ mát, khô, và thoải mái trong nhiều giờ chơi game.', 4190000, N'khong_day_Over-ear_1.jpg', N'khong_day_Over-ear_2.jpg', N'khong_day_Over-ear_3.jpg', 4290000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (38, 8, N'Tai nghe Over-ear SteelSeries Arctis 5', NULL, 14, N'Driver giống với các tai nghe đời cao của Steelseries, cho chi tiết cao, âm thanh cân bằng và độ méo cực thấp; Giả lập âm thanh vòm DTS 7.1 sống động; Led RGB 16,8 triệu màu tuỳ chỉnh có thẩm mỹ cao và cá tính riêng; Đệm đầu làm bằng vải đàn hồi có thể điều chỉnh, phân bố đều khối lượng tai nghe, loại bỏ tất cả các điểm gây áp lực; Microphone lọc ồn môi trường và khử méo giọng nói; có thể kéo dài và thu gọn; Đệm tai thoáng khí, thiết kế sử dụng các chất liệu được sử dụng trong thể thao chuyên nghiệp.', 2489000, N'steelseries_61443_arctis_5_1.jpg', N'steelseries_61443_arctis_5_2.jpg', N'steelseries_61443_arctis_5_3.jpg', 2589000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (39, 8, N'Tai nghe không dây Over-ear SteelSeries Arctis Pro', NULL, 14, N'Chứng nhận âm thanh Hi-Res; micro Arctis ClearCast mang lại khả năng xóa âm thanh chất lượng cao và khả năng khử tiếng ồn nền; Trình điều khiển loa cao cấp; Kết nối không dây linh hoạt', 9290000, N'1_26_146.jpg', N'2_19_148.jpg', N'3_15_88.jpg', 9890000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (40, 9, N'Tai nghe Over-ear Razer Electra V2', NULL, 15, N'Công cụ âm thanh vòng 7.1 tiên tiến; Hiệu chuẩn âm thanh cá nhân; Micrô kỹ thuật số nâng cao; Giá cả hoàn toàn xứng đáng với chất lượng; Thiết kế hiện đại, bắt mắt; Được thiết kế thoải mái với nhiều cỡ đầu người dùng; Microphone chất lượng cao, cách âm tốt', 1749000, N'sp04ara_174921_800x800.jpg', N'sp04ara_174922_800x800.jpg', N'sp04ara_174923_800x800.jpg', 1849000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (43, 9, N'Tai nghe Over-ear Razer Tiamat 7.1 V2', NULL, 15, N'Tương thích đa nền tảng - 4 x 50mm củ loa âm thanh; Bộ điều chỉnh âm thanh trên dây; Jack 3.5 audio kết hợp; Dải tần đáp ứng: 100 – 10 kHz; Loại micrô: ECM', 5889000, N'techzones-razer-tiamat-1.jpg', N'techzones-razer-tiamat-2.jpg', N'techzones-razer-tiamat-3.jpg', 5990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (46, 9, N'Tai nghe không dây In-ear Razer Hammerhead', NULL, 15, N'Thương hiệu: Razer - Chuẩn kết nối: Bluetooth; Thời lượng pin ấn tượng lên đến 8h, tương thích dễ dàng với các thiết bị.', 2699000, N'In-ear Razer Hammerhead_1.jpg', N'In-ear Razer Hammerhead_2.jpg', N'In-ear Razer Hammerhead_3.jpg', 2799000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (49, 9, N'Tai nghe In-ear Razer Ifrit + Razer USB', NULL, 15, N'Chất lượng âm thanh mà bạn luôn mong đợi; Thiết kế nhỏ gọn giúp cho các streamer có cảm giác thoải mái khi đeo; Microphone có chất lượng thu âm tuyệt vời và có thể điều chỉnh được; Không làm ảnh hưởng đến kiểu tóc của người sử dụng', 2790000, N'razer ifrit + razer usb audio_1.jpg', N'razer ifrit + razer usb audio_2.jpg', N'razer ifrit + razer usb audio_3.jpg', 2990000, NULL, NULL)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (51, 10, N'Laptop HP Pavilion 14-ce2041TU', NULL, 19, N'CPU: Intel Core i5-8265U ( 1.6 GHz - 3.9 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 14" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 4GB DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 3 cell Pin liền , khối lượng: 1.6 kg', 14990000, N'hp pavilion 14-ce2041tu (6zt94pa)_1.jpg', N'hp pavilion 14-ce2041tu (6zt94pa)_2.jpg', N'hp pavilion 14-ce2041tu (6zt94pa)_3.jpg', 15990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (52, 10, N'Laptop HP ProBook 440 G6', NULL, 19, N'CPU: Intel Core i3-8145U ( 2.1 GHz - 3.9 GHz / 4MB / 2 nhân, 4 luồng ); Màn hình: 14" IPS ( 1366 x 768 ) , không cảm ứng; RAM: 1 x 4GB DDR4 2666MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 500GB HDD 5400RPM; Hệ điều hành: Free DOS; Pin: 3 cell 45 Wh Pin liền , khối lượng: 1.6 kg', 12390000, N'hp probook 440 g6_1.jpg', N'hp probook 440 g6_2.jpg', N'hp probook 440 g6_3.jpg', 13390000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (54, 10, N'Laptop HP Pavilion Gaming 15-dk0003TX', NULL, 19, N'CPU: Intel Core i7-9750H (2.6 GHz - 4.5 GHz/12MB/6 nhân, 12 luồng); Màn hình: 15.6" IPS (1920 x 1080), không cảm ứng; RAM: 1 x 16GB DDR4 2666MHz (2 Khe cắm, Hỗ trợ tối đa 32GB); Đồ họa: Intel UHD Graphics 630/ NVIDIA GeForce GTX 1660Ti 6GB; Lưu trữ: 512GB SSD M.2 NVMe / 1TB HDD 5400RPM; Hệ điều hành: Windows 10 Home 64-bit; Pin: 3 cell 53 Wh Pin liền, Khối lượng: 2.2 kg', 31990000, N'HP_Gaming_Pavilion15_1.jpg', N'HP_Gaming_Pavilion15_2.jpg', N'HP_Gaming_Pavilion15_3.jpg', 33990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (55, 10, N'Laptop HP ENVY 13-aq0027TU', NULL, 19, N'CPU: Intel Core i7-8565U ( 1.8 GHz - 4.6 GHz / 8MB / 4 nhân, 8 luồng ); Màn hình: 13.3" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 1 x 8GB Onboard DDR4; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 256GB SSD M.2 NVMe; Hệ điều hành: Windows 10 Home SL 64-bit; Pin: 4 cell 53 Wh Pin liền , khối lượng: 1.3 kg', 26990000, N'hp envy 13-aq00xxtu _gold_1.jpg', N'hp envy 13-aq00xxtu _gold_2.jpg', N'hp envy 13-aq00xxtu _gold_3.jpg', 27490000, NULL, 0)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (56, 11, N'Laptop AVITA LIBER U13-70181496', NULL, 20, N'CPU: Intel Core i5-8250U ( 1.6 GHz - 3.4 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 13.3" ( 1920 x 1080 ) , không cảm ứng; RAM: 8GB Onboard DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 256GB SSD M.2 SATA; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 36 Wh Pin liền , khối lượng: 1.4 kg', 15990000, N'avita-liber-u14-Iris-on-Ruby4-1.png', N'avita-liber-u14-Iris-on-Ruby4-2.png', N'avita-liber-u14-Iris-on-Ruby4-3.png', 20990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (57, 11, N'Laptop AVITA LIBER U14-70181500', NULL, 20, N'CPU: Intel Core i5-8250U ( 1.6 GHz - 3.4 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 14" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 8GB Onboard DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 256GB SSD M.2 SATA; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 36 Wh Pin liền , khối lượng: 1.5 kg', 13051000, N'avita-liber-u14-Flowers-on-Yellow-1.png', N'avita-liber-u14-Flowers-on-Yellow-2.jpg', N'avita-liber-u14-Flowers-on-Yellow-3.png', 20990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (58, 11, N'Laptop AVITA LIBER U14-70181503', NULL, 20, N'CPU: Intel Core i5-8250U ( 1.6 GHz - 3.4 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 14" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 8GB Onboard DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 256GB SSD M.2 SATA; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 36 Wh Pin liền , khối lượng: 1.5 kg', 15990000, N'avita-liber-u14-paisley-on-lilac-1.png', N'avita-liber-u14-paisley-on-lilac-2.png', N'avita-liber-u14-paisley-on-lilac-3.png', 20990000, NULL, 1)
INSERT [dbo].[SanPham] ([MaSP], [MaHieu], [TenSP], [TenAlias], [MaLoai], [MoTa], [DonGia], [Hinh], [Hinh2], [Hinh3], [GiaCu], [MaNCC], [SpHot]) VALUES (59, 11, N'Laptop AVITA LIBER U14-CBP-70177658', NULL, 20, N'CPU: Intel Core i5-8250U ( 1.6 GHz - 3.4 GHz / 6MB / 4 nhân, 8 luồng ); Màn hình: 14" IPS ( 1920 x 1080 ) , không cảm ứng; RAM: 8GB Onboard DDR4 2400MHz; Đồ họa: Intel UHD Graphics 620; Lưu trữ: 256GB SSD M.2 SATA; Hệ điều hành: Windows 10 Home 64-bit; Pin: 4 cell 36 Wh Pin liền , khối lượng: 1.5 kg', 16990000, N'Laptop-Avita-Liber-U14-CBP-1.jpg', N'Laptop-Avita-Liber-U14-CBP-2.jpg', N'Laptop-Avita-Liber-U14-CBP-3.jpg', 20990000, NULL, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (1, N'Apple', N'apple.png')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (2, N'Dell', N'dell.png')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (3, N'Asus', N'asus.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (4, N'Acer', N'acer.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (5, N'Sony', N'sony.png')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (6, N'Logitech', N'logitech.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (7, N'Kingston', N'kingston.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (8, N'Steelseries', N'steelseries.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (9, N'Razer', N'razer.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (10, N'HP', N'hp.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (11, N'Avita', N'avita.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (12, N'LG', N'lg.png')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (13, N'Lenovo', N'lenovo.png')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (14, N'MSI', N'msi.jpg')
INSERT [dbo].[ThuongHieu] ([MaHieu], [TenHieu], [Hinh]) VALUES (15, N'SamSung', N'samsung.png')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (0, N'Chờ xác nhận', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (1, N'Đang chuẩn bị hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (2, N'Đang giao hàng', NULL)
INSERT [dbo].[TrangThai] ([MaTrangThai], [TenTrangThai], [MoTa]) VALUES (3, N'Đã giao hàng', NULL)
SET IDENTITY_INSERT [dbo].[YeuThich] ON 

INSERT [dbo].[YeuThich] ([MaYT], [MaSP], [MaKH], [NgayChon], [MoTa]) VALUES (1, 11, 2, CAST(N'2019-12-18T23:47:19.523' AS DateTime), NULL)
INSERT [dbo].[YeuThich] ([MaYT], [MaSP], [MaKH], [NgayChon], [MoTa]) VALUES (2, 15, 2, CAST(N'2019-12-18T23:50:43.693' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[YeuThich] OFF
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_KhachHang]
GO
ALTER TABLE [dbo].[BanBe]  WITH CHECK ADD  CONSTRAINT [FK_BanBe_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BanBe] CHECK CONSTRAINT [FK_BanBe_SanPham]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_KhachHang]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_SanPham]
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_LoaiBlog] FOREIGN KEY([MaLoaiBlog])
REFERENCES [dbo].[LoaiBlog] ([MaLoaiBlog])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_LoaiBlog]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_HoaDon]
GO
ALTER TABLE [dbo].[ChiTietHD]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietHD_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietHD] CHECK CONSTRAINT [FK_ChiTietHD_SanPham]
GO
ALTER TABLE [dbo].[ChuDe]  WITH CHECK ADD  CONSTRAINT [FK_ChuDe_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[ChuDe] CHECK CONSTRAINT [FK_ChuDe_NhanVien]
GO
ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_TrangThai] FOREIGN KEY([MaTrangThai])
REFERENCES [dbo].[TrangThai] ([MaTrangThai])
GO
ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_TrangThai]
GO
ALTER TABLE [dbo].[HoiDap]  WITH CHECK ADD  CONSTRAINT [FK_HoiDap_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[HoiDap] CHECK CONSTRAINT [FK_HoiDap_NhanVien]
GO
ALTER TABLE [dbo].[KhoHang]  WITH CHECK ADD  CONSTRAINT [FK_KhoHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[KhoHang] CHECK CONSTRAINT [FK_KhoHang_SanPham]
GO
ALTER TABLE [dbo].[KhuyenMai]  WITH CHECK ADD  CONSTRAINT [FK_KhuyenMai_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[KhuyenMai] CHECK CONSTRAINT [FK_KhuyenMai_KhachHang]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_NhanVien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[NhanVien] ([MaNV])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_NhanVien]
GO
ALTER TABLE [dbo].[PhanCong]  WITH CHECK ADD  CONSTRAINT [FK_PhanCong_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanCong] CHECK CONSTRAINT [FK_PhanCong_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_PhongBan] FOREIGN KEY([MaPB])
REFERENCES [dbo].[PhongBan] ([MaPB])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_PhongBan]
GO
ALTER TABLE [dbo].[PhanQuyen]  WITH CHECK ADD  CONSTRAINT [FK_PhanQuyen_TrangWeb] FOREIGN KEY([MaTrang])
REFERENCES [dbo].[TrangWeb] ([MaTrang])
GO
ALTER TABLE [dbo].[PhanQuyen] CHECK CONSTRAINT [FK_PhanQuyen_TrangWeb]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_Loai]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_NhaCungCap] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NhaCungCap] ([MaNCC])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_NhaCungCap]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([MaHieu])
REFERENCES [dbo].[ThuongHieu] ([MaHieu])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
ALTER TABLE [dbo].[ThuongHieu]  WITH CHECK ADD  CONSTRAINT [FK_ThuongHieu_ThuongHieu] FOREIGN KEY([MaHieu])
REFERENCES [dbo].[ThuongHieu] ([MaHieu])
GO
ALTER TABLE [dbo].[ThuongHieu] CHECK CONSTRAINT [FK_ThuongHieu_ThuongHieu]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_KhachHang]
GO
ALTER TABLE [dbo].[YeuThich]  WITH CHECK ADD  CONSTRAINT [FK_YeuThich_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[YeuThich] CHECK CONSTRAINT [FK_YeuThich_SanPham]
GO
USE [master]
GO
ALTER DATABASE [EStore] SET  READ_WRITE 
GO
