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
   public class UserBLL
    {
        /// <summary>
        /// 注册用户
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int regUser(YC_User u)
        {
            return Convert.ToInt32(DAL.UserServer.add(u));
        }
        /// <summary>
        /// 用户登录
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int login(YC_User u)
        {
            return Convert.ToInt32(DAL.UserServer.login(u));
        }
        /// <summary>
        /// 通过用户名查询uid
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static int selectIDByName(string name)
        {
            return Convert.ToInt32(DAL.UserServer.selectIDbyName(name));
        }
        /// <summary>
        /// 通过uid查询用户资料
        /// </summary>
        /// <param name="uid"></param>
        /// <returns></returns>
        public static YC_User SelectUInfo(int uid)
        {
            DataTable dt= DAL.UserServer.selectOneByuid(uid).Tables[0];
            DataRow dr = dt.Rows[0];
            YC_User u = new YC_User();
            u.Uid = Convert.ToInt32(dr["UID"]);
            u.Name = dr["Name"].ToString();
            u.Nickname= dr["NickName"].ToString();
            u.Password = dr["PassWord"].ToString();
            u.Address = dr["Address"].ToString();
            u.Sex = Convert.ToInt32(dr["Sex"]);
            u.Admin = Convert.ToInt32(dr["Admin"]);
            u.Phone = dr["Phone"].ToString();
            u.Qq = dr["QQ"].ToString();
            u.Enable = Convert.ToInt32(dr["Enable"]);
            u.Headimg = dr["headImg"].ToString();
            u.Money = Convert.ToDouble(dr["Moneysum"]);
            u.RegDateTime = dr["RegDateTime"].ToString();
            return u;

        }
        /// <summary>
        /// 验证密码是否和传入的密码一致
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int AuthPwd(YC_User u)
        {
            return Convert.ToInt32(DAL.UserServer.AuthPwd(u));
        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int updatePwd(YC_User u)
        {
            return Convert.ToInt32(DAL.UserServer.updatePwd(u));
        }
        /// <summary>
        /// 更新用户资料
        /// </summary>
        /// <param name="U"></param>
        /// <returns></returns>
        public static int UpdateaUInfo(YC_User U)
        {
            return Convert.ToInt32(DAL.UserServer.UpdateaPart(U));
        }
        /// <summary>
        /// 查看用户是否存在 用户名
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static int isExists(YC_User u)
        {
            return Convert.ToInt32(DAL.UserServer.isExists(u));
        }
    }
}
