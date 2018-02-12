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
    public partial class MyAddress : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }
        void bind()
        {
            this.GridView1.DataSource = BLL.AddressBLL.selectAllAddress(1);//这里传入当前用户的id
            this.GridView1.DataBind();
        }
        /// <summary>
        /// 添加
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnfootAdd_Click(object sender, EventArgs e)
        {
            //TextBox txtName = txtName as TextBox;
            //TextBox txtEmail = GridView1.FooterRow.FindControl("txtEmail") as TextBox;
            //TextBox txtPhone = GridView1.FooterRow.FindControl("txtPhone") as TextBox;
            //TextBox txtAddress = GridView1.FooterRow.FindControl("txtAddress") as TextBox;
            YC_Address address = new YC_Address();
            address.Name = txtName.Text;
            address.MailNumber = txtEmail.Text;
            address.Phone = txtPhone.Text;
            address.Address = txtAddress.Text;
            address.UID = 1;//这里传入当前用户的id;
            if (BLL.AddressBLL.addAddress(address) == 1)
            {
                bind();
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
           Label labid= this.GridView1.Rows[e.RowIndex].FindControl("labAID") as Label;
            BLL.AddressBLL.deleteAddress(Convert.ToInt32(labid.Text.Trim()));
            bind();
        }
    }
}