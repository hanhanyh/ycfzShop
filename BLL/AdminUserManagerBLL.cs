using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using Model;
namespace BLL
{
   public  class AdminUserManagerBLL
    {
        /// <summary>
        /// 查询所有用户
        /// </summary>
        /// <returns></returns>
        public static DataTable SelectAllUsers()
        {
            return DAL.UserServer.selectAll().Tables[0];
        }
        //查询一个用户的信息
        public static YC_User selectOneByUID(int UID)
        {
            DataTable table= DAL.UserServer.selectOneByuid(UID).Tables[0];
            YC_User user = new YC_User();
            user.Uid = UID;
            user.Name = table.Rows[0][1].ToString();
            user.Nickname= table.Rows[0][2].ToString();
            user.Password= table.Rows[0][3].ToString();
            user.Address = table.Rows[0][4].ToString();
            user.Sex= Convert.ToInt32(table.Rows[0][5]);
            user.Admin = Convert.ToInt32(table.Rows[0][6]);
            user.Phone = table.Rows[0][7].ToString();
            user.Qq= table.Rows[0][8].ToString();
            user.Enable = Convert.ToInt32(table.Rows[0][9]);
            user.Headimg = table.Rows[0][10].ToString();
            user.Money = Convert.ToDouble(table.Rows[0][11]);
            return user;
        }
        //更新用户信息(一部分)
        public static int UpdateUser(YC_User u)
        {
           return Convert.ToInt32( DAL.UserServer.UpdateaPart(u));
        }
        /// <summary>
        /// 模糊查询 通过NAME 和nick
        /// </summary>
        /// <param name="key"></param>
        /// <returns></returns>
        public static DataTable selectAllLike(string key)
        {
            return DAL.UserServer.selectAllLike(key).Tables[0];
        }
    }
}
