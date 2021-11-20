/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2020/5/18 19:46:51                           */
/*==============================================================*/


drop table if exists t_customer;

drop table if exists t_figures;

drop table if exists t_inport;

drop table if exists t_operator;

drop table if exists t_outport;

drop table if exists t_provider;

drop table if exists t_sales;

drop table if exists t_salesback;

drop table if exists t_stock;

/*==============================================================*/
/* Table: t_customer                                            */
/*==============================================================*/
create table t_customer
(
   id                   varchar(11) not null,
   customer_name        varchar(50) not null,
   shorts               varchar(20),
   address              varchar(50),
   zip                  varchar(6),
   telephone            varchar(20),
   contacts             varchar(20),
   contacts_tel         varchar(11),
   bank                 varchar(20),
   account              varchar(20),
   mail                 varchar(20),
   available            int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_figures                                             */
/*==============================================================*/
create table t_figures
(
   id                   varchar(11) not null,
   figuresname          varchar(50) not null,
   short                varchar(20),
   productplace         varchar(50),
   size                 varchar(50),
   packeage             varchar(50),
   productcode          varchar(20),
   promitcode           varchar(20),
   price                float not null,
   memo                 varchar(100),
   provider_id          varchar(11) not null,
   available            int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_inport                                              */
/*==============================================================*/
create table t_inport
(
   id                   varchar(11) not null,
   number               int not null,
   price                float not null,
   comment              varchar(100),
   provider_id          varchar(11) not null,
   inporttime           datetime not null,
   operateperson        varchar(20) not null,
   sponsor              varchar(20),
   paytype              varchar(20) not null,
   figures_id           varchar(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_operator                                            */
/*==============================================================*/
create table t_operator
(
   username             varchar(20) not null,
   password             varchar(20) not null,
   name                 varchar(20) not null,
   power                varchar(20) not null,
   primary key (username)
);

/*==============================================================*/
/* Table: t_outport                                             */
/*==============================================================*/
create table t_outport
(
   id                   varchar(11) not null,
   number               int not null,
   price                float not null,
   comment              varchar(100),
   provider_id          varchar(11) not null,
   outporttime          datetime not null,
   operateperson        varchar(20) not null,
   sponsor              varchar(20),
   paytype              varchar(20) not null,
   goods_id             varchar(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_provider                                            */
/*==============================================================*/
create table t_provider
(
   id                   varchar(11) not null,
   provider_name        varchar(50) not null,
   shorts               varchar(32),
   address              varchar(50),
   zip                  varchar(6),
   telephone            varchar(20),
   contacts             varchar(20),
   contacts_tel         varchar(11),
   bank                 varchar(50),
   account              varchar(50),
   mail                 varchar(20),
   available            int not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_sales                                               */
/*==============================================================*/
create table t_sales
(
   id                   varchar(11) not null,
   number               int not null,
   price                float not null,
   comment              varchar(100),
   customer_id          varchar(11) not null,
   salestime            datetime not null,
   operateperson        varchar(20) not null,
   sponsor              varchar(20),
   paytype              varchar(20) not null,
   figures_id           varchar(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_salesback                                           */
/*==============================================================*/
create table t_salesback
(
   id                   varchar(11) not null,
   number               int not null,
   price                float not null,
   comment              varchar(100),
   customer_id          varchar(11) not null,
   salesbacktime        datetime not null,
   operateperson        varchar(20) not null,
   sponsor              varchar(20),
   paytype              varchar(20) not null,
   figures_id           varchar(11) not null,
   primary key (id)
);

/*==============================================================*/
/* Table: t_stock                                               */
/*==============================================================*/
create table t_stock
(
   id                   int not null auto_increment,
   figures_id           varchar(11) not null,
   number               int not null,
   primary key (id)
);

alter table t_figures add constraint FK_Reference_1 foreign key (provider_id)
      references t_provider (id) on delete restrict on update restrict;

alter table t_inport add constraint FK_Reference_2 foreign key (provider_id)
      references t_provider (id) on delete restrict on update restrict;

alter table t_inport add constraint FK_Reference_3 foreign key (figures_id)
      references t_figures (id) on delete restrict on update restrict;

alter table t_outport add constraint FK_Reference_6 foreign key (provider_id)
      references t_provider (id) on delete restrict on update restrict;

alter table t_outport add constraint FK_Reference_7 foreign key (goods_id)
      references t_figures (id) on delete restrict on update restrict;

alter table t_sales add constraint FK_Reference_10 foreign key (figures_id)
      references t_figures (id) on delete restrict on update restrict;

alter table t_sales add constraint FK_Reference_9 foreign key (customer_id)
      references t_customer (id) on delete restrict on update restrict;

alter table t_salesback add constraint FK_Reference_4 foreign key (customer_id)
      references t_customer (id) on delete restrict on update restrict;

alter table t_salesback add constraint FK_Reference_5 foreign key (figures_id)
      references t_figures (id) on delete restrict on update restrict;

alter table t_stock add constraint FK_Reference_8 foreign key (figures_id)
      references t_figures (id) on delete restrict on update restrict;

