/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2008                    */
/* Created on:     2017/12/18 14:13:12                          */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YC_Address') and o.name = 'FK_YC_ADDRE_REFERENCE_YC_USER')
alter table YC_Address
   drop constraint FK_YC_ADDRE_REFERENCE_YC_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YC_Goods') and o.name = 'FK_YC_GOODS_REFERENCE_YC_GOODT')
alter table YC_Goods
   drop constraint FK_YC_GOODS_REFERENCE_YC_GOODT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YC_MoneyRecord') and o.name = 'FK_YC_MONEY_REFERENCE_YC_USER')
alter table YC_MoneyRecord
   drop constraint FK_YC_MONEY_REFERENCE_YC_USER
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YC_Order') and o.name = 'FK_YC_ORDER_REFERENCE_YC_GOODS')
alter table YC_Order
   drop constraint FK_YC_ORDER_REFERENCE_YC_GOODS
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('YC_Order') and o.name = 'FK_YC_ORDER_REFERENCE_YC_USER')
alter table YC_Order
   drop constraint FK_YC_ORDER_REFERENCE_YC_USER
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_Address')
            and   type = 'U')
   drop table YC_Address
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_GoodType')
            and   type = 'U')
   drop table YC_GoodType
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_Goods')
            and   type = 'U')
   drop table YC_Goods
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_MoneyRecord')
            and   type = 'U')
   drop table YC_MoneyRecord
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_Order')
            and   type = 'U')
   drop table YC_Order
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_User')
            and   type = 'U')
   drop table YC_User
go

if exists (select 1
            from  sysobjects
           where  id = object_id('YC_WebSite')
            and   type = 'U')
   drop table YC_WebSite
go

/*==============================================================*/
/* Table: YC_Address                                            */
/*==============================================================*/
create table YC_Address (
   AID                  int                  not null,
   UID                  int                  not null,
   Address              nvarchar(max)        not null,
   Phone                nvarchar(15)         not null,
   MailNumber           nvarchar(10)         not null,
   constraint PK_YC_ADDRESS primary key (AID)
)
go

/*==============================================================*/
/* Table: YC_GoodType                                           */
/*==============================================================*/
create table YC_GoodType (
   GTID                 int                  identity,
   Name                 nvarchar(20)         not null,
   Description          nvarchar(200)        null,
   constraint PK_YC_GOODTYPE primary key (GTID)
)
go

/*==============================================================*/
/* Table: YC_Goods                                              */
/*==============================================================*/
create table YC_Goods (
   GID                  int                  identity,
   GTID                 int                  not null,
   Name                 nvarchar(30)         not null,
   SCPrice              money                not null,
   CXPrice              money                not null,
   DesImg1Url           nvarchar(50)         not null,
   DesImg2Url           nvarchar(50)         not null,
   DesImg3Url           nvarchar(50)         not null,
   DetailImages         nvarchar(max)        not null,
   constraint PK_YC_GOODS primary key (GID)
)
go

/*==============================================================*/
/* Table: YC_MoneyRecord                                        */
/*==============================================================*/
create table YC_MoneyRecord (
   MRID                 int                  not null,
   UID                  int                  not null,
   RMoney               money                not null,
   RType                int                  not null,
   Description          nvarchar(max)        null,
   constraint PK_YC_MONEYRECORD primary key (MRID)
)
go

/*==============================================================*/
/* Table: YC_Order                                              */
/*==============================================================*/
create table YC_Order (
   OID                  int                  identity,
   GID                  int                  not null,
   UID                  int                  not null,
   Price                money                not null,
   Count                int                  not null,
   isSended             int                  not null,
   SendType             nvarchar(20)         null,
   Address              nvarchar(max)        not null,
   BuyTime              datetime             not null,
   SendTime             datetime             null,
   FinishedTime         datetime             null,
   GoodSize             nvarchar(max)        not null,
   WayNumber            nvarchar(30)         not null,
   constraint PK_YC_ORDER primary key (OID)
)
go

/*==============================================================*/
/* Table: YC_User                                               */
/*==============================================================*/
create table YC_User (
   UID                  int                  identity,
   Name                 nvarchar(16)         null,
   NickName             nvarchar(16)         null,
   PassWord             nvarchar(32)         not null,
   Address              nvarchar(50)         null,
   Sex                  int                  not null,
   Admin                int                  not null,
   Phone                nvarchar(15)         null,
   QQ                   nvarchar(11)         null,
   Enable               int                  not null,
   headImg              nvarchar(50)         null,
   Moneysum             money                not null,
   constraint PK_YC_USER primary key (UID)
)
go

/*==============================================================*/
/* Table: YC_WebSite                                            */
/*==============================================================*/
create table YC_WebSite (
   WID                  int                  identity,
   WName                nvarchar(50)         not null,
   LogoUrl              nvarchar(100)        not null,
   LunboImgUrl          nvarchar(max)        not null,
   CompanyDescription   text                 not null,
   OurTeam              text                 not null,
   ContactUs            text                 not null,
   ContactUsWeChatImage nvarchar(50)         not null,
   TodayMovieUrl        nvarchar(50)         not null,
   constraint PK_YC_WEBSITE primary key (WID)
)
go

alter table YC_Address
   add constraint FK_YC_ADDRE_REFERENCE_YC_USER foreign key (UID)
      references YC_User (UID)
go

alter table YC_Goods
   add constraint FK_YC_GOODS_REFERENCE_YC_GOODT foreign key (GTID)
      references YC_GoodType (GTID)
go

alter table YC_MoneyRecord
   add constraint FK_YC_MONEY_REFERENCE_YC_USER foreign key (UID)
      references YC_User (UID)
go

alter table YC_Order
   add constraint FK_YC_ORDER_REFERENCE_YC_GOODS foreign key (GID)
      references YC_Goods (GID)
go

alter table YC_Order
   add constraint FK_YC_ORDER_REFERENCE_YC_USER foreign key (UID)
      references YC_User (UID)
go

