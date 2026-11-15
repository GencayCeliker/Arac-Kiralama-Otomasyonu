/* KIRALAMA veritabanı - SQL Server'dan dışa aktarıldı (2026-11-15)
   SSMS ile açıp Execute (F5) ile çalıştırın. */
IF DB_ID(N'KIRALAMA') IS NULL CREATE DATABASE [KIRALAMA];
GO
USE [KIRALAMA];
GO

CREATE TABLE [dbo].[ARAC] (
    [AKod] int IDENTITY(1,1) NOT NULL,
    [Marka] nvarchar(50) NULL,
    [Model] int NULL,
    [Plaka] nvarchar(20) NULL,
    [Fiyat] decimal(10,2) NULL,
    [Kirada] bit NULL,
    CONSTRAINT [PK__ARAC__43FA1D38F8188919] PRIMARY KEY ([AKod])
);
GO

CREATE TABLE [dbo].[KIRA] (
    [KKod] int IDENTITY(1,1) NOT NULL,
    [MKod] int NULL,
    [AKod] int NULL,
    [Tarih] date NULL,
    [Saat] time(0) NULL,
    [TeslimTarih] date NULL,
    [TeslimSaat] time(0) NULL,
    CONSTRAINT [PK__KIRA__BE7629704EE62136] PRIMARY KEY ([KKod])
);
GO

CREATE TABLE [dbo].[MUSTERI] (
    [MKod] int IDENTITY(1,1) NOT NULL,
    [MAd] nvarchar(50) NULL,
    [MSoyad] nvarchar(50) NULL,
    [MTCKimlik] char(11) NULL,
    [MAdres] nvarchar(100) NULL,
    [MTel] nvarchar(20) NULL,
    CONSTRAINT [PK__MUSTERI__1A6765AE5C1275B3] PRIMARY KEY ([MKod])
);
GO

SET IDENTITY_INSERT [dbo].[ARAC] ON;
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (1, N'Fiat Egea', 2016, N'60ZT035', 500.00, 0);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (2, N'Renault Megane', 2019, N'60ZA061', 800.00, 0);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (3, N'Ford Focus', 2017, N'60HT485', 600.00, 0);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (4, N'Volkswagen Golf', 2015, N'60FA161', 800.00, 0);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (5, N'Opel Astra', 2018, N'60ZE537', 900.00, 1);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (6, N'Fiat Egea', 2020, N'60ZB888', 800.00, 1);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (7, N'Fiat Egea', 2021, N'60AL345', 1000.00, 0);
INSERT INTO [dbo].[ARAC] ([AKod], [Marka], [Model], [Plaka], [Fiyat], [Kirada]) VALUES (8, N'Volkswagen Golf', 2021, N'60AZ909', 1200.00, 0);
SET IDENTITY_INSERT [dbo].[ARAC] OFF;
GO

SET IDENTITY_INSERT [dbo].[KIRA] ON;
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (1, 1, 4, '2021-05-01', '14:00:00', '2021-05-03', '14:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (2, 3, 1, '2021-09-04', '12:00:00', '2021-09-05', '14:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (3, 1, 3, '2021-10-01', '14:00:00', '2021-10-04', '17:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (4, 2, 5, '2021-12-10', '10:00:00', '2021-12-16', '15:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (5, 4, 2, '2021-12-18', '12:00:00', '2021-12-23', '16:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (7, 1, 1, '2021-12-25', '09:00:00', '2025-12-28', '15:27:59');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (8, 3, 4, '2021-12-15', '15:00:00', '2025-12-28', '15:39:22');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (9, 5, 5, '2021-12-20', '11:30:00', '2022-01-04', '12:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (10, 2, 2, '2021-12-25', '13:30:00', '2022-01-05', '15:00:00');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (11, 3, 3, '2021-12-25', '14:00:00', '2025-12-28', '15:40:11');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (13, 4, 5, NULL, NULL, '2025-12-28', '15:12:08');
INSERT INTO [dbo].[KIRA] ([KKod], [MKod], [AKod], [Tarih], [Saat], [TeslimTarih], [TeslimSaat]) VALUES (14, 4, 6, '2025-12-28', '15:14:02', NULL, NULL);
SET IDENTITY_INSERT [dbo].[KIRA] OFF;
GO

SET IDENTITY_INSERT [dbo].[MUSTERI] ON;
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (1, N'Turgut', N'Özseven', N'10000000001', N'Turhal/TOKAT', N'05550000001');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (2, N'Mustafa', N'Çağlayan', N'10000000002', N'Meram/KONYA', N'05550000002');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (3, N'Ahmet', N'Kara', N'10000000003', N'Zile/TOKAT', N'05550000003');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (4, N'Murat', N'Beyaz', N'10000000004', N'Turhal/TOKAT', N'05550000004');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (5, N'Elif', N'Kurt', N'10000000005', N'Beşiktaş/İSTANBUL', N'05550000005');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (6, N'Ayşe', N'Uçar', N'10000000006', N'Taşova/AMASYA', N'05550000006');
INSERT INTO [dbo].[MUSTERI] ([MKod], [MAd], [MSoyad], [MTCKimlik], [MAdres], [MTel]) VALUES (7, N'Bülent', N'Ayar', N'10000000007', N'Zile/TOKAT', N'05550000007');
SET IDENTITY_INSERT [dbo].[MUSTERI] OFF;
GO

ALTER TABLE [dbo].[KIRA] ADD CONSTRAINT [FK_Kira_Arac] FOREIGN KEY ([AKod]) REFERENCES [dbo].[ARAC] ([AKod]);
GO
ALTER TABLE [dbo].[KIRA] ADD CONSTRAINT [FK_Kira_Musteri] FOREIGN KEY ([MKod]) REFERENCES [dbo].[MUSTERI] ([MKod]);
GO

CREATE PROCEDURE sp_Agetir
AS BEGIN
SELECT* 
  FROM ARAC
END
GO

CREATE PROCEDURE sp_Kirala
AS BEGIN
SELECT *
  FROM KIRA
END
GO

CREATE PROCEDURE sp_Mgetir
AS BEGIN
SELECT *
  FROM MUSTERI
END
GO

CREATE PROCEDURE  dbo.spAracTeslimAl
@KKOD INT,
@AKOD INT,
@MKOD INT
AS BEGIN
SET NOCOUNT ON
UPDATE KIRA  SET TeslimTarih = GETDATE(), TeslimSaat = CAST(GETDATE() AS TIME(0))
WHERE KKod = @KKOD  AND AKod = @AKOD AND MKod = @MKOD

UPDATE ARAC SET Kirada=0
WHERE ARAC.AKod=@AKOD
END
GO

CREATE PROCEDURE  spAracTeslimEt
@AKOD INT,
@MKOD INT
AS BEGIN
SET NOCOUNT ON
INSERT INTO KIRA(AKod,MKod,Tarih,Saat)
VALUES(@AKOD,@MKOD,GETDATE(),CAST(GETDATE() AS TIME(0)))

UPDATE ARAC SET Kirada=1
WHERE ARAC.AKod=@AKOD
END
GO

CREATE PROCEDURE  spPlakaFiltre 
@PARA NVARCHAR(20)
AS BEGIN
SELECT *
  FROM ARAC
  WHERE Plaka LIKE @PARA+'%'
END
GO

CREATE PROCEDURE  [dbo].[spTCFiltre]
@TCARA NVARCHAR(11)
AS BEGIN
SELECT *
  FROM MUSTERI
  WHERE MTCKimlik LIKE @TCARA+'%'
END
GO
