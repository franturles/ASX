drop database if exists test;
create database if not exists test;
use test;
create table alumnos (
	id int(11) not null,
	nombre varchar(20),
    apellido1 varchar(20),
    apellido2 varchar(20),
    nota int(10),
    primary key(id)
);

drop trigger if exists Trigget_Test_1;
delimiter //
create trigger Trigget_Test_1 before insert on alumnos
for each row
begin
	if (new.nota < 0)
    then
    set new.nota = 0;
    elseif (new.nota > 10)
    then
    set new.nota = 10;
	end if;
end
//
delimiter ;

drop trigger if exists Trigget_Test_2;
delimiter //
create trigger Trigget_Test_2 before update on alumnos
for each row
begin
	if (new.nota < 0)
    then
    set new.nota = 0;
    elseif (new.nota > 10)
    then
    set new.nota = 10;
	end if;
end
//
delimiter ;