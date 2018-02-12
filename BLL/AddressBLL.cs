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
    public  class AddressBLL
    {
        /// <summary>
        /// 查询我的所有收货地址
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataTable selectAllAddress(int uid)
        {
            return DAL.AddressServer.selectAllAddress(uid).Tables[0];
        }
        /// <summary>
        /// 增加收货地址
        /// </summary>
        /// <param name="address"></param>
        /// <returns></returns>
        public static int addAddress(YC_Address address)
        {
            return Convert.ToInt32(DAL.AddressServer.addAddress(address));
        }
        /// <summary>
        /// 删除一个收货地址
        /// </summary>
        /// <param name="aid"></param>
        /// <returns></returns>
        public static int deleteAddress(int aid)
        {
            return Convert.ToInt32(DAL.AddressServer.deleteAddress(aid));

        }
        /// <summary>
        /// 查询一个收货地址信息
        /// </summary>
        /// <param name="aid"></param>
        /// <returns></returns>
        public static YC_Address SelectOneByAId(int aid)
        {
             DataTable dt= DAL.AddressServer.SelectOneByAId(aid).Tables[0];
            DataRow dr= dt.Rows[0];
            YC_Address address = new YC_Address();
            address.AID =Convert.ToInt32( dr["AID"].ToString());
            address.UID = Convert.ToInt32(dr["UID"].ToString());
            address.Address = dr["Address"].ToString();
            address.Phone= dr["Phone"].ToString();
            address.MailNumber = dr["MailNumber"].ToString();
            address.Name = dr["Name"].ToString();
            return address;
        }
    }
}
