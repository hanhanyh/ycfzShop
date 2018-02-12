using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Model;
using System.Data;

namespace BLL
{
   public class Goods
    {
        /// <summary>
        /// 通过id查询某一记录
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        public static DataTable selectOneByID(int gid)
        {
            return DAL.GoodsServer.selectOneByID(gid).Tables[0];
        }
        /// <summary>
        /// 通过id查询商品对象
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        public static YC_Goods selectObjectById(int gid)
        {
            DataTable dt = BLL.Goods.selectOneByID(gid);
            YC_Goods g = new YC_Goods();
            DataRow dr = dt.Rows[0];
           g.Name= dr["Name"].ToString();
            g.Cxprice =Convert.ToDouble( dr["CXPrice"].ToString());
           g.SCPrice=Convert.ToDouble( dr["SCPrice"].ToString());
            g.DesImg1Url = dr["DesImg1Url"].ToString();
           g.DesImg2Url = dr["DesImg2Url"].ToString();
           g.DesImg3Url = dr["DesImg3Url"].ToString();
            g.AllSize = dr["AllSize"].ToString();
            g.DetailImages = dr["DetailImages"].ToString();
            return g;
        }
    }
}
