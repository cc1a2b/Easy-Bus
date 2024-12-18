USE [Station]
GO
/****** Object:  Table [dbo].[tbl_About]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_About](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParagTitle] [nvarchar](350) NULL,
	[Paragraph] [nvarchar](max) NULL,
	[aboutImg] [nvarchar](350) NULL,
 CONSTRAINT [PK_tbl_About] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Booking]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Booking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookingRef] [int] NULL,
	[tripId] [int] NULL,
	[TravelDate] [date] NULL,
	[PassengerId] [int] NULL,
	[RegistDate] [datetime] NULL,
	[BookStatus] [int] NULL,
 CONSTRAINT [PK_tbl_Booking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Company]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](50) NULL,
	[CompanyMobile] [nvarchar](50) NULL,
	[CompanyEmail] [nvarchar](50) NULL,
	[CompanyAddress] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[CompanyLogo] [nvarchar](350) NULL,
 CONSTRAINT [PK_tbl_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Drivers]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Drivers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DriverName] [nvarchar](50) NULL,
	[DriverIdNum] [nvarchar](50) NULL,
	[DriverMobile] [nvarchar](50) NULL,
	[DriverAddress] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Drivers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Passengers]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Passengers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PassengerName] [nvarchar](50) NULL,
	[PassengerIdNum] [nvarchar](50) NULL,
	[PassengerMobile] [nvarchar](50) NULL,
	[PassengerEmail] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Passengers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Schedule]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Schedule](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FromStationId] [int] NULL,
	[ToStationId] [int] NULL,
	[TripTime] [time](7) NULL,
	[TtripCost] [float] NULL,
	[TripStatusId] [int] NULL,
 CONSTRAINT [PK_tbl_Trips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Stations]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Stations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CityId] [int] NULL,
	[StationName] [nvarchar](50) NULL,
	[StationAddress] [nvarchar](50) NULL,
	[StationLongitude] [nvarchar](50) NULL,
	[StationLatitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Stations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_TripStatus]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_TripStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TripStatus] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_TripStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Users]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StationId] [int] NULL,
	[FullName] [nvarchar](50) NULL,
	[UserMobile] [nvarchar](50) NULL,
	[UserEmail] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Vehicles]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Vehicles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeId] [int] NULL,
	[VehiclePlate] [nvarchar](50) NULL,
	[VehicleModel] [nvarchar](50) NULL,
	[VehicleSerial] [nvarchar](50) NULL,
	[VehicleColor] [nvarchar](50) NULL,
	[VehicleImage] [nvarchar](350) NULL,
	[VehicleStatus] [int] NULL,
	[SeatCount] [int] NULL,
 CONSTRAINT [PK_tbl_Vehicles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_VehicleType]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_VehicleType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VehicleType] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_VehicleType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_About] ON 

INSERT [dbo].[tbl_About] ([Id], [ParagTitle], [Paragraph], [aboutImg]) VALUES (1, N'20 Years Of Experience', N'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia dese mollit anim id est laborum. Sed ut perspiciatis unde omnis iste.', NULL)
SET IDENTITY_INSERT [dbo].[tbl_About] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Booking] ON 

INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (1, 1000001, 1, NULL, 1, CAST(N'2022-10-15T16:16:53.660' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (2, 1000002, 1, NULL, 2, CAST(N'2022-10-15T23:06:31.830' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (3, 1000003, 4, NULL, 3, CAST(N'2022-10-17T22:30:14.970' AS DateTime), 2)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (4, 1000004, 2, NULL, 1, CAST(N'2022-10-31T12:02:58.407' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (5, 1000005, 1, NULL, 1, CAST(N'2022-10-31T12:46:20.913' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (6, 1000006, 1, CAST(N'2022-11-02' AS Date), 1, CAST(N'2022-10-31T12:49:44.807' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (7, 1000007, 6, CAST(N'2022-11-03' AS Date), 1, CAST(N'2022-10-31T12:50:30.837' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (8, 1000008, 1, CAST(N'2022-11-05' AS Date), 5, CAST(N'2022-10-31T13:34:06.327' AS DateTime), 1)
INSERT [dbo].[tbl_Booking] ([Id], [BookingRef], [tripId], [TravelDate], [PassengerId], [RegistDate], [BookStatus]) VALUES (9, 1000009, 2, CAST(N'2022-11-06' AS Date), 1, CAST(N'2022-10-31T19:05:26.890' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[tbl_Booking] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

INSERT [dbo].[tbl_City] ([Id], [CityName]) VALUES (1, N'نجران')
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Company] ON 

INSERT [dbo].[tbl_Company] ([Id], [CompanyName], [CompanyMobile], [CompanyEmail], [CompanyAddress], [Longitude], [Latitude], [CompanyLogo]) VALUES (1, N'Easybus Tarvel', N'4546546464646', N'email@gmail.com', N'Najran', N'44.22368104278616', N'17.545563168379484', N'b42282b6-8473-4b1d-ab79-68442b3d9a3e.jpg')
SET IDENTITY_INSERT [dbo].[tbl_Company] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Drivers] ON 

INSERT [dbo].[tbl_Drivers] ([Id], [DriverName], [DriverIdNum], [DriverMobile], [DriverAddress]) VALUES (1, N'test', N'', N'050', N'')
SET IDENTITY_INSERT [dbo].[tbl_Drivers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Passengers] ON 

INSERT [dbo].[tbl_Passengers] ([Id], [PassengerName], [PassengerIdNum], [PassengerMobile], [PassengerEmail], [UserName], [Password]) VALUES (1, N'test', N'4446664444', N'5555555555', N'test@gmail.com', NULL, N'123')
INSERT [dbo].[tbl_Passengers] ([Id], [PassengerName], [PassengerIdNum], [PassengerMobile], [PassengerEmail], [UserName], [Password]) VALUES (2, N'test', N'5555555555', N'1111111111', N'', NULL, N'123')
INSERT [dbo].[tbl_Passengers] ([Id], [PassengerName], [PassengerIdNum], [PassengerMobile], [PassengerEmail], [UserName], [Password]) VALUES (3, N'محمد', N'4545445454', N'0202020202', N'nmn@bb.cm', NULL, N'123')
INSERT [dbo].[tbl_Passengers] ([Id], [PassengerName], [PassengerIdNum], [PassengerMobile], [PassengerEmail], [UserName], [Password]) VALUES (4, N'', N'', N'', N'', NULL, N'')
INSERT [dbo].[tbl_Passengers] ([Id], [PassengerName], [PassengerIdNum], [PassengerMobile], [PassengerEmail], [UserName], [Password]) VALUES (5, N'444', N'444', N'444', N'444', NULL, N'444')
SET IDENTITY_INSERT [dbo].[tbl_Passengers] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Schedule] ON 

INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (1, 1, 3, CAST(N'13:30:00' AS Time), 50, 1)
INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (2, 1, 3, CAST(N'04:30:00' AS Time), 150, 1)
INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (3, 3, 1, CAST(N'04:30:00' AS Time), 50, 1)
INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (4, 1, 4, CAST(N'00:00:00' AS Time), 15, 1)
INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (5, 4, 5, CAST(N'15:24:00' AS Time), 25, 1)
INSERT [dbo].[tbl_Schedule] ([Id], [FromStationId], [ToStationId], [TripTime], [TtripCost], [TripStatusId]) VALUES (6, 1, 4, CAST(N'13:35:00' AS Time), 20, 1)
SET IDENTITY_INSERT [dbo].[tbl_Schedule] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Stations] ON 

INSERT [dbo].[tbl_Stations] ([Id], [CityId], [StationName], [StationAddress], [StationLongitude], [StationLatitude]) VALUES (1, 1, N'الفيصليه', N'الفيصليه', NULL, NULL)
INSERT [dbo].[tbl_Stations] ([Id], [CityId], [StationName], [StationAddress], [StationLongitude], [StationLatitude]) VALUES (3, 1, N'العريسة', N'العريسة', NULL, NULL)
INSERT [dbo].[tbl_Stations] ([Id], [CityId], [StationName], [StationAddress], [StationLongitude], [StationLatitude]) VALUES (4, 1, N'المطار', N'اااا', NULL, NULL)
INSERT [dbo].[tbl_Stations] ([Id], [CityId], [StationName], [StationAddress], [StationLongitude], [StationLatitude]) VALUES (5, 1, N'الجامعه', N'ؤرؤلا', NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Stations] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_TripStatus] ON 

INSERT [dbo].[tbl_TripStatus] ([Id], [TripStatus]) VALUES (1, N'في الموعد')
INSERT [dbo].[tbl_TripStatus] ([Id], [TripStatus]) VALUES (2, N'مغادرة')
INSERT [dbo].[tbl_TripStatus] ([Id], [TripStatus]) VALUES (3, N'وصول')
INSERT [dbo].[tbl_TripStatus] ([Id], [TripStatus]) VALUES (4, N'ملغي')
SET IDENTITY_INSERT [dbo].[tbl_TripStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Users] ON 

INSERT [dbo].[tbl_Users] ([Id], [StationId], [FullName], [UserMobile], [UserEmail], [UserName], [UserPassword]) VALUES (2, 1, N'Admin', N'050505050', N'admin@admin.com', N'kk', N'123')
SET IDENTITY_INSERT [dbo].[tbl_Users] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Vehicles] ON 

INSERT [dbo].[tbl_Vehicles] ([Id], [TypeId], [VehiclePlate], [VehicleModel], [VehicleSerial], [VehicleColor], [VehicleImage], [VehicleStatus], [SeatCount]) VALUES (1, 1, N' ا ب ت 1234', N'2012', N'95498626565', N'ابيض', N'b8a51668-b859-4b63-9f90-186634c2b638.png', NULL, 40)
INSERT [dbo].[tbl_Vehicles] ([Id], [TypeId], [VehiclePlate], [VehicleModel], [VehicleSerial], [VehicleColor], [VehicleImage], [VehicleStatus], [SeatCount]) VALUES (2, 3, N'1235 ن ا ب', N'2015', N'', N'', N'8c73a324-fa19-4f54-89f3-06434caeaadd.jpg', NULL, 30)
SET IDENTITY_INSERT [dbo].[tbl_Vehicles] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_VehicleType] ON 

INSERT [dbo].[tbl_VehicleType] ([Id], [VehicleType]) VALUES (1, N'مرسيدس')
INSERT [dbo].[tbl_VehicleType] ([Id], [VehicleType]) VALUES (3, N'شيفرولية')
INSERT [dbo].[tbl_VehicleType] ([Id], [VehicleType]) VALUES (4, N'test')
SET IDENTITY_INSERT [dbo].[tbl_VehicleType] OFF
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_Passengers] FOREIGN KEY([PassengerId])
REFERENCES [dbo].[tbl_Passengers] ([Id])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_Passengers]
GO
ALTER TABLE [dbo].[tbl_Booking]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Booking_tbl_Schedule] FOREIGN KEY([tripId])
REFERENCES [dbo].[tbl_Schedule] ([Id])
GO
ALTER TABLE [dbo].[tbl_Booking] CHECK CONSTRAINT [FK_tbl_Booking_tbl_Schedule]
GO
ALTER TABLE [dbo].[tbl_Stations]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Stations_tbl_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[tbl_City] ([Id])
GO
ALTER TABLE [dbo].[tbl_Stations] CHECK CONSTRAINT [FK_tbl_Stations_tbl_City]
GO
ALTER TABLE [dbo].[tbl_Users]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Users_tbl_Stations] FOREIGN KEY([StationId])
REFERENCES [dbo].[tbl_Stations] ([Id])
GO
ALTER TABLE [dbo].[tbl_Users] CHECK CONSTRAINT [FK_tbl_Users_tbl_Stations]
GO
ALTER TABLE [dbo].[tbl_Vehicles]  WITH CHECK ADD  CONSTRAINT [FK_tbl_Vehicles_tbl_VehicleType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[tbl_VehicleType] ([Id])
GO
ALTER TABLE [dbo].[tbl_Vehicles] CHECK CONSTRAINT [FK_tbl_Vehicles_tbl_VehicleType]
GO
/****** Object:  StoredProcedure [dbo].[GetBooking]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetBooking]
AS
SELECT		tbl_Booking.Id,tbl_Booking.BookingRef,tbl_Booking.TripId,tbl_Booking.TravelDate,tbl_Booking.PassengerId,
			tbl_Booking.RegistDate,tbl_Booking.BookStatus,tbl_Schedule.FromStationId,tbl_Schedule.ToStationId,tbl_Schedule.TripTime,
			LTRIM(RIGHT(CONVERT(VARCHAR(20), tbl_Schedule.TripTime, 100), 7)) AS StringTime,
			tbl_Schedule.TtripCost,tbl_Schedule.TripStatusId,
			--CONVERT(varchar(10),tbl_Schedule.TripDate,121) AS StringDate,
			--Format(tbl_Schedule.TripDate,'dddd','ar-SA') AS TripDay,
			--Format(tbl_Schedule.TripDate,'dddd','en-US') AS EngTripDay,
			tbl_Passengers.PassengerIdNum,tbl_Passengers.PassengerName,tbl_Passengers.PassengerMobile,tbl_Passengers.PassengerEmail,
			(SELECT tbl_Stations.StationName FROM tbl_Stations WHERE tbl_Stations.Id=tbl_Schedule.FromStationId) AS FromStation,
			(SELECT tbl_Stations.StationName FROM tbl_Stations WHERE tbl_Stations.Id=tbl_Schedule.ToStationId) AS ToStation,
			tbl_TripStatus.TripStatus

FROM		tbl_Booking LEFT JOIN
			tbl_Schedule ON tbl_Booking.TripId = tbl_Schedule.Id LEFT JOIN
			tbl_TripStatus ON tbl_Schedule.TripStatusId = tbl_TripStatus.Id LEFT JOIN
			tbl_Passengers ON tbl_Booking.PassengerId = tbl_Passengers.Id 

			ORDER BY tbl_Booking.Id DESC




GO
/****** Object:  StoredProcedure [dbo].[GetSchedule]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetSchedule]
AS
SELECT		tbl_Schedule.Id,tbl_Schedule.FromStationId,tbl_Schedule.ToStationId,tbl_Schedule.TripTime,
			LTRIM(RIGHT(CONVERT(VARCHAR(20), tbl_Schedule.TripTime, 100), 7)) AS StringTime,
			tbl_Schedule.TtripCost,tbl_Schedule.TripStatusId,
			(SELECT tbl_Stations.StationName FROM tbl_Stations WHERE tbl_Stations.Id=tbl_Schedule.FromStationId) AS FromStation,
			(SELECT tbl_Stations.StationName FROM tbl_Stations WHERE tbl_Stations.Id=tbl_Schedule.ToStationId) AS ToStation,
			tbl_TripStatus.TripStatus

FROM		tbl_Schedule LEFT JOIN
			tbl_TripStatus ON tbl_Schedule.TripStatusId = tbl_TripStatus.Id 




GO
/****** Object:  StoredProcedure [dbo].[GetStations]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetStations]
AS
SELECT		tbl_Stations.Id,tbl_Stations.CityId,tbl_Stations.StationName,tbl_Stations.StationAddress,tbl_Stations.StationLongitude,
			tbl_Stations.StationLatitude,tbl_City.CityName

FROM		tbl_Stations LEFT JOIN
			tbl_City ON tbl_Stations.CityId = tbl_City.Id
GO
/****** Object:  StoredProcedure [dbo].[GetVehicles]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[GetVehicles]
AS
SELECT		tbl_Vehicles.Id,tbl_Vehicles.TypeId,tbl_Vehicles.VehiclePlate,tbl_Vehicles.VehicleModel,tbl_Vehicles.VehicleSerial,
			tbl_Vehicles.VehicleColor,tbl_Vehicles.VehicleImage,tbl_Vehicles.VehicleStatus,tbl_Vehicles.SeatCount,
			tbl_VehicleType.VehicleType

FROM		tbl_Vehicles LEFT JOIN
			tbl_VehicleType ON tbl_Vehicles.TypeId = tbl_VehicleType.Id

GO
/****** Object:  Trigger [dbo].[BookingTrigger]    Script Date: 2022-11-02 06:41:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[BookingTrigger]
   ON [dbo].[tbl_Booking]
   AFTER INSERT
AS 
BEGIN
	SET NOCOUNT ON;
	DECLARE @RID INT 
	DECLARE @Ref NVARCHAR(350)
	SET @RID=(SELECT Id FROM inserted)
	SET @Ref=(SELECT MAX(BookingRef) FROM [dbo].[tbl_Booking])
	IF @Ref IS NULL
	BEGIN
	SET @Ref=1000000
	END
	UPDATE [dbo].[tbl_Booking]
	SET BookingRef = @Ref+1

	WHERE Id = @RID
END
GO
ALTER TABLE [dbo].[tbl_Booking] ENABLE TRIGGER [BookingTrigger]
GO
