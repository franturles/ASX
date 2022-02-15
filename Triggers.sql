/* Ejercicios Triggers */
use CIRCO;
-- 1) Haz que no se pueda añadir un nuevo animal si el tipo es 'León' y el número de años es mayor que 20.
--    En caso de no cumplirse la condición lanzará una excepción.
drop trigger if exists Ejercicio1;
delimiter //
create trigger Ejercicio1 before insert on ANIMALES
for each row
begin 
	if (new.Tipo = "Leon" AND new.anhos > 20)
    then
		signal sqlstate '45000' set message_text = "Pon otro tipo de animal y edad";
    end if;
end
//
delimiter ;;

-- 2) Cuando se añada un nuevo animal, hacer que dicho animal esté cuidado 
-- por el artista que cuida a menos animales.
-- Deberás de tener en cuenta el caso en el que no haya ningún artista cuidando animales. 
-- En ese caso debes coger el primer artista que no sea jefe.
drop trigger if exists Ejercicio1;
delimiter //
create trigger Ejercicio2 after insert on ANIMALES
for each row
begin
	declare Artista char(9);
    declare Tiempo int default 0;
end
//
delimiter ;;


select min(count(nombre_animal)) as Animales,nif_artista
from ANIMALES_ARTISTAS
group by nif_artista;