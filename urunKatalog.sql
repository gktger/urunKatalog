USE [urunKatalogDb]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 24.09.2019 21:01:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24.09.2019 21:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.09.2019 21:01:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Price] [float] NOT NULL,
	[Stock] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsHome] [bit] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__MigrationHistory] ([MigrationId], [ContextKey], [Model], [ProductVersion]) VALUES (N'201909181022063_InitialCreate', N'urunKatalog.MvcWebUI.Entity.DataContext', 0x1F8B0800000000000400ED59DB6EE336107D2FD07F10F4D416592B979736B077917592D6D87512C4C9B66F012D8D1D6229522529C346D12FEB433FA9BFD0D19D122D5B762E68178B00814D720E678687C399F13F7FFDDD7FB70C99B300A9A8E003F7A877E83AC07D11503E1FB8B19EBDF9D17DF7F6DB6FFA1741B8743E15EB4E927528C9D5C07DD43A3AF53CE53F4248542FA4BE144ACC74CF17A14702E11D1F1EFEE41D1D7980102E62394EFF36E69A86907EC1AF43C17D88744CD85804C0543E8E339314D5B92221A888F8803AC9987F209A3031EF8D17FEAF30BD1FF52E104EAF5CE78C51822A4D80CD5C87702E34D1A8F0E9BD82899682CF27110E1076B78A00D7CD0853901B725A2DEF6AD3E1716293570916507EACB40877043C3AC99DE435C5F772B55B3A11DD98F927B13A75E5C01D120D7321D165CDCD4E874C260B377ABA57C81F38EB561D944C4142257F07CE30663A9630E0106B49D88173134F19F53FC0EA4E7C063EE03163A6CAA834CED50670E8468A08A45EDDC22C376414B88E5797F39A82A59821939938E2FAE4D875AE707332655032C270C7440B093F030789260737446B903CC1809C73DEC6BD92FFC56E4841BC56AE3326CB8FC0E7FA71E0E247D7B9A44B088A915C837B4EF116A29096316CDBE41C942F699471E5B9F7BA220B3A4F7DD1D815BF06B1AF95EBDC024B17A8471A65B7AF974F3E5444BB9422BC15AC122CE71EEE889C8346D545CB828988A5DF50ADEF55ACDEC8F51C6D5FAAE7E25F99FEC533DDE237F54B8BCE059E22AC71E0660CF4A9FF79DB196C86188564FEF28E1DA9B3289262012563DE0BBC8B84EFAEAFFA45544CD817A5B8FADB19DC355C5591E8A9E1AA8846ADE1AA88675DC2D59952C2A7A93EF57855E95237F08207CE36C532AE18862163302CD1080311EA30707FB0FCB601B60CCF156CE5A73AEE91DB0C64D7FC1C186870CEFC2C151A12E593C03E38F44F501FC1D80732093E846186A8309A52AEED4049B94F23C2B668DF90EB186213BDCA1D9A33E710014FA2E396F3E8B2B5C9775B8572A786CBB679A8EF19F4B21F4994D12801B288AEF8BA2563B05CF75A62129D3F982A8F294D06259813D075932860865071DF2290C5C33A4A9565581825B71B1086CD168E71C38D656D51A079101DEE5EA9BFA9BA75A21D6E9B01647AB2796BEAC6AE0938E52157559597955545F9E5B5D45FFD3189227C6E8C7A2C1F71265931367C33D9BD3809330CCF576B6A9452DB7227CC4AF0016CCCE2D6A8E925954A27A49D92E4251806A1B5CCA4740BD18A9D2CD6DA875610B010493E67625D8AA535812007BA4413C32490A439987DF26B44D3E2983022D7A47C43C1E290B7C7B476E92C8933E5B391EE08B50CCD04AA4DD8787DAFE10B2B085AEEB7DE8FFA81763AEEF28E3ED761174169F7B36E95FCD28EBA0D2F4FB84DA47CA83B469E709B18F950778C3CE3AEB9361BDA01C3C8A76B40C6F82E68594E5D47CAC6BAA398398689B429F778E18B693D52CD25E5EEE563D57894FAF903B1BD7368BD18D912D741372D6890BC169395D210F69205BDC9EF6CC828DA5B2D18134E67A07456C8BBC78747C78D9EE37FA7FFE72915B08E4DC057EF46D0C4AB5BFB0D3B968C6603822F88F41F89FC2E24CBEF4DA43D9B0C3BE0EDDC97FAEAFD67F4FE9636CE8C09A29FD6C549BDF7941ECE93ACB1FB3453BA873EB51ECD3E08767F26F58B55348EB06C5D0EDC3F52B15367F4DB432579E05C4B8CAAA7CEA1F3E716055EA07B521582AFDDD7B08ABFFD3A367BB54736D4222FD50FF9FFF43FEC9AB2538763B5B1BF9165190337980A3CE78CE11B0AFA96FEC7A6F6C7BA1DDA7A0FAFD21C69FAA55ECA76E886AC6BA3BC4CEBC3CE1E9155C6AFD3486A45E71544F25B3507BFC6A772CD88CF4441ED8646C59246181D83260192ED4C6A3A23BEC6691F944A7BFC9F088B71C945388560C4AF631DC51A4D8670CA6A4E4CAEC7A6FDD3FE4E5DE7FE75FABEAAE73001D5A468025CF3F7316541A9F7E59A28DE0291DCBB3C1549CE522729C97C55225D09DE1128775F192EEE208C1882A96B3E210BD847B77B051F614EFC555104B4836C3F88BADBFBE794CC2509558E51C9E357E470102EDFFE0BF18C961AA4210000, N'6.1.3-40302')
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (1, N'Kamera', N'Kamera ürünleri')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (2, N'Bilgisayar', N'Bilgisayar ürünleri')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (3, N'Televizyon', N'Televizyon ürünleri')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (4, N'Telefon', N'Telefon ürünleri')
GO
INSERT [dbo].[Categories] ([Id], [Name], [Description]) VALUES (5, N'Beyaz Eşya', N'Beyaz Eşya ürünleri')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (1, N'Canon Eos 1200D 18-55 mm DC Profesyonel Dijital Fotoğraf Makinesi', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 1200, 500, N'1.jpg', 1, 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (2, N'Canon Eos 100D 18-55 mm DC Profesyonel Fotoğraf Makines', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 1200, 500, N'2.jpg', 1, 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (3, N'Canon Eos 700D 18-55 DC DSLR Fotoğraf Makinesi', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 1200, 500, N'3.jpg', 0, 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (4, N'Canon Eos 100D 18-55 mm IS STM Kit DSLR Fotoğraf Makinesi', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 1200, 500, N'4.jpg', 1, 1, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (5, N'Canon Eos 700D + 18-55 Is Stm + Çanta + 16 Gb Hafıza Kartı', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 1200, 500, N'5.jpg', 0, 0, 1)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (6, N'Dell Inspiron 5567 Intel Core i5 7200U 8GB 1TB R7 M445 Windows 10 Home 15.6 FHD Taşınabilir Bilgisayar FHDG20W81C', NULL, 1200, 500, NULL, 1, 0, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (7, N'Lenovo Ideapad 310 Intel Core i7 7500U 12GB 1TB GT920M Windows 10 Home 15.6 Taşınabilir Bilgisayar 80TV028XTX', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 4500, 1200, N'1.jpg', 1, 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (8, N'Asus UX310UQ-FB418T Intel Core i7 7500U 8GB 512GB SSD GT940MX Windows 10 Home 13.3 QHD Taşınabilir Bilgisayar', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 3400, 0, N'2.jpg', 0, 1, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (9, N'Asus UX310UQ-FB418T Intel Core i7 7500U 16GB 512GB SSD GT940MX Windows 10 Home 13.3 QHD Taşınabilir Bilgisayar', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 2500, 600, N'3.jpg', 1, 0, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (10, N'Asus N580VD-DM160T Intel Core i7 7700HQ 16GB 1TB + 128GB SSD GTX1050 Windows 10 Home', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 5200, 500, N'4.jpg', 1, 0, 2)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (11, N'LG 49UH610V 49 124 Ekran 4K Uydu Alıcılı Smart LED TV', NULL, 1200, 500, N'1.jpg', 1, 0, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (12, N'Vestel 49UB8300 49 124 Ekran 4K Smart Led Tv', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 5600, 1200, N'2.jpg', 1, 0, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (13, N'Samsung 55KU7500 55 140 Ekran [4K] Uydu Alıcılı Smart[Tizen] LED TV', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 3400, 0, N'3.jpg', 0, 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (14, N'LG 55UH615V 55 140 Ekran 4K Uydu Alıcılı Smart Wi-Fi [webOS 3.0] LED TV', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 2500, 600, N'4.jpg', 1, 1, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (15, N'Sony Kd-55Xd7005B 55 140 Ekran [4K] Uydu Alıcılı Smart LED TV', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 5200, 500, N'5.jpg', 1, 0, 3)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (16, N'Apple iPhone 6 32 GB (Apple Türkiye Garantili)', NULL, 1200, 500, N'1.jpg', 1, 0, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (17, N'Apple iPhone 7 32 GB (Apple Türkiye Garantili)', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 5600, 1200, N'2.jpg', 1, 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (18, N'Apple iPhone 6S 32 GB (Apple Türkiye Garantili)', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 3400, 0, N'3.jpg', 0, 1, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (19, N'Case 4U Manyetik Mıknatıslı Araç İçi Telefon Tutucu', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 2500, 600, N'4.jpg', 1, 0, 4)
GO
INSERT [dbo].[Products] ([Id], [Name], [Description], [Price], [Stock], [Image], [IsApproved], [IsHome], [CategoryId]) VALUES (20, N'Xiaomi Mi 5S 64GB (İthalatçı Garantili)', N'Kullanmayı çok seveceğiniz ergonomik tasarım Optik vizör, çekiminizi oluşturmanıza ve tahmin etmenize olanak tanıyarak her zaman anın arkasındaki duyguyu yakalamak için hazır olmanızı sağlar. Sezgisel kullanımlı kullanıcı dostu kontrolleri ve görüntüyü incelemek için 7,5 cm''lik (3 inç) geniş LCD ekranıyla EOS 1200D''yi kullanması çok keyiflidir.', 5200, 500, N'5.jpg', 1, 0, 4)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_dbo.Products_dbo.Categories_CategoryId]
GO
