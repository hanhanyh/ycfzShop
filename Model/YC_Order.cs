using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public  class YC_Order
    {
        private int _OID;
        private int _GID;
        private int _UID;
        private double _Price;
        private int _Count;
        private int _isSended;
        private string _sendtype;
        private string _address;
        private string _buytime;
        private string _sendtime;
        private string _finishedtime;

        private string _GoodSize ;
        private string _WayNumber;
        public int OID { get => _OID; set => _OID = value; }
        public int GID { get => _GID; set => _GID = value; }
        public int UID { get => _UID; set => _UID = value; }
       
        public int Count { get => _Count; set => _Count = value; }
        public int IsSended { get => _isSended; set => _isSended = value; }
        public string Sendtype { get => _sendtype; set => _sendtype = value; }
        public string Address { get => _address; set => _address = value; }
        public string Buytime { get => _buytime; set => _buytime = value; }
        public string Sendtime { get => _sendtime; set => _sendtime = value; }
        public string Finishedtime { get => _finishedtime; set => _finishedtime = value; }
        public double Price { get => _Price; set => _Price = value; }
        public string GoodSize { get => _GoodSize; set => _GoodSize = value; }
        public string WayNumber { get => _WayNumber; set => _WayNumber = value; }
    }
}
