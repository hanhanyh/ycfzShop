using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using Model;
namespace DAL
{
    public class OrderServer
    {
        public static string sqltext = "";
        /// <summary>
        /// 生成订单  下单
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public static object GenerateOrder(YC_Order order)
        {
            sqltext = "  INSERT INTO [dbo].[YC_Order]([GID],[UID],[Price],[Count],[SendType],[Address],[BuyTime],[SendTime],[FinishedTime],[GoodSize],[WayNumber])values('" + order.GID + "', '" + order.UID + "', '" + order.Price + "', '" + order.Count + "',  '', '" + order.Address + "', convert(char(10),getdate(),120)+' '+Convert(varchar(8),Getdate(),108), null, null, '" + order.GoodSize + "', '" + order.WayNumber + "'); ";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 发货（修改状态为 发货，填写发货方式，运单号,订单Id）
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public static object sendOrder(YC_Order order)
        {
            sqltext = "update [dbo].[YC_Order] set SendType='" + order.Sendtype + "',SendTime=convert(char(10),getdate(),120)+' '+Convert(varchar(8),Getdate(),108),WayNumber='" + order.WayNumber + "' where OID='" + order.OID + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 确认收收货  订单完成，设置FinishedTime
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public static object OrderFinished(YC_Order order)
        {
            sqltext = "  update [dbo].[YC_Order] set [FinishedTime]=(convert(char(10),getdate(),120)+' '+Convert(varchar(8),Getdate(),108)) where OID='" + order.OID + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 查询所有订单
        /// </summary>
        /// <returns></returns>
        public static DataSet selectAllOrders()
        {
            sqltext = "   select [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询某一个用户的所有订单
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataSet selectOneOrder(int uid)
        {
            sqltext = "    select [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].UID='" + uid + "' order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询所有未发货订单([dbo].[YC_Order].[SendTime] is null)
        /// </summary>
        /// <returns></returns>
        public static DataSet selectAllUnSendOrder()
        {
            sqltext = "   select isClosed, YC_User.Name as 购买用户, [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_User], [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime] is null AND [dbo].[YC_User].[UID]= [dbo].[YC_Order].[UID] AND isClosed is null order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询某一个用户的未完成订单
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataSet selectOneAllUnSendOrder(int uid)
        {
            sqltext = "  select isClosed,[dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime] is null AND [dbo].[YC_Order].UID='" + uid + "' AND isClosed is null order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //查询所有待收货订单
        public static DataSet selectAllUnFinishedOrder()
        {
            sqltext = "  select  isClosed,YC_User.Name as 购买用户, [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间,[dbo].[YC_Order].SendType as 发货方式,[dbo].[YC_Order].WayNumber as 运单号  from YC_User, [dbo].[YC_Order],[dbo].[YC_Goods] where YC_User.UID=YC_Order.UID and [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime]  is  not null AND [dbo].[YC_Order].[FinishedTime]  is null AND isClosed is null  order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询某一个用户的所有待收货订单
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataSet selectOneUnFinishedOrder(int uid)
        {
            sqltext = "  select isClosed,[dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime]  is  not null AND [dbo].[YC_Order].[FinishedTime]  is null AND [dbo].[YC_Order].UID='" + uid + "' AND isClosed is null order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询某一用户的已完成订单
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataSet OnehasFinishedOrder(int uid)
        {
            sqltext = "  select isClosed, [dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime]  is  not null AND [dbo].[YC_Order].[FinishedTime]  is not  null AND [dbo].[YC_Order].UID='" + uid + "' AND isClosed is null order by [dbo].[YC_Order].OID desc";

            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询所有已完成订单
        /// </summary>
        /// <returns></returns>
        public static DataSet AllHasFinishedOrder()
        {
            sqltext = "  select isClosed,[dbo].[YC_Order].[OID] as 订单ID, [dbo].[YC_Goods].[Name] as 商品名称,[Price] as 付款金额,[dbo].[YC_Order].[Address] as 收货地址 ,[BuyTime] as 购买时间 from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Order].[GID]=[dbo].[YC_Goods].[GID] AND [dbo].[YC_Order].[SendTime]  is  not null AND [dbo].[YC_Order].[FinishedTime]  is not  null  AND isClosed is null order by [dbo].[YC_Order].OID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 通过订单ID查询订单(多表查询，订单表和商品表)
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static DataSet selectOneOrderByOID(int oid)
        {
            sqltext = "   select  YC_Order.Price as 价格,YC_Order.Count as 数量,YC_Order.Address as 收货地址,YC_Order.GoodSize as 尺寸,YC_Order.BuyTime as 拍下时间,YC_Goods.Name as 商品名称 ,YC_Goods.DesImg1Url as 图片 from [dbo].[YC_Goods],[dbo].[YC_Order] where [dbo].[YC_Goods].GID=[dbo].[YC_Order].GID AND YC_Order.OID='" + oid + "'";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// /*查询一个订单是否是已发货，是返回1，不是返回*0/
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static object isSended(int oid)
        {
            sqltext = "select count(*) from[dbo].[YC_Order] where[OID] = '" + oid + "' and SendTime is not NULL";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 查询订单是否已完成 是返回1 否返回0
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static object isFinished(int oid)
        {
            sqltext = "  select count(*) from [dbo].[YC_Order] where [OID]='" + oid + "' and FinishedTime is not NULL";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 查询订单是否已关闭 是返回1
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static object isClosed(int oid)
        {
            sqltext = "  select count(*) from [dbo].[YC_Order]  where [isClosed]='1' and [OID]='" + oid + "'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 关闭交易
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static object Close(int oid)
        {
            sqltext = "  update [dbo].[YC_Order] set [isClosed]='1' where [OID]='" + oid + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }

    }
}
