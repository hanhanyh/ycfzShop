using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Model;
using System.Data;
namespace DAL
{
    public class GoodsServer
    {
        public  static string sqltext="";
        /// <summary>
        /// 通过类型ID查询商品
        /// </summary>
        /// <param name="GTID"></param>
        /// <returns></returns>
        public static DataSet selectAllBygtid(int GTID)
        {
            sqltext = "  select * from [dbo].[YC_Goods] where [GTID]='" + GTID+ "' ORDER BY GID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 查询所有商品 降序排列
        /// </summary>
        /// <returns></returns>
        public static DataSet selectAll()
        {
            sqltext = " select * from [dbo].[YC_Goods] order by GID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 模糊查询 通过name
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static DataSet SelectByNameLike(string name)
        {
            sqltext = "  select * from [dbo].[YC_Goods]  where Name LIKE '%"+name+"%' order by GID desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //添加商品
        public static object add(YC_Goods good)
        {
            sqltext = " insert into [dbo].[YC_Goods]([GTID],[Name],[SCPrice],[CXPrice],[DesImg1Url],[DesImg2Url],[DesImg3Url],[DetailImages],[AllSize])values('" + good.Gtid + "', '" + good.Name + "', '" + good.SCPrice + "', '" + good.SCPrice + "', '" + good.DesImg1Url + "', '" + good.DesImg2Url + "', '" + good.DesImg3Url + "', '" + good.DetailImages + "','" + good.AllSize + "'); ";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 用过商品id查询商品
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        public static DataSet selectOneByID(int gid)
        {
            sqltext = " select * from [dbo].[YC_Goods] where GID='" + gid + "'";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 根据ID删除商品
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        public static object deleteGoodById(int gid)
        {
            sqltext = "delete from [dbo].[YC_Goods] where [GID]='" + gid + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
     
    }
}
