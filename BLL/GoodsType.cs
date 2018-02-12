using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
namespace BLL
{
    public class GoodsType
    {
        public static DataTable selectAllType()
        {
            return DAL.GoodTypeServer.selectAll().Tables[0];
        }
    }
}
