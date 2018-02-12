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
    public partial class WebForm3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UName"] == null)
                {
                    Response.Redirect("index.aspx");
                    return; 
                }
                string uname = Session["UName"].ToString();
                int uid = BLL.UserBLL.selectIDByName(uname);
                YC_User user = BLL.UserBLL.SelectUInfo(uid);
                labName.Text = user.Name;
                labNick.Text = user.Nickname;
                labPhone.Text = user.Phone;
                labQQ.Text = user.Qq;
                labSex.Text = user.Sex == 0 ?  "女": "男" ;
                labRegTime.Text = user.RegDateTime;
            }
        }
    }
}