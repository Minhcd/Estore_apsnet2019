using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Mvc;

namespace EStore.Controllers
{
    public class GioHangController : Controller
    {
        private readonly EStoreContext db;
        public GioHangController(EStoreContext context)
        {
            db = context;
        }

        [Route("gio-hang")]
        public IActionResult Index()
        {
            return View(Carts);
        }

        public List<CartItem> Carts
        {
            get
            {
                List<CartItem> myCart = HttpContext.Session.Get<List<CartItem>>("GioHang");
                if (myCart == default(List<CartItem>))
                {
                    myCart = new List<CartItem>();
                }

                return myCart;
            }
        }

        [Route("[controller]/[action]")]
        public IActionResult AddToCart(int mahh, int sl)
        {
            List<CartItem> gioHang = Carts;
            //tìm xem có chưa
            CartItem item = gioHang.SingleOrDefault(p => p.MaHh == mahh);
            if (item != null) //có rồi
            {
                item.SoLuong++;
            }
            else
            {
                SanPham hh = db.SanPham.SingleOrDefault(p => p.MaSp == mahh);
                item = new CartItem
                {
                    MaHh = hh.MaSp,
                    TenHh = hh.TenSp,
                    Hinh = hh.Hinh,
                    SoLuong = sl,
                    GiaBan = hh.DonGia.Value,
                };
                gioHang.Add(item);
            }
            //lưu session
            HttpContext.Session.Set("GioHang", gioHang);
            return RedirectToAction("Index");
        }
        [Route("[controller]/[action]")]
        public IActionResult Update(int masua, int sl)
        {
            List<CartItem> giohang = Carts;
            CartItem hh = giohang.SingleOrDefault(p => p.MaHh == masua);
            hh.SoLuong = sl;
            HttpContext.Session.Set("GioHang", giohang);
            return RedirectToAction("Index");
        }
        [Route("[controller]/[action]")]
        public IActionResult Remove(int maxoa)
        {
            List<CartItem> giohang = Carts;
            CartItem hh = giohang.SingleOrDefault(p => p.MaHh == maxoa);
            giohang.Remove(hh);
            HttpContext.Session.Set("GioHang", giohang);
            return RedirectToAction("Index");
        }

        [Route("[controller]/[action]")]
        public IActionResult Delete()
        {
            List<CartItem> giohang = Carts;
            HttpContext.Session.Remove("GioHang");
            return RedirectToAction("Index");
        }
    }
}