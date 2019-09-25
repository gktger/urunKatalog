using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using urunKatalog.MvcWebUI.Entity;
using urunKatalog.MvcWebUI.Models;


namespace urunKatalog.MvcWebUI.Controllers
{
    public class HomeController : Controller
    {
        DataContext _context = new DataContext();

        // GET: Home
        public ActionResult Index()
        {
            var result =
                _context.Products
                .Where(i => i.IsHome && i.IsApproved)
                .Select(i => new ProductModel()
                {
                    Id = i.Id,
                    Name = i.Name.Length>50
                    ?i.Name.Substring(0,30)+"..."
                    :i.Name,
                    Description = i.Description.Length > 50
                    ? i.Description.Substring(0, 47) + "..."
                    : i.Description,
                    Price = i.Price,
                    Stock = i.Stock,
                    Image = i.Image,
                    CategoryId = i.CategoryId
                }).ToList();
            return View(result);
        }
        public ActionResult Details(int id)
        {
            return View(_context.Products.FirstOrDefault(i => i.Id == id));
        }
        public ActionResult List(int? id)
        {
            var result =
                _context.Products
                    .Where(i => i.IsApproved)
                    .Select(i => new ProductModel()
                    {
                        Id = i.Id,
                        Name = i.Name.Length > 50
                            ? i.Name.Substring(0, 30) + "..."
                            : i.Name,
                        Description = i.Description.Length > 50
                            ? i.Description.Substring(0, 47) + "..."
                            : i.Description,
                        Price = i.Price,
                        Stock = i.Stock,
                        Image = i.Image ?? "1.jpg",
                        CategoryId = i.CategoryId
                    }).AsQueryable();
            if (id !=null)
            {
                result = result.Where(i => i.CategoryId == id);
            }
            return View(result.ToList());
        }

        public PartialViewResult GetCategories()
        {
            return PartialView(_context.Categories.ToList());
        }
    }
}