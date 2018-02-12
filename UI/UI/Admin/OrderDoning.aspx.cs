using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
namespace UI.Admin
{
    public partial class OrderDoning : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //没登录 直接跳转
                if (Session["adminuser"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                bind();
            }
        }
        void bind()
        {
            DataView dv = BLL.AdminOrderBLL.selectAllUnFinishedOrder().DefaultView;
            for (int i = 0; i < dv.Count; i++)
            {
                DataRowView drv = dv[i];
                if (drv[0].ToString().Length > 10)
                {
                    drv[0] = drv[0].ToString().Substring(0, 10) + "...";
                }
                if (drv[1].ToString().Length > 10)
                {
                    drv[1] = drv[1].ToString().Substring(0, 10) + "...";
                }
                if (drv[2].ToString().Length > 10)
                {
                    drv[2] = drv[2].ToString().Substring(0, 10) + "...";
                }
                if (drv[3].ToString().Length > 10)
                {
                    drv[3] = drv[3].ToString().Substring(0, 10) + "...";
                }
                if (drv[4].ToString().Length > 10)
                {
                    drv[4] = drv[4].ToString().Substring(0, 10) + "...";
                }
                if (drv[5].ToString().Length > 10)
                {
                    drv[5] = drv[5].ToString().Substring(0, 10) + "...";
                }
            }
            this.GridView1.DataSource = dv;
            this.GridView1.DataBind();
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "closeOrder")
            {
                int oid = Convert.ToInt32(e.CommandArgument);
                if (BLL.OrderBLL.Close(oid) == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "xnsbsab", "<script>alert(\"关闭成功\");</script>");
                    bind();
                    
                }
            }

        }
    }
}