using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class KhuyenMai
    {
        public int MaKm { get; set; }
        public string CodeKm { get; set; }
        public string LoaiKm { get; set; }
        public int? MaKh { get; set; }

        public virtual KhachHang MaKhNavigation { get; set; }
    }
}
