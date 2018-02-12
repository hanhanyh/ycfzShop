using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
     public class YC_GoodType
    {
        private int _GTID;
        private string _Name;
        private string _Description;

        public int GTID { get => _GTID; set => _GTID = value; }
        public string Name { get => _Name; set => _Name = value; }
        public string Description { get => _Description; set => _Description = value; }
    }
}
