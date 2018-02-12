using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//添加引用 System.Configuration
using System.Configuration;
using System.Data;
using System.Data.Sql;
using System.Data.SqlClient;
namespace DAL
{
    public class SQLHELPER
    {
        //获取Web.config里面的连接字符串
        public static String configuration = ConfigurationManager.ConnectionStrings["MYSQL"].ConnectionString;
        /// <summary>
        /// 返回首行首列 
        /// </summary>
        /// <param name="sqltext">sql语句</param>
        /// <returns>(object)</returns>
        public static object ExecuteScalar(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(configuration))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqltext, conn);
                return cmd.ExecuteScalar();
            }
        }
        /// <summary>
        /// 返回受影响行数
        /// </summary>
        /// <param name="sqltext"></param>
        /// <returns></returns>
        public static object ExecuteNonQuery(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(configuration))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand(sqltext, conn);
                return cmd.ExecuteNonQuery();
            }
        }
        /// <summary>
        /// 返回DataSet结果集
        /// </summary>
        /// <param name="sqltext">SQL语句</param>
        /// <returns>DataSet</returns>
        public static DataSet ExecuteDataSet(string sqltext)
        {
            using (SqlConnection conn = new SqlConnection(configuration))
            {
                conn.Open();
                
                SqlDataAdapter adapter = new SqlDataAdapter(sqltext, conn);
                DataSet dataset = new DataSet();
                adapter.Fill(dataset);
                return dataset;
            }
        }
    }
}
