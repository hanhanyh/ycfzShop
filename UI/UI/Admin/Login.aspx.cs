using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BLL;
using Model;
namespace UI.Admin
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
               
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            YC_User user = new YC_User();
            user.Name = txtUname.Text.Trim();
            user.Password = txtPwd.Text.Trim();
            int re=AdminLoginBLL.Login(user);
            if (re == 1)
            {
                //存入session
                Session["adminuser"] = user.Name;
                Response.Redirect("Panel.aspx");
            }
            else {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "loginfail", "<script>loginfail();</script>");
            }
        }
    }
}