using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Admin
{
    public partial class OrderWaiting : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.GridView1.DataSource = BLL.AdminOrderBLL.selectAllUnSendedOrder();
                this.GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            ////发货按钮点击
            if (e.CommandName == "SendGoods")
            {
                string urlget=e.CommandArgument.ToString();
                Response.Redirect("SendingGoods.aspx?OID=" + urlget);
            }
        }
    }
 
}