using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
   public    class YC_MoneyRecord
    {
        private int _MRID;
        private int _UID;
        private double _RMoney;
        private int _RType;
        private string _Description;

        public int MRID { get => _MRID; set => _MRID = value; }
        public int UID { get => _UID; set => _UID = value; }
        public double RMoney { get => _RMoney; set => _RMoney = value; }
        public int RType { get => _RType; set => _RType = value; }
        public string Description { get => _Description; set => _Description = value; }
    }
}
