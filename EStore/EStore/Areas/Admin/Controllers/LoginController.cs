using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EStore.Areas.Admin.Models;
using EStore.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace EStore.Areas.Admin.Controllers
{
    [Area("Admin")]
    public class LoginController : Controller
    {
        private readonly EStoreContext _context;
        PasswordHasher passwordHasher = new PasswordHasher();
        public LoginController(EStoreContext context)
        {
            _context = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        
        [ValidateAntiForgeryToken]
        public IActionResult Login(NVLoginViewModel user)
        {
            var result = _context.NhanVien.Where(p => p.Email == user.Username).SingleOrDefault();
            if (result != null)
            {
                if (passwordHasher.VerifyHashedPassword(result.MatKhau, user.Password) == PasswordVerificationResult.Success)
                {
                    HttpContext.Session.Set("email", result);
                    return RedirectToAction("Index", "Homes");
                }
                else
                {
                    ViewData["Error"] = "Mật Khẩu Không Chính Xác";
                    return View("Index");
                }
            }
            else
            {
                ViewData["Error"] = "Tài Khoản Không Tồn Tại";
                return View("Index");
            }
        }

        public IActionResult Logout()
        {
            //xóa session
            HttpContext.Session.Remove("email");
            return RedirectToAction("Index", "Login");
        }
    }
}