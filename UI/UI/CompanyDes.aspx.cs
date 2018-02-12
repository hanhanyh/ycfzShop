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
    public partial class CompanyDes : System.Web.UI.Page
    {
        public string _des;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                YC_Website web = BLL.AdminWebSiteManager.selectLastOne();
                _des = web.Companydescription;
            }
        }
    }
}