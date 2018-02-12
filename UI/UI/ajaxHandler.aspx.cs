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
    public partial class ajaxHandler : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DoingAJax();
            }
        }
        private void DoingAJax()
        {
            Response.Clear();
            //什么都没有的时候
            if (Request.QueryString["comm"] == null || Request.QueryString["comm"] == "")
            {
                Response.Write("0");
                Response.End();
                return;
            }

            string comm = (Request.QueryString["comm"].ToString());
            switch (comm)
            {
                case "Reg"://注册
                    RegUser();
                    break;
                case "Login"://登录
                    Login();
                    break;
                case "Logout"://注销
                    Logout();
                    break;
                case "getGoods"://获取商品信息 返回json
                    getGoods();
                    break;
                case "generateOrder"://提交订单保存session
                    generateOrder();
                    break;
                case "PaySuccess"://支付成功读取session保存订单数据库
                    PaySuccess();
                    break;
                case "isLogined"://是否登录
                    isLogined();
                    break;
                case "UserisExists"://判断用户名是否存在
                    UserisExists();
                    break;
                default:
                    Response.Write("0");
                    break;
            }
            Response.End();
        }
        public void PaySuccess()//先提交订单 保存订单session,然后支付成功的时候读取session存取数据库
        {
            //Session["Order_"]
            string strGID = Session["Order_GID"].ToString(); ;// Request.Form["GID"];
            string strUID = Session["Order_UID"].ToString();//Request.Form["UID"];
            string strPayed = Session["Order_Payed"].ToString(); //Request.Form["Payed"];
            string strCount = Session["Order_count"].ToString();// Request.Form["count"];
            string strAddress = Session["Order_Address"].ToString();// Request.Form["Address"];
            string strSize = Session["Order_Size"].ToString();// Request.Form["Size"];
            YC_Order order = new YC_Order();
            order.GID = Convert.ToInt32(strGID);
            order.UID = Convert.ToInt32(strUID);
            order.Price = Convert.ToDouble(strPayed);
            order.Count = Convert.ToInt32(strCount);
            order.Address = strAddress;
            order.GoodSize = strSize;
            ///存入数据库
            if (BLL.OrderBLL.generateOrder(order) == 1)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }
        }
        public void generateOrder()
        {
            if (Session["UName"] == null)
            {
                Response.Write("0");

            }
            else {
                //传入商品ID 用户ID 已付资金，数量，地址,尺寸
                ///这里保存session等支付成功后 给支付页面用
                Session["Order_GID"] = Request.Form["GID"].ToString() ;
                Session["Order_UID"] = Request.Form["UID"].ToString();
                Session["Order_Payed"] = Request.Form["Payed"].ToString() ;
                Session["Order_count"] = Request.Form["count"].ToString() ;
                Session["Order_Address"] = Request.Form["Address"].ToString() ;
                Session["Order_Size"] = Request.Form["Size"].ToString(); ;
                //返回客户端
                    Response.Write("1");
           
                
            }
           
        }
        public void UserisExists()
        {
            string name = Request.QueryString["Name"].ToString();
            YC_User u = new YC_User();
            u.Name = name;
            if (BLL.UserBLL.isExists(u) == 1)
            {
                Response.Write("1");//存在
            }
            else {
                Response.Write("0");
            }
        }
        public void RegUser()
        {
            string name = Request.Form["Name"];
            string pwd = Request.Form["Pwd"];

            YC_User u = new YC_User();
            u.Name = name;
            u.Nickname = name;
            u.Password = pwd;
            u.Address = "四川";
            u.Sex = 0;
            u.Phone = "18381506390";
            u.Qq = "1031893464";
            int i = BLL.UserBLL.regUser(u);
            Response.Write(i);
        }
        public void isLogined()
        {
            if (Session["UName"] == null)
            {
                Response.Write("0");
            }
            else
            {

                Response.Write("1");
            }
        }
        public void Login()
        {
            string name = Request.Form["Name"];
            string pwd = Request.Form["Pwd"];
            YC_User u = new YC_User();
            u.Name = name;
            u.Password = pwd;
            if (BLL.UserBLL.login(u) == 1)
            {
                Session["UName"] = name;//登录成功写入Session
                Response.Write("1");
            }
            else {
                Response.Write("0");
            }
        }
        public void Logout()
        {
            Session["UName"] = null;
            Response.Write("1");//注销成功
        }
        public void getGoods()
        {
            if (Request.QueryString["GID"] == null)
            {
                Response.Write("{status:\"failure\"}");
            }
            else {
                int gid = Convert.ToInt32(Request.QueryString["GID"]);
                 YC_Goods goodobj= BLL.Goods.selectObjectById(gid);
                string allsize= goodobj.AllSize;
                string cxprice=goodobj.Cxprice.ToString();
                string goodname= goodobj.Name;
                string img1=goodobj.DesImg1Url;
                Response.Write("{status:\"success\",allsize:\""+allsize+"\",cxprice:\""+cxprice+"\",goodname:\""+goodname+"\",imgurl:\""+img1+"\"}");
            }
        }
    }
}