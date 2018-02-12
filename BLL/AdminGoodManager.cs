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
    public  class AdminGoodManager
    {
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="good"></param>
        /// <returns></returns>
        public static int add(YC_Goods good)
        {
            return Convert.ToInt32(DAL.GoodsServer.add(good));
        }
        //查询所有商品
        public static DataTable select()
        {
            return DAL.GoodsServer.selectAll().Tables[0];
        }
        /// <summary>
        /// 模糊查询
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static DataTable SelectByNameLike(string name)
        {
            return DAL.GoodsServer.SelectByNameLike(name).Tables[0];
        }
        //查询商品通过shangpID
        public static DataTable selectAllGoods(int gtid)
        {
            return DAL.GoodsServer.selectAllBygtid(gtid).Tables[0];
        }
        /// <summary>
        /// 根据商品ID删除商品
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        public static int deleteGoodById(int gid)
        {
            return Convert.ToInt32(DAL.GoodsServer.deleteGoodById(gid));
        }
    }
}
