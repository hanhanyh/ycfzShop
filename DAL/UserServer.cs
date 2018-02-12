using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
using Model;
namespace DAL
{
    //管理用户 UserServer
    public class UserServer
    {
        private static  string sqltext = "";
        /// <summary>
        /// 增加用户
        /// </summary>
        public static object add(YC_User user)
        {
           sqltext = "insert into [dbo].[YC_User]([Name],[NickName],[PassWord],[Address],[Sex],[Admin],[Phone],[QQ],Enable,Moneysum,RegDateTime)values('" + user.Name+"','"+user.Nickname+"','"+user.Password+"','"+user.Address+"','"+user.Sex+"','"+0+"','"+user.Phone+"','"+user.Qq+ "','1','0.00',convert(char(10),getdate(),120)+' '+Convert(varchar(8),Getdate(),108))";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        //查询一个用户的信息
        public static DataSet selectOneByuid(int uid)
        {
            sqltext = "select * from [dbo].[YC_User] where UID=" + uid + "";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        /// <summary>
        /// 删除用户
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static object delete(YC_User user)
        {
            sqltext = "delete from [dbo].[YC_User]  where UID='"+user.Uid+"'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        //更新用户资料
        public static object update(YC_User user)
        {
            sqltext = "insert into [dbo].[YC_User]([Name],[NickName],[PassWord],[Address],[Sex],[Admin],[Phone],[QQ],Enable)values('" + user.Name+"','"+user.Nickname+"','"+user.Password+"','"+user.Address+"','"+user.Sex+"','"+user.Admin+"','"+user.Phone+"','"+user.Qq+"','1')";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        //查询所有用户
        public static DataSet selectAll()
        {
            sqltext = "select * from  [dbo].[YC_User] order by [UID] desc";
           return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //模糊查询 所有用户
        public static DataSet selectAllLike(string key)
        {
            sqltext = "select * from  [dbo].[YC_User] where  [Name]  LIKE '%" + key + "%'or [NickName] LIKE '%" + key + "%' order by [UID] desc";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
        //判断是否是管理员
        public static object isAdmin(int uid)
        {
            if (uid == 1) return 1;
            sqltext = "  select [Admin] from [dbo].[YC_User] where [UID]="+uid+"";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        //判断是否是超级管理员
        public static object isSuperAdmin(int uid)
        {
            if (uid == 1)
                return 1;
            else
                return 0;
        }
        /// <summary>
        /// 登录
        /// </summary>
        /// <param name="user"></param>
        /// <returns></returns>
        public static object login(YC_User user)
        {
            sqltext = " select count(*) from [dbo].[YC_User] where [Name]='" + user.Name + "' and [PassWord]='" + user.Password + "'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 根据用户名查id
        /// </summary>
        /// <param name="name"></param>
        /// <returns></returns>
        public static object selectIDbyName(string name)
        {
            sqltext = "select [UID] from [dbo].[YC_User] where [Name]='" + name + "'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 后台管理中，管理员只能更新一部分用户资料
        /// </summary>
        /// <param name="U"></param>
        /// <returns></returns>
        public static object UpdateaPart(YC_User U)
        {
            sqltext = "  update [dbo].[YC_User] set [NickName]='" + U.Nickname + "',[Sex]='" + U.Sex + "',[Address]='" + U.Address + "',[Phone]='" + U.Phone + "',[QQ]='" + U.Qq + "' where [UID]='" + U.Uid + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 判断输入的用户名对应的密码是否一致 是返回1，不是返回0 
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static object AuthPwd(YC_User u)
        {
            sqltext = "  select count(*) from [dbo].[YC_User] where [Name]='" + u.Name + "' AND [PassWord]='" + u.Password + "'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
        /// <summary>
        /// 更新密码 传入用户名 和密码
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static object updatePwd(YC_User u)
        {
            sqltext = "  update [dbo].[YC_User] set [PassWord]='" + u.Password + "' where [Name]='" + u.Name + "'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 查看是否存在这个用户
        /// </summary>
        /// <param name="u"></param>
        /// <returns></returns>
        public static object isExists(YC_User u)
        {
            sqltext = "select count(*) from [dbo].[YC_User] where [Name]='" + u.Name + "'";
            return SQLHELPER.ExecuteScalar(sqltext);
        }
    }
}
