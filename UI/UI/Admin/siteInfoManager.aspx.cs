using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;
using System.Data;
using System.IO;
namespace UI.Admin
{
    public partial class siteInfoManager : System.Web.UI.Page
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
                YC_Website web= BLL.AdminWebSiteManager.selectLastOne();
                txtSiteName.Text = web.Wname;
                fckCompanyDes.Value = web.Companydescription;
                fckContactUs.Value = web.Contactus;
                fckAboutUs.Value = web.Ourteam;
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
            string type = path.Substring(path.LastIndexOf("."));
            return path.Substring(a + 1, b) + random + type;//给文件加上随机字符
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string siteName = txtSiteName.Text.Trim();
            string logourl = fileuplogo.FileName;
            string Banner1 = this.filebanner1.FileName;
            string Banner2= this.filebanner2.FileName;
            string Banner3 = this.filebanner3.FileName;
            string comDes=this.fckCompanyDes.Value.ToString();
            string OurTeam = this.fckAboutUs.Value;
            string ContactUs = this.fckContactUs.Value;
            //string WeCharimg = this.filewechat.FileName;
            //string todaymovie = this.filemovie.FileName;
          
            //如果上传了文件就保存
            if(filebanner1.HasFile == true)
            {
                
                ///加上随机字符串
                Banner1 = getFileName(Banner1);
                Banner2 = getFileName(Banner2);
                Banner3 = getFileName(Banner3);
                logourl = getFileName(logourl);
                //WeCharimg = getFileName(WeCharimg);
                //todaymovie = getFileName(todaymovie);
                //保存
                fileuplogo.SaveAs(Server.MapPath("~\\img\\" + logourl));
                filebanner1.SaveAs(Server.MapPath("~\\img\\" + Banner1));
                filebanner2.SaveAs(Server.MapPath("~\\img\\" + Banner2));
                filebanner3.SaveAs(Server.MapPath("~\\img\\" + Banner3));
                //filewechat.SaveAs(Server.MapPath("~\\img\\" + WeCharimg));
                //filemovie.SaveAs(Server.MapPath("~\\img\\" + todaymovie));
                //删除
                YC_Website webpre = BLL.AdminWebSiteManager.selectLastOne();
                //删除Banner图片
                string[] urllunbo = webpre.Lunboimgurl.Split('|');
                for (int i = 0; i < urllunbo.Length; i++)
                {
                    string truepath = Server.MapPath("~\\img\\" + urllunbo[i]);
                    if (File.Exists(truepath))
                    {
                        File.Delete(truepath);
                    }
                }
                
            }
            //  Response.Write(comDes);
            YC_Website web = new YC_Website();
            web.Wname = siteName;
            web.Lunboimgurl = Banner1 + "|" + Banner2 + "|" + Banner3;
            web.Companydescription = comDes;
            web.Logourl = logourl;
            web.Ourteam = OurTeam;
            web.Contactus = ContactUs;
            //web.ContactUsWeChatImage = WeCharimg;
            //web.TodayMovieUrl = todaymovie;
            //存入数据库
            if (filebanner1.HasFile == true)
            {

                if (BLL.AdminWebSiteManager.update(web) == 1)
                {
                    //  Response.Write("更新成功！");
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "ssssss", "<script>alert(\"更新成功\")</script>");
                }
            }
            else {
                if (BLL.AdminWebSiteManager.updatenopic(web) == 1)
                {
                    ClientScript.RegisterClientScriptBlock(this.GetType(), "ssssss", "<script>alert(\"更新成功\")</script>");
                }
            }
        }
    }
}