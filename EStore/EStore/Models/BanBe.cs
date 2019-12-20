using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class BanBe
    {
        public int MaBb { get; set; }
        public int? MaKh { get; set; }
        public int? MaSp { get; set; }
        public string HoTen { get; set; }
        public string Email { get; set; }
        public DateTime? NgayGui { get; set; }
        public string GhiChu { get; set; }

        public virtual KhachHang MaKhNavigation { get; set; }
        public virtual SanPham MaSpNavigation { get; set; }
    }
}
