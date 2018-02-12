using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class Search : System.Web.UI.Page
    {
        public int _page;//当前页数
        public string _key;//搜索的key
        public int _allcount;//总数量
        public int _allPages;//总页数
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["key"] == null)
                {
                    Response.Redirect("index.aspx");
                }
                if (Request.QueryString["page"] == null)
                {
                    _key = Request.QueryString["key"].ToString();
                    Response.Redirect("Search.aspx?key=" + _key + "&page=1");
                }


                //绑定属性
                initProperties();
                //绑定控件
                txtPage.Text = _page.ToString();
                //计算页数
                if (_allcount % 12 == 0)
                {
                    _allPages = _allcount / 12;
                }
                else {
                    _allPages = _allcount / 12+1;
                }
                //绑定rep
                bindRepeater();
            }
        }
        void initProperties()
        {
            this._page = Convert.ToInt32(Request.QueryString["page"]);
            this._key = (Request.QueryString["key"]).ToString(); ;
            _allcount = BLL.GoodPagerBLL.CountByKey(_key);
        }
       
        void bindRepeater()
        {

            //第一行Repeater
            this.Repeater1row.DataSource = BLL.GoodPagerBLL.PagerRowByKey(_key, _page, 1);
            this.Repeater1row.DataBind();
            //第二行rep
            Repeater2row.DataSource = BLL.GoodPagerBLL.PagerRowByKey(_key, _page, 2);
            Repeater2row.DataBind();
            //第三行
            Repeater3row.DataSource = BLL.GoodPagerBLL.PagerRowByKey(_key, _page, 3);
            Repeater3row.DataBind();
        }

        protected void btnprePage_Click(object sender, EventArgs e)
        {
            initProperties();
            string url = "Search.aspx?key=" + this._key.ToString() + "&page=" + (_page - 1).ToString();
            Response.Redirect(url);
        }

        protected void btnNavgator_Click(object sender, EventArgs e)
        {
            this._key = Request.QueryString["key"].ToString();
             string url = "Search.aspx?key=" + this._key.ToString() + "&page=" + txtPage.Text.ToString().Trim();
             Response.Redirect(url);
        }

        protected void btnNextPage_Click(object sender, EventArgs e)
        {
            initProperties();
            string url = "Search.aspx?key=" + this._key.ToString() + "&page=" + (_page + 1).ToString();
            Response.Redirect(url);
        }
    }
}