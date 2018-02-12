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
     public   class AdminOrderBLL
    {
        /// <summary>
        /// 查询所有未发货订单
        /// </summary>
        /// <returns></returns>
        public static DataTable selectAllUnSendedOrder()
        {
            return DAL.OrderServer.selectAllUnSendOrder().Tables[0];
        }
        /// <summary>
        /// 查询所有未完成订单（待收货）
        /// </summary>
        /// <returns></returns>
        public static DataTable selectAllUnFinishedOrder()
        {
            return DAL.OrderServer.selectAllUnFinishedOrder().Tables[0];
        }
        /// <summary>
        /// 查询所有已完成订单
        /// </summary>
        /// <returns></returns>
        public static DataTable AllHasFinishedOrder()
        {
            return DAL.OrderServer.AllHasFinishedOrder().Tables[0];
        }
        /// <summary>
        /// 订单ID查询订单
        /// </summary>
        /// <param name="oid"></param>
        /// <returns></returns>
        public static DataTable selectOneOrderByOID(int oid)
        {
            return DAL.OrderServer.selectOneOrderByOID(oid).Tables[0];
        }
        /// <summary>
        /// 发货
        /// </summary>
        /// <param name="sendtype">发货方式</param>
        /// <param name="yundan">运单号</param>
        /// <param name="oid">订单ID</param>
        /// <returns></returns>
        public static int SendingGood(string sendtype, string yundan, int oid)
        {   YC_Order order = new YC_Order();
       
            order.Sendtype = sendtype;
            order.IsSended = 1;
            order.OID = oid;
            order.WayNumber = yundan;
            return Convert.ToInt32(DAL.OrderServer.sendOrder(order));
        }
    }
}
