using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace UI.Admin
{
    public partial class Panel : System.Web.UI.Page
    {
        /// <summary>
        /// 销量柱状统计图
        /// </summary>
         public  string[] _goodsnames=new string[6];//商品名称
        public string[] _goodxl= new string[6];//商品销量
                                               
        public string[] _pieXl = null;
        public string[] _pieName = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //没登录 直接跳转
                if (Session["adminuser"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                labnow.Text = DateTime.Now.ToLongTimeString();
                labuname.Text = Session["adminuser"].ToString();
                //销量统计柱状图
                DataTable dt= BLL.CountBLL.xlCount();
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (dt.Rows[i][1].ToString().Length > 4)
                    {
                        _goodsnames[i] = dt.Rows[i][1].ToString().Substring(0, 4);
                    }
                    else
                    {
                        _goodsnames[i] = dt.Rows[i][1].ToString();
                    }
                    _goodxl[i] = dt.Rows[i][0].ToString();
                }
                //销量饼状图
                DataTable dtpie = BLL.CountBLL.pieCount();
                _pieXl = new string[dtpie.Rows.Count];
                _pieName = new string[dtpie.Rows.Count];
                for (int i = 0; i < dtpie.Rows.Count; i++)
                {
                    _pieXl[i] = dtpie.Rows[i][0].ToString(); 
                    _pieName[i]= dtpie.Rows[i][1].ToString();
                }
            }
        }
        //注销
        //protected void btnLogout_Click(object sender, EventArgs e)
        //{
        //    Session["adminuser"] = null;
        //    Response.Redirect("login.aspx");
        //}
    }
}