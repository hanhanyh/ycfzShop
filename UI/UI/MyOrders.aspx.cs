using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Model;
namespace UI
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UName"] == null)
            {
                Response.Redirect("index.aspx");
                return;
            }
            if (!IsPostBack)
            {
                bind();
            }
        }
        void bind()
        {
            string uname = Session["UName"].ToString();
            int uid = BLL.UserBLL.selectIDByName(uname);
            //获取DataView
            DataView dv = BLL.OrderBLL.selectMyAllOrder(uid).DefaultView;//这里暂且绑定1
            for (int i = 0; i < dv.Count; i++)
            {
                //取出每一行 为DatRowView  dv[i]
                //每一个数据是drv 判断长度进行截取
                DataRowView drv = dv[i];

                if (drv[1].ToString().Count() > 8)//商品名称
                    drv[1] = drv[1].ToString().Substring(0, 8) + "...";

                if (drv[3].ToString().Count() > 10)//收货地址
                    drv[3] = drv[3].ToString().Substring(0, 10) + "...";
            }
            this.GridView1.DataSource = dv;
            this.GridView1.DataBind();

            ///
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                Label labid = this.GridView1.Rows[i].FindControl("labid") as Label;
                int orderid = Convert.ToInt32(Convert.ToInt32(labid.Text));
                Label labStatus = this.GridView1.Rows[i].FindControl("LaborderStatus") as Label;
                LinkButton lbtnshouhuo = this.GridView1.Rows[i].FindControl("btnshouhuo") as LinkButton;
                if (BLL.OrderBLL.isClosed(orderid) == 1)
                {
                    labStatus.Text = "已关闭";
                    lbtnshouhuo.CssClass = "lbtnhide";

                    continue;
                }
                if (BLL.OrderBLL.isSended(orderid) == 0)
                {
                    labStatus.Text = "待发货";
                    lbtnshouhuo.CssClass = "lbtnhide";


                }
                else if (BLL.OrderBLL.isSended(orderid) == 1 && BLL.OrderBLL.isFinished(orderid) == 0)
                {
                    labStatus.Text = "配送中";
               
                }
                else if (BLL.OrderBLL.isSended(orderid) == 1 && BLL.OrderBLL.isFinished(orderid) == 1)
                {
                    labStatus.Text = "已完成";
                    lbtnshouhuo.CssClass = "lbtnhide";
                }
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            bind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnshouhuo")
            {
                int oid = Convert.ToInt32(e.CommandArgument);
                YC_Order order = new YC_Order();
                order.OID = oid;
                if (BLL.OrderBLL.OrderFinished(order) == 1)
                {
                    bind();
                }
            }
        }
    }
}