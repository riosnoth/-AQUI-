-- Generado por Oracle SQL Developer Data Modeler 24.3.1.351.0831
--   en:        2025-04-07 00:02:56 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE ADMINISTRADOR 
    ( 
     idAdministrador               INTEGER  NOT NULL , 
     nombre                        VARCHAR2 (100) , 
     correoElectronico             VARCHAR2 (100) , 
     contraseña                    VARCHAR2 (50) , 
     telefono                      VARCHAR2 (15) , 
     ADMINISTRADOR_idAdministrador INTEGER , 
     REPORTES_idReporte            INTEGER 
    ) 
;

ALTER TABLE ADMINISTRADOR 
    ADD CONSTRAINT ADMINISTRADOR_PK PRIMARY KEY ( idAdministrador ) ;

CREATE TABLE MARCACIÓN 
    ( 
     idMarcacion           INTEGER  NOT NULL , 
     fecha                 DATE , 
     hora                  DATE , 
     UBICACIÓN_idUbicacion INTEGER 
    ) 
;

ALTER TABLE MARCACIÓN 
    ADD CONSTRAINT MARCACIÓN_PK PRIMARY KEY ( idMarcacion ) ;

CREATE TABLE Notificación 
    ( 
     idNotificacion INTEGER  NOT NULL , 
     mensaje        VARCHAR2 (100) , 
     estado         VARCHAR2 (50) , 
     fechaEnvio     DATE 
    ) 
;

ALTER TABLE Notificación 
    ADD CONSTRAINT Notificación_PK PRIMARY KEY ( idNotificacion ) ;

CREATE TABLE REPORTES 
    ( 
     idReporte                     INTEGER  NOT NULL , 
     tipoReporte                   VARCHAR2 (100) , 
     rangoFechas                   DATE , 
     datos                         VARCHAR2 (100) , 
     ADMINISTRADOR_idAdministrador INTEGER 
    ) 
;

ALTER TABLE REPORTES 
    ADD CONSTRAINT REPORTES_PK PRIMARY KEY ( idReporte ) ;

CREATE TABLE UBICACIÓN 
    ( 
     idUbicacion                   INTEGER  NOT NULL , 
     nombreUbicacion               VARCHAR2 (100) , 
     latitud                       FLOAT , 
     longitud                      FLOAT , 
     ADMINISTRADOR_idAdministrador INTEGER 
    ) 
;

ALTER TABLE UBICACIÓN 
    ADD CONSTRAINT UBICACIÓN_PK PRIMARY KEY ( idUbicacion ) ;

CREATE TABLE Usuario 
    ( 
     idUsuario                     INTEGER  NOT NULL , 
     nombre                        VARCHAR2 (100) , 
     correoElectronico             VARCHAR2 (50) , 
     rol                           VARCHAR2 (10) , 
     contraseña                    VARCHAR2 (50) , 
     Notificación_idNotificacion   INTEGER , 
     MARCACIÓN_idMarcacion         INTEGER , 
     REPORTES_idReporte            INTEGER , 
     ADMINISTRADOR_idAdministrador INTEGER 
    ) 
;

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_PK PRIMARY KEY ( idUsuario ) ;

ALTER TABLE MARCACIÓN 
    ADD CONSTRAINT MARCACIÓN_MARCACIÓN_FK FOREIGN KEY 
    ( 
     UBICACIÓN_idUbicacion
    ) 
    REFERENCES UBICACIÓN 
    ( 
     idUbicacion
    ) 
;

ALTER TABLE REPORTES 
    ADD CONSTRAINT REPORTES_REPORTES_FK FOREIGN KEY 
    ( 
     ADMINISTRADOR_idAdministrador
    ) 
    REFERENCES ADMINISTRADOR 
    ( 
     idAdministrador
    ) 
;

ALTER TABLE UBICACIÓN 
    ADD CONSTRAINT UBICACIÓN_UBICACIÓN_FK FOREIGN KEY 
    ( 
     ADMINISTRADOR_idAdministrador
    ) 
    REFERENCES ADMINISTRADOR 
    ( 
     idAdministrador
    ) 
;

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Usuario_FK FOREIGN KEY 
    ( 
     Notificación_idNotificacion
    ) 
    REFERENCES Notificación 
    ( 
     idNotificacion
    ) 
;

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Usuario_FKv2 FOREIGN KEY 
    ( 
     MARCACIÓN_idMarcacion
    ) 
    REFERENCES MARCACIÓN 
    ( 
     idMarcacion
    ) 
;

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Usuario_FKv3 FOREIGN KEY 
    ( 
     REPORTES_idReporte
    ) 
    REFERENCES REPORTES 
    ( 
     idReporte
    ) 
;

ALTER TABLE Usuario 
    ADD CONSTRAINT Usuario_Usuario_FKv4 FOREIGN KEY 
    ( 
     ADMINISTRADOR_idAdministrador
    ) 
    REFERENCES ADMINISTRADOR 
    ( 
     idAdministrador
    ) 
;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             13
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
