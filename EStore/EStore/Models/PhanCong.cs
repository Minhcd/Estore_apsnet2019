using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class PhanCong
    {
        public int MaPc { get; set; }
        public string MaNv { get; set; }
        public string MaPb { get; set; }
        public DateTime? NgayPc { get; set; }
        public bool? HieuLuc { get; set; }

        public virtual NhanVien MaNvNavigation { get; set; }
        public virtual PhongBan MaPbNavigation { get; set; }
    }
}
