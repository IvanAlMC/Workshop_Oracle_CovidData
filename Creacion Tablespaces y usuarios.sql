--En primer lugar, nos conectamos como dba
CONNECT sysdba/password AS SYSDBA;

/*Se nos pide realizar dos tablespaces por separada, uno para guardar los datos y 
otro para guardar los indices, ya que con eso aseguramos un mejor rendimiento*/

-- Creamos el tablespace para los datos
CREATE TABLESPACE covid_data DATAFILE 'covid_data.dbf' SIZE 100M AUTOEXTEND ON NEXT 10M MAXSIZE UNLIMITED;

-- Creamos el tablespace para los indices
CREATE TABLESPACE covid_index DATAFILE 'covid_index.dbf' SIZE 50M AUTOEXTEND ON NEXT 5M MAXSIZE UNLIMITED;


/*De igual forma se nos pide crear un usuario el cual va a manejar dichos tablespaces, 
asi que debemos asegurarnos de darle los permisos adecuados*/

-- Creamos el usuario covid_user con contraseña
CREATE USER covid_user IDENTIFIED BY covid123 DEFAULT TABLESPACE covid_data QUOTA UNLIMITED ON covid_data;

-- Otorgamos permisos básicos y de DBA a covid_user
GRANT CONNECT, RESOURCE TO covid_user;
GRANT CREATE SESSION, CREATE TABLE, CREATE VIEW, CREATE PROCEDURE, CREATE SEQUENCE, CREATE TRIGGER TO covid_user;




/*Luego de crear la tablas, damos los permisos al usuario sobre las tablas*/

-- Otorgamos permisos de INSERT, DELETE, SELECT, UPDATE a las tablas creadas
GRANT INSERT, DELETE, SELECT, UPDATE ON covid_user.regions TO covid_user;
GRANT INSERT, DELETE, SELECT, UPDATE ON covid_user.countries TO covid_user;
GRANT INSERT, DELETE, SELECT, UPDATE ON covid_user.CovidData TO covid_user;



---Dimos permisos en el tablespace covid_index al usuario covod_user


-- Otorgamos cuota ilimitada en el tablespace covid_index
ALTER USER covid_user QUOTA UNLIMITED ON covid_index;

-- Otorgamos permisos adicionales al usuario covid_user
GRANT CREATE ANY INDEX TO covid_user;
GRANT DROP ANY INDEX TO covid_user;
GRANT ALTER ANY INDEX TO covid_user;
GRANT SELECT ANY TABLE TO covid_user;
GRANT INSERT ANY TABLE TO covid_user;
GRANT UPDATE ANY TABLE TO covid_user;
GRANT DELETE ANY TABLE TO covid_user;
