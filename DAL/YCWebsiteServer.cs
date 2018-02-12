using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Model;
using System.Data;
namespace DAL
{
    //
   public  class YCWebsiteServer
    {
        private  static string sqltext="";
        //增加
        public static object add(YC_Website wb)
        {
            sqltext = "  insert into [dbo].[YC_WebSite]([WName],[LogoUrl],[LunboImgUrl],[CompanyDescription],[OurTeam],[ContactUs],[ContactUsWeChatImage],[TodayMovieUrl])VALUES  ('"+wb.Wname+"','"+wb.Logourl+"','"+wb.Lunboimgurl+"','"+wb.Companydescription+"','"+wb.Ourteam+"','"+wb.Contactus+"','"+wb.ContactUsWeChatImage+"','"+wb.TodayMovieUrl+"')";

            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        //查询最新的一条 返回
        public static YC_Website selectLastestOne()
        {
            sqltext = "  select top 1 * from [dbo].[YC_WebSite] order by [WID] desc";
           DataTable dt= SQLHELPER.ExecuteDataSet(sqltext).Tables[0];
            DataRow dr = dt.Rows[0];
            YC_Website wb = new YC_Website();
            wb.Wname = dr["WName"].ToString();
            wb.Logourl = dr["LogoUrl"].ToString();
            wb.Lunboimgurl = dr["LunboImgUrl"].ToString();
            wb.Companydescription = dr["CompanyDescription"].ToString();
            wb.Ourteam = dr["OurTeam"].ToString();
            wb.Contactus = dr["ContactUs"].ToString();
            wb.ContactUsWeChatImage = dr["ContactUsWeChatImage"].ToString();
            wb.TodayMovieUrl = dr["TodayMovieUrl"].ToString();
            return wb;
        }
        //通过id删除
        public static object delete(int id)
        {
            sqltext = "  delete from [dbo].[YC_WebSite] where[WID] ='"+id+"'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 修改（包括图片）
        /// </summary>
        /// <param name="web"></param>
        /// <returns></returns>
        public static object update(YC_Website web)
        {
            sqltext = "  update  [dbo].[YC_WebSite] set [WName]='"+web.Wname+"',[LogoUrl]='"+web.Logourl+"',[LunboImgUrl]='"+web.Lunboimgurl+"',[CompanyDescription]='"+web.Companydescription+"',[OurTeam]='"+web.Ourteam+"',[ContactUs]='"+web.Contactus+"',[ContactUsWeChatImage]='"+web.ContactUsWeChatImage+"',[TodayMovieUrl]='"+web.TodayMovieUrl+"' where [WID]='1'";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }
        /// <summary>
        /// 修改（不包括图）
        /// </summary>
        /// <param name="web"></param>
        /// <returns></returns>
        public static object updatenopic(YC_Website web)
        {
            sqltext = "    update  [dbo].[YC_WebSite] set [WName]='"+web.Wname+"',[CompanyDescription]='"+web.Companydescription+"',[OurTeam]='"+web.Ourteam+"',[ContactUs]='"+web.Contactus+"' where [WID]='1';";
            return SQLHELPER.ExecuteNonQuery(sqltext);
        }

    }
}
