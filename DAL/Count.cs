using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace DAL
{
   public  class Count
    {
        public static string sqltext;
        //分组查询销量
        public static DataSet xlCount()
        {
            sqltext = "select top 6 count(*) as 销量,[dbo].[YC_Goods].[Name] as 名称, [dbo].[YC_Order].[GID] as 商品ID from [dbo].[YC_Order],[dbo].[YC_Goods] where [dbo].[YC_Goods].GID=[dbo].[YC_Order].GID  group by [dbo].[YC_Order].[GID],[dbo].[YC_Goods].[Name] order by count(*) desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //销量饼状图
        public static DataSet pieCount()
        {
            sqltext = "select count(*) as 销量,[dbo].[YC_Goods].[Name] as 名称 from [dbo].[YC_Goods],[dbo].[YC_Order] where [dbo].[YC_Goods].GID=[dbo].[YC_Order].GID group by [dbo].[YC_Goods].[Name]  order by  count(*) desc";
            return SQLHELPER.ExecuteDataSet(sqltext);

        }
    }
}
