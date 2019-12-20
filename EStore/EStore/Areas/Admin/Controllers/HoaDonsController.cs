using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EStore.Models;
using System.Net.Mail;

namespace EStore.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class HoaDonsController : Controller
    {
        private readonly EStoreContext _context;

        public HoaDonsController(EStoreContext context)
        {
            _context = context;
        }

        // GET: Admin/HoaDons
        public async Task<IActionResult> Index()
        {
            var eStoreContext = _context.HoaDon.Include(h => h.MaTrangThaiNavigation);
            return View(await eStoreContext.ToListAsync());
        }

        // GET: Admin/HoaDons/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hoaDon = await _context.HoaDon
                .Include(h => h.MaTrangThaiNavigation)
                .FirstOrDefaultAsync(m => m.MaHd == id);
            if (hoaDon == null)
            {
                return NotFound();
            }

            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Create
        public IActionResult Create()
        {
            ViewData["MaTrangThai"] = new SelectList(_context.TrangThai, "MaTrangThai", "MaTrangThai");
            return View();
        }

        // POST: Admin/HoaDons/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaHd,NgayDat,NgayGiao,HoTen,DiaChi,CachThanhToan,CachVanChuyen,PhiVanChuyen,MaTrangThai,GhiChu,DienThoai,TongTien")] HoaDon hoaDon)
        {
            if (ModelState.IsValid)
            {
                _context.Add(hoaDon);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaTrangThai"] = new SelectList(_context.TrangThai, "MaTrangThai", "MaTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hoaDon = await _context.HoaDon.FindAsync(id);
            if (hoaDon == null)
            {
                return NotFound();
            }
            ViewData["MaTrangThai"] = new SelectList(_context.TrangThai, "MaTrangThai", "MaTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // POST: Admin/HoaDons/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MaHd,NgayDat,NgayGiao,HoTen,DiaChi,CachThanhToan,CachVanChuyen,PhiVanChuyen,MaTrangThai,GhiChu,DienThoai,TongTien")] HoaDon hoaDon)
        {
            if (id != hoaDon.MaHd)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(hoaDon);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!HoaDonExists(hoaDon.MaHd))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaTrangThai"] = new SelectList(_context.TrangThai, "MaTrangThai", "MaTrangThai", hoaDon.MaTrangThai);
            return View(hoaDon);
        }

        // GET: Admin/HoaDons/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var hoaDon = await _context.HoaDon
                .Include(h => h.MaTrangThaiNavigation)
                .FirstOrDefaultAsync(m => m.MaHd == id);
            if (hoaDon == null)
            {
                return NotFound();
            }

            return View(hoaDon);
        }

        // POST: Admin/HoaDons/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var hoaDon = await _context.HoaDon.FindAsync(id);
            _context.HoaDon.Remove(hoaDon);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool HoaDonExists(int id)
        {
            return _context.HoaDon.Any(e => e.MaHd == id);
        }

        public IActionResult ChangeStatus(int id)
        {
            var hd = _context.HoaDon.Find(id);
            if (hd != null)
            {
                hd.MaTrangThai = 1;
                _context.SaveChanges();
                KhachHang kh = _context.KhachHang.SingleOrDefault(p => p.HoTen == hd.HoTen && p.DiaChi == hd.DiaChi && p.DienThoai == hd.DienThoai);
                if (kh != null) 
                {
                    MailMessage mm = new MailMessage("eshoppingmanager@gmail.com", kh.Email);
                    mm.Subject = "Thông báo đơn hàng";
                    string content = "<h1>{0}</h1> <br/> <div class='text text-success'><h2>Chào mừng bạn đến với EStore.</h2></div> <br> <h5>Bạn vừa tạo một đơn hàng ở EStore. Đơn hàng của bạn đã được gửi tới cửa hàng : <br/> Thông tin đơn hàng : <br/>";
                    content = content + "<table border='1px' style='font-size:15px;border-collapse: collapse;text-align:center'><tr><th>Tên sản phẩm</th><th>Số lượng</th><th>Đơn giá</th><th>Thành tiền</th></tr>";
                    double tongtien = 0;
                    List<ChiTietHd> cthd = _context.ChiTietHd.Where(p => p.MaHd == hd.MaHd).ToList();
                    foreach (var item in cthd)
                    {
                        SanPham sp = _context.SanPham.SingleOrDefault(p => p.MaSp == item.MaSp);
                        CartItem ct = new CartItem
                        {
                            MaHh = sp.MaSp,
                            TenHh = sp.TenSp,
                            Hinh = sp.Hinh,
                            GiaBan = Convert.ToDouble(item.DonGia),
                            SoLuong = Convert.ToInt32(item.SoLuong)
                        };

                        tongtien += ct.ThanhTien;
                        content = content + "<tr><td>" + sp.TenSp + "</td><td>" + item.SoLuong + "</td><td>" + ct.GiaBan.ToString("#,##0") + "</td><td>" + ct.ThanhTien.ToString("#,##0") + "</td></tr>";
                    }
                    _context.SaveChanges();
                    content = content + "<tr><td colspan='4'>Tổng thanh toán : </td><td>" + tongtien.ToString("#,##0") + "</td></tr></table><br />";
                    content = content + "<div>Đơn hàng của bạn sẽ được chuyển đến trong vài ngày tới . Cảm ơn bạn đã ủng hộ EStore. Thân</div>";
                    mm.Body = string.Format(content, kh.HoTen);
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("eshoppingmanager@gmail.com", "EShop@21298");
                    smtp.Send(mm);
                }
             
            }
            return RedirectToAction("Index");
        }
    }
}
