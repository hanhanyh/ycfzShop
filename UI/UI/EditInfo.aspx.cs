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
    public partial class EditInfo : System.Web.UI.Page
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
                ddlsex.SelectedIndex = user.Sex;
                
            }
        }
        /// <summary>
        /// 更新
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
          
            YC_User u = new YC_User();
            u.Sex = this.ddlsex.SelectedIndex;
            u.Nickname = labNick.Text;
            u.Qq = labQQ.Text;
            u.Phone = labPhone.Text;
            u.Uid = BLL.UserBLL.selectIDByName(Session["UName"].ToString());
            if (BLL.UserBLL.UpdateaUInfo(u) == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "usucc", "<script>alert(\"修改资料成功！\")</script>");
            }
        }
    }
}