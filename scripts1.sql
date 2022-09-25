create database ecommerce;
use ecommerce;

create table clients(
 id_client int auto_increment primary key
,F_name varchar(10)
,M_init char(3)
,L_name varchar(20)
,cpf char(11) not null
,address varchar(30)
,constraint unique_cpf_client unique (CPF)
);

create table product(
 id_product int auto_increment primary key
,P_name varchar(10) not null
,classification_kids bool default false
,category enum('eletronico','vestimenta','brinquedos','alimentos','moveis')
,avaliacao float default 0
,size varchar(10)
);

create table payments(
   id_client int
  ,id_payment int
  ,typePayment enum('boleto','cartao','dois cartoes')
  ,limitAvaiable float
  ,primary key(id_client,id_payment)
);
  
create table orders(
   id_order int auto_increment primary key
  ,id_orderclient int
  ,orderStatus enum('cancelado','confirmado','em processamento') default 'em processamento'
  ,description varchar(255)
  ,sendValue float default 10
  ,paymentCash bool default false
  ,constraint fk_orders_client foreign key (idorderclient) references clients(id_client)
  );

create table productStorage(
   id_prodStorage int auto_increment primary key
  ,storageLocation varchar(255)
  ,quantity int default 0
  ,constraint fk_orders_client foreign key (id_orderClient) references clients(id_client)
  );

create table supplier(
   id_supplier int auto_increment primary key
  ,socialName varchar(255) not null
  ,CNPJ char(15) not null
  ,contact char(11) not null
  ,constraint unique_supplier unique (CNPJ)
  );

create table seller(
   id_seller int auto_increment primary key
  ,socialName varchar(255) not null
  ,CNPJ char(15) not null
  ,CPF char(9)
  ,location varchar(255)
  ,contact char(11) not null
  ,constraint unique_supplier unique (CNPJ)
  ,constraint unique_cpf_seller unique (CPF)
  );

create table productSeller(
   id_Pseller int auto_increment primary key
  ,id_product int primary key
  ,qt_prod int default 1
  ,primary key(id_Pseller,id_product)
  ,constraint fk_product_seller foreign key (id_Pseller) references seller(id_seller)
  ,constraint fk_product_product foreign key (id_product) references product(id_product)
);

create table productOrder(
   id_Pproduct int
  ,id_Porder int
  ,poQuantity int default 1
  ,poStatus enum('disponivel','sem estoque') default 'disponivel'
  ,primary key (id_Pproduct,id_Porder)
  ,constraint fk_product_seller foreign key (id_Pproduct) references seller(id_product)
  ,constraint fk_product_product foreign key (id_Porder) references product(id_order)
);

create table storageLocation(
   id_Lproduct int
  ,id_Lstorage int
  ,location varchar(255) not null
  ,primary key (id_Lproduct,id_Lstorage)
  ,constraint fk_storage_location_product foreign key (id_Lproduct) references product(id_product)
  ,constraint fk_storage_location_storage foreign key(id_Lstorage) references productStorage(id_prodStorage)
);

create table productSupplier(
   id_PsSupplier int
  ,id_PsProduct int
  ,quantity int not null
  ,primary key (idPsSupplier,idPsProduct)
  ,constraint fk_product_supplier_supplier foreign key (id_PsSupplier) references supplier(id_supplier)
  ,constraint fk_product_supplier_prodcut foreign key(id_PsProduct) references product(id_product)
);

show tables;
show databases;
use information_schema;
show tables;
desc referential_constraints;
select * from referential_constraints;


