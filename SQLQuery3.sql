--create database Polizia

--create table AgentePolizia (
--IDAgente int primary key identity (1,1),
--Nome nvarchar(30) not null,
--Cognome nvarchar(50) not null,
--CodiceFiscale nchar(16) unique not null,
--AnniDiServizio int not null,
--DataNascita date check(2021-Year(DataNascita)>18),
--)

--create table AreaMetropolitana(
--IDAreaMetropolitana int primary key identity(1,1),
--CodiceArea nchar(5) unique not null,
--AltoRischio bit ,
--);

--create table Agente_Area(
--IDAgente int not null,
--IDAreaMetropolitana int not null,
--);

--alter table Agente_Area add foreign key (IDAgente) references AgentePolizia(IDAgente);
--alter table Agente_Area add foreign key (IDAreaMetropolitana) references AreaMetropolitana(IDAreaMetropolitana);

--insert into AgentePolizia values('Laura', 'Rossi', 'aaa', 2, '1990-10-02');--1
--insert into AgentePolizia values('Paolo', 'Rossi', 'aaa1', 2, '1980-10-02');--2
--insert into AgentePolizia values('Martina', 'Rossi', 'aaa2', 2, '1970-10-02');--3
--insert into AgentePolizia values('Mirko', 'Rossi', 'aaa3', 2, '2000-10-02');--5
--insert into AgentePolizia values('Francesco', 'Rossi', 'aaa4', 2, '1986-10-02');--9
--insert into AgentePolizia values('Susanna', 'Rossi', 'aaa5', 2, '1974-10-02');--10
--insert into AgentePolizia values('Manuel', 'Rossi', 'aaa6', 2, '1998-10-02');--11

--insert into AreaMetropolitana values ('AM001',0);--1
--insert into AreaMetropolitana values ('AM002',0);--2
--insert into AreaMetropolitana values ('AM003',1);--3
--insert into AreaMetropolitana values ('AM004',1);--4

--insert into Agente_Area values (1,1); 
--insert into Agente_Area values (2,2); 
--insert into Agente_Area values (3,3); 
--insert into Agente_Area values (5,4); 
--insert into Agente_Area values (9,1); 
--insert into Agente_Area values (10,2); 
--insert into Agente_Area values (11,3); 
--insert into Agente_Area values (1,4); 
--insert into Agente_Area values (2,1); 

--visualizzare l'elenco degli agenti che lavorano in "aree ad alto rischio" e hanno meno di 3 anni di servizio
select distinct a.Nome, am.IDAreaMetropolitana
from AgentePolizia a join Agente_Area aa on a.IDAgente=aa.IDAgente
     join AreaMetropolitana am on am.IDAreaMetropolitana=aa.IDAreaMetropolitana
	 and a.AnniDiServizio<3 
	 and AltoRischio =1

--visualizzare il numero di agenti assegnati per ogni area geografica (numero agenti e codice area)

select count(a.IDAgente) as 'Numero Agenti', am.CodiceArea
from AgentePolizia a join Agente_Area aa on a.IDAgente=aa.IDAgente
     join AreaMetropolitana am on am.IDAreaMetropolitana=aa.IDAreaMetropolitana
group by am.CodiceArea