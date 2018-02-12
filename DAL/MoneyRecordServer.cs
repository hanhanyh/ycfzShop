using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data;
namespace DAL
{
   
   public  class MoneyRecordServer
    {
        public static string sqltext = "";
        /// <summary>
        /// 查询我的所有交易记录
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public static DataSet selectMyAllRecordByUid(int id)
        {
            sqltext = "  select * from [dbo].[YC_MoneyRecord] where [UID]='"+id+"' order by [MRID] desc ";
            return SQLHELPER.ExecuteDataSet(sqltext);
        }
    }
}
