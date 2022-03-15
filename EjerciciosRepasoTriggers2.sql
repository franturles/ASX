/*Ejercicios Repaso*/
-- 1 Haz que no se pueda añadir un nuevo animal si el tipo es 'León' y el número de años es mayor que 20.
use CIRCO;
drop trigger if exists Ejercicio1;
delimiter //
create trigger Ejercicio1 before insert on ANIMALES
for each row
begin
	if (new.tipo = "Leon" or new.anhos > 20)
    then
	SIGNAL SQLSTATE '45000'
		set message_text="No puede ser ni leon ni mayor que 20";
	end if;
end
//
delimiter ;;

-- Insercion de comprobacion
insert into ANIMALES values ("Pepe","Leon",21,94,10,'El gran felino',null);

-- 2 Cuando se añada un nuevo animal, hacer que dicho animal esté cuidado por el artista que cuida a menos animales

drop trigger if exists Ejercicio2;
delimiter //
create trigger Ejercicio2 after insert on ANIMALES
for each row
begin
	declare artistmin varchar(20);
	select a.nif as NombreArtista,count(an.nombre_animal) as Animales
    into artistmin
	from ARTISTAS as a join ANIMALES_ARTISTAS as an on (nif_artista=nif)
	group by NombreArtista
	order by Animales asc
	limit 1;
    
    if (artistmin is NULL)
	then
		select nif
		into artistmin;
    end if;

	insert into ANIMALES_ARTISTAS (nombre_animal,nif_artista)
    values (NEW.nombre,artistmin);
end
//
delimiter ;;

-- Insercion de comprobacion
INSERT INTO ANIMALES
VALUES ('Perro','León',2,120,1.2,'El gran felino','LATERAL1');