using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using EStore.Models;
using Microsoft.AspNetCore.Mvc;

namespace EStore.Controllers
{
    public class RestoreAccountController : Controller
    {
        private readonly EStoreContext db;
        PasswordHasher pH = new PasswordHasher();
        public RestoreAccountController(EStoreContext context)
        {
            db = context;
        }
        public IActionResult Index()
        {
            return View();
        }
        public string CreatePassword(int length)
        {
            const string valid = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuilder res = new StringBuilder();
            Random rnd = new Random();
            while (0 < length--)
            {
                res.Append(valid[rnd.Next(valid.Length)]);
            }
            return res.ToString();
        }
        [Route("[controller]/[action]")]
        public IActionResult Forget(RestoreAccount model)
        {
            if (ModelState.IsValid)
            {
                KhachHang kh = db.KhachHang.SingleOrDefault(p => p.Email == model.UserEmail);
                if (kh == null)
                {
                    ModelState.AddModelError("Lỗi", "Người dùng không tồn tại");
                    return View("Index");
                }
                else
                {
                    string mk = CreatePassword(12);
                    kh.MatKhau = pH.HashPassword(mk);
                    db.Update(kh);
                    db.SaveChangesAsync();
                    MailMessage mm = new MailMessage("eshoppingmanager@gmail.com", model.UserEmail);
                    mm.Subject = "Mật khẩu tài khoản Eshop";
                    mm.Body = string.Format("Xin chào: <h1>{0}</h1> <br/> Mật khẩu mới của bạn là <h1>{1}</h1>", kh.HoTen, mk);
                    mm.IsBodyHtml = true;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.Port = 587;
                    smtp.EnableSsl = true;
                    smtp.Credentials = new System.Net.NetworkCredential("eshoppingmanager@gmail.com", "EShop@21298");
                    smtp.Send(mm);
                    TempData["Success"] = "Xin hãy kiểm tra Email của bạn!";
                    return View("Index");
                }
            }
            return View("Index");
        }
    }
}