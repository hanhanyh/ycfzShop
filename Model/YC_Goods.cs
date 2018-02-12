using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model
{
    public class YC_Goods
    {
        private int _gid;
        private int _gtid;
        private string _name;
        private double _SCPrice;
        private double _cxprice;
        private string _DesImg1Url;
        private string _DesImg2Url;
        private string _DesImg3Url;
        private string _DetailImages;
        private string _AllSize;
        public int Gid { get => _gid; set => _gid = value; }
        public int Gtid { get => _gtid; set => _gtid = value; }
        public string Name { get => _name; set => _name = value; }
        public double SCPrice { get => _SCPrice; set => _SCPrice = value; }
        public double Cxprice { get => _cxprice; set => _cxprice = value; }
        public string DesImg1Url { get => _DesImg1Url; set => _DesImg1Url = value; }
        public string DesImg2Url { get => _DesImg2Url; set => _DesImg2Url = value; }
        public string DesImg3Url { get => _DesImg3Url; set => _DesImg3Url = value; }
        public string DetailImages { get => _DetailImages; set => _DetailImages = value; }
        public string AllSize { get => _AllSize; set => _AllSize = value; }
    }
}
