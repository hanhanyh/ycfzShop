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
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
               // YC_User u = new YC_User();
               // u.Name = "user251";
               // u.Nickname = "user251";
               // u.Password = "user251";
               // u.Address = "四川";
               // u.Sex = 0;
               // u.Phone = "18381506390";
               // u.Qq = "1031893464";
               //int i= BLL.UserBLL.regUser(u);
               // Response.Write(i);
            }
        }
    }
}