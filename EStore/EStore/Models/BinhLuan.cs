using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class BinhLuan
    {
        public int MaBl { get; set; }
        public int? MaSp { get; set; }
        public int? MaKh { get; set; }
        public DateTime? NgayBl { get; set; }
        public string HoTen { get; set; }
        public string Email { get; set; }
        public string NoiDung { get; set; }

        public virtual KhachHang MaKhNavigation { get; set; }
        public virtual SanPham MaSpNavigation { get; set; }
    }
}
