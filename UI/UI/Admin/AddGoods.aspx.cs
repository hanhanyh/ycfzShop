using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using Model;
namespace UI.Admin
{
    public partial class AddGoods : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DataTable td = BLL.AdminGoodTypeBLL.selectAllType();
                ddlType.DataValueField = "GTID";
                ddlType.DataTextField = "Name";
                ddlType.DataSource = td;
                ddlType.DataBind();
            }
        }
        /// <summary>
        /// 给文件加上随机字符
        /// </summary>
        /// <param name="path"></param>
        /// <returns></returns>
        public string getFileName(string path)
        {
            int a = path.LastIndexOf("/");
            int b = path.LastIndexOf(".");
            string random = DateTime.Now.ToString("yyyyMMdd") + new Random().Next(0, 999999).ToString();
            string type=path.Substring(path.LastIndexOf("."));
            return  path.Substring(a + 1, b)+random+type;//给文件加上随机字符
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile == false || FileUpload2.HasFile == false || FileUpload3.HasFile == false)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "fileup", "<script>warningDesPic();</script>");

            }
            else if (txtName.Text.Trim() == "" || txtSize.Text.Trim() == "" || txtSCPrice.Text.Trim() == "" || txtCXPrice.Text.Trim() == "")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "fileup", "<script>warningEmpty();</script>");
            }
            else {
                string name = txtName.Text.Trim();
                //市场价格
                string scprice = txtSCPrice.Text.Trim();
                //促销价格
                string cxprice = txtCXPrice.Text.Trim();
                //可选尺码
                string selectSize = txtSize.Text.Trim();
                string File1 = FileUpload1.FileName;
                string File2 = FileUpload2.FileName;
                string File3 = FileUpload3.FileName;
                string DetailDes = FCKeditor1.Value;
                //string type1, type2, type3;
                //type1 = File1.Substring(File1.LastIndexOf("."));
                //type2 = File2.Substring(File2.LastIndexOf("."));
                //type3 = File3.Substring(File3.LastIndexOf("."));
                ///这里还没有判断是否是图片
                //////
                //随机种子
                //Random rd = new Random();
                //int sj1= rd.Next(10000, 99999999);
                //int sj2 = rd.Next(10000, 99999999);
                //int sj3 = rd.Next(10000, 99999999);
                //File1 = File1 + sj1.ToString();
                //File2 = File2 + sj1.ToString();
                //File3 = File3 + sj1.ToString();
                string a1 = getFileName(File1);
                string a2 = getFileName(File2);
                string a3 = getFileName(File3);
                string path1 = Server.MapPath("~\\productImg\\" + a1);
                string path2 = Server.MapPath("~\\productImg\\" + a2);
                string path3 = Server.MapPath("~\\productImg\\" + a3);

                 FileUpload1.SaveAs(path1);
                 FileUpload2.SaveAs(path2);
                 FileUpload1.SaveAs(path3);
                string goodtype = ddlType.SelectedValue;
                ///
                YC_Goods goods = new YC_Goods();
                goods.Gtid = Convert.ToInt32(goodtype);
                goods.Name = name;
                goods.SCPrice = Convert.ToDouble(scprice);
                goods.Cxprice = Convert.ToDouble(cxprice);
                goods.DesImg1Url = a1;
                goods.DesImg2Url = a2;
                goods.DesImg3Url = a3;
                goods.DetailImages = DetailDes;
                goods.AllSize = txtSize.Text;
                BLL.AdminGoodManager.add(goods);
                ClientScript.RegisterClientScriptBlock(this.GetType(), "xx", "<script>alert(\"上架成功\")</script>");
            }
        }
    }
}