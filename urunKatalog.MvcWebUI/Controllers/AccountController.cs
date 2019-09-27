using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;
using Microsoft.Owin.Security;
using urunKatalog.MvcWebUI.Identity;
using urunKatalog.MvcWebUI.Models;

namespace urunKatalog.MvcWebUI.Controllers
{
    public class AccountController : Controller
    {
        private UserManager<AplicationUser> userManager;
        private RoleManager<ApplicationRole> roleManager;

        
        public AccountController()
        {
            var userStore =
                new UserStore<AplicationUser>(new IdentityDataContext());
            userManager = new UserManager<AplicationUser>(userStore);
            var roleStore = new RoleStore<ApplicationRole>(new IdentityDataContext());
            roleManager = new RoleManager<ApplicationRole>(roleStore);
        }

        // GET: Account
        public ActionResult Register()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(Register model)
        {
            if (ModelState.IsValid)
            {
                //Kayıt işlemleri
                var user = new AplicationUser();
                user.Name = model.Name;
                user.Surname = model.Surname;
                user.Email = model.Email;
                user.UserName = model.UserName;
                IdentityResult result =
                      userManager.Create(user, model.Password);
                if (result.Succeeded)
                {
                    //kullanıcıyı role ata
                    if (roleManager.RoleExists("user"))
                    {
                        userManager.AddToRole(user.Id, "user");
                    }

                    return RedirectToAction("Login", "Account");
                }
                else
                {
                    ModelState.AddModelError("RegisterUserError","Kullanıcı oluşturma hatası.");
                }
            }
            return View(model);
        }

        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(Login model,string ReturnUrl)
        {
            if (ModelState.IsValid)
            {
                //Login işlemleri

                var user = userManager.Find(model.UserName, model.Password);

                if (user!=null)
                {
                    //var olan kullanıcıyı sisteme dahil et
                    //cookie olustur sisteme bırak

                    var authManager = HttpContext.GetOwinContext().Authentication;

                    var identityclaims = userManager.CreateIdentity(user, "ApplicationCookie");

                    var authProperties = new AuthenticationProperties();
                    authProperties.IsPersistent = model.RememberMe;

                    authManager.SignIn(authProperties,identityclaims);
                    if (!String.IsNullOrEmpty(ReturnUrl))
                    {
                        Redirect(ReturnUrl);
                    }

                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("LoginUserError","Böyle bir kullanıcı bulunamadı.");
                }

            }
            return View(model);
        }

        public ActionResult Logout()
        {
            var authManager = HttpContext.GetOwinContext().Authentication;
            authManager.SignOut();

            return RedirectToAction("Index","Home");
        }
    }
}