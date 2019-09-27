using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using urunKatalog.MvcWebUI.Entity;

namespace urunKatalog.MvcWebUI.Identity
{
    public class IdentityInitializer: CreateDatabaseIfNotExists<IdentityDataContext>
    {
        protected override void Seed(IdentityDataContext context)
        {
            //roller

            if (!context.Roles.Any(i=> i.Name=="admin"))
            {
                var store = new RoleStore<ApplicationRole>(context);
                var manager = new RoleManager<ApplicationRole>(store);

                var role=new ApplicationRole(){Name = "admin",Description = "admin rolü"};

                manager.Create(role);
            }
            

            if (!context.Roles.Any(i => i.Name == "user"))
            {
                var store = new RoleStore<ApplicationRole>(context);
                var manager = new RoleManager<ApplicationRole>(store);

                var role = new ApplicationRole() { Name = "user", Description = "user rolü" }; ;

                manager.Create(role);
            }


            //user
            if (!context.Users.Any(i => i.Name == "goktugercaliskan"))
            {
                var store = new UserStore<AplicationUser>(context);
                var manager = new UserManager<AplicationUser>(store);

                var user = new AplicationUser(){Name = "goktug",Surname = "ercaliskan",UserName = "goktugercaliskan",Email = "goktuger@hotmail.com"};
                
                manager.Create(user,"123456");
                manager.AddToRole(user.Id, "admin");
                manager.AddToRole(user.Id, "user");
            }
            if (!context.Users.Any(i => i.Name == "tulayercaliskan"))
            {
                var store = new UserStore<IdentityUser>(context);
                var manager = new UserManager<IdentityUser>(store);

                var user = new AplicationUser() { Name = "tulay", Surname = "ercaliskan", UserName = "tulayercaliskan", Email = "tulayer@hotmail.com" };

                manager.Create(user, "123456");
                manager.AddToRole(user.Id, "user");
            }
            
            base.Seed(context);
        }
    }
}