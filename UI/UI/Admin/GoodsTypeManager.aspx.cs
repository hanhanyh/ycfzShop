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
    public partial class GoodsTypeManager : System.Web.UI.Page
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
            this.GridView1.DataSource = BLL.AdminGoodTypeBLL.selectAllType();
            this.GridView1.DataBind();
        }
        //行编辑时
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            this.GridView1.EditIndex = e.NewEditIndex;
            bind();
        }
        //取消编辑
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            this.GridView1.EditIndex = -1;
            bind();
        }
        //增加新类型
        protected void btnadd_Click(object sender, EventArgs e)
        {
            string typename = (this.GridView1.FooterRow.FindControl("txtTypeName") as TextBox).Text.Trim();
            string typedes = (this.GridView1.FooterRow.FindControl("txtTypeDes") as TextBox).Text.Trim();
            YC_GoodType gd = new YC_GoodType();
            gd.Name = typename;
            gd.Description = typedes;
            if (BLL.AdminGoodTypeBLL.add(gd)==1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "addsucc", "<script>f()</script>");
                this.GridView1.EditIndex = -1;
                this.bind();
            }

            //注册客户端脚本
            //    
        }
        /// <summary>
        /// 删除按钮
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32((this.GridView1.Rows[e.RowIndex].FindControl("gtidlab") as Label).Text);
            if (BLL.AdminGoodTypeBLL.delete(id) == 1)
            {
                //注册客户端脚本和重新绑定
                ClientScript.RegisterClientScriptBlock(this.GetType(), "deleteSuccess", "<script>deleteSuss();</script>");
                bind();
            }
        }
    }
}