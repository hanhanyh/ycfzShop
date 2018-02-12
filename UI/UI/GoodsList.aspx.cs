using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UI
{
    public partial class GoodsList : System.Web.UI.Page
    {
       public  int _page;
        int _gtid;
       public int _allcount;//总数量
        public int _allPages;//总页数
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["GTID"] == null)
                {
                    Response.Redirect("GoodsList.aspx?GTID=1&page=1");
                }
              
                //绑定属性
                initProperties();
                //绑定控件
                txtPageIndex.Text = _page.ToString();
                //计算页数
                if (_allcount % 12 == 0)
                {
                    _allPages = _allcount / 12;
                }
                else
                {
                    _allPages = _allcount / 12 + 1;
                }
                //绑定类型
                bindTypeBar();
                //绑定rep
                bindRepeater();
            
            }
        }
        void initProperties()
        {
            this._page = Convert.ToInt32(Request.QueryString["page"]);
            this._gtid = Convert.ToInt32(Request.QueryString["GTID"]);
            _allcount = BLL.GoodPagerBLL.CountByGTID(_gtid);
        }
        void bindTypeBar()
        {
            //分类条
            this.RepeaterGoodsType.DataSource = BLL.GoodsType.selectAllType();
            this.RepeaterGoodsType.DataBind();
        }
        void bindRepeater()
        {
           
            //第一行Repeater
            this.Repeater1row.DataSource = BLL.GoodPagerBLL.PagerRowByGTID(_gtid, _page, 1);
            this.Repeater1row.DataBind();
            //第二行rep
            Repeater2row.DataSource = BLL.GoodPagerBLL.PagerRowByGTID(_gtid, _page, 2);
            Repeater2row.DataBind();
            //第三行
            Repeater3row.DataSource = BLL.GoodPagerBLL.PagerRowByGTID(_gtid, _page, 3);
            Repeater3row.DataBind();
        }

        protected void btnprePage_Click(object sender, EventArgs e)
        {
            initProperties();
            string url = "GoodsList.aspx?GTID=" + this._gtid.ToString() + "&page=" + (_page-1).ToString();
            Response.Redirect(url);
        }

        protected void btnNavgator_Click(object sender, EventArgs e)
        {
            this._gtid = Convert.ToInt32(Request.QueryString["GTID"]);
            string url = "GoodsList.aspx?GTID=" + this._gtid.ToString() + "&page=" + txtPageIndex.Text.ToString().Trim();
            Response.Redirect(url);
        }

        protected void btnNextPage_Click(object sender, EventArgs e)
        {
            initProperties();
            string url = "GoodsList.aspx?GTID=" + this._gtid.ToString() + "&page=" + (_page+1).ToString();
            Response.Redirect(url);
        }
    }
}