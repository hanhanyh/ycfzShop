using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public  class YC_Address
    {
        private int _AID;
        private int _UID;
        private string _Address;
        private string _Phone;
        private string _MailNumber;
        private string _Name;
        public int AID { get => _AID; set => _AID = value; }
        public int UID { get => _UID; set => _UID = value; }
        public string Address { get => _Address; set => _Address = value; }
        public string Phone { get => _Phone; set => _Phone = value; }
        public string MailNumber { get => _MailNumber; set => _MailNumber = value; }
        public string Name { get => _Name; set => _Name = value; }
    }
}
