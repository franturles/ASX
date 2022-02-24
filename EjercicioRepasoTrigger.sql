use tendabd;
delimiter //
drop trigger if exists trigger_DetalleVenda;
create trigger trigger_DetalleVenda before insert on detalle_venda
for each row
begin
	declare stock_art
    set stock_art = select art_stock from artigos where art_codigo = new.dev_art;
	if (new.dev_cantidade > stock.art)
     SIGNAL SQLSTATE '45000'
		set_message_text="No hay stock";
	end if;
end
//
delimiter ;