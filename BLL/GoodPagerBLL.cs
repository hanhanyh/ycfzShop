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
   public class GoodPagerBLL
    {
        /// <summary>
        /// 首页分行查询
        /// </summary>
        /// <param name="RowIndex"></param>
        /// <returns></returns>
        public static DataTable PagerIndexPage(int RowIndex)
        {
            return DAL.GoodsPager.PagerIndexPage(RowIndex).Tables[0];
        }
        /// <summary>
        /// 分页分行
        /// </summary>
        /// <param name="GTID"></param>
        /// <param name="page"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public static DataTable PagerRowByGTID(int GTID, int page, int row)
        {
            return DAL.GoodsPager.PagerRowByGTID(GTID, page, row).Tables[0];
        }
        /// <summary>
        /// 查询一个分类下的所有商品数量
        /// </summary>
        /// <param name="GTID"></param>
        /// <returns></returns>
        public static int CountByGTID(int GTID)
        {
            return Convert.ToInt32(DAL.GoodsPager.CountByGTID(GTID));
        }
        /// <summary>
        /// 搜索
        /// </summary>
        /// <param name="key"></param>
        /// <param name="page"></param>
        /// <param name="row"></param>
        /// <returns></returns>
        public static DataTable PagerRowByKey(string key, int page, int row)
        {
            return DAL.GoodsPager.PagerRowByKey(key, page, row).Tables[0];
        }
        /// <summary>
        /// 统计某一搜索key的返回总数
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static int CountByKey(string key)
        {
            return Convert.ToInt32(DAL.GoodsPager.CountByKey(key));
        }
    }
}
