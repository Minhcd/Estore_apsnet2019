using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace EStore.Models
{
    public partial class NhanVien
    {
        public NhanVien()
        {
            ChuDe = new HashSet<ChuDe>();
            HoiDap = new HashSet<HoiDap>();
            PhanCong = new HashSet<PhanCong>();
        }
        [Display(Name = "Mã nhân viên")]
        public string MaNv { get; set; }
        [Display(Name = "Họ tên")]
        public string HoTen { get; set; }
        [Display(Name = "Email")]
        public string Email { get; set; }
        [Display(Name = "Mật khẩu")]
        public string MatKhau { get; set; }

        public virtual ICollection<ChuDe> ChuDe { get; set; }
        public virtual ICollection<HoiDap> HoiDap { get; set; }
        public virtual ICollection<PhanCong> PhanCong { get; set; }
    }
}
