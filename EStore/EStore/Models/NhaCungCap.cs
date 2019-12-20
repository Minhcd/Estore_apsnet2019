using System;
using System.Collections.Generic;

namespace EStore.Models
{
    public partial class NhaCungCap
    {
        public NhaCungCap()
        {
            SanPham = new HashSet<SanPham>();
        }

        public string MaNcc { get; set; }
        public string TenCongTy { get; set; }
        public string Logo { get; set; }
        public string Email { get; set; }
        public string DienThoai { get; set; }
        public string DiaChi { get; set; }
        public string MoTa { get; set; }

        public virtual ICollection<SanPham> SanPham { get; set; }
    }
}
