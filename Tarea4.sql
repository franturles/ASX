
update departamento set numempdep=(select count(*) from empleado where empleado.numdep = departamneto.numdep);
use empleados;
show tables;
select * from departamento;
-- A
-- Insert
drop trigger if exists Tarea2A;
delimiter //
create trigger Tarea2A before insert on empleados
for each row 
begin
	update departamento set numempdep = numempdep + 1
    where new.Numdept=Numdep;
end
//
-- Delete
drop trigger if exists Tarea2A2;
delimiter //
create trigger Tarea2A2 before delete on empleados
for each row 
begin
	update departamento set numempdep = numempdep - 1
    where new.Numdept=Numdep;
end
//
-- Update
delimiter $$
use empleados;
drop trigger if exists Tarea2A3;
create trigger Tarea2A3 before update on empleados
for each row begin
	if old.numdep != new.numdep then
    update departamento
    set numempdep = numempdep - 1
    where old.numdept = numdep
    
    update departamento
    set numempdep = numempdep + 1
    where new.numdept = numdep
end $$
delimiter ;

-- B 
delimiter $$
use departamento;
drop trigger if exists Tarea2B;
create trigger Tarea2B before insert on departamento
for each row begin
	if new.numdep != old.numdep then
    update departamento
    set numempdep = 0
    else
    update departamento
    set numempdep = old.numempdep
end $$
delimiter ;
