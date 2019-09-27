using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity.EntityFramework;
using urunKatalog.MvcWebUI.Identity;

namespace urunKatalog.MvcWebUI.Entity
{
    public class DataContext:DbContext
    {
        public DataContext():base("dataConnection")
        {
        }



        public DbSet<Product> Products { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}