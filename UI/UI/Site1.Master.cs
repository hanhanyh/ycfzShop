using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using Model;
namespace UI
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        /// <summary>
        /// 是否登录（前台）
        /// </summary>
        public bool _isLogin;
        /// <summary>
        /// 几个图片
        /// </summary>
        public string _logoimg;
        //public string _banner1;
        //public string _banner2;
        //public string _banner3;
      //  public string[] banners;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //是否登录
                if (Session["UName"] == null)
                {
                    _isLogin = false;
                }
                else
                {
                    _isLogin = true;
                }
                YC_Website web = BLL.AdminWebSiteManager.selectLastOne();
                _logoimg = web.Logourl;
             
                
            }
        }
    }
}