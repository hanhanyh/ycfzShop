using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using DAL;
using Model;
namespace BLL
{
    public class AdminLoginBLL
    {
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static int Login(YC_User user)
        {
            //根据用户名获取id
            user.Uid =Convert.ToInt32( DAL.UserServer.selectIDbyName(user.Name));
            int isAdmin = Convert.ToInt32(DAL.UserServer.isAdmin(user.Uid));
            if (isAdmin == 0)
            {
                return 0;
            }
            int loginre = Convert.ToInt32(DAL.UserServer.login(user));
            return loginre;
        }
    }
}
