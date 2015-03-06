
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/05/2015 07:30:48
-- Generated from EDMX file: E:\PruebasConcepto\Enfasis2015I\ReservasMF\ReservasMF.Repositorio\ReservasModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ReservasMF];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ClienteReserva]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ClienteSet] DROP CONSTRAINT [FK_ClienteReserva];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[ClienteSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ClienteSet];
GO
IF OBJECT_ID(N'[dbo].[HabitacionSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[HabitacionSet];
GO
IF OBJECT_ID(N'[dbo].[ReservaSet]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReservaSet];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Clientes'
CREATE TABLE [dbo].[Clientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Ciudad] nvarchar(max)  NOT NULL,
    [Calificacion] int  NULL,
    [Reserva_Id] int  NOT NULL
);
GO

-- Creating table 'Habitaciones'
CREATE TABLE [dbo].[Habitaciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Descripcion] nvarchar(max)  NOT NULL,
    [Capacidad] int  NOT NULL,
    [NumeroHabitacion] int  NOT NULL,
    [Disponible] bit  NOT NULL
);
GO

-- Creating table 'Reservas'
CREATE TABLE [dbo].[Reservas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FechaIngreso] datetime  NOT NULL,
    [FechaSalida] datetime  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [PK_Clientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Habitaciones'
ALTER TABLE [dbo].[Habitaciones]
ADD CONSTRAINT [PK_Habitaciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Reservas'
ALTER TABLE [dbo].[Reservas]
ADD CONSTRAINT [PK_Reservas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Reserva_Id] in table 'Clientes'
ALTER TABLE [dbo].[Clientes]
ADD CONSTRAINT [FK_ClienteReserva]
    FOREIGN KEY ([Reserva_Id])
    REFERENCES [dbo].[Reservas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ClienteReserva'
CREATE INDEX [IX_FK_ClienteReserva]
ON [dbo].[Clientes]
    ([Reserva_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------