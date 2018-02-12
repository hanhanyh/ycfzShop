using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class YC_User
    {
        private int _uid;
        private string _name;
        private string _nickname;
        private string _password;
        private string _address;
        private int _sex;
        private int _admin;
        private string _phone;
        private string _qq;
        private int _Enable;
        private string _Headimg;
        private double _Money;
        private string _RegDateTime;
        public YC_User() { }
        public int Uid { get => _uid; set => _uid = value; }
        public string Name { get => _name; set => _name = value; }
        public string Nickname { get => _nickname; set => _nickname = value; }
        public string Password { get => _password; set => _password = value; }
        public string Address { get => _address; set => _address = value; }
        public int Sex { get => _sex; set => _sex = value; }
        public int Admin { get => _admin; set => _admin = value; }
        public string Phone { get => _phone; set => _phone = value; }
        public string Qq { get => _qq; set => _qq = value; }
        public int Enable { get => _Enable; set => _Enable = value; }
        public string Headimg { get => _Headimg; set => _Headimg = value; }
        public double Money { get => _Money; set => _Money = value; }
        public string RegDateTime { get => _RegDateTime; set => _RegDateTime = value; }
    }
}
