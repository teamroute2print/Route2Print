-- ****************** SqlDBM: Microsoft SQL Server ******************
-- ******************************************************************

DROP TABLE [QueriesRequested];
GO


DROP TABLE [ReviewandRating];
GO


DROP TABLE [Custome_print];
GO


DROP TABLE [User];
GO


DROP TABLE [dbo].[Product_details];
GO


DROP TABLE [UserType];
GO


DROP TABLE [Product_color];
GO


DROP TABLE [Productsizes];
GO


DROP TABLE [ProductType];
GO


DROP TABLE [Products];
GO



DROP SCHEMA [dbo];
GO


DROP SCHEMA [guest];
GO


DROP SCHEMA [db_owner];
GO


DROP SCHEMA [db_accessadmin];
GO


DROP SCHEMA [db_securityadmin];
GO


DROP SCHEMA [db_ddladmin];
GO


DROP SCHEMA [db_backupoperator];
GO


DROP SCHEMA [db_datareader];
GO


DROP SCHEMA [db_datawriter];
GO


DROP SCHEMA [db_denydatareader];
GO


DROP SCHEMA [db_denydatawriter];
GO


CREATE SCHEMA [dbo];
GO


CREATE SCHEMA [guest];
GO


CREATE SCHEMA [db_owner];
GO


CREATE SCHEMA [db_accessadmin];
GO


CREATE SCHEMA [db_securityadmin];
GO


CREATE SCHEMA [db_ddladmin];
GO


CREATE SCHEMA [db_backupoperator];
GO


CREATE SCHEMA [db_datareader];
GO


CREATE SCHEMA [db_datawriter];
GO


CREATE SCHEMA [db_denydatareader];
GO


CREATE SCHEMA [db_denydatawriter];
GO

--************************************** [UserType]

CREATE TABLE [UserType]
(
 [Type_id]   INT NOT NULL ,
 [User_Role] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED ([Type_id] ASC)
);
GO



--************************************** [Product_color]

CREATE TABLE [Product_color]
(
 [Color_id]     INT NOT NULL ,
 [Color_code]   VARCHAR(50) NOT NULL ,
 [Custom_color] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Product_color] PRIMARY KEY CLUSTERED ([Color_id] ASC)
);
GO



--************************************** [Productsizes]

CREATE TABLE [Productsizes]
(
 [Size_Id]         INT NOT NULL ,
 [Available_Sizes] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Productsizes] PRIMARY KEY CLUSTERED ([Size_Id] ASC)
);
GO



--************************************** [ProductType]

CREATE TABLE [ProductType]
(
 [Product_typeId]  INT NOT NULL ,
 [ProductTypeCode] VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED ([Product_typeId] ASC)
);
GO



--************************************** [Products]

CREATE TABLE [Products]
(
 [ProductGuid]    UNIQUEIDENTIFIER NOT NULL ,
 [Product_typeId] INT NOT NULL ,

 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED ([ProductGuid] ASC)
);
GO



--************************************** [ReviewandRating]

CREATE TABLE [ReviewandRating]
(
 [Id]          INT NOT NULL ,
 [Comments]    VARCHAR(255) NOT NULL ,
 [Rating]      INT NOT NULL ,
 [ProductGuid] UNIQUEIDENTIFIER NOT NULL ,

 CONSTRAINT [PK_ReviewandRating] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_234] FOREIGN KEY ([ProductGuid])
  REFERENCES [Products]([ProductGuid])
);
GO


--SKIP Index: [fkIdx_234]


--************************************** [Custome_print]

CREATE TABLE [Custome_print]
(
 [CustomeProduct]   UNIQUEIDENTIFIER NOT NULL ,
 [Color_id]         INT NOT NULL ,
 [Image]            VARCHAR(50) NOT NULL ,
 [expected_date]    DATETIME NOT NULL ,
 [Number_of_Orders] INT NOT NULL ,
 [Sizes]            NVARCHAR(50) NOT NULL ,
 [Product_typeId]   INT NOT NULL ,

 CONSTRAINT [PK_Custome_print] PRIMARY KEY CLUSTERED ([CustomeProduct] ASC),
 CONSTRAINT [FK_212] FOREIGN KEY ([Color_id])
  REFERENCES [Product_color]([Color_id]),
 CONSTRAINT [FK_221] FOREIGN KEY ([Product_typeId])
  REFERENCES [ProductType]([Product_typeId])
);
GO


--SKIP Index: [fkIdx_212]

--SKIP Index: [fkIdx_221]


--************************************** [User]

CREATE TABLE [User]
(
 [UserID]    INT NOT NULL ,
 [UserName]  VARCHAR(50) NOT NULL ,
 [FirstName] VARCHAR(50) NOT NULL ,
 [LastName]  VARCHAR(50) NOT NULL ,
 [Address]   VARCHAR(50) NOT NULL ,
 [Contact]   INT NOT NULL ,
 [Type_id]   INT NOT NULL ,

 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED ([UserID] ASC),
 CONSTRAINT [FK_149] FOREIGN KEY ([Type_id])
  REFERENCES [UserType]([Type_id])
);
GO


--SKIP Index: [fkIdx_149]


--************************************** [dbo].[Product_details]

CREATE TABLE [dbo].[Product_details]
(
 [ProductId]      INT NOT NULL ,
 [Product_image]  VARCHAR(50) NOT NULL ,
 [Product_typeId] INT NOT NULL ,
 [ProductGuid]    UNIQUEIDENTIFIER NOT NULL ,
 [Color_id]       INT NOT NULL ,
 [Size_Id]        INT NOT NULL ,
 [Product_info]   VARCHAR(50) NOT NULL ,
 [Product_title]  VARCHAR(50) NOT NULL ,

 CONSTRAINT [PK_Product_details] PRIMARY KEY CLUSTERED ([ProductId] ASC),
 CONSTRAINT [FK_115] FOREIGN KEY ([Color_id])
  REFERENCES [Product_color]([Color_id]),
 CONSTRAINT [FK_119] FOREIGN KEY ([Size_Id])
  REFERENCES [Productsizes]([Size_Id]),
 CONSTRAINT [FK_123] FOREIGN KEY ([Product_typeId])
  REFERENCES [ProductType]([Product_typeId]),
 CONSTRAINT [FK_127] FOREIGN KEY ([ProductGuid])
  REFERENCES [Products]([ProductGuid])
);
GO


--SKIP Index: [fkIdx_115]

--SKIP Index: [fkIdx_119]

--SKIP Index: [fkIdx_123]

--SKIP Index: [fkIdx_127]


--************************************** [QueriesRequested]

CREATE TABLE [QueriesRequested]
(
 [Id]             INT NOT NULL ,
 [Message]        VARCHAR(MAX) NOT NULL ,
 [CustomeProduct] UNIQUEIDENTIFIER NOT NULL ,

 CONSTRAINT [PK_QueriesRequested] PRIMARY KEY CLUSTERED ([Id] ASC),
 CONSTRAINT [FK_243] FOREIGN KEY ([CustomeProduct])
  REFERENCES [Custome_print]([CustomeProduct])
);
GO


--SKIP Index: [fkIdx_243]


