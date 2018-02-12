using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI.Admin
{
    public partial class AllGoodsManager : System.Web.UI.Page
    {

        /// <summary>
        /// 商品分类ID；
        /// </summary>
        //public int _gitd;
        public string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                //没登录 直接跳转
                if (Session["adminuser"] == null)
                {
                    Response.Redirect("login.aspx");
                }
                ///默认类型ID;
                //_gitd = 1;
                bind();
               
             
            }
        }
        public void bind() {
            if (Session["key"] == null)
            {
                //GridView绑定
                this.GridView1.DataSource = BLL.AdminGoodManager.select();
                this.GridView1.DataBind();
            }
            else
            {
               _key= Session["key"].ToString();
                txtSearch.Text = _key;
                this.GridView1.DataSource = BLL.AdminGoodManager.SelectByNameLike(_key);
                this.GridView1.DataBind();
            }
            ////类型ID下拉框数据绑定
            //this.ddlType.DataSource = BLL.AdminGoodTypeBLL.selectAllType();
            //this.ddlType.DataValueField = "GTID";
            //this.ddlType.DataTextField = "Name";
            //this.ddlType.DataBind();
        }
        /// <summary>
        /// 行编辑
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
        /// commanded
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EditLBtn")
            {
                Response.Redirect("~\\Admin\\GoodsEditor.aspx?GID=" + e.CommandArgument.ToString());
            }

        }
        /// <summary>
        /// 类型ID选择项变更（需要前台开启自动回传）
        /// </summary>
        /// <param name="sender"></param>
        ///// <param name="e"></param>
        //protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int index = this.ddlType.SelectedIndex;
        //   int gtid=Convert.ToInt32( this.ddlType.Items[index].Value);
        //    this._gitd = gtid;
        //    //重新绑定
        //    this.bind();
        //}
        /// <summary>
        /// 行删除
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // ClientScript.RegisterClientScriptBlock(this.GetType(), "aDelete", "<script>var r=prompt(\"确定删除？\");return r;</script>");
           int index =e.RowIndex;
            Label labid = this.GridView1.Rows[index].FindControl("labGID") as Label;
            int id = Convert.ToInt32(labid.Text);
            int re = BLL.AdminGoodManager.deleteGoodById(id);
            if (re == 1)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "aDelete", "<script>alert(\"删除成功\");</script>");
                bind();
            }
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == "")
            {
                Session["key"] = null;
            }
            else {
                Session["key"] = txtSearch.Text;
            }
            bind();
        }
    }
}