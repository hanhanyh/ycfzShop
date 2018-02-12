using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;
using Model;
namespace UI.Admin
{
    public partial class SendingGoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // 没登录 直接跳转
                if (Session["adminuser"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                int oid = Convert.ToInt32(Request.QueryString["OID"].Trim());
                DataTable dt=  BLL.AdminOrderBLL.selectOneOrderByOID(oid);
                ///获取第一行
                DataRow dr= dt.Rows[0];
                string price = dr["价格"].ToString().Trim();
                string amount = dr["数量"].ToString().Trim();
                string address= dr["收货地址"].ToString().Trim();
                string Size= dr["尺寸"].ToString().Trim();
                string PayTime = dr["拍下时间"].ToString().Trim();
                string Gname = dr["商品名称"].ToString().Trim();
                string Pic = dr["图片"].ToString().Trim();
                //
                this.LabelPayedMoney.Text = price;
                this.LabelAmount.Text = amount;
                this.LabelAddress.Text = address;
                this.LabelSize.Text = Size;
                this.LabelBuyTime.Text = PayTime;
                this.LabelGName.Text = Gname;
                this.LabelPic.Text = Pic;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          //  string datetime = DateTime.Now.Year.ToString()+"-"+ DateTime.Now.Month.ToString()+"-"+ DateTime.Now.Day.ToString()+" "+ DateTime.Now.Hour.ToString()+":"+DateTime.Now.Minute.ToString()+":"+DateTime.Now.Second.ToString();
            if (BLL.AdminOrderBLL.SendingGood(this.labSendType.Text, this.labYunDan.Text, Convert.ToInt32(Request.QueryString["OID"].Trim())) == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "fhcg", "<script> sendSucc();</script>");
                Response.Redirect("OrderWaiting.aspx");
            }
        }
    }
}