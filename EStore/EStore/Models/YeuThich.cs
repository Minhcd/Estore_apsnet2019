using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class YeuThich
    {
        public int MaYt { get; set; }
        public int? MaSp { get; set; }
        public int? MaKh { get; set; }
        public DateTime? NgayChon { get; set; }
        public string MoTa { get; set; }

        public virtual KhachHang MaKhNavigation { get; set; }
        public virtual SanPham MaSpNavigation { get; set; }
    }
}
