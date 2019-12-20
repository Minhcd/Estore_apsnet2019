using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Mvc;
using System.Text.RegularExpressions;

namespace EStore.Controllers
{
    public class DangNhapController : Controller
    {
        private readonly EStoreContext db;
        //private string key = "Cyg-X1"; //key to encrypt and decrypt
        PasswordHasher passwordHasher = new PasswordHasher();
        //Encrytion ecr = new Encrytion(); // Encrypt HoTen, DiaChi, DienThoai, Email 
        public DangNhapController(EStoreContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        [Route("[controller]/[action]")]
        public IActionResult DangNhap(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                KhachHang kh = db.KhachHang.SingleOrDefault(p => p.Email == model.email &&
                passwordHasher.VerifyHashedPassword(p.MatKhau, model.MatKhau) == PasswordVerificationResult.Success);
                if (kh == null)
                {
                    ModelState.AddModelError("Loi", "Thông tin tài khoản hoặc mật khẩu không hợp lệ.");
                    return View("Index");
                }
                HttpContext.Session.Set("TaiKhoan", kh);
                return RedirectToAction("Index", "Home");
            }
            return View("Index");
        }

        [Route("[controller]/[action]")]
        public IActionResult DangKy()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        [Route("[controller]/[action]")]
        public async Task<IActionResult> DangKy([Bind("MatKhau,Email")] KhachHang khachHang)
        {
            try
            {
                if (ModelState.IsValid)
                {
                    KhachHang kh = db.KhachHang.SingleOrDefault(p => p.Email == khachHang.Email);
                    if (passwordHasher.HashPassword(khachHang.MatKhau) == "IVP")
                    {
                        throw new UserDefException("Mật khẩu đã đặt không hợp lệ!");
                    }
                    /*if (!Regex.IsMatch(khachHang.DienThoai, @"0(3\d{8}|5\d{8}|7\d{8}|8\d{8}|9\d{8})", RegexOptions.IgnoreCase))
                    {
                        throw new UserDefException("Số điện thoại không hợp lệ!");
                    }*/
                    if (!Regex.IsMatch(khachHang.Email, @"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z", RegexOptions.IgnoreCase))
                    {
                        throw new UserDefException("Email không hợp lệ!");
                    }
                    if (kh != null)
                    {
                        throw new UserDefException("Email này đã được đăng ký!");
                    }
                    else
                    {
                        khachHang.MatKhau = passwordHasher.HashPassword(khachHang.MatKhau);
                        /*khachHang.HoTen = ecr.EncryptString(khachHang.HoTen, key);
                        khachHang.DiaChi = ecr.EncryptString(khachHang.DiaChi, key);
                        khachHang.DienThoai = ecr.EncryptString(khachHang.DienThoai, key);
                        khachHang.Email = ecr.EncryptString(khachHang.Email, key);*/
                        db.Add(khachHang);
                        await db.SaveChangesAsync();
                        return RedirectToAction("Index", "Home");
                    }
                }
            }
            catch (UserDefException e)
            {
                ViewBag.Result = e.Message;
            }
            catch (Exception e)
            {
                ViewBag.Result = e.Message;
            }
            return View(khachHang);
        }
        [Route("[controller]/[action]")]
        public IActionResult DangXuat()
        {
            //xóa session
            HttpContext.Session.Remove("TaiKhoan");
            return RedirectToAction("Index", "Home");
        }
    }
}