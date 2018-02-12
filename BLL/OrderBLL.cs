using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using DAL;
using System.Data;
namespace BLL
{
    public   class OrderBLL
    {
        /// <summary>
        /// 生成订单
        /// </summary>
        /// <param name="or">传入商品ID 用户ID 已付资金，数量，地址,尺寸</param>
        /// <returns></returns>
        public static int generateOrder(YC_Order or)
        {
            return Convert.ToInt32(DAL.OrderServer.GenerateOrder(or));
        }
        public static DataTable selectMyAllOrder(int uid)
        {
            return DAL.OrderServer.selectOneOrder(uid).Tables[0];
        }
        /// <summary>
        /// 是否已发货
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static int isSended(int oid)
        {
            return Convert.ToInt32(DAL.OrderServer.isSended(oid));
        }
        /// <summary>
        /// 订单是否已完成 ，是返回1
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static int isFinished(int oid)
        {
            return Convert.ToInt32(DAL.OrderServer.isFinished(oid));
        }
        /// <summary>
        /// 查询订单是否已关闭
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static int isClosed(int oid)
        {
            return Convert.ToInt32(DAL.OrderServer.isClosed(oid));
        }
        /// <summary>
        /// 关闭交易
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static int Close(int oid)
        {
            return Convert.ToInt32(DAL.OrderServer.Close(oid));
        }
        /// <summary>
        /// 确认收货，传入订单ID
        /// </summary>
        /// <param name="order"></param>
        /// <returns></returns>
        public static int OrderFinished(YC_Order order)
        {
            return Convert.ToInt32(DAL.OrderServer.OrderFinished(order));
        }

    }
}
