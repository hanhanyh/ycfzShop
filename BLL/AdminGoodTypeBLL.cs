using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using DAL;
using Model;
namespace BLL
{
   public class AdminGoodTypeBLL
    {
        /// <summary>
        /// 查询所有商品分类
        /// </summary>
        /// <returns></returns>
        public static DataTable selectAllType()
        {
            return DAL.GoodTypeServer.selectAll().Tables[0];
        }
        /// <summary>
        /// 新增一个商品类型
        /// </summary>
        /// <param name="GT"></param>
        /// <returns></returns>
        public static int add(YC_GoodType GT)
        {
            return Convert.ToInt32(DAL.GoodTypeServer.add(GT));
        }
        /// <summary>
        /// 删除一个商品分类
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static int delete(int id)
        {
            return Convert.ToInt32(DAL.GoodTypeServer.delete(id));
        }
    }
}
