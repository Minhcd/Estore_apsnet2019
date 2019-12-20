using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using EStore.Models;

namespace EStore.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class SanPhamsController : Controller
    {
        private readonly EStoreContext _context;

        public SanPhamsController(EStoreContext context)
        {
            _context = context;
        }

        // GET: Admin/SanPhams
        public async Task<IActionResult> Index()
        {
            var eStoreContext = _context.SanPham.Include(s => s.MaHieuNavigation).Include(s => s.MaLoaiNavigation).Include(s => s.MaNccNavigation);
            return View(await eStoreContext.ToListAsync());
        }

        // GET: Admin/SanPhams/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPham
                .Include(s => s.MaHieuNavigation)
                .Include(s => s.MaLoaiNavigation)
                .Include(s => s.MaNccNavigation)
                .FirstOrDefaultAsync(m => m.MaSp == id);
            if (sanPham == null)
            {
                return NotFound();
            }

            return View(sanPham);
        }

        // GET: Admin/SanPhams/Create
        public IActionResult Create()
        {
            ViewData["MaHieu"] = new SelectList(_context.ThuongHieu, "MaHieu", "MaHieu");
            ViewData["MaLoai"] = new SelectList(_context.Loai, "MaLoai", "MaLoai");
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCap, "MaNcc", "MaNcc");
            return View();
        }

        // POST: Admin/SanPhams/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("MaSp,MaHieu,TenSp,TenAlias,MaLoai,MoTa,DonGia,Hinh,Hinh2,Hinh3,GiaCu,MaNcc,SpHot")] SanPham sanPham)
        {
            if (ModelState.IsValid)
            {
                _context.Add(sanPham);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["MaHieu"] = new SelectList(_context.ThuongHieu, "MaHieu", "MaHieu", sanPham.MaHieu);
            ViewData["MaLoai"] = new SelectList(_context.Loai, "MaLoai", "MaLoai", sanPham.MaLoai);
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCap, "MaNcc", "MaNcc", sanPham.MaNcc);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPham.FindAsync(id);
            if (sanPham == null)
            {
                return NotFound();
            }
            ViewData["MaHieu"] = new SelectList(_context.ThuongHieu, "MaHieu", "MaHieu", sanPham.MaHieu);
            ViewData["MaLoai"] = new SelectList(_context.Loai, "MaLoai", "MaLoai", sanPham.MaLoai);
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCap, "MaNcc", "MaNcc", sanPham.MaNcc);
            return View(sanPham);
        }

        // POST: Admin/SanPhams/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("MaSp,MaHieu,TenSp,TenAlias,MaLoai,MoTa,DonGia,Hinh,Hinh2,Hinh3,GiaCu,MaNcc,SpHot")] SanPham sanPham)
        {
            if (id != sanPham.MaSp)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(sanPham);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!SanPhamExists(sanPham.MaSp))
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
            ViewData["MaHieu"] = new SelectList(_context.ThuongHieu, "MaHieu", "MaHieu", sanPham.MaHieu);
            ViewData["MaLoai"] = new SelectList(_context.Loai, "MaLoai", "MaLoai", sanPham.MaLoai);
            ViewData["MaNcc"] = new SelectList(_context.NhaCungCap, "MaNcc", "MaNcc", sanPham.MaNcc);
            return View(sanPham);
        }

        // GET: Admin/SanPhams/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var sanPham = await _context.SanPham
                .Include(s => s.MaHieuNavigation)
                .Include(s => s.MaLoaiNavigation)
                .Include(s => s.MaNccNavigation)
                .FirstOrDefaultAsync(m => m.MaSp == id);
            if (sanPham == null)
            {
                return NotFound();
            }

            return View(sanPham);
        }

        // POST: Admin/SanPhams/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            var sanPham = await _context.SanPham.FindAsync(id);
            _context.SanPham.Remove(sanPham);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool SanPhamExists(int id)
        {
            return _context.SanPham.Any(e => e.MaSp == id);
        }
    }
}
