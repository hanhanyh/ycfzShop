using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
namespace DAL
{
    public class AddressServer
    {
        public static string sqltext = "";
        /// <summary>
        /// 查询我的所有收货地址
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static DataSet selectAllAddress(int uid)
        {
            sqltext = "  select * from  [dbo].[YC_Address] where [UID] ='" + uid + "' order by [AID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //增加一个收货地址
        public static object addAddress(YC_Address address)
        {
            sqltext = "  insert into [dbo].[YC_Address](UID,Address,Phone,MailNumber,Name)values('"+address.UID+"','"+address.Address+"','"+address.Phone+"','"+address.MailNumber+"','"+address.Name+"')";
            return SQLHELPER.ExecuteNonQuery(sqltext);

        }
        ///删除一个收货地址
        public static object deleteAddress(int aid)
        {
            sqltext = "delete from [dbo].[YC_Address] where AID='" + aid + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 查询一个收货地址信息 通过收货地址ID
        /// </summary>
        /// <param name="aid"></param>
        /// <returns></returns>
        public static DataSet SelectOneByAId(int aid)
        {
            sqltext= "  select * from [dbo].[YC_Address] where AID='"+aid+"'";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }

    
    }
}
