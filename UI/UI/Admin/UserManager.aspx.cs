using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Model;
using BLL;
using System.Data;
namespace UI.Admin
{
    public partial class UserManager : System.Web.UI.Page
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
        public void bind()
        {
            if (txtSearch.Text == "")
            {
                this.GridView1.DataSource = BLL.AdminUserManagerBLL.SelectAllUsers();
                this.GridView1.DataBind();
            }
            else {
                this.GridView1.DataSource = BLL.AdminUserManagerBLL.selectAllLike(this.txtSearch.Text);
                this.GridView1.DataBind();
            }
           
            /////设置性别
            for (int i = 0; i < this.GridView1.Rows.Count; i++)
            {
                Label lab = this.GridView1.Rows[i].FindControl("labSex") as Label;
                if (lab != null)
                {
                    if (lab.Text == "1")
                    {
                        lab.Text = "男";
                    }
                    else {
                        lab.Text = "女";
                    }
                }
            }

        }
      
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.GridView1.PageIndex = e.NewPageIndex;
            bind();
        }

      
        /// <summary>
        /// 编辑时
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridView1.EditIndex = e.NewEditIndex;
            bind();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridView1.EditIndex = -1;
            bind();
        }
        /// <summary>
        /// 行数据绑定时
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (this.GridView1.EditIndex == e.Row.RowIndex)
            {
                ///设置性别
                DropDownList ddlsex = e.Row.FindControl("ddlsex") as DropDownList;
                if (ddlsex != null)
                {
                    //男:1  女：0
                     Label labUid= e.Row.FindControl("labUid") as Label;
                    YC_User user = AdminUserManagerBLL.selectOneByUID(Convert.ToInt32(labUid.Text));
                    ddlsex.SelectedIndex = user.Sex;
                }
                ///设置是否启用
           /*
            *    <asp:TemplateField >
                <HeaderTemplate >
                   启用
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label ID="labEnable" runat="server" Text='<%#Eval("Enable") %>'></asp:Label>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:DropDownList runat="server" ID="ddlenable" >
                        <asp:ListItem Text="是" Value="1"></asp:ListItem>
                        <asp:ListItem Text="否" Value="0"></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <FooterTemplate>

                </FooterTemplate>
            </asp:TemplateField>
                DropDownList ddlenable = e.Row.FindControl("ddlenable") as DropDownList;
                if (ddlsex != null)
                {
                    //男:1  女：0
                    Label labUid = e.Row.FindControl("labUid") as Label;
                    YC_User user = AdminUserManagerBLL.selectOneByUID(Convert.ToInt32(labUid.Text));
                    ddlsex.SelectedIndex = user.Enable;
                }
                */
            }
        }
        //点击更新时
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           YC_User user =new  YC_User();
             user.Uid = Convert.ToInt32((this.GridView1.Rows[e.RowIndex].FindControl("labUid") as Label).Text);
        //    user.Name= (this.GridView1.Rows[e.RowIndex].FindControl("labName") as Label).Text;
           user.Nickname = (this.GridView1.Rows[e.RowIndex].FindControl("txtNick") as TextBox).Text;
             user.Sex =Convert.ToInt32( (this.GridView1.Rows[e.RowIndex].FindControl("ddlsex") as DropDownList).SelectedValue);
           user.Address =(this.GridView1.Rows[e.RowIndex].FindControl("txtAddress") as TextBox).Text;
           user.Phone= (this.GridView1.Rows[e.RowIndex].FindControl("txtPhone") as TextBox).Text;
          user.Qq = (this.GridView1.Rows[e.RowIndex].FindControl("txtQQ") as TextBox).Text;
            //    user.Enable = Convert.ToInt32((this.GridView1.Rows[e.RowIndex].FindControl("ddlenable") as DropDownList).SelectedValue);
            //    user.Headimg= (this.GridView1.Rows[e.RowIndex].FindControl("imghead") as Image).ImageUrl;
            if (BLL.AdminUserManagerBLL.UpdateUser(user) == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "updateSucc", "<script>updateSucc();</script>");
                this.GridView1.EditIndex = -1;
                bind();
            }
           
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            bind();
        }
    }
}