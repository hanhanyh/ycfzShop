/*用户表*/
insert into [dbo].[YC_User]([Name],[NickName],[PassWord],[Address],[Sex],[Admin],[Phone],[QQ],Enable,headImg,Moneysum)values('admin','昵称','admin','地址','1','0','18381506390','1031893464','1',null,'0.00')
delete from [dbo].[YC_User]  where UID=1
update [dbo].[YC_User] set [Name]='',[NickName]='',[PassWord]='',[Address]='',[Sex]='',[Admin]='',[Phone]='',[QQ]=''  where UID='2'
/*网站信息表*/
  insert into [dbo].[YC_WebSite]([WName],[LogoUrl],[LunboImgUrl],[CompanyDescription],[OurTeam],[ContactUs],[ContactUsWeChatImage],[TodayMovieUrl])VALUES  ('原创服装','logo.jpg','lunbo1.jpg|lunbo2.jpg|lunbo3.jpg','公司简介','我们的团队','联系我们','wechat.png','today.mp4')
    select top 1 * from [dbo].[YC_WebSite] order by [WID] desc
	  delete from [dbo].[YC_WebSite] where[WID] ='1'
/*商品类型表*/
  select * from [dbo].[YC_GoodType] order by [GTID] desc
    insert into [dbo].[YC_GoodType]([Name],[Description])values('日韩','日韩描述')
/*商品表*/
  select * from [dbo].[YC_Goods] where [GTID]='1'
  /*添加商品分类*/
  insert into [dbo].[YC_GoodType]([Name],[Description])values('中国风','中国')
  /*添加商品*/
 insert into [dbo].[YC_Goods]([GTID],[Name],[SCPrice],[CXPrice],[DesImg1Url],[DesImg2Url],[DesImg3Url],[DetailImages])
 values('1','衣服','555','222','xx','xxx','xxx','xxxxxx');
 /*下单*/
  INSERT INTO [dbo].[YC_Order]([GID],[UID],[Price],[Count],[isSended],[SendType],[Address],[BuyTime],[SendTime],[FinishedTime],[GoodSize],[WayNumber])
 values('1','1','666','1','0','','四川成都','2017-12-18 14:41:30',null,null,'XXL','131455645665');
 
 /* 
 ----------------------------------------------------------------------------------------
 -------------------------------------------------------------------------------------------
 ------------------------------------------------------------------------------------------
 */
 /*模糊查询  商品*/
 select * from [dbo].[YC_Goods]  where Name LIKE '%衣%' order by GID desc
   /*交易记录 查询*/
 select * from [dbo].[YC_MoneyRecord] where [UID]='1' order by [MRID] desc
   /*发货*/
 update [dbo].[YC_Order] set isSended='1',SendType='快递',SendTime='2017-12-19 09:30:03',WayNumber='1231545646' where OID='2'
	 /*确认收货*/
update [dbo].[YC_Order] set [FinishedTime]='2017-12-19 09:34:26' where OID='2'
/*查询我的所有订单*/
  select * from [dbo].[YC_Order] where [UID]='1' order by [OID] desc
  /*查询我的所有已完成订单*/
    select * from [dbo].[YC_Order]where [UID]='1' and  FinishedTime!='' order by [OID] desc
	/*查询所有已完成订单*/
	  select * from [dbo].[YC_Order]where    FinishedTime!='' order by [OID] desc
	  
    select * from [dbo].[YC_Order] where FinishedTime is  not null order by [OID] desc
	/*查询我的所有收货地址*/
	  select * from  [dbo].[YC_Address] where [UID] ='' order by [AID] desc
/*增加收货地址*/
insert into [dbo].[YC_Address](UID,Address,Phone,MailNumber)values(1,'成都','12345645564','614523');
/*删除收货地址*/
delete from [dbo].[YC_Address] where AID=''
/*登录*/
  select count(*) from [dbo].[YC_User] where [Name]='' and [PassWord]=''
  /*添加商品分类*/
    update [dbo].[YC_User] set [NickName]='u666',[Sex]='0',[Address]='重庆',[Phone]='21',[QQ]='12' where [UID]='6'
	/*查询待收货订单*/
	  select [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime]  is  not null AND [dbo].[YC_Order].[FinishedTime]  is null AND [dbo].[YC_Order].UID='1' order by [dbo].[YC_Order].OID desc
	  
/*分页查询









*/

  select  [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] order by [GID] desc
/*每行四个数据*/  
  /*总行数*/  
  select count(*)/4 from [dbo].[YC_Goods]
  /*余下不足一行的地方*/
  select count(*)%4 from [dbo].[YC_Goods]
  /*
  行数据用repeater做 
  每行一个repeater
  定义一个子查询 传入变量Row行数
  每行数量是4
  */
  
  select top 4  [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top 4 * Row GID from YC_Goods) order by [GID] desc
/*查询一个订单是否是已发货，是返回1，不是返回*0/
  select count(*) from [dbo].[YC_Order] where [OID]='4' and SendTime is not NULL
  /*查询订单是否已关闭*/
    select count(*) from [dbo].[YC_Order]  where [isClosed]='1' and [OID]='2'
/*分页分行查询
每一页3行，每行4个
一页十二个
子查询top语句 是  top (当前页数-1)*12+当前行数-1
*/

   select top 4  [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top 4  GID from YC_Goods where GTID ='1' order by GID desc) AND GTID ='1' order by [GID] desc
/*搜索结果进行分页*/  
  select top 4  [DesImg1Url] as 描述图片, [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top " + top+" GID from YC_Goods  where YC_Goods.Name  Like '%key%' order by GID desc)  AND YC_Goods.Name  Like '%key%'  order by [GID] desc
  
  	select top 4  [DesImg1Url] as 描述图片, [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top 0  GID from YC_Goods  where YC_Goods.Name  Like '%1%' order by GID desc)  AND YC_Goods.Name  Like '%1%'  order by [GID] desc
/*修改网站信息*/
update  [dbo].[YC_WebSite] set [WName]='',[LogoUrl]='',[LunboImgUrl]='',[CompanyDescription]='',[OurTeam]='',[ContactUs]='',[ContactUsWeChatImage]='',[TodayMovieUrl]='' where [WID]='1';
    update  [dbo].[YC_WebSite] set [WName]='',[CompanyDescription]='',[OurTeam]='',[ContactUs]='' where [WID]='1';
	/*分组查询统计销量*/
	select count(*) as 销量,[dbo].[YC_Goods].[Name] as 名称, [dbo].[YC_Order].[GID] as 商品ID from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Goods].GID=[dbo].[YC_Order].GID  group by [dbo].[YC_Order].[GID],[dbo].[YC_Goods].[Name] order by count(*) desc