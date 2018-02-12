using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
namespace DAL
{
    /// <summary>
    /// 由于前台商品分页每行四个商品每行一个repeater
    /// 分页这里单独用了一个DAL类
    /// </summary>
    public class GoodsPager
    {
        public static string  sqltext="";
        /// <summary>
        /// 首页的三行。每行数据的查询
        /// </summary>
        /// <param name="RowIndex"></param>
        /// <returns></returns>
        public static DataSet PagerIndexPage(int RowIndex)
        {
            ///每行数量是4这里写死了的
            ///利用子查询进行
            sqltext = "  select top 4  [GID] as 商品ID,[DesImg1Url] as 描述图片,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top (4*" + RowIndex+") GID from YC_Goods order by GID desc) order by [GID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 分页分行子查询
        /// </summary>
        /// <param name="GTID">商品分类ID</param>
        /// <param name="page">当前页数从1开始</param>
        /// <param name="row">当前行数从1开始（1-3）</param>
        /// <returns></returns>
        public static DataSet PagerRowByGTID(int GTID, int page, int row)
        {
            /*分页分行查询
            每一页3行，每行4个
            一页十二个
            子查询top语句 是  top (当前页数-1)*12+4*(当前行数-1)
            */
            int top = (page - 1) * 12 + 4 * (row - 1);
            sqltext = "select top 4  [DesImg1Url] as 描述图片, [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top " + top+" GID from YC_Goods where GTID ='"+GTID+ "' order by GID desc) AND GTID ='" + GTID + "' order by [GID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查找某一分类下的所有商品
        /// </summary>
        /// <param name="GTID"></param>
        /// <returns></returns>
        public static object CountByGTID(int GTID)
        {
            sqltext = "   select count(*) from [dbo].[YC_Goods] where [GTID]='"+GTID+"'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 搜索
        /// </summary>
        /// <param name="key">搜索值</param>
        /// <param name="page">页数 1开始</param>
        /// <param name="row">行数 1开始</param>
        /// <returns></returns>
        public static DataSet PagerRowByKey(string key, int page,int row)
        {

            int top = 12 * (page - 1) + (row - 1) * 4;
            sqltext = "select top 4  [DesImg1Url] as 描述图片, [GID] as 商品ID,[Name] as 商品名称,SUBSTRING([Name],0,7) as 小标题,[SCPrice] as 市场价,[CXPrice] as 促销价 from [dbo].[YC_Goods] where [GID] not in(select top " + top + "  GID from YC_Goods  where YC_Goods.Name  Like '%" + key + "%' order by GID desc)  AND YC_Goods.Name  Like '%" + key + "%'  order by [GID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 统计某一搜索key 的总条数
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static object CountByKey(string key)
        {
            sqltext = "select count(*) from [dbo].[YC_Goods] where [Name] like '%" + key + "%'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
    }
}
