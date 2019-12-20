using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ReflectionIT.Mvc.Paging;

namespace EStore.Controllers
{
    public class SanPhamController : Controller
    {
        private readonly EStoreContext db;
        public SanPhamController(EStoreContext context)
        {
            db = context;
        }


        [Route("san-pham/{loai}")]
        public async Task<IActionResult> Index(string loai, string mucgia, string sapxep, string thuonghieu, int page = 1)
        {

            var qry = db.SanPham.AsNoTracking().OrderBy(p => p.MaSp);
            var model = await PagingList.CreateAsync(qry, 12, page);
            if (loai != null)
            {
                ViewBag.Loai = db.Loai.SingleOrDefault(p => p.TenLoaiSeoUrl == loai);
                Loai qery1 = db.Loai.SingleOrDefault(p => p.TenLoaiSeoUrl == loai);
                var qery = db.SanPham.Where(p => p.MaLoai == qery1.MaLoai).AsNoTracking().OrderBy(p => p.MaSp);
                
                switch (mucgia)
                {
                    case "10000000":
                        qery = qery.Where(p => p.DonGia < 10000000).OrderBy(p => p.MaSp);
                        break;
                    case "30000000":
                        qery = qery.Where(p => p.DonGia >= 10000000 && p.DonGia < 30000000).OrderBy(p => p.MaSp);
                        break;
                    case "50000000":
                        qery = qery.Where(p => p.DonGia >= 30000000 && p.DonGia < 50000000).OrderBy(p => p.MaSp);
                        break;
                    case "50000001":
                        qery = qery.Where(p => p.DonGia >= 50000000).OrderBy(p => p.MaSp);
                        break;
                    case "tatca":
                        qery = qery.Where(p => p.MaLoai == qery1.MaLoai).AsNoTracking().OrderBy(p => p.MaSp);
                        break;
                    default:
                        break;
                }

                switch (sapxep)
                {
                    case "tang":
                        qery = qery.OrderBy(p => p.DonGia);
                        break;
                    case "giam":
                        qery = qery.OrderByDescending(p => p.DonGia); ;
                        break;
                    case "tatca":
                        qery = qery.Where(p => p.MaLoai == qery1.MaLoai).AsNoTracking().OrderBy(p => p.MaSp);
                        break;
                    default:
                        break;
                }

                var md = await PagingList.CreateAsync(qery, 99, page);


                return View(md);
            }

            return View(model);
        }


        [Route("thuong-hieu/{hieuurl}")]
        public async Task<IActionResult> Hieu(string hieuurl, int page = 1)
        {

            var qry = db.SanPham.AsNoTracking().OrderBy(p => p.MaSp);
            var model = await PagingList.CreateAsync(qry, 9, page);
            if (hieuurl != null)
            {
                ViewBag.Hieu = db.ThuongHieu.SingleOrDefault(p => p.TenHieuSeoUrl == hieuurl);
                ThuongHieu qery1 = db.ThuongHieu.SingleOrDefault(p => p.TenHieuSeoUrl == hieuurl);
                var qery = db.SanPham.Where(p => p.MaHieu == qery1.MaHieu).AsNoTracking().OrderBy(p => p.MaSp);

                var md = await PagingList.CreateAsync(qery, 9, page);
                return View(md);
            }

            return View();
        }

        [Route("{loai}/{url}")]
        public IActionResult ChiTiet(string loai, string url)
        {
            if (loai != null)
            {
                ViewBag.Loai = db.Loai.SingleOrDefault(p => p.TenLoaiSeoUrl == loai);
            }
            SanPham hh = db.SanPham.SingleOrDefault(p => p.TenSpSeoUrl == url);
            if (hh == null)
            {
                return RedirectToAction("Index");
            }
            return View(hh);
        }

        [Route("[controller]/[action]")]
        public IActionResult BinhLuan(int makh, int masp, string hoten, string email, string noidung, string loais, string urls)
        {
            BinhLuan bl = new BinhLuan
            {
                MaSp = masp,
                MaKh = makh,
                NgayBl = DateTime.Now,
                HoTen = hoten,
                Email = email,
                NoiDung = noidung,

            };

            db.BinhLuan.Add(bl);
            db.SaveChanges();
            return RedirectToAction("ChiTiet", "SanPham", new { url = urls, loai = loais });
        }
        public IActionResult timKiem()
        {
            return View();
        }
        [Route("[controller]/[action]")]
        public IActionResult timSp()
        {
            string key = Request.Form["keysearch"].ToString();
            var sanPham = (from sp in db.SanPham
                           where sp.TenSp.Contains(key) && key != ""
                           select new SanPham
                           {
                               MaSp = sp.MaSp,
                               TenSp = sp.TenSp,
                               TenAlias = sp.TenAlias,
                               MaLoai = sp.MaLoai,
                               MoTa = sp.MoTa,
                               DonGia = sp.DonGia,
                               Hinh = sp.Hinh,
                               GiaCu = sp.GiaCu,
                               MaNcc = sp.MaNcc,
                               MaHieu = sp.MaHieu
                           }).ToList();
            return View(sanPham);
        }
    }
}