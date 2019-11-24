CREATE DATABASE LICSE1;
USE LICSE1;
CREATE TABLE ROL
  (IdRol     INT (10) PRIMARY KEY,
   NombreRol VARCHAR (30) NOT NULL);
CREATE TABLE USUARIO
  ( IdUsuario       INT (10) PRIMARY KEY,
    NombreUsuario  VARCHAR (50) NOT NULL,
    ApellidoUsuario VARCHAR (30) NOT NULL,
    Email VARCHAR (30) NOT NULL,
    IdRol         INT (10),
     CONSTRAINT FKRol FOREIGN KEY (IdRol) REFERENCES ROL(IdRol));
    
CREATE TABLE CATEGORIA
  (IdCategoria    INT (10) PRIMARY KEY,
	NombreCategoria VARCHAR (50) NOT NULL);
     
CREATE TABLE ELEMENTO
  (  IdElemento     INT (10) PRIMARY KEY,
     SerialElemento VARCHAR (50) NOT NULL,
     NombreElemento VARCHAR (30) NOT NULL,
     EstadoElemento VARCHAR (30) NOT NULL,
     IdCategoria   INT (10),
     CONSTRAINT FkCategoria FOREIGN KEY (IdCategoria) REFERENCES CATEGORIA(
     IdCategoria));
CREATE TABLE SEDE
  (  IdSede               INT (10) PRIMARY KEY,
     DireccionSede       VARCHAR (30) NOT NULL,
     TipoSede              VARCHAR (30) NOT NULL,
     AnalistaRegionalSede VARCHAR (50) NOT NULL,
     ContactoSede          VARCHAR (30) NOT NULL);
CREATE TABLE SOLICITUD
  (  IdSolicitud         INT (10) PRIMARY KEY,
     InformacionSolicitud VARCHAR (90) NOT NULL,
     FechaSolicitud      DATE NOT NULL,
	 IdUsuario           INT (7),
     IdElemento          INT (10),
     CONSTRAINT FkUsuario FOREIGN KEY (IdUsuario) REFERENCES USUARIO(
     IdUsuario),
     CONSTRAINT FkElemento FOREIGN KEY (IdElemento) REFERENCES ELEMENTO(
     IdElemento));
CREATE TABLE TECNICO
  (  IdTecnico             INT (10) PRIMARY KEY,
     IdentificacionTecnico INT (30) NOT NULL,
     NombreTecnico        VARCHAR (50) NOT NULL,
     EmpresaTecnico       VARCHAR (20) NOT NULL);
CREATE TABLE INSTALACION
  (  IdSolicitud       INT (10),
     FechaInstalacion VARCHAR(10) NOT NULL,
     EstadoInstalacion VARCHAR(30) NOT NULL,
     IdInstalacion     INT (10) PRIMARY KEY,
     IdTecnico       INT (10),
     CONSTRAINT FkSolicitud FOREIGN KEY (IdSolicitud) REFERENCES SOLICITUD(
     IdSolicitud),
     CONSTRAINT FkTecnico FOREIGN KEY (IdTecnico) REFERENCES TECNICO(
     IdTecnico));
CREATE TABLE SEDE_SOLICITUD
  (  IdSede        INT (10),
     IdSolicitud     INT (10),
     IdSedeSolicitud  INT (10) PRIMARY KEY,
     CONSTRAINT FkSolicitud1 FOREIGN KEY (IdSolicitud) REFERENCES SOLICITUD(
     IdSolicitud),
     CONSTRAINT FkSede FOREIGN KEY (IdSede) REFERENCES SEDE(IdSede));
CREATE TABLE STOCK
  (  IdStock    INT (10) PRIMARY KEY,
     IdCategoria   INT (7),
     CantidadStock INT (10) NOT NULL,
     FechaStock  DATE NOT NULL,
     CONSTRAINT FkCATEGORIA1 FOREIGN KEY (IdCategoria) REFERENCES CATEGORIA(
     IdCategoria));
CREATE TABLE PROVEEDOR
  (  IdProveedor      INT (10) PRIMARY KEY,
     NombreProveedor   VARCHAR (30) NOT NULL,
     TelefonoProveedor VARCHAR (30) NOT NULL,
     CorreoProveedor  VARCHAR (50) NOT NULL);
CREATE TABLE ELEMENTO_PROVEEDOR
  (  IdProveedor INT (10),
     IdElemento  INT (10),
     CONSTRAINT FkProveedor FOREIGN KEY (IdProveedor) REFERENCES PROVEEDOR(
     IdProveedor),
     CONSTRAINT FkElemento1 FOREIGN KEY (IdElemento) REFERENCES ELEMENTO(
     IdElemento));








