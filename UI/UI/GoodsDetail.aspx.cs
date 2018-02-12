using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using BLL;
namespace UI
{
    public partial class GoodsDetail : System.Web.UI.Page
    {
        //商品ID
        public int _GID;
        //当前用户uid
        public int _UID;
        //商品名称
        public string _Name;
        //促销价
        public string _CXPrice;
        //市场价
        public string _SCPrice;
        //描述图片
        public string _DesImg1Url;
        public string _DesImg2Url;
        public string _DesImg3Url;
        //尺寸
        public string _AllSize;
        //详细描述
        public string _Detail;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Request.QueryString["GID"] == null)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "GG", "<SCRIPT>ffrequest();</SCRIPT>");
                    return;
                }
                if (Session["UName"] != null)
                {
                    this._UID = BLL.UserBLL.selectIDByName(Session["UName"].ToString());
                }
                this._GID = Convert.ToInt32(Request.QueryString["GID"]);
                DataTable dt = BLL.Goods.selectOneByID(_GID);
                DataRow dr = dt.Rows[0];
                _Name = dr["Name"].ToString();
                _CXPrice = dr["CXPrice"].ToString();
                _SCPrice = dr["SCPrice"].ToString();
                _DesImg1Url = dr["DesImg1Url"].ToString();
                _DesImg2Url = dr["DesImg2Url"].ToString();
                _DesImg3Url = dr["DesImg3Url"].ToString();
                _AllSize = dr["AllSize"].ToString();
                _Detail = dr["DetailImages"].ToString();

            }

        }
    }
}