-- inserção de dados e queries

use ecommerce;

show tables;
-- idCliente, Fname, Minit, Lname, CPF, Addres
insert into Clients (Fname, Minit, Lname, CPF, CNPJ, Address)
	values('Maria','M','Silva','123456789', null,'rua silva de prata 29, Carangola - Cidade das flores'),
		  ('Matheus','O','Pimentel','987654321', null, 'rua alameda 289, Centro - Cidade das flores'),
          ('Ricardo','F','Silva',null, '456789132', 'avenida alameda vinha 1009, Centro - Cidade das flores'),
          ('Julia','S','França','789123456', null, 'rua laranjeiras 861, Centro - Cidade das flores'),
          ('Roberta','G','Assis', null, '987456310', 'avenida koller 19, Centro - Cidade das flores'),
          ('Isabela','M','Cruz','654789123', null, 'rua alameda das flores 28, Centro - Cidade das flores');
          
-- IdProduct, Pname, classification_kids boolean, category('Eletrônico', 'Vestimentas', 'Brinquedos', 'Alimentos', 'Móveis'), avaliação, size
insert into product (Pname, classification_kids, category, avaliação, size) values
						('Fone de ouvido', false, 'Eletrônico', '4', null),
                        ('Barbie Elsa', true, 'Brinquedos', '5', null),
                        ('Body Carters', true, 'Vestimenta', '5', null),
                        ('Microfone Vedo - Youtuber', false, 'Eletrônico', '4', null),
                        ('Sofá retratil', false, 'Móveis', '3', '3x57x80'),
                        ('Farinha de arroz', false, 'Alimentos', '2', null),
                        ('Fire Stick Amazon', false, 'Eletrônico', '4', null);

select * from clients;
select * from product;
-- idPayment, idPaymentClient, TypePayment, limitAvailable
insert into payments (idPaymentClient, TypePayment, limitAvailable) values
						(1, 'PIX', 5000),
                        (2, 'Cartão', 10000),
                        (3, 'Boleto', null),
                        (4, 'PIX', 7000);
                        
select * from payments;                        
-- idOrder, idOrderClient, orderStatus, orderDescription, sendValue, paymentCash
-- delete from orders where idOrderClient in (1,2,3,4);
insert into orders (idOrderClient, orderStatus, orderDescription, sendValues, paymentCash) values
						(1,  default, 'compra via aplicativo', null, 1),
                        (2,  default, 'compra via aplicativo', 50, 0),
                        (3,  'Confirmado', null, null, 1),
                        (4,  default, 'compra via web site', 150, 0);

select * from orders;

-- idPOproduct, idPOorder, poQuantity, poStatus
insert into productOrder (idPOproduct, idPOorder, poQuantity, poStatus) values
						(1, 1, 2, null),
                        (2, 1, 1, null),
                        (3, 2, 1, null);
                        
-- storageLocation, quatity
insert into productStorage (storageLocation, quantity) values
						('Rio de Janeiro', 1000),
                        ('Rio de Janeiro', 500),
                        ('São Paulo', 10),
                        ('São Paulo', 100),
                        ('São Paulo', 10),
                        ('Brasília', 60);

-- idLproduct, idLstorage, location
insert into storageLocation (idLproduct, idLstorage, location) values
						(1, 2, 'RJ'),
                        (2, 6, 'GO');

-- idSupplier, SocialName, CNPJ, contact
insert into supplier (SocialName, CNPJ, contact) values
						('Almeida e Filhos', 123456789123456, '21985474'),
                        ('Eletrônicos Silva', 854519649143457, '21985484'),
                        ('Eletrônicos Valma', 934567893934695, '21975474');

select * from supplier;

-- idPsSupplier, idPsProduct, quantity
insert into productSupplier (idPsSupplier, idPsProduct, quantity) values
						(1,1,500),
                        (1,2,400),
                        (2,4,633),
                        (3,3,5),
                        (2,5,10);
                        
-- idSeller, SocialName, AbstName, CNPJ, CPF, location, contact
insert into seller (SocialName, AbstName, CNPJ, CPF, location, contact) values
						('Tech eletronics', null, 123456789456321, null, 'Rio de Janeiro', 219946287),
                        ('Botique Durgas', null, null, 123456783, 'Rio de Janeiro', 219567895),
                        ('Kids World', null, 456789123654485, null, 'São Paulo', 1198657484);

select * from seller;

-- idPseller, idPproduct, prodQuantity
insert into productSeller (idPseller, idPproduct, prodQuantity) values
						(1, 6, 80),
                        (2, 7, 10);
 
 select * from productSeller;
 select count(*) from clients;
select * from clients c, orders o where c.idClient = idOrderClient;
select concat(Fname, ' ' ,Lname) as Client, idOrder as Request, orderStatus as Status from clients c, orders o where c.idClient = idOrderClient;

select * from clients c, orders o 
			where c.idClient = idOrderClient
			group by idOrder;
            
-- Recuperação de pedido com produra associado	
  select * from clients c
		inner join orders o on c.idClient = o.idOrderClient
        inner join prodcutOrder p on p.idPOorder = o.idOrder
	group by idClient;
  
-- Recuperar quantos pedidos foram realizados pelos clientes
 select c.idClient, Fname, count(*) as Number_of_orders from clients c
		inner join orders o on c.idClient = o.idOrderClient
	group by idClient;
    
    select * from clients c, payments p
			where c.idClient = idPaymentClient;