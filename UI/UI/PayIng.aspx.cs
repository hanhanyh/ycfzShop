using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class PayIng : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                labName.Text = Session["Order_GID"].ToString();
                labSize.Text = Session["Order_Size"].ToString();
                labTopicPrice.Text = "￥"+Session["Order_Payed"].ToString();
                labCount.Text = Session["Order_count"].ToString();
                labAddress.Text = Session["Order_Address"].ToString();
                labWillPayMoney.Text = Session["Order_Payed"].ToString();
            }
        }

       

      
    }
}