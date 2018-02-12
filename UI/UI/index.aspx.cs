using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
namespace UI
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        public string[] banners;
        public string _title;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //第一行索引为0
                Repeater1row.DataSource = BLL.GoodPagerBLL.PagerIndexPage(0);
                Repeater1row.DataBind();
                //1
                //第2行索引为1
                Repeater2row.DataSource = BLL.GoodPagerBLL.PagerIndexPage(1);
                Repeater2row.DataBind();
                //第三行 索引2
                Repeater3row.DataSource = BLL.GoodPagerBLL.PagerIndexPage(2);
                Repeater3row.DataBind();
                YC_Website web = BLL.AdminWebSiteManager.selectLastOne();
                banners = web.Lunboimgurl.Split('|');
                _title = web.Wname;
            }
        }

        protected void linkbtnNavGoods_Click(object sender, EventArgs e)
        {
            Response.Redirect("xx.aspx");
        }
    }
}