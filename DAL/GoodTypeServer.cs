using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Model;
using System.Data;
namespace DAL
{
    public class GoodTypeServer
    {
        private static string sqltext = "";
        //查询所有商品类型
        public static DataSet selectAll()
        {
            sqltext = "  select * from [dbo].[YC_GoodType] order by [GTID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //增加商品类型
        public static object add(YC_GoodType gt)
        {
            sqltext = "  insert into [dbo].[YC_GoodType]([Name],[Description])values('"+gt.Name+"','"+gt.Description+"')";
           return  SQLHELPER.ExecuteNonQuery(sqltext);
        }
        //删除商品类型
        public static object delete(int id)
        {
            sqltext = "  delete from [dbo].[YC_GoodType] where [GTID]='" + id + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
    }
}
