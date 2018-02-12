using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using BLL;
namespace BLL
{
    public class CountBLL
    {
        /// <summary>
        /// 销量统计
        /// </summary>
        /// <returns></returns>
        public static DataTable xlCount()
        {
            return DAL.Count.xlCount().Tables[0];
        }
        /// <summary>
        /// 饼状图
        /// </summary>
        /// <returns></returns>
        public static DataTable pieCount()
        {
            return DAL.Count.pieCount().Tables[0];
        }


    }
}
