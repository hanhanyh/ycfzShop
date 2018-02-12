using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Model;
using DAL;
namespace BLL
{
    public class AdminWebSiteManager
    {
        /// <summary>
        /// 增加信息~
        /// </summary>
        /// <param name="wt"></param>
        /// <returns></returns>
        public static int add(YC_Website wt)
        {
            return Convert.ToInt32(DAL.YCWebsiteServer.add(wt));
        }
        /// <summary>
        /// 查询最新一条
        /// </summary>
        /// <returns></returns>
        public static YC_Website selectLastOne()
        {
            return DAL.YCWebsiteServer.selectLastestOne();
        }
        /// <summary>
        /// 更新包括图片
        /// </summary>
        /// <param name="web"></param>
        /// <returns></returns>
        public static int update(YC_Website web)
        {
            return Convert.ToInt32(DAL.YCWebsiteServer.update(web));
        }
        /// <summary>
        /// 更新不包括图片
        /// </summary>
        /// <param name="web"></param>
        /// <returns></returns>
        public static int updatenopic(YC_Website web)
        {
            return Convert.ToInt32(DAL.YCWebsiteServer.updatenopic(web));
        }
    }
}
