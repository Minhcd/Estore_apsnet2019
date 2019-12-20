using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EStore.Models
{
    public partial class ThuongHieu
    {
        public ThuongHieu()
        {
            SanPham = new HashSet<SanPham>();
        }
        [Display(Name = "Mã thương hiệu")]
        public int MaHieu { get; set; }
        [Display(Name = "Tên thương hiệu")]
        public string TenHieu { get; set; }
        public string TenHieuSeoUrl => TenHieu.ToUrlFriendly();
        [Display(Name = "Hình")]
        public string Hinh { get; set; }

        public virtual ICollection<SanPham> SanPham { get; set; }
    }
}
