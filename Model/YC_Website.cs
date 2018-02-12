using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public  class YC_Website
    {
        private int _wid;
        private string _wname;
        private string _logourl;
        private string _lunboimgurl;
        private string _companydescription;
        private string _ourteam;
        private string _contactus;
        private string _ContactUsWeChatImage;
        private string _TodayMovieUrl;

        public int Wid { get => _wid; set => _wid = value; }
        public string Wname { get => _wname; set => _wname = value; }
        public string Logourl { get => _logourl; set => _logourl = value; }
        public string Lunboimgurl { get => _lunboimgurl; set => _lunboimgurl = value; }
        public string Companydescription { get => _companydescription; set => _companydescription = value; }
        public string Ourteam { get => _ourteam; set => _ourteam = value; }
        public string Contactus { get => _contactus; set => _contactus = value; }
        public string ContactUsWeChatImage { get => _ContactUsWeChatImage; set => _ContactUsWeChatImage = value; }
        public string TodayMovieUrl { get => _TodayMovieUrl; set => _TodayMovieUrl = value; }
    }
}
