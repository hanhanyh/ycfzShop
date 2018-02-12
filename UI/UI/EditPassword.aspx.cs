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
    public partial class EditPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 修改密码
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditPwd_Click(object sender, EventArgs e)
        {
            string oriPwd = this.txtOriPwD.Text.Trim();
            string newPwd = txtNewPwd.Text;
            string newrepPwd = txtRepPwd.Text;
            YC_User u = new YC_User();
            u.Name = Session["UName"].ToString();
            u.Password = oriPwd;
            if (BLL.UserBLL.AuthPwd(u) == 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "authfailure", "<script>alert(\"原始密码错误！\")</script>");
            }
            else if (newPwd == "" || newrepPwd == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "authfailure", "<script>alert(\"密码不能为空！\")</script>");
            }
            else if (newPwd != newrepPwd)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "authfailure", "<script>alert(\"两次输入不一致！\")</script>");
            }
            else {
                u.Password = newPwd;
                if (BLL.UserBLL.updatePwd(u) == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "authfailure", "<script>alert(\"密码修改成功！\");location.href=\"index.aspx\"</script>");
                    Session["UName"] = null;
                    
                }
            }
            
        }
    }
}