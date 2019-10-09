using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using urunKatalog.MvcWebUI.Entity;

namespace urunKatalog.MvcWebUI.Models
{
    public class UserOrderModel
    {
        public int Id { get; set; }
        public string OrderNumber { get; set; }
        public double Total { get; set; }
        public EnumOrderState OrderState { get; set; }
        public DateTime OrderDate { get; set; }

    }
}