using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class KhoHang
    {
        public int MaKho { get; set; }
        public int? MaSp { get; set; }
        public int? SoLuong { get; set; }

        public virtual SanPham MaSpNavigation { get; set; }
    }
}
