using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace EStore.Controllers
{
    public class YeuThichController : Controller
    {
        private readonly EStoreContext _context;

        public YeuThichController(EStoreContext context)
        {
            _context = context;
        }

        // GET: YeuThich
        public async Task<IActionResult> Index()
        {
            var myPhamContext = _context.YeuThich.Include(y => y.MaKhNavigation).Include(y => y.MaSpNavigation);
            return View(await myPhamContext.ToListAsync());
        }


        [Route("[controller]/[action]")]
        public IActionResult themYT(int masp, int makh)
        {
            ViewBag.chon = "1";
            YeuThich yt = new YeuThich
            {
                MaKh = makh,
                MaSp = masp,
                NgayChon = DateTime.Now,

            };

            _context.YeuThich.Add(yt);
            _context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }

        [Route("[controller]/[action]")]
        public IActionResult boYT(int masp)
        {
            YeuThich yt = _context.YeuThich.SingleOrDefault(p => p.MaSp == masp);

            _context.YeuThich.Remove(yt);
            _context.SaveChanges();
            return RedirectToAction("Index", "Home");
        }
    }
}